extends StaticBody2D
class_name Block

# Durabilidad del bloque
var life = 100

func damage(damage):
	life = life - 100
	if(life <= 0):
		destruct()

func destruct():
	queue_free()
