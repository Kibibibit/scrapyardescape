extends State
class_name StatePlayerFall

@export_category("Exit States")
@export var idle_state: State
@export var move_state: State
@export var jump_state: State

func do_physics_process(delta: float) -> State:
	super(delta)

	var move_direction := _move_component.get_movement_direction_3d()
	
	var delta_v: float = _parent.air_accel
	if move_direction.is_zero_approx():
		delta_v = _parent.air_friction
	
	var y_velocity: float = _parent.velocity.y
	_parent.velocity.y = 0.0
	_parent.velocity = _parent.velocity.move_toward(
		move_direction*_parent.move_speed, 
		delta*delta_v
	)
	_parent.velocity.y = y_velocity
	
	if _parent.is_on_floor():
		if not move_direction.is_zero_approx():
			return move_state
		if _move_component.wants_jump() && _parent.is_on_floor():
			return jump_state
		
		return idle_state
	
	return null
