extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
const CLIMB_VELOCITY = -100.0
var is_climbing = false
const CLIMB_WALL = "WallClimb"


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D
@onready var coyotetimer = $CoyoteTimer
@onready var right_wall = $RightWall
@onready var left_wall = $LeftWall
@onready var top_right_wall = $TopRightWall
@onready var top_left_wall = $TopLeftWall

var rng = RandomNumberGenerator.new()
var can_jump = true
var first_cycle = true
var can_paraglide = true
var is_paragliding = true

func nextToWall():
	return is_raycast_colliding(right_wall, CLIMB_WALL) or is_raycast_colliding(left_wall, CLIMB_WALL)

func is_raycast_colliding(raycaster, object_name):
	return raycaster.is_colliding() and raycaster.get_collider().get("name") == object_name

func aboutToFinishClimb():
	var right_side = is_raycast_colliding(right_wall, CLIMB_WALL) and not is_raycast_colliding(top_right_wall, CLIMB_WALL)
	var left_side = is_raycast_colliding(left_wall, CLIMB_WALL) and not is_raycast_colliding(top_left_wall, CLIMB_WALL)
	return right_side or left_side
	
func jump(multiplier=1, play_sound=true):
	can_jump = false
	velocity.y = JUMP_VELOCITY * multiplier
	if (play_sound):
		var jump_sound = rng.randi_range(1, 3)
		if jump_sound == 1:
			$Background/Jump1.play()
		if jump_sound == 2:
			$Background/Jump2.play()
		if jump_sound == 3:
			$Background/Jump3.play()
	

func _physics_process(delta): 	
	
		if not is_on_floor():
			
			if (Input.is_action_pressed("paraglider")):
				if (can_paraglide):
					velocity.y = 0
					can_paraglide = false
				velocity.y += gravity/5 * delta
				is_paragliding = true
			else:
				velocity.y += gravity * delta
				is_paragliding = false
			
			if (velocity.y <= 0):
				animated_sprite.play("jump")
			else:
				animated_sprite.play("fall")
				
				
			if (coyotetimer.is_stopped() and can_jump and first_cycle):
				coyotetimer.start()
				first_cycle = false	
						
		else:
			can_paraglide = true
			can_jump = true
			first_cycle = true
			
			if not is_climbing:
				if (velocity.x == 0):
					animated_sprite.play("idle")
				else:
					animated_sprite.play("run")

		# Handle Jump
		if $CanvasLayer/Botas.visible and Input.is_action_just_pressed("ui_accept") and (is_on_floor() or (!coyotetimer.is_stopped() and can_jump)):
			jump()
			

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		if ($CanvasLayer/Calcetin.visible):
			var direction = Input.get_axis("ui_left", "ui_right")

			
			if direction:
				velocity.x = direction * SPEED
				
				if (velocity.x < 0):
					animated_sprite.flip_h = true
				if (velocity.x > 0): 
					animated_sprite.flip_h = false
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
			
		move_and_slide()
		wall_climb()

func wall_climb():
	var vertical_direction = Input.get_axis("ui_down", "ui_up")
	
	if (Input.is_action_pressed("climb") and nextToWall()) and $CanvasLayer/Guantes.visible:
		animated_sprite.play("hit")
		is_climbing = true
	else:
		is_climbing = false
	
	if is_climbing:
		velocity.y = vertical_direction * CLIMB_VELOCITY;
		if aboutToFinishClimb():
			jump(0.6,false)
	
	
