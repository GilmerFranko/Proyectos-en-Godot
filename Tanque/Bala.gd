extends KinematicBody2D
export (int) var velocidad = 400
var direccion
var posision
var a
signal tiempo
var tiempo
func _ready():
	posision = Vector2(0,0)
	a=false
	tiempo = false
	if Input.is_action_just_pressed("click"):
		$Sale_Bala.start()
		direccion=get_global_mouse_position() - global_position
	

func _physics_process(delta):

	Disparar(delta)
	

func Disparar(delta):
	move_and_collide(direccion.normalized()*delta*velocidad)
	


	


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()


func DesaparecerBalaAlColisionar(body):
	if tiempo == true:
		queue_free()
		


func _on_Sale_Bala_timeout():
	tiempo= true

func _on_Bullet_tiempo():
	$Sale_Bala.start()
