extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var movenement = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if movenement:
	
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY
		
	# flip player
	if Input.is_action_pressed("ui_left"):
	#if Input.is_action_just_pressed("ui_left"):
		if $Sprite2D.flip_h:
			$Sprite2D.flip_h = false
	if Input.is_action_pressed("ui_right"):
		if not $Sprite2D.flip_h:
			$Sprite2D.flip_h = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

		
	if position.x < 0:
		position.x = 600
	
	if  position.x > 600:
		position.x = 0

	move_and_slide()
	
