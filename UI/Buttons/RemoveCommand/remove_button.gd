extends Button

@export
var value : int = 10

@onready
var currency_spender : CurrencySpender = $CurrencySpenderComponent

func _ready() -> void:
	currency_spender.set_value(value)

func _on_can_purchase(can_purchase:bool) -> void:
	if (can_purchase):
		disabled = false
	else:
		disabled = true

func _on_button_down() -> void:
	if(currency_spender.purchase()):
		print_debug("Purchase success.")
