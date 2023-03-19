extends Node2D
class_name Floors
var Robot

var itemsInFloor = {1: null, 2: null, 3: null, 4: null, 5: null, 6: null, 7: null, 8: null}


func _ready():
	itemsInFloor = Global.itemsInFloo 

func set_item(id_floor, robot):
	self.itemsInFloor[id_floor] = robot
	
	
func remove_item(id_floor):
	self.itemsInFloor[id_floor] = null
	
	
func add_robot(id_floor, robot):
	Robot = load("res://src/modules/robots/robot_" + robot + ".tscn").instance()
	if(can_add_robot(id_floor, Robot)):
		Robot.position = get_node("floor_" + str(id_floor)).position
		# Establecer ubicacion en la arena
		Robot.place_floor = id_floor
		# Agregar intancia del <robot>
		add_child(Robot)
		set_item(id_floor, robot)
		Function.charge_energy(Robot.price)
	#Se deberia liberar espacio en memoria eliminando las variables
	
	
# Comprueba si el <robot> se puede comprar
# Teniendo en cuenta su precio
func can_buy(robot):
	if(Global.energy >= robot.price):
		
		return true
	return false

# Devuelve true si está disponible el lugar
# para colocar el <robot>
func place_available(id_floor):
	if((Global.RobotSelected) and (itemsInFloor[id_floor] == null)):
		return true
	print(itemsInFloor)
	return false
	
	
func can_add_robot(id_floor, robot):
	if(place_available(id_floor) and can_buy(robot)):
		return true
	return false
	
func bt1_pressed():
	add_robot(1, Global.RobotSelected)
func bt2_pressed():
	add_robot(2, Global.RobotSelected)
func bt3_pressed():
	add_robot(3, Global.RobotSelected)
func bt4_pressed():
	add_robot(4, Global.RobotSelected)
func bt5_pressed():
	add_robot(5, Global.RobotSelected)
func bt6_pressed():
	add_robot(6, Global.RobotSelected)
func bt7_pressed():
	add_robot(7, Global.RobotSelected)
func bt8_pressed():
	add_robot(8, Global.RobotSelected)
