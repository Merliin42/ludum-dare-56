extends Area2D 

@export var speed := 100;
@export var health := 10;
@export var damages := 10;

func _process(delta: float) -> void:
	# var center = get_viewport_rect().size / 2;
	var camera = get_viewport().get_camera_2d()

	if camera:
		var center_ajusted = camera.global_position 
		position = position.move_toward(center_ajusted, delta * speed);
	
	print(camera.global_position);
