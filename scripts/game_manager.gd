extends Node


var score:int = 0
@onready var score_text: Label = $"../CanvasLayer/AspectRatioContainer/MarginContainer/BoxContainer/VBoxContainer/ScoreText"
@onready var coins: Node = %Coins
@export var win_canvas: PackedScene

func _ready() -> void:
	score = coins.get_child_count()
	score_text.text = "Score: {score}".format({"score": str(score)})

func add_point():
	score = coins.get_child_count()
	score_text.text = "Score: {score}".format({"score": str(score)})
