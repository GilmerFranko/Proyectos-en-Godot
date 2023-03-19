extends Node2D


var listPositions = {}
var positionActual = Vector2(0,-3)
var positionInitial = Vector2(0,-3)
var positionFinal = Vector2(-19,11)

# Costo por pasos
var costSteps = 1
# Called when the node enters the scene tree for the first time.

var updates = 0

# Almacena las posiciones en las que se crea un nuevo obstaculo
var positions_obtacles = Array()


func _ready():
	positionActual = positionInitial
	add_list_open({'id': positionInitial, 'father': positionInitial, 'g': 0, 'h': 0, 'f': 0, 'type': 'closed'})
	add_list_closed(positionInitial)
	
	for i in 1000:
		create_routes()

func _input(_event):
	if(Input.is_action_just_pressed("reset")):
		get_tree().reload_current_scene()
		
func create_routes()->void:
	if(is_point()):
		reverse()
		return
	askNeighbors()
	

func is_point() -> bool:
	if(listPositions.has(positionFinal)):
		return true
	return false

#
#func is_wall(point_a: Vector2) -> bool:
#	var tiles = get_node("TileMap").get_used_cells()
#	point_a 
#	# Si esta chocando con una pared: devuelve true y pinta
#	if(tiles.has(point_a)): 
#		add_signal(point_a)
#		return true
#	if(positions_obtacles.has(point_a)):
#		return true
#	return false


func make_trail(data: Dictionary, change = false):

#	var trail = load('res://Pos.tscn').instance()
#	trail.position = from_tile_to_map(data.position)
#	if change:
#		trail.get_node('g').text = ''
#		trail.get_node('h').text = ''
#		trail.get_node('f').text = ''
#		trail.get_node('position').text = 'Punto'
#		trail.get_node('ColorRect').visible = false
#	else:
#		trail.get_node('g').text = str(data.g)
#		trail.get_node('h').text = 'h=' + str(data.h)
#		trail.get_node('f').text = 'f=' + str(data.f)
#		trail.get_node('position').text = str(data.position)
#	listPositions[data.position].obj = trail
#
#
#
#	trail.get_node('arrow').rotate(trail.get_angle_to(from_tile_to_map(listPositions[data.position].father)))
#	trail.get_node("arrow").rotation_degrees -= 90
#	trail.position = Vector2(trail.position.x + 32, trail.position.y + 32)
#	add_child(trail)
	

#func add_signal(pos: Vector2):
#	var sprite = Sprite.new()
#	sprite.texture = load("res://icon.png")
#
#	var newposition = $TileMap.map_to_world(pos)
#	newposition = Vector2(newposition.x + 32, newposition.y + 32)
#	sprite.position = newposition
#	add_child(sprite)
	pass

# F es igual a {g+h}
func calcF(positionTile) -> int:
	var f = listPositions[positionTile].g + listPositions[positionTile].h
	return f
	
# Calcula la distancia que hay desde el padre hacia el hijo
func calcG(from: Vector2, to: Vector2, ignore = true) -> int:
	
	if(is_in_list_closed(to)):
		return 0
		
	# Si to se encuentra en la lista abierta
	if(is_in_list_open(to)):
		# Comprueba si la <g> + costSteps de from es menor a la <g> de to
		if((listPositions[from].g + costSteps) < listPositions[to].g and !ignore):
			recalculateGHF(to, positionActual)
			return calcG(from, to, false)
	
	
	var g = listPositions[from].g + costSteps
	return g
		
		
# Calcula la distancia que hay desde el hijo hasta el punto final
func calcH(to: Vector2):
	var h 

	# Si lo invertimos, creo que el objeto intentara alejarse en sentico contrario
	if(to < positionFinal):
		h = (positionFinal - to)
	else:
		h = (to - positionFinal)
	
	return (to_positive(to_positive(h.x) + to_positive(h.y)))


