class_name PassiveAdd extends PurchasablePassive

@export_category("Add Variables")
@export
var value : int = 1

func on_tick():
	SignalBus.add_currency.emit(value)
