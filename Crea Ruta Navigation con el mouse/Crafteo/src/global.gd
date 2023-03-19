extends Node

#---- Modulo Floor ----
# Contiene cada objeto (robot) colocado
# En cada posición (suelo, espacio)
var itemsInFloo = {1: null, 2: null, 3: null, 4: null, 5: null, 6: null, 7: null, 8: null}

#---- Modulo Robot ----
# Contiene el robot selecionado
# Default - generator
var RobotSelected = 'generator'


#---- Modulo Energy ----
# Segundos en que se genera energia
# Default - 5
var time_generate_energy = 1

# Energia preinicial
# Default - 50
var energy = 50



