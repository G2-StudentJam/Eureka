extends Area2D

signal guantes_recogidos

func _on_body_entered(body):
	if (body.get_name() == "Player"):
		guantes_recogidos.emit()
		queue_free()
	pass

