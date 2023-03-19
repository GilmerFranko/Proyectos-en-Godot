extends Node2D
var updates = 0
var max_updates = 1000
func _ready():
	floodfill(Vector2(0,0))
	
func floodfill(seed_point: Vector2):
	#yield(get_tree().create_timer(0.01),"timeout")
	if(get_point(seed_point.x, seed_point.y) == false and updates < max_updates):
		updates = updates + 1
		create_obstacle(Vector2(seed_point.x, seed_point.y));
		floodfill(Vector2(seed_point.x, seed_point.y + 9 )) #Norte
		floodfill(Vector2(seed_point.x + 9, seed_point.y )) #Este	
		floodfill(Vector2(seed_point.x, seed_point.y - 9 )) #Sur	
		floodfill(Vector2(seed_point.x - 9, seed_point.y )) #Oeste	
func get_point(pos_x, pos_y):
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_point(Vector2(pos_x, pos_y))
	if(!result.empty()):
		return true
	else:
		return false
func create_obstacle(pos: Vector2):
	
	var node2d = Node2D.new()
	var static_body = StaticBody2D.new()
	static_body.name = "static_body"
	node2d.name = ("StaticBody" + str(updates))
	
	var shape = RectangleShape2D.new()
	shape.set_extents(Vector2(8,8))
	var collision_shape = CollisionShape2D.new()
	collision_shape.set_shape(shape)
	static_body.add_child((collision_shape))
	node2d.add_child(static_body)	
	node2d.set_position(pos)
	add_child(node2d)
