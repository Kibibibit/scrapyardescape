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

func _ready() -> void:
	state_machine.init(self, move_component)



func _physics_process(_delta: float) -> void:
	move_and_slide()
