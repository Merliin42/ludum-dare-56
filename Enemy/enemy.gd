extends Area2D 

signal damage_taken(new_health);

@export var speed := 100;
@export var health := 10;
@export var damages := 10;

func _process(delta: float) -> void:
	var camera = get_viewport().get_camera_2d()

	if camera:
		var center_ajusted = camera.global_position 
		position = position.move_toward(center_ajusted, delta * speed);
		$Line2D.points[1].position = center_ajusted;

func take_damage(amount: int) -> void:
	$AnimationPlayer.play('take_damage');
	health -= amount;
	emit_signal('damage_taken', health);

func _on_damage_detector_area_entered(area: Area2D) -> void:
	if is_instance_of(area, Attack):
		take_damage(area.damages);