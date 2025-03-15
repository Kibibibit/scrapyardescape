extends StatefulCharacter3D
class_name Player


@export var camera_rig: CameraRig


func _ready() -> void:
	if move_component is PlayerMoveComponent:
		move_component.camera_rig = camera_rig
	super()
