extends Control



func _on_button_pressed():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _ready():
	$Button.grab_focus()
