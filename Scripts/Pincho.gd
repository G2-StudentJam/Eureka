extends Node2D

signal player_hit_spikes

func _on_body_entered(body):
	if body.get_name() == "Player":
		player_hit_spikes.emit()
		
