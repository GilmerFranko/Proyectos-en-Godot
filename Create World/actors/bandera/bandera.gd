extends Area2D
var velocity = Vector2(0, 0)
var hitsplayer
var hitsenemy
var map = load("res://scenes/Map.tscn");
var objparent=get_parent()
var follow: bool
var bodycol: KinematicBody2D
var ifollow
func _ready():
	hitsenemy=0
	hitsplayer=0
	objparent=get_parent()
	follow=false
	ifollow="n"
# warning-ignore:unused_argument
func _process(delta):
	$Label.text=ifollow
	if follow:#sigue a quien tomo la bandera
		position=bodycol.position
		$Label.text=ifollow
func _on_bandera_body_entered(body):#con esto se sabe quien tomo la bandera y le suma el puntaje
	if body.is_in_group("player"):
		bodycol=body
		follow=true
		ifollow="player"
	elif body.is_in_group("enemy"):
		bodycol=body
		follow=true
		ifollow="enemy"
