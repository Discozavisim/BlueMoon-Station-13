/obj/structure/bigDelivery
	name = "large parcel"
	desc = "A large delivery parcel."
	icon = 'icons/obj/storage.dmi'
	icon_state = "deliverycloset"
	density = TRUE
	mouse_drag_pointer = MOUSE_ACTIVE_POINTER
	var/giftwrapped = FALSE
	var/sortTag = 0
	var/obj/item/barcode/sticker

/obj/structure/bigDelivery/interact(mob/user)
	to_chat(user, "<span class='notice'>You start to unwrap the package...</span>")
	if(!do_after(user, 15, target = user))
		return
	playsound(src.loc, 'sound/items/poster_ripped.ogg', 50, 1)
	new /obj/effect/decal/cleanable/wrapping(get_turf(user))
	unwrap_contents()
	qdel(src)

/obj/structure/bigDelivery/Destroy()
	var/turf/T = get_turf(src)
	for(var/atom/movable/AM in contents)
		AM.forceMove(T)
	return ..()

/obj/structure/bigDelivery/examine(mob/user)
	. = ..()
	if(sticker)
		. += "There's a barcode attached to the side."

/obj/structure/bigDelivery/contents_explosion(severity, target, origin)
	for(var/atom/movable/AM in contents)
		AM.ex_act(severity, target, origin)

/obj/structure/bigDelivery/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/destTagger))
		var/obj/item/destTagger/O = W

		if(sortTag != O.currTag)
			var/tag = uppertext(GLOB.TAGGERLOCATIONS[O.currTag])
			to_chat(user, "<span class='notice'>*[tag]*</span>")
			sortTag = O.currTag
			playsound(loc, 'sound/machines/twobeep.ogg', 100, 1)

	else if(istype(W, /obj/item/pen))
		if(!user.is_literate())
			to_chat(user, "<span class='notice'>You scribble illegibly on the side of [src]!</span>")
			return
		var/str = stripped_input(user, "Label text?", "Set label", "", MAX_NAME_LEN)
		if(!user.canUseTopic(src, BE_CLOSE))
			return
		if(!str || !length(str))
			to_chat(user, "<span class='warning'>Invalid text!</span>")
			return
		user.visible_message("[user] labels [src] as [str].")
		name = "[name] ([str])"

	else if(istype(W, /obj/item/stack/wrapping_paper) && !giftwrapped)
		var/obj/item/stack/wrapping_paper/WP = W
		if(WP.use(3))
			user.visible_message("[user] wraps the package in festive paper!")
			giftwrapped = TRUE
			icon_state = "gift[icon_state]"
		else
			to_chat(user, "<span class='warning'>You need more paper!</span>")
	else if(istype(W, /obj/item/sales_tagger))
		var/obj/item/sales_tagger/tagger = W
		if(sticker)
			to_chat(user, "<span class='warning'>This package already has a barcode attached!</span>")
			return
		if(!(tagger.payments_acc))
			to_chat(user, "<span class='warning'>Swipe an ID on [tagger] first!</span>")
			return
		if(tagger.paper_count <= 0)
			to_chat(user, "<span class='warning'>[tagger] is out of paper!</span>")
			return
		user.visible_message("<span class='notice'>[user] attaches a barcode to [src].</span>", "<span class='notice'>You attach a barcode to [src].</span>")
		tagger.paper_count -= 1
		sticker = new /obj/item/barcode(src)
		sticker.payments_acc = tagger.payments_acc	//new tag gets the tagger's current account.
		sticker.cut_multiplier = tagger.cut_multiplier	//same, but for the percentage taken.

		var/list/wrap_contents = src.GetAllContents()
		for(var/obj/I in wrap_contents)
			I.AddComponent(/datum/component/pricetag, sticker.payments_acc, tagger.cut_multiplier)
		var/overlaystring = "[icon_state]_tag"
		if(giftwrapped)
			overlaystring = copytext(overlaystring, 5)
		add_overlay(overlaystring)
	else if(istype(W, /obj/item/barcode))
		var/obj/item/barcode/stickerA = W
		if(sticker)
			to_chat(user, "<span class='warning'>This package already has a barcode attached!</span>")
			return
		if(!(stickerA.payments_acc))
			to_chat(user, "<span class='warning'>This barcode seems to be invalid. Guess it's trash now.</span>")
			return
		if(!user.transferItemToLoc(W, src))
			to_chat(user, "<span class='warning'>For some reason, you can't attach [W]!</span>")
			return
		sticker = stickerA
		var/overlaystring = "[icon_state]_tag"
		if(giftwrapped)
			overlaystring = copytext_char(overlaystring, 5) //5 == length("gift") + 1
		add_overlay(overlaystring)

	else
		return ..()

