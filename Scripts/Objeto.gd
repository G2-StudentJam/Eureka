extends Area2D

signal botas_recogidas

func _on_body_entered(body):
	if (body.get_name() == "Player"):
		botas_recogidas.emit()
		queue_free()
	pass
