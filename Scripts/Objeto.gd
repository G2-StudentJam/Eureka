extends Area2D

signal recogido

func _on_body_entered(_body):
	recogido.emit()
	queue_free()
	pass
