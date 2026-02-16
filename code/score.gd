extends Node2D
@onready var label = $CanvasLayer/Score
var score = 0
@onready var movenement = false
var y_difference = 0
func _process(_delta: float) -> void:
	score += (y_difference)
	label.text = str(int(score/100))
