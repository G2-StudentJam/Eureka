extends Area2D

signal guantes_recogidos

const ANIMATION_SPEED = 5
var animation_direction = -1

func _on_body_entered(body):
	if (body.get_name() == "Player"):
		guantes_recogidos.emit()
		queue_free()
	pass

func _process(delta):
	
	position.y += ANIMATION_SPEED * delta * animation_direction
	
	


func _on_timer_timeout():
	animation_direction *= -1
