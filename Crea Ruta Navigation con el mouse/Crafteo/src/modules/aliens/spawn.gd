extends Area2D

class_name Spawn

# Contiene los <aliens> organizados por nivel
var aliens_level = {
	0: {
		0: 'walking'
	}
}

# Aproximado de aliens que se spawnea por nivel
var rang_aliens = {
	0: 50,
	1: 100,
	2: 200, 
}

# Rango de tiempo en que se spawnea un <alien>
export var rang_time = {'from': 5, 'to': 15}
func _ready():
	prepare(0)

func prepare(nivel):
	# Cantidad de <aliens> en este nivel
	# nivel-10 a nivel+10
	var count_aliens = rand_range((rang_aliens[nivel] - 10), (rang_aliens[nivel] + 10))
	spawn({'count_aliens': count_aliens, "nivel": nivel})
	
func spawn(spawn: Dictionary) -> void:
	var num_alien = int((rand_range(0, aliens_level[spawn.nivel].size())))
	var name_alien = aliens_level[spawn.nivel][num_alien] 
	var alien = Function.new_alien(name_alien)
	add_child(alien)
	yield(get_tree().create_timer(rand_range(rang_time.from, rang_time.to)), "timeout")
	spawn(spawn)
