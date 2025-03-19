extends CharacterBody3D
class_name StatefulCharacter3D


@export var state_machine: StateMachine
@export var skin: Node3D
@export var move_component: MoveComponent

@export_category("Movement Properties")
@export var move_speed: float = 10.0
@export var ground_accel: float = 50.0
@export var ground_friction: float = 45.0
@export var air_accel: float = 10.0
@export var air_friction: float = 0.1
@export var jump_impulse: float = 10.0
@export var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@export var turn_speed: float = 8.0


var _last_direction := Vector3.ZERO

func _ready() -> void:
	state_machine.init(self, move_component)



func _physics_process(delta: float) -> void:
	
	
	var input_direction := move_component.get_movement_direction_3d()
	
	
	input_direction.y = 0.0
	
	if input_direction.length() > 0.2:
		_last_direction = input_direction
	
	var skin_angle := Vector3.FORWARD.signed_angle_to(_last_direction, Vector3.UP)
	
	skin.rotation.y = lerp_angle(skin.rotation.y, skin_angle, delta*turn_speed)
	
	move_and_slide()
