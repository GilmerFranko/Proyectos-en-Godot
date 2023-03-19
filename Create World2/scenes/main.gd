extends Node2D
var map = load("res://scenes/Map.tscn");

func _ready():
	pass
func _process(delta):
	yield(get_tree().create_timer(10.0), "timeout")
	$Label.text="Puedes intercambiar el bloque de construccion con la tecla 1 y 2 /n Reiniciar CTRL+R"
	yield(get_tree().create_timer(5.0), "timeout")
	get_tree().change_scene_to(map);
