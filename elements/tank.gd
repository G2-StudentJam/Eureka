extends Node2D

signal player_entered

func _on_player_item_dropped(item):
	print("Recibido objeto: " + item)


func _on_area_2d_player_entered():
	player_entered.emit()
