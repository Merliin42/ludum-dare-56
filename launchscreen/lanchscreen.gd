extends CanvasLayer

@onready var main := preload('res://main.tscn');

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_packed(main);