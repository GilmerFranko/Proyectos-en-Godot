extends Path2D

var a
func _ready():
	a=1
func _process(delta):
	if $PathFollow2D.offset == 0:	
		$PathFollow2D.offset + a * delta
	if $PathFollow2D.offset == 300:
		$PathFollow2D.offset - a * delta
