extends Node3D
class_name Glock

var callback: Callable

func fire_anim(callback: Callable):
	$AnimationPlayer.play("fire")
	self.callback = callback

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fire" && callback != null:
		callback.call()
