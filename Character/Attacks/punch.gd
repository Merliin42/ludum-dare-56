extends Attack 


func _on_timer_timeout() -> void:
	$AnimationPlayer.play('punch');

func _on_animation_player_animation_finished(anim_name:StringName) -> void:
	if(anim_name == 'punch'):
		$AnimationPlayer.play('RESET');
		$Timer.start();