/obj/structure/bigDelivery/relay_container_resist(mob/living/user, obj/O)
	if(ismovable(loc))
		var/atom/movable/AM = loc //can't unwrap the wrapped container if it's inside something.
		AM.relay_container_resist(user, O)
		return
	to_chat(user, "<span class='notice'>You lean on the back of [O] and start pushing to rip the wrapping around it.</span>")
	if(do_after(user, 50, target = O))
		if(!user || user.stat != CONSCIOUS || user.loc != O || O.loc != src )
			return
		to_chat(user, "<span class='notice'>You successfully removed [O]'s wrapping !</span>")
		O.forceMove(loc)
		playsound(src.loc, 'sound/items/poster_ripped.ogg', 50, 1)
		new /obj/effect/decal/cleanable/wrapping(get_turf(user))
		unwrap_contents()
		qdel(src)
	else
		if(user.loc == src) //so we don't get the message if we resisted multiple times and succeeded.
			to_chat(user, "<span class='warning'>You fail to remove [O]'s wrapping!</span>")

/obj/structure/bigDelivery/proc/unwrap_contents()
	if(!sticker)
		return
	for(var/obj/I in src.GetAllContents())
		SEND_SIGNAL(I, COMSIG_STRUCTURE_UNWRAPPED)

/obj/item/smallDelivery
	name = "parcel"
	desc = "A brown paper delivery parcel."
	icon = 'icons/obj/storage.dmi'
	icon_state = "deliverypackage3"
	var/giftwrapped = 0
	var/sortTag = 0
	var/obj/item/barcode/sticker

/obj/item/smallDelivery/contents_explosion(severity, target, origin)
	for(var/atom/movable/AM in contents)
		AM.ex_act(severity, target, origin)

/obj/item/smallDelivery/attack_self(mob/user)
	to_chat(user, "<span class='notice'>You start to unwrap the package...</span>")
	if(!do_after(user, 15, target = user))
		return
	user.temporarilyRemoveItemFromInventory(src, TRUE)
	unwrap_contents()
	for(var/X in contents)
		var/atom/movable/AM = X
		user.put_in_hands(AM)
	playsound(src.loc, 'sound/items/poster_ripped.ogg', 50, 1)
	new /obj/effect/decal/cleanable/wrapping(get_turf(user))
	qdel(src)

/obj/item/smallDelivery/attack_self_tk(mob/user)
	if(ismob(loc))
		var/mob/M = loc
		M.temporarilyRemoveItemFromInventory(src, TRUE)
		for(var/X in contents)
			var/atom/movable/AM = X
			M.put_in_hands(AM)
	else
		for(var/X in contents)
			var/atom/movable/AM = X
			AM.forceMove(src.loc)
	playsound(src.loc, 'sound/items/poster_ripped.ogg', 50, 1)
	new /obj/effect/decal/cleanable/wrapping(get_turf(user))
	unwrap_contents()
	qdel(src)

