extends Control

func _ready():
	pass
func _process(delta):
	get_node("energy").text = 'Energy: ' + str(Global.energy) 
