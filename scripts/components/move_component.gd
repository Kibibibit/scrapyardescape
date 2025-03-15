extends Node
class_name MoveComponent

func get_movement_direction_2d() -> Vector2:
	return Vector2.ZERO

func get_movement_direction_3d() -> Vector3:
	return Vector3.ZERO

func wants_jump() -> bool:
	return false
