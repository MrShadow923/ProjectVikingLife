extends CharacterBody3D

@export var walk_speed: float = 5.0
@export var sprint_speed: float = 8.5
@export var jump_velocity: float = 4.5

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var mesh: MeshInstance3D = $MeshInstance3D
@onready var camera_rig: Node3D = $CameraPivot
@onready var interaction_ray: RayCast3D = $CameraPivot/SpringArm3D/Camera3D/InteractionRay
@onready var interaction_label: Label = $UI/InteractionLabel

var current_interactable: Interactable = null

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	if event.is_action_pressed("toggle_perspective"):
		camera_rig.toggle_perspective()

	# Trigger interaction on 'E'
	if event.is_action_pressed("interact") and current_interactable:
		current_interactable.interact(self)

	camera_rig.handle_mouse_input(event)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	var current_speed = sprint_speed if Input.is_action_pressed("sprint") else walk_speed
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")

	var camera_forward = -camera_rig.global_transform.basis.z
	var camera_right = camera_rig.global_transform.basis.x
	
	camera_forward.y = 0
	camera_right.y = 0
	camera_forward = camera_forward.normalized()
	camera_right = camera_right.normalized()

	var direction = (camera_forward * -input_dir.y + camera_right * input_dir.x).normalized()

	if direction != Vector3.ZERO:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
		
		if camera_rig.current_mode == camera_rig.Mode.THIRD:
			var target_rotation = atan2(-direction.x, -direction.z)
			mesh.rotation.y = lerp_angle(mesh.rotation.y, target_rotation, 10.0 * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)

	if camera_rig.current_mode == camera_rig.Mode.FIRST:
		rotation.y = camera_rig.rotation.y

	move_and_slide()
	_check_interaction()

func _check_interaction() -> void:
	if interaction_ray.is_colliding():
		var collider = interaction_ray.get_collider()
		var interactable = collider.get_node_or_null("Interactable") as Interactable
		
		if interactable:
			current_interactable = interactable
			interaction_label.text = "[E] " + interactable.prompt_text
			interaction_label.visible = true
			return

	current_interactable = null
	interaction_label.visible = false
