extends Node2D

signal paracaidas_recogido



func _on_area_2d_paracas_recogido():
	paracaidas_recogido.emit()
