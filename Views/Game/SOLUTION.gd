extends Node2D


onready var solutionImages = [
	preload("res://img/solution1.png"),
	preload("res://img/solution2.png"),
]

# Called when the node enters the scene tree for the first time.
func _ready():
	$SolutionImg.texture = solutionImages[0]


func show_image(n):
	$SolutionImg.texture = solutionImages[n]
