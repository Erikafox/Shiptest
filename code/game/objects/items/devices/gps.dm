/datum/wires/gps
	holder_type = /obj/item/gps
	proper_name = "GPS"

/datum/wires/autolathe/New(atom/holder)
	wires = list(
		WIRE_POWER, WIRE_TX,
		WIRE_RX,
	)
	..()

/datum/wires/gps/interactable(mob/user)
	var/obj/item/gps/our_gps = holder
	if(our_gps.panel_open)
		return TRUE

/datum/wires/gps/get_status()
	var/obj/item/gps/our_gps = holder
	var/list/status = list()
	status += "The red light is [A.disabled ? "on" : "off"]."
	status += "The blue light is [A.hacked ? "on" : "off"]."
	return status

/datum/wires/gps/on_pulse(wire)
	var/obj/item/gps/our_gps = holder
	switch(wire)
		if(WIRE_POWER)
			A.toggle(!A.hacked)
			addtimer(CALLBACK(A, TYPE_PROC_REF(/obj/machinery/autolathe, reset), wire), 60)
		if(WIRE_TX)
			A.shocked = !A.shocked
			addtimer(CALLBACK(A, TYPE_PROC_REF(/obj/machinery/autolathe, reset), wire), 60)
		if(WIRE_RX)
			A.disabled = !A.disabled
			addtimer(CALLBACK(A, TYPE_PROC_REF(/obj/machinery/autolathe, reset), wire), 60)

/datum/wires/gps/on_cut(wire, mend)
	var/obj/machinery/autolathe/A = holder
	switch(wire)
		if(WIRE_HACK)
			A.adjust_hacked(!mend)
		if(WIRE_SHOCK)
			A.shocked = !mend
		if(WIRE_DISABLE)
			A.disabled = !mend
		if(WIRE_ZAP)
			A.shock(usr, 50)



/obj/item/gps
	name = "global positioning system"
	desc = "Helping lost spacemen find their way through the planets since 2016."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "gps-c"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	obj_flags = UNIQUE_RENAME
	var/gpstag
	var/panel_open = FALSE

/obj/item/gps/Initialize()
	. = ..()
	AddComponent(/datum/component/gps/item, gpstag)

/obj/item/gps/screwdriver_act(mob/living/user, obj/item/I)
	. = ..()
	panel_open = !panel_open
	to_chat(user, span_notice("You open [src]'s wire panel"))

/obj/item/gps/science
	icon_state = "gps-s"
	gpstag = "SCI0"

/obj/item/gps/engineering
	icon_state = "gps-e"
	gpstag = "ENG0"

/obj/item/gps/mining
	icon_state = "gps-m"
	gpstag = "MINE0"
	desc = "A positioning system helpful for rescuing trapped or injured miners, keeping one on you at all times while mining might just save your life."

/obj/item/gps/cyborg
	icon_state = "gps-b"
	gpstag = "BORG0"
	desc = "A mining cyborg internal positioning system. Used as a recovery beacon for damaged cyborg assets, or a collaboration tool for mining teams."

/obj/item/gps/cyborg/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CYBORG_ITEM_TRAIT)

/obj/item/gps/mining/internal
	icon_state = "gps-m"
	gpstag = "MINER"
	desc = "A positioning system helpful for rescuing trapped or injured miners, keeping one on you at all times while mining might just save your life."

/obj/item/gps/visible_debug
	name = "visible GPS"
	gpstag = "ADMIN"
	desc = "This admin-spawn GPS unit leaves the coordinates visible \
		on any turf that it passes over, for debugging. Especially useful \
		for marking the area around the transition edges."
	var/list/turf/tagged

/obj/item/gps/visible_debug/Initialize()
	. = ..()
	tagged = list()
	START_PROCESSING(SSfastprocess, src)

/obj/item/gps/visible_debug/process()
	var/turf/T = get_turf(src)
	if(T)
		// I assume it's faster to color,tag and OR the turf in, rather
		// then checking if its there
		T.color = RANDOM_COLOUR
		T.maptext = "[T.x],[T.y],[T.virtual_z()]"
		tagged |= T

/obj/item/gps/visible_debug/proc/clear()
	while(tagged.len)
		var/turf/T = pop(tagged)
		T.color = initial(T.color)
		T.maptext = initial(T.maptext)

/obj/item/gps/visible_debug/Destroy()
	if(tagged)
		clear()
	tagged = null
	STOP_PROCESSING(SSfastprocess, src)
	. = ..()
