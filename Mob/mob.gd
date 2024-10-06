class_name Mob;
extends CharacterBody2D;

signal health_updated(new_health);

@export var speed := 100;
@export var max_health := 10;
@export var damages := 10;

@onready var health := max_health;

var xp := preload('res://XP/xp.tscn');
var dead := false;

func _physics_process(_delta: float) -> void:
	var camera = get_viewport().get_camera_2d()

	if camera:
		velocity = camera.global_position - self.global_position;
		velocity = velocity.normalized() * speed;
		move_and_slide();
	
	var angle = velocity.angle_to(Vector2(1, 1));
	$AnimatedSprite2D.rotation = -angle;

func take_damage(amount: int) -> void:
	$DamagePlayer.play();
	$AnimationPlayer.play('take_damage');
	health -= amount;
	health_updated.emit(health);

func _on_damage_detector_area_entered(area: Area2D) -> void:
	if is_instance_of(area, Attack):
		take_damage(area.damages);

	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'take_damage':
		if health <= 0:
			dead = true;
			$AnimatedSprite2D.play('explosion');

func _on_animated_sprite_2d_animation_finished() -> void:
	if dead :
		var xp_instance = xp.instantiate();
		xp_instance.position = self.position;
		get_parent().add_child(xp_instance);
		queue_free();


