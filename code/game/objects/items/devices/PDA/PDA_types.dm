//Clown PDA is slippery.
/obj/item/pda/clown
	name = "clown PDA"
	default_cartridge = /obj/item/cartridge/virus/clown
	inserted_item = /obj/item/toy/crayon/rainbow
	icon_state = "pda-clown"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. The surface is coated with polytetrafluoroethylene and banana drippings."
	ttone = "honk"
	var/slipvictims = list() //CIT CHANGE - makes clown PDAs track unique people slipped

/obj/item/pda/clown/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/slippery, 120, NO_SLIP_WHEN_WALKING|SLIP_WHEN_JOGGING, CALLBACK(src, .proc/AfterSlip))

/obj/item/pda/clown/proc/AfterSlip(mob/living/carbon/human/M)
	if (istype(M) && (M.real_name != owner))
		slipvictims |= M //CIT CHANGE - makes clown PDAs track unique people slipped
		var/obj/item/cartridge/virus/clown/cart = cartridge
		if(istype(cart) && cart.charges < 5)
			cart.charges++

//Mime PDA sends "silent" messages.
/obj/item/pda/mime
	name = "mime PDA"
	default_cartridge = /obj/item/cartridge/virus/mime
	inserted_item = /obj/item/toy/crayon/mime
	icon_state = "pda-mime"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. The hardware has been modified for compliance with the vows of silence."
	silent = TRUE
	ttone = "silence"

/obj/item/pda/mime/msg_input(mob/living/U = usr)
	if(emped || toff)
		return
	var/emojis = emoji_sanitize(stripped_input(U, "Please enter emojis", name))
	if(!emojis)
		return
	if(!U.canUseTopic(src, BE_CLOSE))
		return
	return emojis

// Special AI/pAI PDAs that cannot explode.
/obj/item/pda/ai
	icon = null
	ttone = "data"
	fon = FALSE
	detonatable = FALSE

/obj/item/pda/ai/attack_self(mob/user)
	if ((honkamt > 0) && (prob(60)))//For clown virus.
		honkamt--
		playsound(loc, 'sound/items/bikehorn.ogg', 30, 1)
	return

/obj/item/pda/ai/pai
	ttone = "assist"



/obj/item/pda/medical
	name = "medical PDA"
	default_cartridge = /obj/item/cartridge/medical
	icon_state = "pda-medical"

/obj/item/pda/viro
	name = "virology PDA"
	default_cartridge = /obj/item/cartridge/medical
	icon_state = "pda-virology"

/obj/item/pda/engineering
	name = "engineering PDA"
	default_cartridge = /obj/item/cartridge/engineering
	icon_state = "pda-engineer"

/obj/item/pda/security
	name = "security PDA"
	default_cartridge = /obj/item/cartridge/security
	icon_state = "pda-security"

/obj/item/pda/detective
	name = "detective PDA"
	default_cartridge = /obj/item/cartridge/detective
	icon_state = "pda-detective"

/obj/item/pda/warden
	name = "warden PDA"
	default_cartridge = /obj/item/cartridge/security
	icon_state = "pda-warden"

/obj/item/pda/janitor
	name = "janitor PDA"
	default_cartridge = /obj/item/cartridge/janitor
	icon_state = "pda-janitor"
	ttone = "slip"

/obj/item/pda/toxins
	name = "scientist PDA"
	default_cartridge = /obj/item/cartridge/signal/toxins
	icon_state = "pda-science"
	ttone = "boom"

/obj/item/pda/heads
	default_cartridge = /obj/item/cartridge/head
	icon_state = "pda-hop"

/obj/item/pda/heads/hop
	name = "head of personnel PDA"
	default_cartridge = /obj/item/cartridge/hop
	icon_state = "pda-hop"

/obj/item/pda/heads/hos
	name = "head of security PDA"
	default_cartridge = /obj/item/cartridge/hos
	icon_state = "pda-hos"

/obj/item/pda/heads/ce
	name = "chief engineer PDA"
	default_cartridge = /obj/item/cartridge/ce
	icon_state = "pda-ce"

/obj/item/pda/heads/cmo
	name = "chief medical officer PDA"
	default_cartridge = /obj/item/cartridge/cmo
	icon_state = "pda-cmo"

/obj/item/pda/heads/rd
	name = "research director PDA"
	default_cartridge = /obj/item/cartridge/rd
	inserted_item = /obj/item/pen/fourcolor
	icon_state = "pda-rd"

/obj/item/pda/captain
	name = "captain PDA"
	default_cartridge = /obj/item/cartridge/captain
	inserted_item = /obj/item/pen/fountain/captain
	icon_state = "pda-captain"
	detonatable = FALSE

