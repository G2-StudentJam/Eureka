extends Area2D


signal player_entered

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")

func _on_body_entered(body):
	player_entered.emit()