# Agrega una posicion a la 'Lista Abierta' junto con otras características
func add_list_open(positionTile):
	if(listPositions.has(positionTile.id)):
		return
	if($TileMap.get_used_cells().has(positionTile.id)):
		return
	listPositions[positionTile.id] = {'father': positionTile.father, 'g': positionTile.g, 'h': positionTile.h, 'f': positionTile.f, 'type': 'open'}
	
	# Crea un ratro de ejemplo
	var trail = {'g': positionTile.g, 'h': positionTile.h, 'f': positionTile.f, 'position': positionTile.id, 'father': positionTile.father}
	make_trail(trail)
	
# Cambia una posición de 'Abierta' a 'Cerrada'
func add_list_closed(positionTile):
	listPositions[positionTile].type = 'closed'
	# Crea un ratro de ejemplo
	var trail = {'position': positionTile}
	make_trail(trail, true)
	#print(listPositions)
	
	
# Calcula el costo de llegada aplicando la formula f=g+h
# from - Ubicación del padre
# to   - Posicion al cual se le preguntará
func calcHardOfArribal(from: Vector2, to: Vector2)->void:
	var h = calcH(to)
	var g = calcG(from, to)
	var f = g + h
	var positionTile = {'id': to, 'father': positionActual, 'g': g, 'h': h, 'f': f}
	add_list_open(positionTile)

	
func from_tile_to_map(tile: Vector2)-> Vector2:
	return get_node("TileMap").map_to_world(tile)


func from_map_to_tile(map: Vector2):
	return get_node("TileMap").map_to_world(map)

#  Pregunta a los lugares vecinos el costo de llegada desde el punto A (comienzo) al punto b (llegada)
func askNeighbors():
#	# Derecha
	calcHardOfArribal(positionActual, Vector2(positionActual.x + 1, positionActual.y))
#	# Izquierda
	calcHardOfArribal(positionActual, Vector2(positionActual.x - 1, positionActual.y))
#	# Arriba
	calcHardOfArribal(positionActual, Vector2(positionActual.x, positionActual.y + 1))
#	# Abajo
	calcHardOfArribal(positionActual, Vector2(positionActual.x, positionActual.y - 1))
#
	# Encuentra menor F (Costo de llegada)
	var fcost : Array
	var find  : Dictionary
	for id in listPositions:
		if(listPositions[id].type == 'open'):
			
			fcost.append(listPositions[id].f)
			find[listPositions[id].f] = id
	updatePosition(find[fcost.min()])
	

func is_in_list_closed(positionTile):
	if(listPositions.has(positionTile) and listPositions[positionTile] != null and listPositions[positionTile].type == 'closed'):
		return true
	else:
		return false
func is_in_list_open(positionTile):
	if(listPositions.has(positionTile) and listPositions[positionTile] != null and listPositions[positionTile].type == 'open'):
		return true
	else:
		return false

func updatePosition(newPosition: Vector2)->void:
	positionActual = newPosition
	add_list_closed(newPosition)
	
func to_positive(num: int)->int:
	if num > 0:
		return num
	else:
		return -num

func recalculateGHF(from: Vector2, to: Vector2) -> void:
	listPositions[to].h = calcH(to)
	listPositions[to].g = calcG(from, to, false)
	listPositions[to].f = listPositions[to].g + listPositions[to].h
	listPositions[to].obj.get_node('arrow').rotate(listPositions[to].obj.get_angle_to(from_tile_to_map(from)))

func reverse():
	var trail = Sprite.new()
	trail.texture = load('res://robot_laser.png')
	add_child(trail)
	var fin = true
	var reverse = positionFinal
	while(fin):
		
		var newposition = from_tile_to_map(reverse)
		trail.position = Vector2(newposition.x + 32, newposition.y + 32)
		yield(get_tree().create_timer(1),"timeout")
		
		if(reverse == positionInitial):
			fin = false
		
		reverse = listPositions[reverse].father
		
		
	
func save(img: Image, i):
	img.flip_y()
	img.save_png('res://images/image-' + str(i) + '.png')

func _process(delta):
	save(get_viewport().get_texture().get_data(), OS.get_unix_time())
	
