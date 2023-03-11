extends Control



func _on_player_stamina_changed(new_value):
	$StaminaBar.value = new_value
