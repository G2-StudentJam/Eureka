extends Area2D

signal paracas_recogido


const ANIMATION_SPEED = 5
var animation_direction = -1


func _on_body_entered(body):
	if (body.get_name() == "Player"):
		paracas_recogido.emit()
		queue_free()



func _process(delta):
	
	position.y += ANIMATION_SPEED * delta * animation_direction
	
	


func _on_timer_timeout():
	animation_direction *= -1
