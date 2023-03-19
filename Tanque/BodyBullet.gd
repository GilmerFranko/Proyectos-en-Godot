extends KinematicBody2D
export (int) var velocidad = 300
var direccion
var Movimiento = Vector2()
var posision
var a
func _ready():
	posision = Vector2(0,0)
	a=false
	direccion=get_global_mouse_position() - global_position
	Movimiento= Vector2(position.x,position.y)

func _physics_process(delta):
	a= posision
	Disparar(delta)
	
	pass
func Disparar(delta):
	if Input.is_action_just_pressed("click") and a == true:
		direccion=get_global_mouse_position() - global_position
		
		a=false
	if Input.is_action_just_released("click"):
		
		pass

	move_and_collide(direccion.normalized()*delta*velocidad)
	$TextEdit.text = str(Movimiento)


	
