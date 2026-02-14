extends Button

@export
var purchasable : PurchasableBase
var _value : int = 0

@onready
var currency_spender : CurrencySpender = $CurrencySpenderComponent

func _ready() -> void:
	_get_cost()
	_set_label()

func _on_can_purchase(can_purchase:bool) -> void:
	if (can_purchase):
		disabled = false
	else:
		disabled = true

func _on_button_down() -> void:
	_purchase()

func _purchase() -> void:
	if(!currency_spender.purchase()):
		print_debug("Purchase Failed.")
	
	SignalBus.on_purchase.emit(purchasable)

func _get_cost():
	_value = purchasable.base_cost
	currency_spender.set_value(_value)

func _set_label():
	text = str("Buy ", purchasable.name, " Cost: ", _value)
