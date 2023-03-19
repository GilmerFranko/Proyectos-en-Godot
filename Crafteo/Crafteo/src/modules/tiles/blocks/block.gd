extends StaticBody2D
class_name Block

# Durabilidad del bloque
var life = 100

func _ready():
	update()
	
func damage(damage):
	life = life - damage
	if(life <= 0):
		destruct()

func destruct():
	queue_free()

func update():
	have_top_block()
	yield(get_tree().create_timer(1), "timeout")
	update()
	
	
	
func have_top_block():
	if(get_node("top").is_colliding()):
		if(get_node("top").get_collider().is_in_group('block')):
			get_node("Line2D").width = 0
func have_left_block():
	pass
func have_right_block():
	pass
func have_bottom_block():
	pass
