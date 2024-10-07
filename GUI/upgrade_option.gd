class_name UpgradeOption;
extends Button;

signal has_been_pressed(value);

var ref : = '';
var title := '';
var description := '';
var icon_path := '';

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = title + '\n' + description;
	icon = load(icon_path);


func _on_pressed() -> void:
	has_been_pressed.emit(ref);