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
var spring

func _ready() -> void:
	var instance = scene.instantiate()
	instance.position = Vector2(300, y_pos)
	instance.set_script(collisionScript)
	y_pos -= y_interval
	add_child(instance)

func _process(_delta):
	if abs(character.position.y - y_pos) < 800:
		var platform = scene.instantiate()
		platform.name = "platform"
		while true:
			x = randf_range(0, 600)
			if abs(x - prevx) < x_interval:
				pass
			else:
				prevx = x
				break
			
		platform.position = Vector2(x, y_pos)
		platform.set_script(collisionScript)
		add_child(platform)
		if randi_range(0, 10) == 1:
			platform.name = "springPlatform"
			var springInstance = springScene.instantiate()
			springInstance.position = Vector2(x, y_pos)
			# spring.set_script("res://code/spring.gd")
			add_child(springInstance)
			
		y_pos -= y_interval

	
