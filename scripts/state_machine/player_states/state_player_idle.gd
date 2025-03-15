extends State
class_name StatePlayerIdle


@export_group("Exit States")
@export var move_state: State
@export var jump_state: State
@export var fall_state: State



func do_physics_process(delta: float) -> State:
	super(delta)
	_parent.velocity = _parent.velocity.move_toward(Vector3.ZERO, delta*_parent.ground_friction)
	
	## If the floor disappears, go to fall state
	if not _parent.is_on_floor():
		return fall_state
	
	## If input is being pressed, go to move state
	if not _move_component.get_movement_direction_2d().is_zero_approx():
		return move_state
	
	## If the player can jump, go to jump state
	if _move_component.wants_jump() && _parent.is_on_floor():
		return jump_state
	
	return null
