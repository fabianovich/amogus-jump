extends Label
var countdown = 3
@onready var character = get_node("../Character")



func _on_timer_timeout() -> void:
	if countdown > 0:
		text = str(countdown)
		countdown -=1
	else:
		text = "start"
		character.movenement = true
		
