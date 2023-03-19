extends Node2D
var box = load("res://actors/tile/ground/groundwithgras.tscn")
func _ready():
	load_game()
func load_game():
	get_node("FileDialog").visible=true
func convertatmap(type):
	if type=="ground":
		return "res://actors/tile/ground/groundwithgras.tscn"
	elif type=="surprisebox":
		return "res://actors/box/box.tscn"
func file_selected(path):
	var save_game = File.new()
	if not save_game.file_exists(path):
		return #Error! We don't have a save to load.

	# We need to revert the game state so we're not cloning objects
	# during loading. This will vary wildly depending on the needs of a
	# project, so take care with this step.
	# For our example, we will accomplish this by deleting saveable objects.
	var save_nodes = get_tree().get_nodes_in_group("terrain")
	for i in save_nodes:
		i.queue_free()

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	save_game.open(path, File.READ)
	while save_game.get_position() < save_game.get_len():
		# Get the saved dictionary from the next line in the save file
		var node_data = parse_json(save_game.get_line())

		# Firstly, we need to create the object and add it to the tree and set its position.
		var type=convertatmap(node_data["type"])
		var tilemap = load(type)
		var loadtilemap = tilemap.instance()
		add_child(loadtilemap)
		loadtilemap.position = Vector2(node_data["posx"], node_data["posy"])

		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "typename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			loadtilemap.set(i, node_data[i])

	save_game.close()
