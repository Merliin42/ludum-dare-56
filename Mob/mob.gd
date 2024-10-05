class_name Mob;
extends CharacterBody2D;

signal damage_taken(new_health);

@export var speed := 100;
@export var health := 10;
@export var damages := 10;

func _process(delta: float) -> void:
	var camera = get_viewport().get_camera_2d()

	if camera:
		velocity = camera.global_position - self.global_position;
		velocity = velocity.normalized() * speed;
		move_and_slide();

func take_damage(amount: int) -> void:
	$AnimationPlayer.play('take_damage');
	health -= amount;
	emit_signal('damage_taken', health);

func _on_damage_detector_area_entered(area: Area2D) -> void:
	if is_instance_of(area, Attack):
		take_damage(area.damages);