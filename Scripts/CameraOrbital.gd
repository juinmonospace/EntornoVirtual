extends Camera3D

const rotationAngle = 0.8*PI/180
var leftLimitReached = false
var rightLimitReached = false
var upperLimitReached = false
var downLimitReached = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Camera_left"):
		#if global_transform.Vector3(0, 1, 0) < PI:
		var yLeft = get_rotation_degrees().y
		if (yLeft <= 175 && yLeft >= -175) || rightLimitReached  :
			#global_rotate(Vector3(0,1,0),rotationAngle)
			transform.basis = transform.basis.rotated(Vector3(0,1,0), rotationAngle)
			#rotationLeft += rotationAngle	
			rightLimitReached = false
			print(get_rotation_degrees())
		else:
			leftLimitReached = true
			print("Left rotation limit reached")
			
	if (Input.is_action_pressed("Camera_right")):
		var yRight = get_rotation_degrees().y
		if (yRight <= 175 && yRight >= -175) || leftLimitReached :
			#global_rotate(Vector3(0,-1,0), rotationAngle)
			transform.basis = transform.basis.rotated(Vector3(0,-1,0), rotationAngle)
			print(get_rotation_degrees())
			leftLimitReached = false
		else:
			print("Right rotation limit reached")
			rightLimitReached = true

	if (Input.is_action_pressed("Camera_up")):
		var xUp = get_rotation_degrees().x
		print(get_rotation_degrees())
		if (xUp <= 170 && xUp >= -170) || downLimitReached:
			#global_rotate(Vector3(1,0,0), rotationAngle)
			transform.basis = transform.basis.rotated(Vector3(1,0,0), rotationAngle)
			downLimitReached = false
		else:
			upperLimitReached = true
			print("Upper rotation limit reached")
	
	if (Input.is_action_pressed("Camera_down")):
		var xDown = get_rotation_degrees().x
		print(get_rotation_degrees())
		if (xDown <= 170 && xDown >= -170) || upperLimitReached:
			#global_rotate(Vector3(-1,0,0), rotationAngle)
			transform.basis = transform.basis.rotated(Vector3(-1,0,0), rotationAngle)
			upperLimitReached = false
		else:
			downLimitReached = true
			print("Down rotation limit reached")

