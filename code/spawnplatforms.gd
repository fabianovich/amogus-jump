extends Node

@onready var scene = preload("res://scenes/platform.tscn")
@onready var springScene = preload("res://scenes/spring.tscn")
@onready var character = $"../Character"

@onready var collisionScript = preload("res://code/collisions.gd")
var y_pos = 551
const y_interval = 150
const x_interval = 150
var x
var prevx = 300

func _ready() -> void:
	var instance = scene.instantiate()
	instance.position = Vector2(300, y_pos)
	instance.set_script(collisionScript)
	y_pos -= y_interval
	add_child(instance)

func _process(_delta):
	if abs(character.position.y - y_pos) < 800:
		var instance = scene.instantiate()
		while true:
			x = randf_range(0, 600)
			if abs(x - prevx) < x_interval:
				pass
			else:
				prevx = x
				break
			
		instance.position = Vector2(x, y_pos)
		instance.set_script(collisionScript)
		add_child(instance)
		if randi_range(0, 15) == 1:
			var spring = springScene.instantiate()
			instance.position = Vector2(x, y_pos)
			instance.set_script(""res://code/spring.gd"
		y_pos -= y_interval

	
