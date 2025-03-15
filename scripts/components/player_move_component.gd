extends MoveComponent
class_name PlayerMoveComponent

var camera_rig: CameraRig

func get_movement_direction_2d() -> Vector2:
	return Input.get_vector("player_left","player_right", "player_forward", "player_backward")

func get_movement_direction_3d() -> Vector3:
	var raw_input := get_movement_direction_2d()
	return (
		camera_rig.global_basis.z * raw_input.y + 
		camera_rig.global_basis.x * raw_input.x
	)

func wants_jump() -> bool:
	return Input.is_action_just_pressed("player_jump")
