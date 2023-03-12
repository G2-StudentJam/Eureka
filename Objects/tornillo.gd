extends Node2D

signal tornillo_recogido

func disappear():
	queue_free()

func _on_area_2d_body_entered(body):
	tornillo_recogido.emit()
	disappear()
	
