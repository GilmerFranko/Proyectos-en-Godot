extends Node2D
func _ready():
	create_block()
func create_block():
	for i in get_node("TileMap").get_used_cells():
		var block = load("res://src/modules/tiles/blocks/block.tscn").instance()
		block.position = get_node("TileMap").map_to_world(i)
		add_child(block)
	get_node("TileMap").queue_free()

	
