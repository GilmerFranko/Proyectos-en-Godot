extends "res://src/modules/robots/robot.gd"

var price = 50

func _ready():
	self.points = 25
	self.life   = 70
	yield(get_tree().create_timer(2), "timeout")
	special_ability()
	
func special_ability():
	Function.set_energy(self.points)
	yield(get_tree().create_timer(1), "timeout")
	special_ability()
