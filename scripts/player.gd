extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var sprite_animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_audio: AudioStreamPlayer2D = $JumpSFX


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if not jump_audio.playing:
			jump_audio.play()

	# Get input
	var direction := Input.get_axis("move_left", "move_right")
	
	# Play animation
	if is_on_floor():
		if direction > 0:
			sprite_animation.flip_h = false
			sprite_animation.play("run")
		elif direction < 0:
			sprite_animation.flip_h = true
			sprite_animation.play("run")
		else:
			sprite_animation.play("idle")
	else:
		sprite_animation.play("jump")
	
	# Flip sprite
	if direction > 0:
		sprite_animation.flip_h = false
	elif direction < 0:
		sprite_animation.flip_h = true
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
