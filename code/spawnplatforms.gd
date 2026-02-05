extends Node

@onready var scene = preload("res://scenes/platform.tscn")
@onready var y_pos = 700
@onready var collisionScript = preload("res://code/collisions.gd")
const y_interval = 150


func _process(_delta):
	var instance = scene.instantiate()
	instance.position = Vector2(randf_range(0, 600), y_pos)
	instance.set_script(collisionScript)
	y_pos -= y_interval
	add_child(instance)
	