/obj/item/smallDelivery/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/destTagger))
		var/obj/item/destTagger/O = W

		if(sortTag != O.currTag)
			var/tag = uppertext(GLOB.TAGGERLOCATIONS[O.currTag])
			to_chat(user, "<span class='notice'>*[tag]*</span>")
			sortTag = O.currTag
			playsound(loc, 'sound/machines/twobeep.ogg', 100, 1)

	else if(istype(W, /obj/item/pen))
		if(!user.is_literate())
			to_chat(user, "<span class='notice'>You scribble illegibly on the side of [src]!</span>")
			return
		var/str = stripped_input(user, "Label text?", "Set label", "", MAX_NAME_LEN)
		if(!user.canUseTopic(src, BE_CLOSE))
			return
		if(!str || !length(str))
			to_chat(user, "<span class='warning'>Invalid text!</span>")
			return
		user.visible_message("[user] labels [src] as [str].")
		name = "[name] ([str])"

	else if(istype(W, /obj/item/stack/wrapping_paper) && !giftwrapped)
		var/obj/item/stack/wrapping_paper/WP = W
		if(WP.use(1))
			icon_state = "gift[icon_state]"
			giftwrapped = 1
			user.visible_message("[user] wraps the package in festive paper!")
		else
			to_chat(user, "<span class='warning'>You need more paper!</span>")

	else if(istype(W, /obj/item/sales_tagger))
		var/obj/item/sales_tagger/tagger = W
		if(sticker)
			to_chat(user, "<span class='warning'>This package already has a barcode attached!</span>")
			return
		if(!(tagger.payments_acc))
			to_chat(user, "<span class='warning'>Swipe an ID on [tagger] first!</span>")
			return
		if(tagger.paper_count <= 0)
			to_chat(user, "<span class='warning'>[tagger] is out of paper!</span>")
			return
		user.visible_message("<span class='notice'>[user] attaches a barcode to [src].</span>", "<span class='notice'>You attach a barcode to [src].</span>")
		tagger.paper_count -= 1
		sticker = new /obj/item/barcode(src)
		sticker.payments_acc = tagger.payments_acc	//new tag gets the tagger's current account.
		sticker.cut_multiplier = tagger.cut_multiplier	//as above, as before.

		var/list/wrap_contents = src.GetAllContents()
		for(var/obj/I in wrap_contents)
			I.AddComponent(/datum/component/pricetag, sticker.payments_acc, tagger.cut_multiplier)
		var/overlaystring = "[icon_state]_tag"
		if(giftwrapped)
			overlaystring = copytext(overlaystring, 5)
		add_overlay(overlaystring)

	else if(istype(W, /obj/item/barcode))
		var/obj/item/barcode/stickerA = W
		if(sticker)
			to_chat(user, "<span class='warning'>This package already has a barcode attached!</span>")
			return
		if(!(stickerA.payments_acc))
			to_chat(user, "<span class='warning'>This barcode seems to be invalid. Guess it's trash now.</span>")
			return
		if(!user.transferItemToLoc(W, src))
			to_chat(user, "<span class='warning'>For some reason, you can't attach [W]!</span>")
			return
		sticker = stickerA
		var/overlaystring = "[icon_state]_tag"
		if(giftwrapped)
			overlaystring = copytext_char(overlaystring, 5) //5 == length("gift") + 1
		add_overlay(overlaystring)

/obj/item/smallDelivery/proc/unwrap_contents()
	if(!sticker)
		return
	for(var/obj/I in src.GetAllContents())
		SEND_SIGNAL(I, COMSIG_ITEM_UNWRAPPED)

/obj/item/smallDelivery/examine(mob/user)
	. = ..()
	if(sticker)
		. += "There's a barcode attached to the side."


/obj/item/destTagger
	name = "destination tagger"
	desc = "Used to set the destination of properly wrapped packages."
	icon = 'icons/obj/device.dmi'
	icon_state = "cargotagger"
	var/currTag = 0 //Destinations are stored in code\globalvars\lists\flavor_misc.dm
	var/locked_destination = FALSE //if true, users can't open the destination tag window to prevent changing the tagger's current destination
	w_class = WEIGHT_CLASS_TINY
	item_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT

/obj/item/destTagger/borg
	name = "cyborg destination tagger"
	desc = "Used to fool the disposal mail network into thinking that you're a harmless parcel. Does actually work as a regular destination tagger as well."

/obj/item/destTagger/suicide_act(mob/living/user)
	user.visible_message("<span class='suicide'>[user] begins tagging [user.ru_ego()] final destination!  It looks like [user.ru_who()] trying to commit suicide!</span>")
	if (islizard(user))
		to_chat(user, "<span class='notice'>*HELL*</span>")//lizard nerf
	else
		to_chat(user, "<span class='notice'>*HEAVEN*</span>")
	playsound(src, 'sound/machines/twobeep.ogg', 100, 1)
	return BRUTELOSS

/obj/item/destTagger/proc/openwindow(mob/user)
	var/dat = "<tt><center><h1><b>TagMaster 2.2</b></h1></center>"

	dat += "<table style='width:100%; padding:4px;'><tr>"
	for (var/i = 1, i <= GLOB.TAGGERLOCATIONS.len, i++)
		dat += "<td><a href='?src=[REF(src)];nextTag=[i]'>[GLOB.TAGGERLOCATIONS[i]]</a></td>"

		if(i%4==0)
			dat += "</tr><tr>"

	dat += "</tr></table><br>Current Selection: [currTag ? GLOB.TAGGERLOCATIONS[currTag] : "None"]</tt>"

	user << browse(dat, "window=destTagScreen;size=450x350")
	onclose(user, "destTagScreen")

/obj/item/destTagger/attack_self(mob/user)
	if(!locked_destination)
		openwindow(user)
		return

