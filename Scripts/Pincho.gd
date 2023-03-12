extends Area2D


func _on_body_entered(body):
	if body.get_name() == "Player":
		print("Mueres")
		get_tree().reload_current_scene()
		get_tree().change_scene_to_file("res://ui/Pantalla_muerte.tscn")
		
	
	pass
