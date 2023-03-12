extends Area2D

signal paracas_recogido

func _on_body_entered(body):
	if (body.get_name() == "Player"):
		paracas_recogido.emit()
		queue_free()
