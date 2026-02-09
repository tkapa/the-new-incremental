class_name CurrencyTracker extends Node

signal currency_updated(new_value: int)

func _init():
	SignalBus.currency_updated.connect(on_currency_updated)

func on_currency_updated(new_value: int):
	currency_updated.emit(new_value)
