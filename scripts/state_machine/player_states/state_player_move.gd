extends State
class_name StatePlayerMove


@export_group("Exit States")
@export var idle_state: State
@export var jump_state: State
@export var fall_state: State

func do_physics_process(delta: float) -> State:
	super(delta)
	
	if not _parent.is_on_floor():
		return fall_state
	if _move_component.wants_jump():
		return jump_state
		
	var move_direction := _move_component.get_movement_direction_3d()
	var y_velocity := _parent.velocity.y
	_parent.velocity.y = 0.0
	
	_parent.velocity = _parent.velocity.move_toward(
		move_direction*_parent.move_speed, 
		delta*_parent.ground_accel
	)
	
	_parent.velocity.y = y_velocity
	
	return null
	
	
	
