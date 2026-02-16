extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0
const SPRING_VELOCITY = -1500
@onready var gameNode = get_node("..")
@onready var previous_y = 0.
@onready var highest_y = position.y




func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())


func _ready():
	position.x = 300
	previous_y = position.y

func _physics_process(delta: float) -> void:
	var movenement = gameNode.movenement
	if !is_multiplayer_authority(): return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
		

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY
		
	# flip player
	
	
	if Input.is_action_pressed("left"):
	#if Input.is_action_just_pressed("ui_left"):
		if $Sprite2D.flip_h:
			$Sprite2D.flip_h = false
	if Input.is_action_pressed("right"):
		if not $Sprite2D.flip_h:
			$Sprite2D.flip_h = true

	# calculate y difference
	var current_y = position.y
	var y_difference = current_y - previous_y
	
	if y_difference < 0:
		if movenement:
			if position.y < highest_y:
				gameNode.y_difference = abs(y_difference)
				highest_y = position.y
	
	previous_y = current_y

		
	if position.x < 0:
		position.x = 600
	
	if  position.x > 600:
		position.x = 0

	move_and_slide()
	if movenement:
		for index in get_slide_collision_count():
			var collision := get_slide_collision(index)
			var body := collision.get_collider()
			if is_on_floor():
				if "springPlatform" in body.name:
					velocity.y = SPRING_VELOCITY
					var id = extract_id(body.name)
					get_node("../Platforms/spring" + id + "/AnimatedSprite2D").frame = 1
				else: 
					velocity.y = JUMP_VELOCITY
			
		
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		
func extract_id(body_name):
	var regex = RegEx.new()
	regex.compile("[0-9]+")
	#get spring id
	var IsId = regex.search(body_name)
	if IsId:
		return str(IsId.get_string())
	else:
		return ""
