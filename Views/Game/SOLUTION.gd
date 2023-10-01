extends Node2D


onready var solutionImages = [
	preload("res://img/solutions/level1.png"),
	preload("res://img/solutions/level2.png"),
	preload("res://img/solutions/level3.png"),
	preload("res://img/solutions/level4.png"),
	preload("res://img/solutions/level5.png"),
]

# Called when the node enters the scene tree for the first time.
func _ready():
	$SolutionImg.texture = solutionImages[0]


func show_image(n):
	$SolutionImg.texture = solutionImages[n]
