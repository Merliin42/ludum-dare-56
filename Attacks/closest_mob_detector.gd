class_name ClosestMobDetector;
extends Area2D;

func get_closest_mob_position() -> Vector2:
	var mob = null;
	var distance = 10000000000000000000000000000000000;
	var overlapping_bodies = get_overlapping_bodies();
	for body in overlapping_bodies:
		var overlapping_body_distance = position.distance_squared_to(body.position);
		if overlapping_body_distance < distance:
			print(distance);
			distance = overlapping_body_distance;
			mob = body;
	if (mob == null):
		return Vector2.ZERO;
	return mob.global_position;
