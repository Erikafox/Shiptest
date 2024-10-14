/* Liquids */

/turf/open/floor/planetary/water
	name = "water"
	desc = "Shallow water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	baseturfs = /turf/open/floor/planetary/water
	slowdown = 1
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER
	floor_variants = FALSE
	can_dig = FALSE

	///extractable liquid reagents should be converted to a component/element

	///what reagent can we pull from this liquid
	var/datum/reagent/reagent_to_extract = /datum/reagent/water
	///what does it get called?
	var/extracted_reagent_visible_name = "water"

/turf/open/floor/planetary/water/examine(mob/user)
	. = ..()
	if(reagent_to_extract)
		. += span_notice("You could probably scoop some of the [extracted_reagent_visible_name] if you had a beaker...")


/turf/open/floor/planetary/water/attackby(obj/item/_item, mob/user, params)
	if(istype(_item, /obj/item/fish))
		to_chat(user, span_notice("You toss the [_item.name] into the [name]."))
		playsound(_item, "sound/effects/bigsplash.ogg", 90)
		qdel(_item)
	if(istype(_item, /obj/item/reagent_containers/glass))
		extract_reagents(_item,user,params)

	. = ..()

/turf/open/floor/planetary/water/proc/extract_reagents(obj/item/reagent_containers/glass/container, mob/user, params)
	if(!reagent_to_extract)
		return FALSE
	if(!container.is_refillable())
		to_chat(user, span_danger("\The [container]'s cap is on! Take it off first."))
		return FALSE
	if(container.reagents.total_volume >= container.volume)
		to_chat(user, span_danger("\The [container] is full."))
		return FALSE
	container.reagents.add_reagent(reagent_to_extract, rand(5, 10))
	user.visible_message(span_notice("[user] scoops [extracted_reagent_visible_name] from the [src] with \the [container]."), span_notice("You scoop out [extracted_reagent_visible_name] from the [src] using \the [container]."))
	return TRUE

/turf/open/floor/planetary/water/can_have_cabling()
	return FALSE

/turf/open/floor/planetary/water/rcd_vals(mob/user, obj/item/construction/rcd/the_rcd)
	switch(the_rcd.mode)
		if(RCD_FLOORWALL)
			return list("mode" = RCD_FLOORWALL, "delay" = 0, "cost" = 3)
	return FALSE

/turf/open/floor/planetary/water/rcd_act(mob/user, obj/item/construction/rcd/the_rcd, passed_mode)
	switch(passed_mode)
		if(RCD_FLOORWALL)
			to_chat(user, span_notice("You build a floor."))
			PlaceOnTop(/turf/open/floor/plating, flags = CHANGETURF_INHERIT_AIR)
			return TRUE
	return FALSE
