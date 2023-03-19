extends StaticBody2D
class_name Robot
var life   = 100
var points = 10
# Segundos en que se repite la abilidad
var time_ability = 0.8
# Posicion en <floor> en el que el <robot> esta ubicado
var place_floor: int

func _ready():
	pass

func _process(delta):
	if(life <= 0):
		remove_robot()
		
		
func damage(damage):
	life = life - damage
	print(life)

func remove_robot():
	Floor.remove_item(place_floor)
	print(Global.itemsInFloo)
	queue_free()
