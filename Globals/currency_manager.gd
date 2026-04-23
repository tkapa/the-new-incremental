extends Node

var current_currency : int = 0;

func _init():
	SignalBus.add_currency.connect(_add_currency)
	SignalBus.remove_currency.connect(_remove_currency)

func _add_currency(value: int):
	current_currency += value
	SignalBus.currency_updated.emit(current_currency)

func _remove_currency(value: int):
	current_currency -= value
	SignalBus.currency_updated.emit(current_currency)
