extends Control


func _ready():
	$VBoxContainer/Menu.grab_focus()

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://ui/menu.tscn")


func _on_quit_pressed():
	get_tree().quit()
