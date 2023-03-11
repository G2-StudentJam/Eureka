extends CanvasLayer

var apple = true
var guantes = true
var calcetin = true

func _ready():
	apple = false
	var BotasNode = get_parent().get_parent().get_node("Botas").get_node("Botas2D")
	BotasNode.botas_recogidas.connect(pipo)
	$Botas.visible = apple
	
	guantes = false
	var GuantesNode = get_parent().get_parent().get_node("Guantes").get_node("Area2D")
	GuantesNode.guantes_recogidos.connect(papi)
	$Guantes.visible = guantes
	
	calcetin = false
	var CalcetinNode = get_parent().get_parent().get_node("Calcetin").get_node("Area2D")
	CalcetinNode.calc_recogidos.connect(pupa)
	$Calcetin.visible = calcetin

func pipo():
	print("Ya puedes saltar")
	apple = true
	$Botas.visible = apple

func papi():
	print("Escalar habilitado")
	guantes = true
	$Guantes.visible = guantes
	
func pupa():
	print("Andar habilitado")
	calcetin = true
	$Calcetin.visible = calcetin
	
