extends Node2D
export (PackedScene) var Bala

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		if $KinematicBody2D.lado == "derecha":
			
	#falta eliminar la instancia cuando salga de la pantalla
			var new_ball = Bala.instance()
			new_ball.decicion = false
			new_ball.position = $KinematicBody2D.ps
			add_child(new_ball)
			
		if $KinematicBody2D.lado == "izquierda":

			
			var new_ball = Bala.instance()
			new_ball.decicion = true
			new_ball.position = $KinematicBody2D.ps
			
			add_child(new_ball)
			

		
	

func termina_tiempo():
	pass # Replace with function body.
