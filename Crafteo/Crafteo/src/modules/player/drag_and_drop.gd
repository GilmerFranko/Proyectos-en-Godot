#Description
#>>Este script se encarga de controlar todas las acciones que el usuario haga con el mouse


extends Node2D
class_name MouseControl

#
var playObject

# Contiene el objeto que sera arrastrado por el mouse
var playObjectMoving

# Posicion actual del mouse
var posMouse : Vector2

# Deshabilita - Posibilita la opcion de clickear
var disableClick = false


func _ready():
	pass

func _input(event):
	position = get_global_mouse_position()
	# Detención de clicks
	clickin()


func exectAction():
	# Se puede mover con el mouse
	if(playObject):
		if(playObject.is_in_group('is_movible')):
			allow_move()
	else:
		# Desactiva los clicks
		disableClick = true
func allow_move():
	if(Input.is_mouse_button_pressed(1)):
		playObjectMoving.position = position
	
	
# Limpia los objetos almacenados en las variables
func clearObjects():
	playObjectMoving = null
	playObject = null

# Almacena el objeto que el mouse
# esta tocando en variables para futuros calculos
func setObject(obj):
	playObjectMoving = obj
	playObject = obj

# Encargado de desactivar o activar
# los clicks dependiendo de las acciones del usuario	
func clickin():
	if disableClick == false:
		if(Input.is_action_pressed("click_left")):
			exectAction()
		elif(Input.is_action_just_released("click_left")):
			clearObjects()
	elif Input.is_action_just_released("click_left"):
		disableClick = false

#---- Signals ----
# Comprueba que objeto estas tocando
func _on_mouse_control_area_entered(area):
	setObject(area)
# Comprueba que objeto estas tocando	
func _on_mouse_control_body_entered(body):
	setObject(body)
# Comprueba que objeto dejo de tocar	
func _on_mouse_control_body_exited(body):
	clearObjects()
func _on_mouse_control_area_exited(area):
	clearObjects()
#------

