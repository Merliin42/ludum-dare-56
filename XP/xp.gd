extends Area2D



func _on_body_entered(_body:Node2D) -> void:
	$Timer.start();

func _on_timer_timeout() -> void:
	queue_free();