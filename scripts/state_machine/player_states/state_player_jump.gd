extends State
class_name StatePlayerJump


@export_group("Exit States")
@export var idle_state: State
@export var fall_state: State
@export var move_state: State



func enter() -> void:
	super()
	_parent.velocity.y += _parent.jump_impulse

func do_physics_process(delta: float) -> State:
	super(delta)
	
	
	
	if not _parent.is_on_floor() && _parent.velocity.y <= 0.0:
		return fall_state
	
	var move_direction := _move_component.get_movement_direction_3d()
	
	if _parent.is_on_floor():
		if move_direction.is_zero_approx():
			return idle_state
		else:
			return move_state
	
	var y_velocity := _parent.velocity.y
	_parent.velocity.y = 0.0
	
	var delta_v: float = _parent.air_accel
	if move_direction.is_zero_approx():
		delta_v = _parent.air_friction
	
	_parent.velocity = _parent.velocity.move_toward(
		move_direction*_parent.move_speed, 
		delta*delta_v
	)

	
	_parent.velocity.y = y_velocity
	
	return null
	
	
	
