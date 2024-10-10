extends Node3D

@export var modules: Array[PackedScene] = []
@export var death: Array[PackedScene] = []
var amnt = 30
var rng = RandomNumberGenerator.new()
var offset = 6
var boolean_array = []
var previous_value = true
var start = true
var random_death = false


func _ready():
	for n in amnt:
		random_generation ()
		spawnModule(n*offset, 0)  # Модуль 1
		spawnModule(n*offset, 3)  # Модуль 2
		spawnModule(n*offset, -3) # Модуль 3
		boolean_array.clear()

func spawnModule(n, z):
	rng.randomize()
	var num = rng.randi_range(0,modules.size()-1)
	if randi_range(0, 1000) % 30 == 0:
		random_death = true
	else:
		num = 0
	
	if start:
		var instance = modules[0].instantiate()
		instance.position.x = n
		instance.position.z = z
		start = false
		add_child(instance)
	else:
		if z == -3:
			if boolean_array[0]:
				var instance = modules[num].instantiate()
				instance.position.x = n
				instance.position.z = z
				death_generation(n,z)
				add_child(instance)
		elif z == 0:
			if boolean_array[1]:
				var instance = modules[num].instantiate()
				instance.position.x = n
				instance.position.z = z
				death_generation(n,z)
				add_child(instance)
		elif z == 3: 
			if boolean_array[2]:
				var instance = modules[num].instantiate()
				instance.position.x = n
				instance.position.z = z
				death_generation(n,z)
				add_child(instance)


func random_generation ():
	for i in range(3):
			var random_value = randi() % 2 == 0
			if i == 2:
				if boolean_array[0] == random_value == false == previous_value:
					boolean_array[1] = true
			boolean_array.append(random_value)
			previous_value = random_value
func death_generation (n, z):
	var num = rng.randi_range(0,1)
	if random_death:
		var instance = death[num].instantiate()
		instance.position.x = n
		instance.position.z = z + 1
		instance.position.y += 1
		random_death = false
		add_child(instance)
