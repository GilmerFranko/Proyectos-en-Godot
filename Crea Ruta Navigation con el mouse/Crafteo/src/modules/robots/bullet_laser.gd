extends Area2D

var velocity = 150

var damage = 10

func _ready():
	pass
	
func _process(delta):
	shoot(delta)
	
func shoot(delta):
	position.x += velocity * delta

func _on_bullet_laser_area_entered(alien: Alien):
	if alien:
		alien.damage(damage)
		queue_free()

	
