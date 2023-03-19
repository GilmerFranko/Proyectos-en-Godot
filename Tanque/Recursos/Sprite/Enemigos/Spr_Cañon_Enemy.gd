extends Sprite
var direx = Vector2()
var direccion
var ab
var valorexactoA
var valorexactoB
var total
var totalab
var direccionn	

func _ready():
	
	direccionn = position
func _process(delta):
	Apuntar()
func Apuntar():

	direccion = get_angle_to(Vector2(direccionn.x,direccionn.y))
	direccion = direccion + 45.6
	rotate(direccion)
	
