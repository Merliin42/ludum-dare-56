extends CanvasLayer

signal upgrade_choosed(value);

@onready var attacks_description: Array = AttacksDescription.new().attacks_description;
var upgrade_option := preload('res://GUI/upgrade_option.tscn');

func _ready() -> void:
	get_tree().paused = true;
	for i in range(3):
		var index = randi() % attacks_description.size();
		var attack = attacks_description[index];
		var upgrade_option_instanced = upgrade_option.instantiate();
		if is_instance_of(upgrade_option_instanced, UpgradeOption):
			upgrade_option_instanced.title = attack.title;
			upgrade_option_instanced.description = attack.description;
			upgrade_option_instanced.icon_path = attack.icon;
			upgrade_option_instanced.ref = attack.ref;
			upgrade_option_instanced.has_been_pressed.connect(_on_button_clicked);
			$VBoxContainer.add_child(upgrade_option_instanced);

func _on_button_clicked(value: String):
	upgrade_choosed.emit(value);
	get_tree().paused = false;
	queue_free();
