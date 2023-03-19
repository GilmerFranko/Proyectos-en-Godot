extends AnimatedSprite
var direx = Vector2()
var direccion
var o
var ab
var valorexactoA
var valorexactoB
var total
var totalab
var direccionn

func _ready():
	
	direccionn = position
	direccion = position

# warning-ignore:unused_argument
func _input(event):
	direccionn = get_global_mouse_position()

	direccion = get_angle_to(Vector2(direccionn.x,direccionn.y))
	direccion = direccion
	
	rotate(direccion)
	print(direccion)

	
	
	
