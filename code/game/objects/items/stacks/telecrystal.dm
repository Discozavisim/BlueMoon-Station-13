/obj/item/stack/telecrystal
	name = "credit"
	desc = "This is money. Dirty money.."
	singular_name = "credit"
	icon = 'icons/obj/telescience.dmi'
	icon_state = "telecrystal"
	grind_results = list(/datum/reagent/telecrystal = 20)
	w_class = WEIGHT_CLASS_TINY
	max_amount = 50
	item_flags = NOBLUDGEON

/obj/item/stack/telecrystal/attack(mob/target, mob/user)
	if(target == user && isliving(user)) //You can't go around smacking people with crystals to find out if they have an uplink or not.
		var/mob/living/L = user
		for(var/obj/item/implant/uplink/I in L.implants)
			if(I?.imp_in)
				var/datum/component/uplink/hidden_uplink = I.GetComponent(/datum/component/uplink)
				if(hidden_uplink)
					hidden_uplink.telecrystals += amount
					use(amount)
					to_chat(user, "<span class='notice'>You press [src] onto yourself and charge your hidden uplink.</span>")
	else
		return ..()

/obj/item/stack/telecrystal/afterattack(obj/item/I, mob/user, proximity)
	. = ..()
	if(istype(I, /obj/item/cartridge/virus/frame))
		var/obj/item/cartridge/virus/frame/cart = I
		if(!cart.charges)
			to_chat(user, "<span class='notice'>[cart] is out of charges, it's refusing to accept [src].</span>")
			return
		cart.telecrystals += amount
		use(amount)
		to_chat(user, "<span class='notice'>You slot [src] into [cart].  The next time it's used, it will also give credits.</span>")

/obj/item/stack/telecrystal/five
	amount = 5

/obj/item/stack/telecrystal/twenty
	amount = 20
