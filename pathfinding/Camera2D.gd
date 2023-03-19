extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _input(event):
	if(Input.is_action_pressed("ui_down")):
		position.y += 20
	if(Input.is_action_pressed("ui_left")):
		position.x += 20
	if(Input.is_action_pressed("ui_up")):
		position.y -= 20
	if(Input.is_action_pressed("ui_right")):
		position.x -= 20
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
