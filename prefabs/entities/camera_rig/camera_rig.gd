extends Node3D
class_name CameraRig

enum CameraState {FOLLOWING_PLAYER}

@export var camera_state: CameraState = CameraState.FOLLOWING_PLAYER
@export var arm_pivot: Node3D
@export var spring_arm: Node3D
@export var camera: Camera3D
@export var aim_ray: RayCast3D


var _relative_motion := Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			_relative_motion = event.screen_relative
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MIDDLE && event.pressed:
			if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			else:
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _process(delta: float) -> void:
	if camera_state == CameraState.FOLLOWING_PLAYER:
		rotation.y -= InputSettings.mouse_sensitivity*_relative_motion.x*delta
		rotation.x -= InputSettings.mouse_sensitivity*_relative_motion.y*delta
	
	
	_relative_motion = Vector2.ZERO
