extends Control

# Contiene cada "robot" de cada espacio
# en el panel de los cuales se pueden seleccionar
# P
var robotInItem = {1: 'generator', 2: 'laser'}

func _ready():
	get_node("ItemList/bt_1/Sprite").set_texture(load("res://src/modules/robots/robot_generator.png"))
	get_node("ItemList/bt_2/Sprite").set_texture(load("res://src/modules/robots/robot_laser.png"))


func bt1_pressed():
	
	select_robot(robotInItem[1])


func bt2_pressed():
	select_robot(robotInItem[2])


func bt3_pressed():
	pass # Replace with function body.


func bt4_pressed():
	pass # Replace with function body.


func bt5_pressed():
	pass # Replace with function body.


func bt6_pressed():
	pass # Replace with function body.


func select_robot(robot):
	Global.RobotSelected = robot

func get_select():
	return Global.RobotSelected
