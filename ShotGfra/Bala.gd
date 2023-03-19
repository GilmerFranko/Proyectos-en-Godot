extends KinematicBody2D
var velocity = Vector2()
var poscc = Vector2()
var decicion
var vel
func _ready():
	pass



func _physics_process(delta): 
	
	decicion
	if decicion == false:##Derecha
		vel
		_posc(poscc)
		velocity = poscc
		velocity.x +=1
		if velocity.length() > 0:
			velocity = velocity.normalized() * 1000
		position.x += velocity.x * delta 
	if decicion == true:##Izquiera
		vel
		_posc(poscc)
		velocity = poscc
		velocity.x +=1
		if velocity.length() > 0:
			velocity = velocity.normalized() * 1000
		position.x -= velocity.x * delta 

	
 
func _posc(poscc):
	velocity = poscc
func _izquierda():
	pass






func _on_Area2D_body_entered(body):
	queue_free()


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
