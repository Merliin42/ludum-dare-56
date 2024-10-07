extends Node

@export var level_up_enabled := true;

var level_up_menu := preload('res://GUI/level_up_menu.tscn');
var player_xp = 0;
var previous_increment = 0;
var increment = 1;
var next_level = 5;

func _on_character_died() -> void:
	get_tree().change_scene_to_file('res://launchscreen/lanchscreen.tscn');

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