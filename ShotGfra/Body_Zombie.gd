extends KinematicBody2D

export (int) var speed = 0
export (int) var Gravedad = 2500
var lado =""
var movimiento = Vector2()
var jumping = true
var jump =-500
var tiempo_para_cambiar_colision=0
var pos=0
var vida =5
var saltar
func Movimientos():
	var derecha = Input.is_action_pressed('ui_right')
	var izquierda = Input.is_action_pressed('ui_left')
	var salto = Input.is_action_pressed('ui_up')
	
	
	
	movimiento.x=0
	if lado == "derecha":
		movimiento.x += speed
		$Sprite.flip_h = true
	if lado == "izquierda":
		movimiento.x -= speed
		$Sprite.flip_h = false
	

func _physics_process(delta):
	movimiento.y += delta * Gravedad
	Ai()
	Movimientos()

	movimiento = move_and_slide(movimiento, Vector2(0, -1))
	
	
	
	
func Tiempo_Pasos():
	if lado == "derecha":
		lado="izquierda"
	else:
		lado="derecha"
		
func Ai():
	if is_on_floor() and is_on_wall() and saltar == false:
		movimiento.y =-0
	
	if get_slide_count()  != 0 :
		var obj_colisionado = get_slide_collision(get_slide_count()-1 )
		if obj_colisionado.collider.is_in_group("bala"):
			saltar = true
			vida = vida-1
		else:
			saltar = false
		if vida==0:
			queue_free()
			
