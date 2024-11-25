extends Node3D

@export var bullet_casing: PackedScene

func spawn_casing():
	var casing = bullet_casing.instantiate()
	get_tree().root.add_child(casing)