/obj/item/destTagger/Topic(href, href_list)
	add_fingerprint(usr)
	if(href_list["nextTag"])
		var/n = text2num(href_list["nextTag"])
		currTag = n
	openwindow(usr)

/obj/item/sales_tagger
	name = "sales tagger"
	desc = "A scanner that lets you tag wrapped items for sale, splitting the profit between you and cargo."
	icon = 'icons/obj/device.dmi'
	icon_state = "salestagger"
	item_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_BELT
	///The account which is recieving the split profits.
	var/datum/bank_account/payments_acc = null
	var/paper_count = 10
	var/max_paper_count = 20
	///Details the percentage the scanned account recieves off the final sale.
	///The person who tagged this will receive the sale value multiplied by this number.
	var/cut_multiplier = 0.5
	///Maximum value for cut_multiplier.
	var/cut_max = 0.5
	///Minimum value for cut_multiplier.
	var/cut_min = 0.01

/obj/item/sales_tagger/examine(mob/user)
	. = ..()
	. += "<span class='notice'>[src] has [paper_count]/[max_paper_count] available barcodes. Refill with paper.</span>"
	. += "<span class='notice'>Profit split on sale is currently set to [round(cut_multiplier*100)]%. <b>Alt-click</b> to change.</span>"
	if(payments_acc)
		. += "<span class='notice'><b>Ctrl-click</b> to clear the registered account.</span>"

/obj/item/sales_tagger/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(istype(I, /obj/item/card/id))
		var/obj/item/card/id/potential_acc = I
		if(potential_acc.registered_account)
			payments_acc = potential_acc.registered_account
			playsound(src, 'sound/machines/ping.ogg', 40, TRUE)
			to_chat(user, "<span class='notice'>[src] registers the ID card. Tag a wrapped item to create a barcode.</span>")
		else if(!potential_acc.registered_account)
			to_chat(user, "<span class='warning'>This ID card has no account registered!</span>")
			return
		else if(payments_acc != potential_acc.registered_account)
			to_chat(user, "<span class='notice'>ID card already registered.</span>")
	if(istype(I, /obj/item/paper))
		if (!(paper_count >=  max_paper_count))
			paper_count += 10
			qdel(I)
			if (paper_count >=  max_paper_count)
				paper_count = max_paper_count
				to_chat(user, "<span class='notice'>[src]'s paper supply is now full.</span>")
				return
			to_chat(user, "<span class='notice'>You refill [src]'s paper supply, you have [paper_count] left.</span>")
			return
		else
			to_chat(user, "<span class='notice'>[src]'s paper supply is full.</span>")
			return

/obj/item/sales_tagger/attack_self(mob/user)
	. = ..()
	if(paper_count <=  0)
		to_chat(user, "<span class='warning'>You're out of paper!'.</span>")
		return
	if(!payments_acc)
		to_chat(user, "<span class='warning'>You need to swipe [src] with an ID card first.</span>")
		return
	paper_count -= 1
	playsound(src, 'sound/machines/click.ogg', 40, TRUE)
	to_chat(user, "<span class='notice'>You print a new barcode.</span>")
	var/obj/item/barcode/new_barcode = new /obj/item/barcode(src)
	new_barcode.payments_acc = payments_acc		// The sticker gets the scanner's registered account.
	new_barcode.cut_multiplier = cut_multiplier		// Also the registered percent cut.
	user.put_in_hands(new_barcode)

/obj/item/sales_tagger/CtrlClick(mob/user)
	. = ..()
	payments_acc = null
	to_chat(user, "<span class='notice'>You clear the registered account.</span>")

/obj/item/sales_tagger/AltClick(mob/user)
	. = ..()
	var/potential_cut = input("How much would you like to pay out to the registered card?","Percentage Profit ([round(cut_min*100)]% - [round(cut_max*100)]%)") as num|null
	if(!potential_cut)
		cut_multiplier = initial(cut_multiplier)
	cut_multiplier = clamp(round(potential_cut/100, cut_min), cut_min, cut_max)
	to_chat(user, "<span class='notice'>[round(cut_multiplier*100)]% profit will be received if a package with a barcode is sold.</span>")

/obj/item/barcode
	name = "Barcode tag"
	desc = "A tiny tag, associated with a crewmember's account. Attach to a wrapped item to give that account a portion of the wrapped item's profit."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "barcode"
	w_class = WEIGHT_CLASS_TINY
	///All values inheirited from the sales tagger it came from.
	var/datum/bank_account/payments_acc = null
	var/cut_multiplier = 0.5
