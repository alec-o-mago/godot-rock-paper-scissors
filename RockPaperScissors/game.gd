extends Control

const ROCK = 0
const PAPER = 1
const SCISSORS = 2

@onready var rng = RandomNumberGenerator.new()
@onready var result_label = $Menu/ResultLabel

func _ready():
	$Menu/RockButton.button_down.connect(_rock_button_down)
	$Menu/PaperButton.button_down.connect(_paper_button_down)
	$Menu/ScissorsButton.button_down.connect(_scissors_button_down)

func _rock_button_down():
	play(ROCK)

func _paper_button_down():
	play(PAPER)

func _scissors_button_down():
	play(SCISSORS)

func play(player_choice):
	var cpu_choice:int = rng.randi_range(0,2)
	match player_choice:
		ROCK:
			match cpu_choice:
				ROCK:
					result_label.text = "You played Rock.\nThe opponent played Rock.\nIt's a tie! :|"
				PAPER:
					result_label.text = "You played Rock.\nThe opponent played Paper.\nYou Lost! :("
				SCISSORS:
					result_label.text = "You played Rock.\nThe opponent played Scissors.\nYou Won! :D"
		PAPER:
			match cpu_choice:
				ROCK:
					result_label.text = "You played Paper.\nThe opponent played Rock.\nYou Won! :D"
				PAPER:
					result_label.text = "You played Paper.\nThe opponent played Paper.\nIt's a tie! :|"
				SCISSORS:
					result_label.text = "You played Paper.\nThe opponent played Scissors.\nYou Lost! :("
		SCISSORS:
			match cpu_choice:
				ROCK:
					result_label.text = "You played Scissors.\nThe opponent played Rock.\nYou Lost! :("
				PAPER:
					result_label.text = "You played Scissors.\nThe opponent played Paper.\nYou Won! :D"
				SCISSORS:
					result_label.text = "You played Scissors.\nThe opponent played Scissors.\nIt's a tie! :|"
