extends Node

@onready var scene = preload("res://scenes/platform.tscn")
@onready var character = $"../Character"

@onready var collisionScript = preload("res://code/collisions.gd")
var y_pos = 700
const y_interval = 150
var x
var prevx = 0


func _process(_delta):
	if abs(character.position.y - y_pos) < 800:
		var instance = scene.instantiate()
		while true:
			x = randf_range(0, 600)
			if abs(x - prevx) < 100:
				pass
			else:
				prevx = x
				break
			
		instance.position = Vector2(x, y_pos)
		instance.set_script(collisionScript)
		y_pos -= y_interval
		add_child(instance)
		print("ligma balls")
	
