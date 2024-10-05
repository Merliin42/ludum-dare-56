extends Node

var player_xp = 0;
var next_level = 100;

func _on_character_died() -> void:
	get_tree().quit();

func _on_character_xp_obtained(amount:Variant) -> void:
	player_xp += amount;
	$CanvasLayer/XPBar.value = player_xp * 100 / next_level;	