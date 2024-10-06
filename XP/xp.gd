extends Area2D



func _on_body_entered(_body:Node2D) -> void:
	$CollectedPlayer.play();

func _on_collected_player_finished() -> void:
	queue_free();