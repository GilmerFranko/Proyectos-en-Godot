extends Node2D
export (PackedScene) var Enemy
export (PackedScene) var friend
var Enemigos
var Amigos

func _ready():
	pass
func _process(delta):
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("0"):
		IniciarEnemigos()
	if Input.is_action_just_pressed("8"):
		IniciarAmigos()
func IniciarEnemigos():
	Enemigos = Enemy.instance()
	add_child(Enemigos)
	
func IniciarAmigos():
	Amigos = friend.instance()
	add_child(Amigos)





