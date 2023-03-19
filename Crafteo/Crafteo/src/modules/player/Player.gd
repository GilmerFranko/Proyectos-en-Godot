extends Area2D
class_name Player
var life = 100

# Velocidad de movimiento
var velocity = 50

# Define si el <alien> se puede mover
var stop : bool
var damage = 40
func _ready():
	pass

func _physics_process(delta):
	moving(delta)
	if(life <= 0):
		remove_alien()
func moving(delta):
	if(!stop):
		position.x -= velocity * delta
		
		
func removing():
	stop = false
	
	
func stop():
	stop = true
	
	
func _on_alien_body_entered(Robot: Robot):
	stop()
	if not Robot:
		removing()
	atack(Robot)

func atack(Robot: Robot):
	if(Robot):
		Robot.damage(damage)
		yield(get_tree().create_timer(1), "timeout")
		atack(Robot)
	else:
		removing()

func damage(damage):
	life = life - damage

func remove_alien():
	queue_free()
