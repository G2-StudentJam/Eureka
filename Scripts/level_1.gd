extends Node2D

func _input(event: InputEvent) -> void:
	if(Input.is_action_pressed("pausar")):
		var paused = load("res://ui/pausa.tscn").instantiate()
		$Paus.add_child(paused)
		get_tree().paused = true
	
func _ready():
	$Player/CanvasLayer/Vidas.text = str($Player.vidas)

func _on_bg_music_finished():
	$Player/Background.play()
