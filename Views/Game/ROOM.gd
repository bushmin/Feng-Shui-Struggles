extends Node2D

const ALLOWED_OFFSET = 15
const ALLOWED_ROTATION = 0.1

var startPositions = {}
var endPositions = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	#print($RealRoom.rect_position)
	for thing in $RealRoom/Furniture.get_children():
		startPositions[thing] = {
			"position": thing.global_position - $RealRoom.rect_position,
			"rotation": thing.rotation
			}
	for thing in $FinalRoom/Furniture.get_children():
		endPositions[thing] = {
			"position": thing.global_position - $FinalRoom.rect_position,
			"rotation": thing.rotation
			}
			
	print(endPositions)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	var correct = true
	
	for furniture in $RealRoom/Furniture.get_children():
		#print(furniture.IdealObject)
		if (furniture.position - furniture.get_node(furniture.IdealObject).position).length() > ALLOWED_OFFSET \
		or abs(furniture.rotation - furniture.get_node(furniture.IdealObject).rotation) > ALLOWED_ROTATION:
			correct = false
			break
	
	if correct == true:
		print('WIN')
