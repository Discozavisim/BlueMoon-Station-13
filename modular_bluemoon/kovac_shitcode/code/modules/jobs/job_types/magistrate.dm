/datum/job/ntr
	title = "NanoTrasen Representative"
	flag = NTR
	department_head = list("CentCom")
	department_flag = ENGSEC
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	head_announce = list(RADIO_CHANNEL_COMMAND)
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 35
	supervisors = "Nanotrasen officials and Space law"
	selection_color = "#7e3d48"
	considered_combat_role = FALSE
	exp_requirements = 180
	exp_type = EXP_TYPE_COMMAND
	req_admin_notify = 1
	custom_spawn_text = "<font color='red'>Представитель NanoTrasen - должностное лицо, назначаемое напрямую Центральным Командованием, исполняющий одновременно функции как советника, так и верховного судьи. Представитель контролирует соблюдение рабочих стандартов и космического закона во всех отделах на станции, консультирует и взаимодействует с главами отделов, а также следит за работой юристов (агентов внутренних дел), отдавая им напрямую приказы и исполняя их прошения. Авторизация увольнений глав, обеспечение связи с ЦК и организация судов аналогично входят в перечень его работ. Представитель ни в коем случае не должен выполнять работу СБ.</font>"
	alt_titles = list(
		"Judge",
		"Magistrate",
		"Prosecutor",
		"NanoTrasen Consultant",
		"NanoTrasen Slut",
		"Netorare"
		)

	outfit = /datum/outfit/job/ntr
	plasma_outfit = /datum/outfit/plasmaman/bar

	access = list(ACCESS_LAWYER, ACCESS_SECURITY, ACCESS_SEC_DOORS,  ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_HEADS, ACCESS_HOS, ACCESS_CE, ACCESS_HOP, ACCESS_CMO, ACCESS_QM, ACCESS_RD, ACCESS_BRIDGE_OFFICER, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_BLUESHIELD)
	minimal_access = list(ACCESS_LAWYER, ACCESS_SECURITY, ACCESS_SEC_DOORS,  ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_HEADS, ACCESS_HOS, ACCESS_CE, ACCESS_HOP, ACCESS_CMO, ACCESS_QM, ACCESS_RD, ACCESS_BRIDGE_OFFICER, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_BLUESHIELD)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	blacklisted_quirks = list(/datum/quirk/mute, /datum/quirk/brainproblems, /datum/quirk/blindness, /datum/quirk/monophobia)

	display_order = JOB_DISPLAY_ORDER_NTR
	threat = 2

	family_heirlooms = list(
		/obj/item/gavelhammer,
		/obj/item/storage/briefcase/lawyer/family,
		/obj/item/book/manual/wiki/security_space_law
	)

/obj/item/radio/headset/heads/ntr
	name = "\proper the NanoTrasen Representative headset"
	desc = "The headset of the lead station's judge."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/hos

/obj/item/pda/heads/ntr
	name = "NanoTrasen Representative PDA"
	default_cartridge = /obj/item/cartridge/hos
	icon_state = "pda-security"

/obj/item/clothing/suit/armor/ntr
	name = "NanoTrasen Officer Coat"
	desc = "A greatcoat enhanced with a special alloy for some extra protection and style for those with a commanding presence."
	icon_state = "ntr"
	item_state = "ntr"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/suit.dmi'
	unique_reskin = list(
		"Peacekeeper" = list("icon_state" = "peacekeeper_trench_hos_white"),
		"Spacecoat" = list("icon_state" = "peacekeeper_spacecoat")
	)

/obj/item/clothing/head/beret/sec/ntr
	name = "NanoTrasen Officer Cap"
	desc = "The standard-issue cap of the NanoTrasen Central Command. For showing the officers and HoS who's in charge."
	icon_state = "ntr"
	item_state = "ntr"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/head.dmi'

/datum/outfit/job/ntr
	name = "NanoTrasen Representative"
	jobtype = /datum/job/ntr

	belt = /obj/item/pda/heads/ntr
	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/heads/ntr
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	uniform = /obj/item/clothing/under/rank/civilian/lawyer/black/alt
	suit = /obj/item/clothing/suit/armor/ntr
	head = /obj/item/clothing/head/beret/sec/ntr
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/melee/classic_baton/telescopic

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec

	chameleon_extras = /obj/item/stamp/law

	backpack_contents = list(/obj/item/gun/energy/e_gun=1, /obj/item/stamp/law=1)

	implants = list(/obj/item/implant/mindshield)
