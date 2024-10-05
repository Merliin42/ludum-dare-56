extends CharacterBody2D;

signal damage_taken(new_health);

@export var speed = 200;
@export var health = 10;
@export var i_frame_enable := false;

var i_frame := false;

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, 0);
	velocity.x = Input.get_axis('character_left', 'character_right');
	velocity.y = Input.get_axis('character_up', 'character_down');
	velocity = velocity.normalized();
	velocity *= speed;

	move_and_slide()

func take_damage(amount: int) -> void:
	if i_frame && i_frame_enable:
		return ;
	i_frame = true;
	$AnimationPlayer.play('take_damage');
	health -= amount;
	emit_signal('damage_taken', health);

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'take_damage':
		i_frame = false;

func _on_mob_detector_body_entered(body:Node2D) -> void:
	if is_instance_of(body, Enemy):
		take_damage(body.damages);
