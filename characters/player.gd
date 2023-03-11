extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
var is_climbing = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D
@onready var right_wall = $RightWall
@onready var left_wall = $LeftWall
var rng = RandomNumberGenerator.new()

func _physics_process(delta): 
	
	if nextToWall():
		print("colision con pared")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
		if (velocity.y <= 0):
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
	else:

		if not is_climbing:
			if (velocity.x == 0):
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		var jump_sound = rng.randi_range(1, 3)
		if jump_sound == 1:
			$Background/Jump1.play()
		if jump_sound == 2:
			$Background/Jump2.play()
		if jump_sound == 3:
			$Background/Jump3.play()
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		if (velocity.x < 0):
			animated_sprite.flip_h = true
		if (velocity.x > 0): 
			animated_sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if (Input.is_action_pressed("climb") and nextToWall()):
		animated_sprite.play("hit")
		is_climbing = true
	else:
		is_climbing = false
		
	move_and_slide()
	
func nextToWall():
	return nextToRightWall() or nextToLeftWall()

func nextToRightWall():
	return right_wall.is_colliding()
	
func nextToLeftWall():
	return left_wall.is_colliding()
