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
	

func _physics_process(delta):
	$CanvasLayer/TextEdit.text = str(tiempo)
	Disparar(delta)
	

func Disparar(delta):
	
	move_and_collide(direccion.normalized()*delta*velocidad)
	


	


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()


func DesaparecerBalaAlColisionar(body):
		
		if body.is_in_group("player"):
			$ColisionBullet.disabled =true
		
		

