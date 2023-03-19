extends Node2D

# Contiene el "robot" que esta base almacena
var myRobot
func _ready():
	pass


# Devuelve true si esta disponible
func is_free():
	pass

func set_robot(robotname = ""):
	myRobot = robotname
	mountRobot(myRobot)
	
func get_robot():
	return myRobot

# Coloca el srite del robot encima de la base
# Debo cambiar a un nombre mas especifica
func mountRobot(robot):
	pass
	
func deleteRobot(robot):
	pass
