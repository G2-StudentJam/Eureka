extends CanvasLayer

var apple = true

func _ready():
	apple = false
	var AppleNode = get_parent().get_parent().get_node("Objeto").get_node("Objeto2D")
	AppleNode.recogido.connect(pipo)
	if (apple == true):
		print ("hola2")
	$Manzanita.visible = apple

func pipo():
	print("Ya puedes saltar")
	apple = true
	$Manzanita.visible = apple