/obj/item/pda/lieutenant
	name = "lieutenant PDA"
	default_cartridge = /obj/item/cartridge/captain
	inserted_item = /obj/item/pen/fountain/captain
	icon_state = "pda-lieutenant"
	ttone = "bwoink"
	detonatable = FALSE
	hidden = TRUE
	note = "Congratulations, you have chosen the Thinktronic 5230-2 Personal Data Assistant Prestige Edition! To help with navigation, we have provided the following definitions. North: Fore. South: Aft. West: Port. East: Starboard. Quarter is either side of aft."

/obj/item/pda/cargo
	name = "cargo technician PDA"
	default_cartridge = /obj/item/cartridge/quartermaster
	icon_state = "pda-cargo"

/obj/item/pda/quartermaster
	name = "quartermaster PDA"
	default_cartridge = /obj/item/cartridge/quartermaster
	inserted_item = /obj/item/pen/fountain
	icon_state = "pda-qm"

/obj/item/pda/shaftminer
	name = "shaft miner PDA"
	icon_state = "pda-miner"

/obj/item/pda/syndicate
	default_cartridge = /obj/item/cartridge/virus/syndicate
	icon_state = "pda-syndi"
	name = "military PDA"
	owner = "John Doe"
	hidden = 1

/obj/item/pda/chaplain
	name = "chaplain PDA"
	icon_state = "pda-chaplain"
	default_cartridge = /obj/item/cartridge/chaplain
	ttone = "holy"

/obj/item/pda/lawyer
	name = "lawyer PDA"
	default_cartridge = /obj/item/cartridge/lawyer
	inserted_item = /obj/item/pen/fountain
	icon_state = "pda-security"
	ttone = "objection"

/obj/item/pda/botanist
	name = "botanist PDA"
	//default_cartridge = /obj/item/cartridge/botanist
	icon_state = "pda-hydro"

/obj/item/pda/roboticist
	name = "roboticist PDA"
	icon_state = "pda-roboticist"
	default_cartridge = /obj/item/cartridge/roboticist

/obj/item/pda/curator
	name = "curator PDA"
	icon_state = "pda-library"
	current_overlays = list("pda-r-library","blank","id_overlay","insert_overlay", "light_overlay", "pai_overlay")
	default_cartridge = /obj/item/cartridge/curator
	inserted_item = /obj/item/pen/fountain
	desc = "A portable microcomputer by Thinktronic Systems, LTD. This model is a WGW-11 series e-reader."
	note = "Congratulations, your station has chosen the Thinktronic 5290 WGW-11 Series E-reader and Personal Data Assistant! To help with navigation, we have provided the following definitions. North: Fore. South: Aft. West: Port. East: Starboard. Quarter is either side of aft."
	silent = TRUE //Quiet in the library!
	overlays_offsets = list('icons/obj/pda.dmi' = list(-3,0))
	overlays_x_offset = -3

/obj/item/pda/clear
	name = "clear PDA"
	icon_state = "pda-clear"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. This model is a special edition with a transparent case."
	note = "Congratulations, you have chosen the Thinktronic 5230 Personal Data Assistant Deluxe Special Max Turbo Limited Edition! To help with navigation, we have provided the following definitions. North: Fore. South: Aft. West: Port. East: Starboard. Quarter is either side of aft."

/obj/item/pda/neko
	name = "neko PDA"
	icon_state = "pda-neko"
	overlays_icons = list('icons/obj/pda_alt.dmi' = list("pda-r", "screen_neko", "id_overlay", "insert_overlay", "light_overlay", "pai_overlay"))
	desc = "A portable microcomputer by Thinktronic Systems, LTD. This model is a special feline edition."
	note = "Congratulations, you have chosen the Thinktronic 5230 Personal Data Assistant Deluxe Special Mew Turbo Limited Edition NYA~! To help with navigation, we have provided the following definitions. North: Fore. South: Aft. West: Port. East: Starboard. Quarter is either side of aft."

/obj/item/pda/cook
	name = "cook PDA"
	icon_state = "pda-cook"

/obj/item/pda/bar
	name = "bartender PDA"
	icon_state = "pda-bartender"
	default_cartridge = /obj/item/cartridge/bartender
	inserted_item = /obj/item/pen/fountain

/obj/item/pda/atmos
	name = "atmospherics PDA"
	default_cartridge = /obj/item/cartridge/atmos
	icon_state = "pda-atmos"

/obj/item/pda/chemist
	name = "chemist PDA"
	default_cartridge = /obj/item/cartridge/chemistry
	icon_state = "pda-chemistry"

/obj/item/pda/geneticist
	name = "geneticist PDA"
	default_cartridge = /obj/item/cartridge/medical
	icon_state = "pda-genetics"
