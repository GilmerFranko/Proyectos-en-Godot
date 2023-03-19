extends KinematicBody2D
var scene_bala = preload("res://Recursos/Objetos/Bala.tscn")
export (int) var Speed = 200
export (int) var _Speed = -200
export (int) var Gravedad = 2500
var lado =""
var movimiento = Vector2()
var jumping = true
var jump =-500
var pos=0
var vida =5
var saltar
var a 
var area2
var b
var posicionglobal
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
	$TextEdit.text = str(b.position.x - global_position.x)
	
	

func _physics_process(delta):
	movimiento.y += delta * Gravedad
	Ai()
	Disparar_a_player()
	if area2==true:
		Movimientos(b)
	
	
	
func Tiempo_Disparo():
	disparo= true
	$Tiempo_Disparo.wait_time = rand_range(1.5,2.5)
func Ai():
	
	if get_slide_count()  != 0 :
		var obj_colisionado = get_slide_collision(get_slide_count()-1 )
		if obj_colisionado.collider.is_in_group("player"):
			saltar = true
			vida = vida-1
			$TextEdit.text = str(a)


func _on_Area2D_body_entered(body): # Cuando Entra Un Cuerpo En la Colision de disparo
	
	if body.is_in_group("enemigos"): 
			if a == false:
				a= true
				
				b=body
				$"Spr_Cañon_Enemy".direccionn = body.position 
			Speed = 0
			_Speed = 0
	else:
		pass

func SaleDelArea(body):
			if a == true:
				a= false

func SeguirAPlayer(body):
	if body.is_in_group("enemigos"):
		if area2 ==false:
			area2=true
		b = body

func SaleDelAreaSeguirAPlayer(body):
	if area2 ==  true:
		area2=false

func Disparar_a_player():
	if a == true and disparo == true:
		$"Spr_Cañon_Enemy".direccionn = b.position 
		movimiento.x = 0
		Bala = scene_bala.instance()
		Bala.position = $"Spr_Cañon_Enemy".position
		Bala.direccion = b.position - global_position
		add_child(Bala)
		disparo=false
	movimiento = move_and_slide(movimiento, Vector2(0, -1))
