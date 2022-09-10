extends Spatial
tool

export var line_radius = 0.1
export var line_resolution = 180

onready var old_radius = line_radius
onready var old_resolution = line_resolution

func _process(delta):
	if old_radius == line_radius and old_resolution == line_resolution:
		return
	print("Recomputing")
	var circle = PoolVector2Array()
	for degree in line_resolution:
		var x = line_radius * sin(PI * 2 * degree / line_resolution)
		var y = line_radius * cos(PI * 2 * degree / line_resolution)
		var coords = Vector2(x,y)
		circle.append(coords)
	$CSGPolygon.polygon = circle
	old_radius = line_radius
	old_resolution = line_resolution
