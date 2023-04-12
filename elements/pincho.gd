extends Node2D

signal player_hit_spikes

@export var is_moving : bool
@export var offset = Vector2(0, -10)
@export var duration = 1.0
@export var waiting = 1.0

func _ready():
	if is_moving:
		start_tween()

func start_tween():
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property($AnimatableBody2D, "position", offset, duration / 2)
	tween.tween_property($AnimatableBody2D, "position", offset, waiting)
	tween.tween_property($AnimatableBody2D, "position", Vector2.ZERO, duration / 2)
	tween.tween_property($AnimatableBody2D, "position", Vector2.ZERO, waiting)


func _on_body_entered(body):
	if body.get("name") == "Player":
		player_hit_spikes.emit()
