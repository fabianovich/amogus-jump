extends Node

@onready var scene = preload("res://scenes/platform.tscn")
@onready var y_pos = 700
@onready var collisionScript = preload("res://code/collisions.gd")
const y_interval = 150
var x
var prevx = 0


func _process(_delta):
	var instance = scene.instantiate()
	
	while true:
		x = randf_range(0, 600)
		if abs(x - prevx) < 100:
			pass
		else:
			print (abs(x-prevx))
			prevx = x
			
			break
		
	instance.position = Vector2(x, y_pos)
	instance.set_script(collisionScript)
	y_pos -= y_interval
	add_child(instance)
	
