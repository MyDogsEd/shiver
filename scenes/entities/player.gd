extends CharacterBody3D


const SPEED := 5.0
const JUMP_VELOCITY := 4.5
const LOOK_SENSITIVIY := 0.001

var mouse_captured := true

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_handle_mouse_motion(event)

func _handle_mouse_motion(event: InputEventMouseMotion):
	if not mouse_captured:
		return
	
	var motion := event.relative
	
	# Rotate about the y axis of the Characterbody3D
	# Which will use the x axis of the motion vector
	rotate_y(motion.x * LOOK_SENSITIVIY * -1)
	
	# Rotate the x axis of the Camera 
	$Camera3D.rotate_x(motion.y * LOOK_SENSITIVIY * -1)
	
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	# Handle doing mouse mode thing
	if Input.is_action_just_pressed("pause"):
		if mouse_captured:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			mouse_captured = false
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			mouse_captured = true
	
	move_and_slide()
