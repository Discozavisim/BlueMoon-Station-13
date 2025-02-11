/obj/item/clothing/under/rank/blueshield/formal/pmc_leader_jumpsuit
	name = "PMC command fatigues"
	desc = "A white set of fatigues, designed for private security operators. The symbol of the Nanotrasen corporation is emblazed on the suit. This particular suit looks like it belongs to a high-ranking officer."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	icon_state = "officer_jumpsuit"
	item_state = "officer_jumpsuit"

/obj/item/clothing/under/aesculapius
	name = "aesculapius uniform"
	desc = "Shirt with trousers with suspenders."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	icon_state = "esculap"
	item_state = "esculap"

/obj/item/clothing/under/butler
	name = "butler uniform"
	desc = "Bright butler formal wear."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	icon_state = "butler_s"
	item_state = "butler_s"

/obj/item/clothing/under/common
	name = "ridiculous clothes"
	desc = "Looks very old."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	icon_state = "common"
	item_state = "common"

/obj/item/clothing/under/baron
	name = "rich clothes"
	desc = "Decorated with precious stones and chains."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	icon_state = "baron"
	item_state = "baron"

//Plasmaman outfit
	//centcom//
/obj/item/clothing/under/plasmaman/captain/centcom
	name = "central command envirosuit"
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	icon_state = "centcom_envirosuit"
	item_state = "centcom_envirosuit"

//InteQ

/obj/item/clothing/under/inteq
	name = "brown combat turtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under_digidrated.dmi'
	icon_state = "inteq"
	item_state = "inteq"

/obj/item/clothing/under/inteq_skirt
	name = "brown combat skirtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	icon_state = "inteq_skirt"
	item_state = "inteq_skirt"

/obj/item/clothing/under/inteq_eng
	name = "brown engineering turtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under_digidrated.dmi'
	icon_state = "inteqeng"
	item_state = "inteqeng"

/obj/item/clothing/under/inteq_eng_skirt
	name = "brown engineering skirtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	icon_state = "inteqeng_skirt"
	item_state = "inteqeng_skirt"

/obj/item/clothing/under/inteq_maid
	name = "brown combat maidsuit"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish. Battle maids!"
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	icon_state = "inteqmaid"
	item_state = "inteqmaid"
	body_parts_covered = CHEST|GROIN
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/inteq_maid/Initialize(mapload)
	. = ..()
	var/obj/item/clothing/accessory/maidapron/inteq/A = new (src)
	attach_accessory(A)

/obj/item/clothing/accessory/maidapron/inteq
	name = "InteQ maid apron"
	desc = "The best part of a maid costume."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	icon_state = "maidapron"
	item_state = "maidapron"

/obj/item/clothing/under/inteq_med
	name = "white combat turtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish. Designed for field medics."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under_digidrated.dmi'
	icon_state = "inteqmed"
	item_state = "inteqmed"

/obj/item/clothing/under/inteq_med_skirt
	name = "white combat skirtleneck"
	desc = "It sits comfortably, does not hinder movement, and most importantly, it is very stylish. Designed for field medics."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/krashly/icons/mob/clothing/under.dmi'
	icon_state = "inteqmed_skirt"
	item_state = "inteqmed_skirt"
