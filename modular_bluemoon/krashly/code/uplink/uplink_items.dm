/datum/uplink_item/inteq
	category = "InteQ Technologies"
	surplus = 0

/datum/uplink_item/inteq/poster
	name = "Propaganda poster"
	desc = "Let them know who is the boss!"
	item = /obj/item/poster/random_inteq
	cost = 1

/datum/uplink_item/inteq/clothes_box
	name = "InteQ Starter Pack"
	desc = "A box with a full set of clothes and armor designed by InteQ. Murderous drip."
	item = /obj/item/storage/box/inteq_box/inteq_clothes
	cost = 4

/datum/uplink_item/inteq/hardsuit/elite
	name = "Elite InteQ Hardsuit"
	desc = "The latest InteQ developments in the field of Hardsuits. MORE ARMOOOOOR!!!"
	item = /obj/item/clothing/suit/space/hardsuit/syndi/elite/inteq
	cost = 16
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/inteq/ak12
	name = "AK-12 Automatic Assault Rifle"
	desc = "The stolen blueprints from the NRI helped us a lot to release our small modification for the AK-12. Use it."
	item = /obj/item/gun/ballistic/automatic/ak12
	cost = 22
	purchasable_from = (UPLINK_NUKE_OPS)

/datum/uplink_item/inteq/ak12_mag
	name = "AK-12 Magazine"
	desc = "30 piece of lead with gunpowder. Made with love."
	item = /obj/item/ammo_box/magazine/ak12
	cost = 4
	purchasable_from = (UPLINK_NUKE_OPS)

/datum/uplink_item/inteq/ak12_mag_hp
	name = "AK-12 Hollow Point Magazine"
	desc = "30 pieces of lead with gunpowder and a bursting mechanism. Made with love."
	item = /obj/item/ammo_box/magazine/ak12/hp
	cost = 6
	purchasable_from = (UPLINK_NUKE_OPS)

/datum/uplink_item/inteq/ak12_mag_ap
	name = "AK-12 Armor Piercing Magazine"
	desc = "30 pieces of lead with gunpowder and a sharp tip. Made with love."
	item = /obj/item/ammo_box/magazine/ak12/ap
	cost = 6
	purchasable_from = (UPLINK_NUKE_OPS)

/datum/uplink_item/inteq/space_suit
	name = "InteQ Space Suit"
	desc = "This Yellow and Black Inteq space suit is less encumbering than Nanotrasen variants, \
			fits inside bags, and has a weapon slot. Nanotrasen crew members are trained to report InteQ space suit \
			sightings, however."
	item = /obj/item/storage/box/syndie_kit/space
	cost = 4

/datum/uplink_item/inteq/hardsuit
	name = "InteQ Hardsuit"
	desc = "The feared suit of a Admiral Brown's Chancellery. Features slightly better armoring and a built in jetpack \
			that runs off standard atmospheric tanks. Toggling the suit in and out of \
			combat mode will allow you all the mobility of a loose fitting uniform without sacrificing armoring. \
			Additionally the suit is collapsible, making it small enough to fit within a backpack. \
			Nanotrasen crew who spot these suits are known to panic."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/inteq
	cost = 8
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS) //you can't buy it in nuke, because the elite hardsuit costs the same while being better

/datum/uplink_item/inteq/hardsuit/elite
	name = "Elite InteQ Hardsuit"
	desc = "An upgraded, elite version of the Admiral Brown's Chancellery hardsuit. It features fireproofing, and also \
			provides the user with superior armor and mobility compared to the standard InteQ hardsuit."
	item = /obj/item/clothing/suit/space/hardsuit/syndi/elite/inteq
	cost = 8
	purchasable_from = UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS

/datum/uplink_item/inteq/hardsuit/shielded
	name = "Shielded InteQ Hardsuit"
	desc = "An upgraded version of the standard Admiral Brown's Chancellery hardsuit. It features a built-in energy shielding system. \
			The shields can handle up to three impacts within a short duration and will rapidly recharge while not under fire."
	item = /obj/item/clothing/suit/space/hardsuit/shielded/syndi/inteq
	cost = 30
	purchasable_from = UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS
