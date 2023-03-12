extends Node2D

signal wrench_recogida

func disappear():
	visible = false

func _on_area_2d_body_entered(body):
	wrench_recogida.emit()
	disappear()
	
