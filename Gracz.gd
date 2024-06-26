extends CharacterBody3D

@onready var spring: Node3D = $spring

const SPEED : float = 5.0
const JUMP_VELOCITY : float = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	var input_obrot := Input.get_vector("lewo", "prawo", "gora", "dol")
	#var rotacja := input_obrot.y * delta
	#var kamp = clampf( rotation.y, deg_to_rad( -25 ), deg_to_rad( 75 ) )
	rotate_y( input_obrot.x * delta )
	spring.rotate_x( input_obrot.y * delta )

	move_and_slide()

func _input(_event: InputEvent) -> void:
	pass
