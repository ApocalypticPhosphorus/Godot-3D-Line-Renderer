extends Spatial
tool

export var line_radius = 0.1
export var line_resoultion = 180

func _process(delta):
	var circle = PoolVector2Array()
	for degree in line_resoultion:
		var x = line_radius * sin(PI * 2 * degree / line_resoultion)
		var y = line_radius * cos(PI * 2 * degree / line_resoultion)
		var coords = Vector2(x,y)
		circle.append(coords)
	$CSGPolygon.polygon = circle
