extends Node2D

func _ready():
	generate_energy(1)

func generate_energy(time):
	Function.set_energy(25)
	yield(get_tree().create_timer(time), "timeout")
	generate_energy(1)
