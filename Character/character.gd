extends CharacterBody2D;

signal health_updated(new_health);
signal xp_obtained(amount);
signal died();

@export var speed := 200;
@export var max_health := 100;
@export var i_frame_enable := false;

@onready var health := max_health;
var i_frame := false;


func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, 0);
	velocity.x = Input.get_axis('character_left', 'character_right');
	velocity.y = Input.get_axis('character_up', 'character_down');
	velocity = velocity.normalized();
	velocity *= speed;

	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false;
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true;
	
	if velocity != Vector2.ZERO:
		$AnimatedSprite2D.play('walk');
	else:
		$AnimatedSprite2D.play('default');
	
	move_and_slide()

func take_damage(amount: int) -> void:
	$DamagePlayer.play();
	if i_frame && i_frame_enable:
		return ;
	i_frame = true;
	$AnimationPlayer.play('take_damage');
	health -= amount;
	health_updated.emit(health);

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'take_damage':
		i_frame = false;

func _on_mob_detector_body_entered(body: Node2D) -> void:
	if is_instance_of(body, Mob):
		take_damage(body.damages);


func _on_health_updated(new_health: Variant) -> void:
	$HealthBar.value = 100 - (new_health * 100. / max_health);

	if health <= 0:
		died.emit();


func _on_collectible_detector_area_entered(_area: Area2D) -> void:
	$Timer.start();


func _on_timer_timeout() -> void:
	xp_obtained.emit(1);
