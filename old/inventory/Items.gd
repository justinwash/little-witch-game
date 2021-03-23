extends Node

class_name Items

const Acorn = preload("res://old/items/Acorn/Acorn.gd")
const Elderberry = preload("res://old/items/Elderberry/Elderberry.gd")
const Leaf = preload("res://old/items/Leaf/Leaf.gd")
const Mushroom = preload("res://old/items/Mushroom/Mushroom.gd")
const Feather = preload("res://old/items/Feather/Feather.gd")

const PotionOfMinorStomachAches = preload("res://old/items/PotionOfMinorStomachAches/PotionOfMinorStomachAches.gd") # 50
const CrunchyNaturePotion = preload("res://old/items/CrunchyNaturePotion/CrunchyNaturePotion.gd") # 51
const TastyHealthPotion = preload("res://old/items/TastyHealthPotion/TastyHealthPotion.gd") # 52
const GreaterPotionOfMinorNarcolepsy = preload("res://old/items/GreaterPotionOfMinorNarcolepsy/GreaterPotionOfMinorNarcolepsy.gd") # 53
const WeakPotionOfGreaterEnergy = preload("res://old/items/WeakPotionOfGreaterEnergy/WeakPotionOfGreaterEnergy.gd") # 54
const PotionOfAdvancedRevelry = preload("res://old/items/PotionOfAdvancedRevelry/PotionOfAdvancedRevelry.gd") # 55
const ScalyPotionOfEnhancedNausea = preload("res://old/items/ScalyPotionOfEnhancedNausea/ScalyPotionOfEnhancedNausea.gd") # 56
const PotionOfToadspeak = preload("res://old/items/PotionOfToadspeak/PotionOfToadspeak.gd") # 57
const PotionOfDelusionaryToadform = preload("res://old/items/PotionOfDelusionaryToadform/PotionOfDelusionaryToadform.gd") # 58
const PotionOfLifelongAnxiety = preload("res://old/items/PotionOfLifelongAnxiety/PotionOfLifelongAnxiety.gd") # 59
const NightmareFuelConcoction = preload("res://old/items/NightmareFuelConcoction/NightmareFuelConcoction.gd") # 60
const PotionOfNeversleep = preload("res://old/items/PotionOfNeversleep/PotionOfNeversleep.gd") # 61
const PsychoticEpisodeInABottle = preload("res://old/items/PsychoticEpisodeInABottle/PsychoticEpisodeInABottle.gd") # 62

var types = {
	"Acorn": load("res://old/items/Acorn/Acorn.gd").new(),
	"Elderberry": load("res://old/items/Elderberry/Elderberry.gd").new(),
	"Leaf": load("res://old/items/Leaf/Leaf.gd").new(),
	"Mushroom": load("res://old/items/Mushroom/Mushroom.gd").new(),
	"Feather": Feather.new(),

	"PotionOfMinorStomachAches": load("res://old/items/PotionOfMinorStomachAches/PotionOfMinorStomachAches.gd").new(),
	"CrunchyNaturePotion": load("res://old/items/CrunchyNaturePotion/CrunchyNaturePotion.gd").new(),
	"TastyHealthPotion": load("res://old/items/TastyHealthPotion/TastyHealthPotion.gd").new(),
	"GreaterPotionOfMinorNarcolepsy": GreaterPotionOfMinorNarcolepsy.new(),
	"WeakPotionOfGreaterEnergy": WeakPotionOfGreaterEnergy.new(),
	"PotionOfAdvancedRevelry": PotionOfAdvancedRevelry.new(),
	"ScalyPotionOfEnhancedNausea": ScalyPotionOfEnhancedNausea.new(),
	"PotionOfToadspeak": PotionOfToadspeak.new(),
	"PotionOfDelusionaryToadform": PotionOfDelusionaryToadform.new(),
	"PotionOfLifelongAnxiety": PotionOfLifelongAnxiety.new(),
	"NightmareFuelConcoction": NightmareFuelConcoction.new(),
	"PotionOfNeversleep": PotionOfNeversleep.new(),
	"PsychoticEpisodeInABottle": PsychoticEpisodeInABottle.new()
}

static func getNamedItemTypes():
	return {
		"Acorn": Acorn,
		"Elderberry": Elderberry,
		"Leaf": Leaf,
		"Mushroom": Mushroom,
		"Feather": Feather,

		"Potion of Minor Stomach Aches": PotionOfMinorStomachAches,
		"Crunchy Nature Potion": CrunchyNaturePotion,
		"Tasty Health Potion": TastyHealthPotion,
		"Greater Potion of Minor Narcolepsy": GreaterPotionOfMinorNarcolepsy,
		"Weak Potion of Greater Energy": WeakPotionOfGreaterEnergy,
		"Potion of Advanced Revelry": PotionOfAdvancedRevelry,
		"Scaly Potion of Enhanced Nausea": ScalyPotionOfEnhancedNausea,
		"Potion of Toadspeak": PotionOfToadspeak,
		"Potion of Delusionary Toadform": PotionOfDelusionaryToadform,
		"Potion of Lifelong Anxiety": PotionOfLifelongAnxiety,
		"Nightmare Fuel Concoction": NightmareFuelConcoction,
		"Potion of Neversleep": PotionOfNeversleep,
		"Psychotic Episode in a Bottle": PsychoticEpisodeInABottle,
	}

static func getItemTypes():
	return [Acorn, Elderberry, Leaf, Mushroom, Feather,
		PotionOfMinorStomachAches, CrunchyNaturePotion, TastyHealthPotion,
		GreaterPotionOfMinorNarcolepsy, WeakPotionOfGreaterEnergy,
		PotionOfAdvancedRevelry, ScalyPotionOfEnhancedNausea, PotionOfToadspeak,
		PotionOfDelusionaryToadform, PotionOfLifelongAnxiety, NightmareFuelConcoction,
		PotionOfNeversleep, PsychoticEpisodeInABottle, ]

static func getInstanceOfItemByItemName(itemName):
	var items = getNamedItemTypes()
	var item = items[itemName]
	var instance = item.new()
	print(str(instance))
	return instance
