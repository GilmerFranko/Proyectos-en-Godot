extends Node
class_name Function



static func set_energy(energy):
	Global.energy = Global.energy + energy


#--- Funciones relacionadas con Energy ---#
static func charge_energy(amount):
	Global.energy = Global.energy - amount

#--- Funciones relacionadas con Aliens ---#
static func new_alien(name_alien: String) -> PackedScene:
	var alien = load("res://src/modules/aliens/alien_" + str(name_alien) + '.tscn').instance()
	return alien
