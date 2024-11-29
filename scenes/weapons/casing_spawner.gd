extends Node3D

@export var bullet_casing: PackedScene

func spawn_casing():
	var casing: RigidBody3D = bullet_casing.instantiate()
	casing.global_position = global_position
	get_tree().root.add_child(casing)
