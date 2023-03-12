extends Node2D

signal guante_recogido




func _on_area_2d_guantes_recogidos():
	guante_recogido.emit()
