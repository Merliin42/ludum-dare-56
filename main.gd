extends Node

@export var level_up_enabled := true;

var level_up_menu := preload('res://GUI/level_up_menu.tscn');
var player_xp = 0;
var previous_increment = 0;
var increment = 1;
var next_level = 5;
var elapsed_seconds = 0;

func _on_character_died() -> void:
	GlobalVariables.elapsed_seconds = elapsed_seconds;
	get_tree().change_scene_to_file('res://scorescreen/score_screen.tscn');

func _on_character_xp_obtained(amount: Variant) -> void:
	player_xp += amount;
	$CanvasLayer/XPBar.value = player_xp * 100 / next_level;
	if (player_xp >= next_level) and level_up_enabled :
		var level_up_menu_instanced = level_up_menu.instantiate();
		level_up_menu_instanced.connect('upgrade_choosed', _on_upgrade_choosed);
		$CanvasLayer.add_child(level_up_menu_instanced);

	
func _on_upgrade_choosed(value: String):
	next_level += increment;
	increment += previous_increment;
	player_xp = 0;	
	$World/Character.add_attack(value);

func _on_timer_timeout() -> void:
	elapsed_seconds += 1;
	$CanvasLayer/Clock.text = get_time_display(elapsed_seconds);

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
