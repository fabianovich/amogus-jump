extends Label
var countdown = 3
@onready var gameNode = get_node("..")



func _on_timer_timeout() -> void:
	if countdown > 0:
		text = str(countdown)
		countdown -=1
	else:
		text = "start"
		gameNode.movenement = true
		
