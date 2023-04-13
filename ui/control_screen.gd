extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().root.set("content_scale_factor",1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://levels/level_1.tscn")
