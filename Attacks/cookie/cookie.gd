extends Attack 


func _on_timer_timeout() -> void:
	$AnimationPlayer.play('cookie');

func _on_animation_player_animation_finished(anim_name:StringName) -> void:
	if(anim_name == 'cookie'):
		$AnimationPlayer.play('RESET');
		$Timer.start();
