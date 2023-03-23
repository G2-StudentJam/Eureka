extends Node2D

@onready var area2d = $Area2D
@onready var colissionShape = $Area2D/CollisionShape2D

signal playerEnteredCheckpoint

func _on_area_2d_body_entered(body):
	if body.get("name") == "Player":
		playerEnteredCheckpoint.emit()
