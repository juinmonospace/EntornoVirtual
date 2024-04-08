extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var cube_mesh = createCube()
	self.mesh = cube_mesh
	print (self.mesh)

func createCube():

	var a = Vector3(0,1,0)
	var b = Vector3(1,1,0)
	var c = Vector3(0,0,0)
	var d = Vector3(1,0,0)
	var e = Vector3(0,1,1)
	var f = Vector3(1,1,1)
	var g = Vector3(0,0,1)
	var h = Vector3(1,0,1)
	
	var verticeOrder = [
		c, d,b, b, a,c, #front
		d, h, f, f, b,d, #right
		g,c,a, a,e,g, #left
		h,g,e, e,f,h, #back
		g,h,d, d,c,g, #bottom
		a,b,f, f,e,a ] #top

	var vertices = PackedVector3Array()
	for v in verticeOrder:
		vertices.push_back(v)
	
	var array_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	
	array_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)

	return array_mesh
