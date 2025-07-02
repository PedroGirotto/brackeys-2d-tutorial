extends Node


var score:int = 0
@onready var score_text: Label = $"../CanvasLayer/AspectRatioContainer/MarginContainer/BoxContainer/VBoxContainer/ScoreText"


func add_point():
	score += 1
	score_text.text = "Score: {score}".format({"score": str(score)})
