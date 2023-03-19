extends Camera2D

var rueda_abajo
var rueda_arriva
var camara
func _ready():
	rueda_abajo= Input.is_action_pressed("rueda_abajo")
	rueda_arriva= Input.is_action_pressed("rueda_arriva")
	camara = position
func _process(delta):
	
	if Input.is_action_pressed("w"):
		camara.x +=0.05
		camara.y +=0.05
		set_zoom (Vector2(camara.y,camara.x))
		if camara.x >= 2 and camara.y >=2:
			camara.x=2
			camara.y=2
	if Input.is_action_pressed("s"):
		camara.x -= 0.05
		camara.y -= 0.05
		set_zoom (Vector2(camara.y,camara.x))
		if camara.x <= 0.3 and camara.y <= 0.3:
			camara.x=0.3
			camara.y=0.3
