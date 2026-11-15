extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var jumpCounter = 0
var bounceVelocity = JUMP_VELOCITY 
func _physics_process(delta: float) -> void:
	
	# Bounce
	if jumpCounter > 0 and is_on_floor() and not Input.is_action_just_pressed("jump"):
		jumpCounter -= 1
		velocity.y = bounceVelocity + 100		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumpCounter += 1
		#print(jumpCounter)
		
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		

		
		# Bounce 
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	var MCOriginal = load("res://.godot/imported/MC Balloon Dog.png-a0e499c2570a4df54c23f52876964fec.ctex")
	var MCReversed = load("res://.godot/imported/MC Balloon Dog Reversed.png-6eb36c754304cc78d9b90c7fc7be8f20.ctex")
		
	if direction:
		velocity.x = direction * SPEED
		if direction < 0: 
			$BalloonDog.set_texture(MCReversed)
		if direction > 0:
			$BalloonDog.set_texture(MCOriginal)

			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
