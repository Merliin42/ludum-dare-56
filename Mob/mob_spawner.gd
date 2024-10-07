extends Node2D;

@export var mobs: Array[PackedScene];
@export var vague_time = 20;

var elapsed_seconds = 0;

func _on_timer_timeout() -> void:
	elapsed_seconds += 1;
	# $Timer.wait_time = clamp($Timer.wait_time - 0.01, 0.1, 1);
	var number_to_spawn = 1;
	if elapsed_seconds % vague_time == 0 :
		number_to_spawn = elapsed_seconds;
	var camera := get_viewport().get_camera_2d();
	if camera:
		var camera_position = get_viewport().get_camera_2d().global_position;
		var distance := get_viewport_rect().size / 2;
		for i in range(number_to_spawn):
			var distance_rotation = randf_range(0, TAU);
			var new_mob = mobs[0].instantiate();
			new_mob.position = distance.rotated(distance_rotation) + camera_position;
			get_parent().add_child(new_mob);
