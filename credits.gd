extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("back"):
		get_tree().change_scene_to_file("res://ui/menu.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://ui/menu.tscn") # Replace with function body.
