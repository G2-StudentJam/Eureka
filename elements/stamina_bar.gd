extends Control

@onready var stamina_bar = $StaminaBar

func _ready():
	stamina_bar.visible = false


func _on_player_stamina_changed(new_value):
	if stamina_bar.value != new_value and new_value <= stamina_bar.max_value:
		appear()
		stamina_bar.value = new_value
		

func appear():
	stamina_bar.visible = true

func disappear():
	stamina_bar.visible = false
	
func _on_stamina_show_timer_timeout():
	disappear()
