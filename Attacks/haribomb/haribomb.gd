extends Attack 

func _on_timer_timeout() -> void:
	var angle = randf_range(0, TAU);
	rotation = -angle;
	$AnimationPlayer.play('launch');

func _on_animation_player_animation_finished(anim_name:StringName) -> void:
	if(anim_name == 'launch'):
		$AnimationPlayer.play('RESET');
		$Timer.start();
