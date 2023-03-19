extends KinematicBody2D
export (int) var speed = 0.02
signal fired
var direction = ""
var pause : bool
var velocity: Vector2 = Vector2(32,0)
var can_fire = true
var currentPosition = {}
var beforePosition = {} # Posicion antes que CurrentPosition
var prePosition: Vector2
var steps_walked : Array
var var_globals
func _ready():
	var_globals = get_node("/root/global_vars")

func _init():
	pass

func _physics_process(delta):
	
	# Posicion actual en el grid
	currentPosition = isInGrid(position, true)
	# Justo en el grid
	#print(str(beforePosition.hash()) + ' ' + str(currentPosition.hash()))
	if((step_decimals(currentPosition.x) == 0 and step_decimals(currentPosition.y) == 0) and beforePosition.hash() != currentPosition.hash()):
		# Guardar posicion actual
		var_globals.players[0].steps_walked.append(currentPosition)
		# Cambiar direccion
		move()
		#beforePosition = currentPosition;
		#print(var_globals.players[0].steps_walked)
		#print(currentPosition)
	
	position.x += velocity.x
	position.y += velocity.y
	#print (position)
func _input(event):
	#----
	# Pausar
	#----
	if(Input.is_action_pressed("ESC")):
		if(pause == false):
			pause = true ;
		else :
			pause = false ;
		set_process(pause)
	#----
	#Derecha
	#----
	if(Input.is_action_pressed("ui_right")and direction != "L"):
		direction = "R" ;
		prePosition.x = speed ;
		prePosition.y = 0 ;
		get_node("Sprite").frame = 2
	#----
	#Abajo
	#----
	if(Input.is_action_pressed("ui_down") and direction != "U"):
		direction = "D" ;
		prePosition.y = speed ;
		prePosition.x = 0 ;
		get_node("Sprite").frame = 2
	#----
	#Arriba
	#----
	if(Input.is_action_pressed("ui_up") and direction != "D"):
		direction = "U" ;
		prePosition.y = -speed ;
		prePosition.x = 0;
		get_node("Sprite").frame = 2
	
	#----
	#Izquierda
	#----
	if(Input.is_action_pressed("ui_left") and direction != "R"):
		direction = "L" ;
		prePosition.x = -speed ;
		prePosition.y = 0 ;
		get_node("Sprite").frame = 2
func move():
	if (direction == "U" or direction == "D"):
		get_node("Sprite").frame = 1
		velocity.x = prePosition.x
		velocity.y = prePosition.y
		direction = null
	if(direction == "L" or direction == "R"):
		get_node("Sprite").frame = 0
		velocity.x = prePosition.x
		velocity.y = prePosition.y
		direction = null
		
# Devuelve la posicion actual en el grid
func isInGrid(object = Vector2(0,0), returnObject = false):
	# Posicion actual en el grid
	object.x = int(object.x); object.y = int(object.y)
	currentPosition.x = (object.x / 16)
	currentPosition.y = (object.y / 16)
	$TextEdit.text = (str(currentPosition) + str(object))
	if(returnObject):
		return currentPosition
	return {}
