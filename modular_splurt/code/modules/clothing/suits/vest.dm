/obj/item/clothing/suit/armor/brigdoc
	name = "brig physician vest"
	desc = "A dark red vests for brig physicians."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/suits.dmi'
	icon_state = "brigphysicianvest"
	item_state = "brigphysicianvest"
	armor = list("melee" = 20, "bullet" = 0, "laser" = 0, "energy" = 10, "bomb" = 0, "bio" = 50, "rad" = 0, "fire" = 50, "acid" = 50)
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/armor/brigdoc/labcoat
	name = "brig physician lab coat"
	desc = "A dark red lab coat for brig physicians."
	icon_state = "secmed_labcoat"
	item_state = "secmed_labcoat"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi' //its in a separate file

/obj/item/clothing/suit/armor/brigdoc/armor
	name = "brig physician armored coat"
	desc = "A dark red lab coat with armored vest for brig physicians. Used for hostile work environments."
	icon_state = "secmed_armor"
	item_state = "secmed_armor"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 0, "bio" = 40, "rad" = 0, "fire" = 50, "acid" = 40)

/obj/item/clothing/suit/armor/vest/bluesheid
	name = "blueshield armored vest"
	desc = "A lightweight vest with a blueshield on it."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/suits.dmi'
	icon_state = "blueshield"
	item_state = "blueshield"
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 70, "acid" = 90, "wound" = 10)
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	unique_reskin = list(
		"Jacket" = list("icon_state" = "blueshield_alt")
	)

/obj/item/clothing/suit/armor/vest/bluesheid/spacecoat
	name = "Blueshield Peacekeeper Spacecoat"
	desc = "A greatcoat enhanced with a special alloy for some extra protection."
	icon_state = "peacekeeper_spacecoat"
	item_state = "peacekeeper_spacecoat"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/suit.dmi'

/obj/item/clothing/suit/armor/vest/bluesheid/coat
	name = "blueshield armored coat"
	desc = "A fashionable piece of armored style."
	icon_state = "blueshieldcoat"
	item_state = "blueshieldcoat"

/obj/item/clothing/suit/fakearmor/press
	name = "press 'armored' vest"
	desc = "A lightweight vest for reporting on security. It makes you feel protected, even if the armor plates are missing."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "press_armor"
	item_state = "press_armor"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/peacekeeper
	name = "peacekeeper armored vest"
	desc = "A Type I armored vest that provides decent protection against most types of damage. This one is used by the peace minded officer"
	icon_state = "peacekeeper_black"
	item_state = "peacekeeper_black"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/metrocop
	name = "Civil Protection Armored Vest"
	desc = "You feel like this may not stop a scientist armed with nothing but a crowbar."
	icon_state = "metrocop_armor"
	item_state = "metrocop_armor"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/warden/peacekeeper
	name = "warden's peacekeeper armored trench coat"
	desc = "A heavy trench coat with a armored vest sown into it. Used by the peace minded warden"
	icon_state = "peacekeeper_trench_warden"
	item_state = "peacekeeper_trench_warden"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'

/obj/item/clothing/suit/armor/hos/peacekeeper
	name = "head of security's peacekeeper armored trench coat"
	desc = "A heavy trench coat with a armored vest sown into it. Used by the peace minded head of security"
	icon_state = "peacekeeper_trench_hos"
	item_state = "peacekeeper_trench_hos"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'

/obj/item/clothing/suit/sling
	name = "rifle sling"
	desc = "A sling with universal clips for holding various longarms, or even internals tanks."
	icon = 'icons/obj/clothing/belts.dmi'
	mob_overlay_icon = 'icons/mob/clothing/belt.dmi'
	icon_state = "bandolier"
	item_state = "bandolier"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	allowed = list(/obj/item/tank/internals, /obj/item/gun/ballistic/shotgun/varmintrifle, /obj/item/gun/ballistic/shotgun/huntingrifle, /obj/item/gun/ballistic/shotgun/hunting, /obj/item/gun/ballistic/shotgun/doublebarrel, /obj/item/gun/ballistic/revolver/doublebarrel/sawn, /obj/item/gun/ballistic/shotgun/leveraction, /obj/item/gun/ballistic/shotgun/brush, /obj/item/gun/ballistic/shotgun/brush2, /obj/item/gun/energy/e_gun)

/datum/design/r_sling
	name = "Rifle Sling"
	id = "r_sling"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 600)
	build_path = /obj/item/clothing/suit/sling
	category = list("initial","Organic Materials")
