extends Camera3D

# Called when the node enters the scene tree for the first time.
func _ready():			#start
	#timer = Timer.new()
	#add_child(timer)
	#timer.autostart = true
	#timer.wait_time = 0.1
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	#update
	# rotate by 0.01 degree at axis y
	global_rotate(Vector3(0,1,0),0.01*PI/180)
	#rotation.y += 0.01*delta
	
	# rotate by 1 degree every 1/10 second
	#const ticks

	pass
