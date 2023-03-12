extends Control

func _ready():
	$"Start button".grab_focus()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://ui/credits.tscn")


func _on_quit_pressed():
	get_tree().quit()
