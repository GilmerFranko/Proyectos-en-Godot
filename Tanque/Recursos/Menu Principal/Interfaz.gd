extends CanvasLayer

func _ready():
	pass
func _process(delta):
	Enemy()
	Salir()
	Jugar()
func Enemy():
	
	$Player/Player.gravedad= 0 
	$Player/Player/Camera2D.current = false
	$Player/Player/Armas/Arma1.hide()
	$Player/Player/Armas/Arma2.hide()
	$Player/Player/Armas/Arma3.hide()
	$Player/Player/Armas/Opcion.hide()
	$Player/Player/Armas/Seleccionado.hide()
	$Player/Player/TextEdit.hide()
	
func Salir():
	if $Salir.pressed:
		get_tree().quit()

func Jugar():
	if $Jugar.pressed:
		get_tree().change_scene("res://Mundo.tscn")
