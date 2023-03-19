extends KinematicBody2D

var movimiento = Vector2()
var der
var izq
var jump= -500
var salto =100
var gravedad = 2500
export (int) var velocidad = 200
var angulo


func _ready():
	pass	

func _process(delta):
	movimiento.y += gravedad * delta
	Movimientos()
	
	movimiento = move_and_slide(movimiento, Vector2(0, -1))

func Movimientos():
	movimiento.x =0
	
	der = Input.is_action_pressed("ui_right")
	izq = Input.is_action_pressed("ui_left")
	salto = Input.is_action_just_pressed("ui_up")
	
	if der:
		movimiento.x =velocidad
	if izq:
		movimiento.x =-velocidad
	if salto:
		movimiento.y =jump
	
