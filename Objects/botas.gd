extends Node2D

signal botas_recogidas

func _on_botas_2d_botas_recogidas():
	botas_recogidas.emit()
