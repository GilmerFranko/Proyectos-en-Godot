extends Node2D
var autotile_coord
var crear_tile
func _ready():
	pass
func _physics_process(delta):
		autotile_coord=get_viewport().get_mouse_position()
		$TextEdit.text  = str(autotile_coord.x) + "X" + str(autotile_coord.y) + "Y" 
