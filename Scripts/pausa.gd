extends Control



func _on_resume_pressed():
	get_tree().paused = false
	self.queue_free()

func _ready():
	$VBoxContainer/Resume.grab_focus()

func _on_back_to_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/menu.tscn")
