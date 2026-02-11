class_name CurrencySpender extends Node

var _could_purchase: bool = false
var can_purchase: bool :
	get: return _could_purchase
var _value: int = 0

func _ready() -> void: 
	SignalBus.currency_updated.connect(_on_currency_updated)
	_set_could_purchase()

func set_value(new_value: int) -> void:
	_value = new_value
	_set_could_purchase()

func purchase() -> bool:
	if (!_could_purchase):
		return false
	
	SignalBus.remove_currency.emit(_value)
	return true

func _set_could_purchase():
	_could_purchase = CurrencyManager.can_afford(_value)

func _on_currency_updated(new_value: int):
	_set_could_purchase()
