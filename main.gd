extends Node

var level_up_menu := preload('res://GUI/level_up_menu.tscn');
var player_xp = 0;
var next_level = 10;

func _on_character_died() -> void:
	get_tree().quit();

func _on_character_xp_obtained(amount: Variant) -> void:
	player_xp += amount;
	$CanvasLayer/XPBar.value = player_xp * 100 / next_level;
	if player_xp >= next_level:
		var level_up_menu_instanced = level_up_menu.instantiate();
		level_up_menu_instanced.connect('upgrade_choosed', _on_upgrade_choosed);
		$CanvasLayer.add_child(level_up_menu_instanced);

	
func _on_upgrade_choosed(value: String):
	print(value);
	pass ;