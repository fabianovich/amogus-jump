extends Label

var fps = false

func _process(_delta: float) -> void: 
	if fps:
		set_text("FPS " + str(Engine.get_frames_per_second()))
		

	if Input.is_action_pressed("fps"):
		if fps:
			fps = false
		else:
			fps = true
