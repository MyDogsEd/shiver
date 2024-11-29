extends RigidBody3D

# Exports

# The maximum number of bullet casings that can exist at a time
@export var MAX_BULLET_COUNT := 100;

# Controls the top end of the random force applied to the casings when entering
# the scene tree
@export var RANDOM_FORCE_TOP := 5

@export_range(0, 10, 0.01) var RANDOM_ROTATIONAL_TOP := 1

# Static Variables
static var bullet_count := 0;



func _enter_tree() -> void:
	bullet_count += 1;
	apply_impulse(Vector3(randf_range(RANDOM_FORCE_TOP/2, RANDOM_FORCE_TOP), 0, 0))
	apply_torque_impulse(Vector3(
		randf_range(-RANDOM_ROTATIONAL_TOP, RANDOM_ROTATIONAL_TOP),
	 	randf_range(-RANDOM_ROTATIONAL_TOP, RANDOM_ROTATIONAL_TOP),
		randf_range(-RANDOM_ROTATIONAL_TOP, RANDOM_ROTATIONAL_TOP)
	))
	

func _on_timer_timeout() -> void:
	if (bullet_count >= MAX_BULLET_COUNT):
		print("casing removed")
		self.queue_free()
	print(linear_velocity)
	print(angular_velocity)
