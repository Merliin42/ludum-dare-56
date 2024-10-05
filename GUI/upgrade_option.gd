class_name UpgradeOption;
extends Button;

signal has_been_pressed(value);

var id : = '';
var title := '';
var description := '';
var icon_path := '';

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%Title.text = title;
	%Description.text = description;
	%Icon.texture = load(icon_path);

func _on_pressed() -> void:
	has_been_pressed.emit(id);