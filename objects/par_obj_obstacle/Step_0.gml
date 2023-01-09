/// @description Obstacle movement and stuff

func_static_obstacle_movement(floor(yMovement / obj_control.slowDown));

if (y < yDelete) {
	instance_destroy();
}