extends Node3D

signal perspective_changed(mode: Mode)

enum Mode { FIRST, THIRD }

@export var current_mode: Mode = Mode.THIRD
@export var mouse_sensitivity: float = 0.003
@export var third_person_fov: float = 70.0
@export var first_person_fov: float = 80.0
@export var transition_duration: float = 0.25

@onready var spring_arm: SpringArm3D = $SpringArm3D
@onready var camera: Camera3D = $SpringArm3D/Camera3D
@onready var player_mesh: MeshInstance3D = $"../MeshInstance3D"
@onready var crosshair: Control = $"../UI/CenterContainer/Crosshair"

var tween: Tween

func _ready() -> void:
	apply_mode_instant(current_mode)

func handle_mouse_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotation.y -= event.relative.x * mouse_sensitivity
		rotation.x -= event.relative.y * mouse_sensitivity
		rotation.x = clamp(rotation.x, deg_to_rad(-60.0), deg_to_rad(30.0))

func toggle_perspective() -> void:
	if current_mode == Mode.THIRD:
		set_mode(Mode.FIRST)
	else:
		set_mode(Mode.THIRD)

func set_mode(new_mode: Mode) -> void:
	current_mode = new_mode
	
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween().set_parallel(true)

	if current_mode == Mode.FIRST:
		tween.tween_property(spring_arm, "spring_length", 0.0, transition_duration)
		tween.tween_property(camera, "fov", first_person_fov, transition_duration)
		if player_mesh:
			player_mesh.visible = false
		if crosshair:
			crosshair.visible = true
	else:
		tween.tween_property(spring_arm, "spring_length", 3.5, transition_duration)
		tween.tween_property(camera, "fov", third_person_fov, transition_duration)
		if player_mesh:
			player_mesh.visible = true
		if crosshair:
			crosshair.visible = false

	perspective_changed.emit(current_mode)

func apply_mode_instant(mode: Mode) -> void:
	current_mode = mode
	if current_mode == Mode.FIRST:
		spring_arm.spring_length = 0.0
		camera.fov = first_person_fov
		if player_mesh:
			player_mesh.visible = false
		if crosshair:
			crosshair.visible = true
	else:
		spring_arm.spring_length = 3.5
		camera.fov = third_person_fov
		if player_mesh:
			player_mesh.visible = true
		if crosshair:
			crosshair.visible = false
