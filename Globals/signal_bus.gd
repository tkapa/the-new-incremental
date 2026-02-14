extends Node

# Tick Signals
signal on_tick

# Currency Signals
signal currency_updated(new_value: int)
signal add_currency(value: int)
signal remove_currency(value: int)

# Purchase Signals
signal on_purchase(item: PurchasableBase)

# Passive Ability Signals
signal add_passive(passive: PurchasablePassive)
