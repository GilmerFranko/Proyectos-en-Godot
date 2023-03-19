extends KinematicBody2D
var run = 350
var direccion
var posision
var a
var rotar
var direccionn
var tiempo
signal tiempo
func _ready():
	posision = Vector2(0,0)
	a=false
	if Input.is_action_just_pressed("click"):
		$Sale_Bala.start()
		direccion=get_global_mouse_position() - global_position
	direccionn = get_viewport().get_mouse_position()
	direccionn = position

func _physics_process(delta):
	direccionn = get_global_mouse_position()
	Disparar(delta)
	

func Disparar(delta):
	
	rotar = get_angle_to(Vector2(direccionn.x,direccionn.y))
	rotar = rotar + 45.6
	if a ==false: # Rotar solo una vez
		$Sprite2.rotate(rotar)
		a=true
	$Sprite2.playing = true
	move_and_collide(direccion.normalized()*delta*run)


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()


func DesaparecerBalaAlColisionar(body):
	if tiempo == true:
		queue_free()
	


func _on_Sale_Bala_timeout():
	tiempo= true

func _on_Bullet_tiempo():
	$Sale_Bala.start()
