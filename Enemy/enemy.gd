class_name Enemy
extends CharacterBody2D

@export var speed := 100;
@export var health := 10;
@export var damages := 10;

func _process(delta: float) -> void:
	var camera = get_viewport().get_camera_2d()

	if camera:
		velocity = camera.global_position - self.global_position;
		velocity = velocity.normalized();
		velocity = velocity * speed;
		move_and_slide();

		# position = position.move_toward(center_ajusted, delta * speed);