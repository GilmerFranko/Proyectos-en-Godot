extends KinematicBody2D
	
const GRAVITY = 2500
const WALK_SPEED = 200
var tiempo_para_cambiar_colision=0
var pos =0
var jumping = false
var velocity = Vector2()
var jump=-1000
var ps
var lado = "derecha"
func _ready():

	pass
func _Movimientos():
	ps = position
	#-----------------------define la distancia de la bala entre la escopeta
	if lado== "derecha":
		ps.y +=24
		ps.x +=55
	if lado== "izquierda":
		ps.y +=24
		ps.x -=55
	#-------------------------
	var Der = Input.is_action_pressed('ui_right')
	var Izq = Input.is_action_pressed('ui_left')
	var S = Input.is_action_pressed('ui_up') and is_on_floor()
	var espacio= Input.is_action_pressed("ui_select")





	velocity.x = 0
	$spr_pirata.playing= true
	if Izq: #Izquierda
		lado = "izquierda"
		if tiempo_para_cambiar_colision==0: #Permite Iniciar Esta Funcion Solo Una Vez
			pos =16
			tiempo_para_cambiar_colision=1
		velocity.x = -WALK_SPEED
		$spr_pirata.play("caminandoconarma")
		$col_pirata.move_local_x(pos)	
		pos=0
		$spr_pirata.flip_h =-1
	
	

		
	if Der:# Derecha
		lado = "derecha"
		$spr_pirata.playing= true
		if tiempo_para_cambiar_colision==1: ##Permite Iniciar esta Funcion Solo Una Vez
			pos=-16
			tiempo_para_cambiar_colision=0
		velocity.x =  WALK_SPEED
		$spr_pirata.flip_h =0
		$spr_pirata.play("caminandoconarma")
		
		$col_pirata.move_local_x(pos)	
		pos=0
	#------------------------------Si Ninguno se presiona, entonces parar la animacion
	if !Der and !Izq and !espacio: 
		$spr_pirata.playing=false
		
		
	if S:#Saltar
		velocity.y =jump
		jumping=true
	if jumping and is_on_floor():
		jumping = false
	##--------------------------Disparar
	if espacio:
		$spr_pirata.playing=true
		$spr_pirata.play("disparo_arma")

func _physics_process(delta):
	
	velocity.y += delta * GRAVITY
	_Movimientos()
	velocity = move_and_slide(velocity, Vector2(0, -1))
	

	

