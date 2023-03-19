extends Node2D
class_name Creater_Direction

var point_find = Vector2(110,100)
var point_init = Vector2(0,0)
var max_update = 100

func _ready():
	find_point(Vector2(100,100))
	
func find_point(pos: Vector2):
	yield(get_tree().create_timer(0.01),"timeout")
	if(true and max_update >= 0):
		create_object(pos)
		find_point(Vector2(pos.x + 64, pos.y))
		#find_point(Vector2(pos.x - 64, pos.y))
		#find_point(Vector2(pos.x, pos.y + 64))
		#find_point(Vector2(pos.x, pos.y - 64))
		max_update = max_update -1
		
func create_object(pos: Vector2):
	var object = load("res://src/modules/tiles/block_terrain.tscn").instance()
	object.position = pos
	add_child(object)

func get_point(pos_x, pos_y):
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_point(Vector2(pos_x, pos_y))
	if(!result.empty()):
		return true
	else:
		return false
	
