extends Node2D

signal win_room

export var roomNumber = 1

const ALLOWED_OFFSET = 20
const ALLOWED_ROTATION = 0.2

var isActive = false
var startPositions = {}
var endPositions = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	$RealRoom.color = Color(0,0,0,0)
	for thing in $RealRoom/Furniture.get_children():
		startPositions[thing] = {
			"position": thing.global_position - $RealRoom.rect_global_position,
			"rotation": thing.rotation
			}
	for thing in $FinalRoom/Furniture.get_children():
		endPositions[thing] = {
			"position": thing.global_position - $FinalRoom.rect_global_position,
			"rotation": thing.rotation
			}
			
	print(startPositions)
	print(endPositions)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func activate():
	isActive = true

func _process(delta):
	if not isActive: return
	
	var correct = true
	
	for furniture in $RealRoom/Furniture.get_children():
		if (furniture.position - furniture.get_node(furniture.IdealObject).position).length() > ALLOWED_OFFSET \
		or abs(Vector2.RIGHT.rotated(furniture.rotation).angle_to(Vector2.RIGHT.rotated(furniture.get_node(furniture.IdealObject).rotation))) > ALLOWED_ROTATION:
			correct = false
			furniture.set_correct(false)
		else:
			furniture.set_correct(true)
	
	if correct == true:
		print('WIN', self)
		isActive = false
		emit_signal("win_room")


func reset():
	for furniture in $RealRoom/Furniture.get_children():
		furniture.position = startPositions[furniture].position
		furniture.rotation = startPositions[furniture].rotation
