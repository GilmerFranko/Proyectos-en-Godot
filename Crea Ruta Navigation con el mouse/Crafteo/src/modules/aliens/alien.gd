extends KinematicBody2D
class_name Alien
var life = 100

# Velocidad de movimiento
var velocity = 50

# Define si el <alien> se puede mover
var stop : bool
var damage = 40
func _ready():
	pass

func _physics_process(delta):
	move_and_collide(Vector2(0,1))

		
		
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
