extends Node
class_name StateMachine


@export var starting_state: State

var _parent: StatefulCharacter3D
var _move_component: MoveComponent
var _current_state: State




func init(parent: StatefulCharacter3D, move_component: MoveComponent):
	_parent = parent
	_move_component = move_component
	_current_state = starting_state
	for child in get_children():
		if child is State:
			child.do_init(parent, move_component, null)
	
	_current_state.enter()


func change_state(new_state: State) -> void:
	print("going from ",_current_state.name," to ", new_state.name)
	_current_state.exit()
	_current_state = new_state
	_current_state.enter()

func _process(delta: float) -> void:
	var next_state := _current_state.do_process(delta)
	if next_state != null:
		change_state(next_state)

func _physics_process(delta: float) -> void:
	var next_state := _current_state.do_physics_process(delta)
	if next_state != null:
		change_state(next_state)

func _unhandled_input(event: InputEvent) -> void:
	var next_state := _current_state.do_unhandled_input(event)
	if next_state != null:
		change_state(next_state)

func _input(event: InputEvent) -> void:
	var next_state := _current_state.do_input(event)
	if next_state != null:
		change_state(next_state)
