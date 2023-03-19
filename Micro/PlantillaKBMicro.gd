extends KinematicBody2D
var Movimiento = Vector2()
export (int) var Velocidad = 250
export (int) var Jump = -600
export (int) var Gravedad = 1450
func _ready():
	pass
func _process(delta):
	Movimientos(delta)
	
	Movimiento = move_and_slide(Movimiento, Vector2(0, -1))

func Movimientos(delta):
	Movimiento.y += delta * Gravedad
	Movimiento.x = 0
	var Der = Input.is_action_pressed("ui_right")
	var Izq = Input.is_action_pressed("ui_left")
	var S = Input.is_action_just_pressed("ui_up")
	var Down = Input.is_action_pressed("ui_select")
	if Der:
		$Animacion.playing = true
		Movimiento.x = Velocidad
		$Animacion.play("Walk")
		$Animacion.flip_h =0
		
	if Izq:
		$Animacion.playing = true
		Movimiento.x = -Velocidad
		$Animacion.play("Walk")
		$Animacion.flip_h =-1
		
		
	if S:
		Movimiento.y= Jump
		
	if !S and !Izq and !Der:
		$Animacion.playing = false
		$Animacion.frame = 0
	if !is_on_floor():
		$Animacion.frame = 2
		
