extends Attack 

func _on_timer_timeout() -> void:
	var mobPos :Vector2 = $ClosestMobDetector.get_closest_mob_position();
	var angle = mobPos.angle_to(Vector2(0, 1));
	rotation = -angle;
	$AnimationPlayer.play('launch');

func _on_animation_player_animation_finished(anim_name:StringName) -> void:
	if(anim_name == 'launch'):
		$AnimationPlayer.play('RESET');
		$Timer.start();
