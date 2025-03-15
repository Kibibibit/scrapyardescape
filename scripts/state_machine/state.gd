extends Node
class_name State


@export var animation_name: String
@export var apply_gravity: bool = true

var _parent: StatefulCharacter3D
var _move_component: MoveComponent
var _animation_player: AnimationPlayer

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")


func do_init(
	parent: StatefulCharacter3D, 
	move_component: MoveComponent, 
	animation_player: AnimationPlayer
) -> void:
	_parent = parent
	_move_component = move_component
	_animation_player = animation_player
	

func enter() -> void:
	if _animation_player != null:
		_animation_player.play(animation_name)

func exit() -> void:
	pass

func do_input(_event: InputEvent) -> State:
	return null

func do_unhandled_input(_event: InputEvent) -> State:
	return null

func do_process(delta: float) -> State:
	if apply_gravity:
		_parent.velocity.y -= gravity*delta
	return null

func do_physics_process(_delta: float) -> State:
	return null
