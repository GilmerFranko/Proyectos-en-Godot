extends "res://src/modules/robots/robot.gd"

var price = 10

func _ready():
	self.points = 25
	self.life   = 70
	special_ability()
	
func special_ability():
	var bullet = load("res://src/modules/robots/bullet_laser.tscn").instance()
	add_child(bullet)
	yield(get_tree().create_timer(self.time_ability), "timeout")
	special_ability()
