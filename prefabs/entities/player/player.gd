extends StatefulCharacter3D
class_name Player


@export var camera_rig: CameraRig
@export var weapon: WeaponPrefab

func _ready() -> void:
	if move_component is PlayerMoveComponent:
		move_component.camera_rig = camera_rig
	super()



func _process(_delta: float) -> void:
	if camera_rig.aim_ray.is_colliding():
		weapon.look_at(camera_rig.aim_ray.get_collision_point(), Vector3.UP)
	else:
		weapon.rotation = Vector3.ZERO
