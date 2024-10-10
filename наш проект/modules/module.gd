extends Node3D

@onready var level = $"../"
var speed = 10

func _physics_process(delta):
	position.x -= speed * delta
	if position.x < -15:
		level.random_generation ()
		level.spawnModule(position.x+(level.amnt*level.offset), 0)  # Модуль 1
		level.spawnModule(position.x+(level.amnt*level.offset), 3)  # Модуль 2
		level.spawnModule(position.x+(level.amnt*level.offset), -3) # Модуль 3
		level.boolean_array.clear()
		queue_free()
