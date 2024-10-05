class_name Mob;
extends CharacterBody2D;

signal health_updated(new_health);

@export var speed := 100;
@export var max_health := 10;
@export var damages := 10;

@onready var health := max_health;

var xp := preload('res://XP/xp.tscn');

func _process(delta: float) -> void:
	var camera = get_viewport().get_camera_2d()

	if camera:
		velocity = camera.global_position - self.global_position;
		velocity = velocity.normalized() * speed;
		move_and_slide();

func take_damage(amount: int) -> void:
	$AnimationPlayer.play('take_damage');
	health -= amount;
	emit_signal('health_updated', health);

func _on_damage_detector_area_entered(area: Area2D) -> void:
	if is_instance_of(area, Attack):
		take_damage(area.damages);

	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'take_damage':
		if health <= 0 :
			var xp_instance = xp.instantiate();
			xp_instance.position = self.position;
			get_parent().add_child(xp_instance);		
			queue_free();
