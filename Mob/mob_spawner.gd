extends Node2D;

@export var mobs: Array[PackedScene];

func _on_timer_timeout() -> void:
	var camera := get_viewport().get_camera_2d();
	if camera:
		var camera_position = get_viewport().get_camera_2d().global_position;
		var distance := get_viewport_rect().size / 2;
		var distance_rotation = randf_range(0, TAU);

		var new_mob = mobs[0].instantiate();
		new_mob.position = distance.rotated(distance_rotation) + camera_position;
		get_parent().add_child(new_mob);
