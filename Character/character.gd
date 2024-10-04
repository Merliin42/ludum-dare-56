extends CharacterBody2D

const SPEED = 200;

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, 0);
	velocity.x = Input.get_axis('character_left', 'character_right');
	velocity.y = Input.get_axis('character_up', 'character_down');
	velocity = velocity.normalized();
	velocity *= SPEED;
 
	move_and_slide()
