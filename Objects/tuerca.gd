extends Node2D

signal tuerca_recogida

func disappear():
	queue_free()

func _on_area_2d_body_entered(body):
	tuerca_recogida.emit()
	disappear()
	
