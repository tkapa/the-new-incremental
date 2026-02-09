extends Control

@onready
var currency_text : Label = $CurrencyText
@onready
var currency_tracker : CurrencyTracker = $CurrencyTrackerComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currency_tracker.currency_updated.connect(on_currency_updated)
	pass # Replace with function body.

func on_currency_updated(new_value: int):
	currency_text.text = str(new_value)
