extends Node2D
var scene_bala = preload("res://Recursos/Objetos/Bala.tscn")
var scene_misil = preload("res://Recursos/Objetos/Misil.tscn")
var Bala
var posision
var angulo= Vector2()
var a
func _ready():
	pass

func _physics_process(delta):
	
	
	Teclas()
	
	if a==1:
		Bala()
		$Player/Armas/Seleccionado.offset.x = 221.5
	if a==2:
		Misil()
		$Player/Armas/Seleccionado.offset.x = 253.5
		
	if a==3:
		$Player/Armas/Seleccionado.offset.x = 284.5
	if a==4:
		$Player/Armas/Seleccionado.offset.x = 316.5
	if a==5:
		$Player/Armas/Seleccionado.offset.x = 347.5
		
	if a==6:
		$Player/Armas/Seleccionado.offset.x = 379

func Teclas():
	if Input.is_action_just_pressed("1"):
		a=1
	if Input.is_action_just_pressed("2"):
		a=2
	if Input.is_action_just_pressed("3"):
		a=3
	if Input.is_action_just_pressed("4"):
		a=4
	if Input.is_action_just_pressed("5"):
		a=5
	if Input.is_action_just_pressed("6"):
		a=6
	if Input.is_action_just_pressed("7"):
		a=7
	if Input.is_action_just_pressed("8"):
		a=8
	if Input.is_action_just_pressed("9"):
		a=9
	
func Bala():
	posision = get_global_mouse_position() - global_position
	if Input.is_action_just_pressed("click"):
		Bala = scene_bala.instance()
		Bala.start($"Player/Spr_Cañon/Posision".global_position, rotation)
		Bala.direccion = posision
		get_parent().add_child(Bala)
		
func Misil():
	posision = get_global_mouse_position() - global_position
	if Input.is_action_just_pressed("click"):
		Bala = scene_misil.instance()
		Bala.position = $Player.position
		Bala.direccion= posision
		add_child(Bala)		
