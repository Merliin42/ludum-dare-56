extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Score.text = get_time_display(GlobalVariables.elapsed_seconds);

func get_time_display(seconds_passed: int) -> String:
	var seconds = seconds_passed % 60;
	var minutes : int = seconds_passed / 60;

	var str_seconds = str(seconds);
	if(seconds <= 9):
		str_seconds = '0' + str_seconds;

	var str_minutes = str(minutes);
	if(minutes <= 9):
		str_minutes = '0' + str_minutes;

	return str_minutes + ':' + str_seconds;

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file('res://main.tscn');