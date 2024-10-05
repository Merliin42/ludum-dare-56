extends Attack 

func _on_timer_timeout() -> void:
	$Sprite2D.visible = !$Sprite2D.visible;
	self.monitorable = !self.monitorable;
