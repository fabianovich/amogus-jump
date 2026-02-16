extends StaticBody2D

@onready var amogus = get_node("../../0")
@onready var collisionShape = get_node("CollisionShape2D")

func _process(_delta: float) -> void:
	if multiplayer.is_server(): return
	if amogus.get_real_velocity().y < 0:
		collisionShape.disabled = true
	if amogus.get_real_velocity().y > 0:
		collisionShape.disabled = false
