extends Path2D

@export var mobs: Array[PackedScene];

func _process(_delta: float) -> void:
	position = get_viewport().get_camera_2d().position;

func _on_timer_timeout() -> void:
	$MobSpawnLocation.progress_ratio = randf()

	var new_mob = mobs[0].instantiate();
	new_mob.position = $MobSpawnLocation.position;

	get_parent().add_child(new_mob);
