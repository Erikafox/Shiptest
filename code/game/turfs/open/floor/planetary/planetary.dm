///root of all planetary tiles
/turf/open/floor/planetary
	name = "planetary tile"
	desc = "if you see this please tell a coder as soon as possible."
	gender = PLURAL
	//our baseturf is ourself
	baseturfs = /turf/open/floor/planetary
	icon = 'icons/turf/floors.dmi'
	icon_state = "grey"
	icon_plating = "grey"
	postdig_icon_change = TRUE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	attachment_holes = FALSE
	/// the icon name to be used: for example, asteroid1 - asteroid12 in the icon file
	base_icon_state  = "grey"
	/// Base turf type to be created by the tunnel
	var/turf_type = /turf/open/floor/planetary
	/// Probability floor has a different icon state
	var/floor_variance = 0
	/// The max amount of unique icons, plus one
	var/max_icon_states = 0

	///our starting gas mix. Set this or you will be plasma'd
	initial_gas_mix = DEFAULT_ATMOS_DETECTOR

	/// Whether the turf has been dug or not
	var/dug = TRUE

	///how much we get from digging
	var/dig_amount

	///what we get from digging
	var/digResult = /obj/item/stack/ore/glass

	///can we be burnt
	var/can_burn = FALSE
	///can we be crushed
	var/can_crush = FALSE // please crush me

/turf/open/floor/planetary/Initialize(mapload, inherited_virtual_z)
	var/proper_name = name
	. = ..()
	name = proper_name

	if(prob(floor_variance))
		icon_state = "[base_icon_state][rand(0,max_icon_states)]"

/// Drops itemstack when dug and changes icon
/turf/open/floor/planetary/proc/get_dug(scrape)
	new digResult(src, dig_amount)
	if(postdig_icon_change)
		if(!postdig_icon)
			icon_plating = "[base_icon_state]_dug"
			icon_state = "[base_icon_state]_dug"
	dug = TRUE

/// If the user can dig the turf
/turf/open/floor/planetary/proc/can_dig(mob/user)
	if(diggable & !dug)
		return TRUE
	if(user)
		to_chat(user, span_warning("You can't dig here!"))

/turf/open/floor/planetary/crush()
	if(can_break)
		. = ..()
	return

/turf/open/floor/planetary/burn_tile()
	if(can_burn)
		. = ..()
	return

/turf/open/floor/planetary/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/planetary/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

/turf/open/floor/planetary/MakeDry()
	return

/turf/open/floor/planetary/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(!.)
		if(W.tool_behaviour == TOOL_SHOVEL)
			if(!can_dig(user))
				return TRUE

			if(!isturf(user.loc))
				return

			balloon_alert(user, "you start digging...")

			if(W.use_tool(src, user, 40, volume=50))
				if(!can_dig(user))
					return TRUE
				get_dug()
				SSblackbox.record_feedback("tally", "pick_used_mining", 1, W.type)
				return TRUE

		else if(istype(W, /obj/item/storage/bag/ore))
			for(var/obj/item/stack/ore/O in src)
				SEND_SIGNAL(W, COMSIG_PARENT_ATTACKBY, O)

		else if(istype(W, /obj/item/stack/sheet/mineral/wood) || istype(W, /obj/item/stack/sheet/mineral/sandstone))
			if(!dug)
				return
			var/obj/item/stack/sheet/mineral/M = W
			if (M.get_amount() < 5)
				to_chat(user, "<span class='warning'>You need at least five sheets for that!</span>")
				return
			var/turf/dest_turf = get_turf(src)
			if(locate(/obj/structure/closet/crate/grave) in dest_turf)
				to_chat(user, "<span class='warning'>There is already a grave there!</span>")
				return
			to_chat(user, "<span class='notice'>You start piling the dirt...</span>")
			if(do_after(user, 30, target = src))
				if(locate(/obj/structure/closet/crate/grave) in dest_turf)
					return
				if(istype(W, /obj/item/stack/sheet/mineral/wood))
					new /obj/structure/closet/crate/grave(dest_turf)
				else if(istype(W, /obj/item/stack/sheet/mineral/sandstone))
					new /obj/structure/closet/crate/grave/stone(dest_turf)
				M.use(5)
				to_chat(user, "<span class='notice'>You place burial mound on [src].</span>")
			return

/turf/open/floor/planetary/ex_act(severity, target)
	. = SEND_SIGNAL(src, COMSIG_ATOM_EX_ACT, severity, target)
	contents_explosion(severity, target)
