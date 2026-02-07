class_name Card extends Node2D

@export var cardName: String = "Card Name"
@export var cardDescription: String = "Card Description"
@export var cardCost: int = 1
@export var cardImage: Node2D

@onready var CostLabel: Label = $CostDisplay/CostLabel
@onready var NameLabel: Label = $CardName/NameLabel
@onready var DescriptionLabel: Label = $CardDescription

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_values(cardCost, cardName, cardDescription)

func _set_values(_cost: int, _name: String, _description: String):
	CostLabel.set_text(str(_cost))
	NameLabel.set_text(_name)
	DescriptionLabel.set_text(_description)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
