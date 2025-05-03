extends StaticBody3D

#var linear_velocity := Vector3(0, 0, 0)
#
#var move_speed := 20
#var move_acceleration := 15
#var move_deacceleration := 10
#
#func _physics_process(delta):
	#var move_direction := Vector3(0,0,0)
	#
	#if Input.is_action_pressed ("move_forward"):
		#move_direction.z += Input.get_action_strength("move_forward")
		#
	#if Input.is_action_pressed ("move_backward"):
		#move_direction.z += Input.get_action_strength("move_backward")
		#
	#if Input.is_action_pressed ("strafe_left"):
		#move_direction.z += Input.get_action_strength("strafe_left")
		#
	#if Input.is_action_pressed ("strafe_right"):
		#move_direction.x += Input.get_action_strength("strafe_right")
#
	#move_direction = move_direction.normalized()
	#move_direction = move_direction.rotated(Vector3.UP,rotation.y)
#
	#if move_direction.length() > 0:
		#linear_velocity = linear_velocity.linear_interpolate(move_direction * move_speed, move_acceleration * delta)
	#else:
		#linear_velocity = linear_velocity.linear_interpolate(Vector3.ZERO, move_direction * delta)
		#
	#linear_velocity = move_and_slide(linear_velocity,Vector3.UP)


var move_speed := 20.0
var acceleration := 15.0
var deacceleration := 10.0
var velocity: Vector3 = Vector3.ZERO

func _physics_process(delta):
	var input_vector = Vector3.ZERO

	if Input.is_action_pressed("move_forward"):
		input_vector.z -= 1
	if Input.is_action_pressed("move_backward"):
		input_vector.z += 1
	if Input.is_action_pressed("strafe_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("strafe_right"):
		input_vector.x += 1

	input_vector = input_vector.normalized()
	input_vector = input_vector.rotated(Vector3.UP, rotation.y)

	# Accelerate or deaccelerate
	if input_vector.length() > 0:
		velocity = velocity.lerp(input_vector * move_speed, acceleration * delta)
	else:
		velocity = velocity.lerp(Vector3.ZERO, deacceleration * delta)
		
