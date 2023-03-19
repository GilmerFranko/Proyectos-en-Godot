extends Node2D
var polygon = NavigationPolygon.new()
var positions_mouse = PoolVector2Array()
var velocity = Vector2()
var target = Vector2()
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
func _process(_delta):
	sprite_follow()
	draw_mouse()
	yield(get_tree().create_timer(3), "timeout")
func go(hola):
	for a in hola:
		print(a)
		var velo = (a - get_node("Area2D").position)
		while((a - get_node("Area2D").position).length() > 6):
			yield(get_tree().create_timer(1), 'timeout')
			get_node("Area2D").position += velo

func get_position_mouse() -> Vector2:
	return get_global_mouse_position()
	
func add_polygon() -> void:
	var outline = PoolVector2Array([Vector2(0, 0), Vector2(0, 50), Vector2(50, 50),Vector2(50, 0)])
	polygon.add_outline(outline)
	update_polygons()
	
func update_polygons() -> void:
	polygon.make_polygons_from_outlines()
	
func create_polygon() -> void:
	get_node("Navigation2D/NavigationPolygonInstance").set_navigation_polygon(polygon) 
	var hola = get_node("Navigation2D").get_simple_path(positions_mouse[0], positions_mouse[positions_mouse.size() - 1])
	go(hola)
	get_node("Area2D2").position = positions_mouse[0]
	positions_mouse = PoolVector2Array()
	polygon = NavigationPolygon.new()
func draw_mouse() -> void:
	
	if(Input.is_action_pressed("click_left")):
		var paint = Sprite.new()
		paint.texture = load("res://src/modules/robots/bullet_laser.png")
		paint.position = get_position_mouse()
		paint.scale = Vector2(0.5,0.5)
		add_child(paint)
		save_positions()
		
	elif(Input.is_action_just_released("click_left")):
		var save
		for a in positions_mouse:
			save = convert_to_polygon(a)
			polygon.add_outline(save)
			print(a)
			print(save)
		update_polygons()
		create_polygon()
func save_positions():
	if(positions_mouse.empty()):
		positions_mouse.append(get_node("BulletLaser").position)
	elif(positions_mouse[positions_mouse.size() - 1] != get_node("Tile").map_to_world(get_node("Tile").world_to_map(get_position_mouse()))):
		positions_mouse.append(get_node("BulletLaser").position)
	

func convert_to_polygon(vector: Vector2):
	var space = 64
	var poligon = PoolVector2Array([Vector2(vector.x, vector.y), Vector2(vector.x, vector.y +- space), Vector2(vector.x +- space, vector.y +- space), Vector2(vector.x +- space, vector.y)])
	return poligon

func sprite_follow():
	get_node("BulletLaser").position=get_node("Tile").map_to_world(get_node("Tile").world_to_map(get_position_mouse() - global_position))

