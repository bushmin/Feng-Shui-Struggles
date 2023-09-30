tool
extends KinematicBody2D

export var IdealObject: NodePath

var holding = false
var holdPosition = Vector2.ZERO

onready var MY_SIZE = $TextureRect.rect_size /  2

var CAMERA_POS = Vector2.ZERO

var mouseDelta = Vector2.ZERO

var prevMousePos = Vector2.ZERO

const SMALL_ROTATION = 0.1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func disable_click():
	#print('disabling_click')
	holding = false
	
func _physics_process(delta):
	var newPos = get_viewport().get_mouse_position()
	mouseDelta = newPos - prevMousePos
	prevMousePos = newPos
	
	if not holding or mouseDelta == Vector2.ZERO: return
	
	move_by(mouseDelta, delta)
	#if not test_move(Transform2D(global_rotation +deltaTransform.deltaAngle, global_position), deltaTransform.deltaPos):
	#	rotation += deltaTransform.deltaAngle
	#elif not test_move(Transform2D(global_rotation +deltaTransform.deltaAngle*SMALL_ROTATION, global_position), deltaTransform.deltaPos):
	#	rotation += deltaTransform.deltaAngle*SMALL_ROTATION
		
	

func move_by(mouseDelta, timeDelta):
	if is_zero_approx(mouseDelta.length()): return
	var deltaTransform = get_block_transform(holdPosition, mouseDelta)
	if not test_move(Transform2D(global_rotation +deltaTransform.deltaAngle, global_position), deltaTransform.deltaPos):
		rotation += deltaTransform.deltaAngle
		move_and_slide(deltaTransform.deltaPos / timeDelta)
	else:
		#holdPosition += deltaTransform.deltaPos/2
		holdPosition = to_local((CAMERA_POS+prevMousePos))
		move_by(mouseDelta/2, timeDelta)

func new_camera_position(pos):
	CAMERA_POS = pos

func set_correct(isCorrect):
	if isCorrect: modulate = Color("86ffb0")
	else: modulate = Color("ffffff")

func _on_input_event(viewport, event, shape_idx):
	if event.is_action('press_mouse'):
		if event.is_pressed():
			holding = true
			holdPosition = to_local((CAMERA_POS+event.position))
		else:
			holding = false
			
func get_block_transform(holdPos: Vector2, deltaMouse: Vector2):
	if holdPos.length() < 0.5*MY_SIZE.length():
		return {"deltaPos":deltaMouse, "deltaAngle":0}
		
	var rotatedHoldPos = holdPos.rotated(rotation)
	#print(holdPos, rotatedHoldPos)
	var deltaCenterPos = rotatedHoldPos + deltaMouse - holdPos.length()*(rotatedHoldPos + deltaMouse).normalized()
	var deltaAngle = rotatedHoldPos.angle_to(rotatedHoldPos + deltaMouse)

	
	return {"deltaPos":deltaCenterPos, "deltaAngle":deltaAngle}
