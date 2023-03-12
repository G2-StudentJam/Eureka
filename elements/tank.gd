extends Node2D

signal player_entered

var nut = false
var wrench = false
var screw = false

@onready var sprite = $Area2D/AnimatedSprite2D

func _on_player_item_dropped(item):
	print("Recibido objeto: " + item)
	if item == "nut":
		nut = true
	if item == "wrench":
		wrench = true
	if item == "screw":
		screw = true
	
	if nut:
		sprite.play("n")
	if wrench:
		sprite.play("w")
	if screw:
		sprite.play("w")
	if nut and wrench:
		sprite.play("nw")
	if nut and screw:
		sprite.play("ns")
	if wrench and screw:
		sprite.play("ws")
	if nut and wrench and screw:
		sprite.play("nsw")
	

func _on_area_2d_player_entered():
	player_entered.emit()
