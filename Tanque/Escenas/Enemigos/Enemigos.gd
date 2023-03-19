extends KinematicBody2D
var scene_bala = preload("res://escenas/enemigos/bala/balaenemigos.tscn")
export (int) var Speed = 120
export (int) var _Speed = -120
export (int) var Gravedad = 2500
var movimiento = Vector2()
var vida =5
var a
var area2
var b
var Bala
var disparo
var posisionbala

func _ready():
	a=false
	area2=false
	b = position
	disparo=true
	posisionbala = position

func Movimientos(b): # Seguir A Player
	movimiento.x = b.position.x - global_position.x
	if movimiento.x >= Speed:
		movimiento.x =Speed
	if movimiento.x <=_Speed:
		movimiento.x =_Speed
	

func _physics_process(delta):
	movimiento.y += delta * Gravedad
	
	if area2==true:
		Movimientos(b)
	Disparar_a_player()
	movimiento = move_and_slide(movimiento, Vector2(0, -1))

func Tiempo_Disparo():
	disparo= true
	$Tiempo_Disparo.wait_time = rand_range(0.5,1)


func _on_Area2D_body_entered(body): # Cuando Entra Un Cuerpo En la Colision

	if body.is_in_group("player"):
			if a == false:
				a= true
				b=body
				$"Spr_Cañon_Enemy".direccionn = body.position
				

func SaleDelArea(body):# Cuando Sale Un Cuerpo En la Colision
	if a == true: 
		a= false

func SeguirAPlayer(body):
	if body.is_in_group("player"):
		if area2 ==false:
			area2=true
		b = body

func SaleDelAreaSeguirAPlayer(body):
	if body.is_in_group("player"):
		if area2 ==  true:
			area2=false

func Disparar_a_player():
	if a == true and disparo == true:
		$"Spr_Cañon_Enemy".direccionn = b.position
		Bala = scene_bala.instance()
		Bala.emit_signal("tiempo")
		Bala.position = $"Spr_Cañon_Enemy".position
		Bala.direccion = b.position - global_position
		add_child(Bala)
		disparo=false
	
	

func OnColisionCuerpo(body):
	$TextEdit.text = str(vida)
			
	if body.is_in_group("bala"):
		vida = vida -1
		$TextEdit.text = str(vida)
		if vida == 0:
			queue_free()
			

