extends StaticBody2D
func _ready():
	pass
func on_entered(body):
	print("Hola")
	if body!=self:#si no esta colicionando con sigo mismo
		if body.is_in_group("terrain"):
			if self.queue_free():
				pass
			else:#si borro la instancia
				get_node("Area2D").disconnect("body_entered",self,"on_entered")#desconectame la señal asi ahorrara recursos
				get_node("Area2D").set_deferred("monitoring",false)#desconectame la señal asi ahorrara recursos
				get_node("Area2D").set_deferred("monitored",false)#desconectame la señal asi ahorrara
func timer():##despues de 1segundo
	get_node("Area2D").disconnect("body_entered",self,"on_entered")#desconectame la señal asi ahorrara recursos
	get_node("Area2D/CollisionShape2D").disabled=true
	print("instance disabled")
