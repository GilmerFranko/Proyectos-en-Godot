extends Node2D
var positionmouse = Vector2(0,0)
var isincolliding=true
var positionchange = Vector2(0,0)
var box = PackedScene
var bodyterrain
var arrayblocks = Array()
var positionclick
var position1
var position2
var position3
var position4
signal craft
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	box = load("res://actors/tile/ground/groundwithgras.tscn")
	connect("craft",self,"craft")
	position1=$Position
	position2=$Position2
	position3=$Position3
	position4=$Position4
func _process(delta):
	$fps.text=str(str(Engine.get_frames_per_second()))
func _input(event):
	changeto()
	positionmouse=get_global_mouse_position()
	position1.position=get_node("TileMap").map_to_world(get_node("TileMap").world_to_map(positionmouse)+Vector2(0,+1))
	position2.position=get_node("TileMap").map_to_world(get_node("TileMap").world_to_map(positionmouse)+Vector2(1,1))
	position3.position=get_node("TileMap").map_to_world(get_node("TileMap").world_to_map(positionmouse)+Vector2(1,0))
	position4.position=get_node("TileMap").map_to_world(get_node("TileMap").world_to_map(positionmouse)+Vector2(0,0))
	if Input.is_action_just_pressed("save"):
		if get_tree().get_nodes_in_group("terrain").size()>0:
			salvar_juego()
		else:
			print("CANT SAVE WHITHOUT CONTENT")
	#--------------
	var posprimaryclick=get_node("TileMap").map_to_world(get_node("TileMap").world_to_map(positionmouse)+ Vector2(0,1))
	
	#----------------click
	
	if Input.is_action_pressed("click_left") and posprimaryclick!=positionclick:#para que no coloque un bloque encima de otro!
		print(2)
		positionclick=posprimaryclick
		var new_box = box.instance()
		var new_box2 = box.instance()
		var new_box3 = box.instance()
		var new_box4 = box.instance()
		add_child(new_box)
		add_child(new_box2)
		add_child(new_box3)
		add_child(new_box4)
		new_box.global_position = get_node("TileMap").map_to_world(get_node("TileMap").world_to_map(positionmouse)+ Vector2(1,1))
		new_box2.global_position = get_node("TileMap").map_to_world(get_node("TileMap").world_to_map(positionmouse)+ Vector2(1,0))
		new_box3.global_position = get_node("TileMap").map_to_world(get_node("TileMap").world_to_map(positionmouse)+ Vector2(0,0))
		new_box4.global_position = get_node("TileMap").map_to_world(get_node("TileMap").world_to_map(positionmouse)+ Vector2(0,1))
	#------------------
	if Input.is_action_pressed("cick_rigth"):#si preciona la tecla entonces
		if bodyterrain!=null:#si body no esta vacio
			if bodyterrain.is_in_group("terrain"):#y esta en el grupo
				bodyterrain.queue_free()
	$numinstance.text=str(get_tree().get_nodes_in_group("terrain").size())
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
func _on_Position_body_entered(body):
	if body.is_in_group("terrain"):
		bodyterrain=body
		
	else:
		isincolliding=true
func changeto():
	if Input.is_action_just_pressed("one"):#cambia el blocke
		print("one")
		box = load("res://actors/box/box.tscn")
	if Input.is_action_just_pressed("two"):
		print("one")
		box = load("res://actors/tile/ground/groundwithgras.tscn")
func _on_Position_body_exited(body):
	bodyterrain=null
	yield(get_tree().create_timer(0.05), "timeout")#espera 0.054s para borrar los datos, asi no pasara en blanco
	body=null;
func save(nodos):
	var typename
	var nodossalvados = get_tree().get_nodes_in_group("terrain")
	var type=nodos.get_groups()
	for i in type.size():
		if type[i]!="terrain":
			typename=type[i]
	var salvardicc = {
		"type":typename,
		"posx":nodos.position.x,
		"posy":nodos.position.y,
		}
	return salvardicc
func salvar_juego():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_node("File").visible=true
	get_tree().paused=true
func file_confirmed():
	get_tree().paused=false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
func file_selected(path):#cuando seleccione el archivo
	path=str(path,".gfsave")
	var juegosalvado = File.new()#crea una instancia
	juegosalvado.open(path, juegosalvado.WRITE)#abre el archivo
	var nodos = get_tree().get_nodes_in_group("terrain")#son los que se guardaran
	#print(nodos[1])
	for i in nodos.size():
		var node=nodos[i]
		var datodenodo = save(node)#llama a la funcion save
		juegosalvado.store_line(to_json(datodenodo))#convierte el dato en json
	juegosalvado.close()#cuando termine cierra el archivo
