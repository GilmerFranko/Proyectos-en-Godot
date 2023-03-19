extends Node2D
var cubitCopy
var rang = {}
export var sizeCubits = 16 
export var sizeMap = 40 
func _ready():
	rang.x = 0
	rang.y = 0
	createWorld()
func createWorld():
	# Filas
	for i in range(sizeMap):
		var Cubit = $Cubit
		rang.y = 0
		rang.x = rang.x + sizeCubits
		cubitCopy = Cubit.duplicate()
		cubitCopy.name="Cubit" + str(i)
		cubitCopy.position = Vector2(rang.x,0)
		cubitCopy.get_node("TextEdit").text = cubitCopy.name
		self.add_child(cubitCopy)
		#Columnas
		for a in range(sizeMap):
			rang.y = rang.y + sizeCubits
			cubitCopy = Cubit.duplicate()
			cubitCopy.name="Cubit" + str(i)
			cubitCopy.position = Vector2(rang.x,rang.y)
			
			# Agrega el sprite
			var image = Sprite.new()
			image.texture = load("res://resources/images/map/pixel-map.png")
			cubitCopy.add_child(image)
			self.add_child(cubitCopy)
		
