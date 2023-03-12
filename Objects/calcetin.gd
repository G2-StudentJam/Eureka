extends Node2D

signal calc_recogido

func _on_area_2d_calc_recogido():
	calc_recogido.emit()
