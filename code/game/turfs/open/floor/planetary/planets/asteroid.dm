/* sand */

/turf/open/floor/planetary/sand/asteroid
	name = "asteroid sand"

	icon = 'icons/turf/floors.dmi'
	icon_state = "asteroid"
	icon_plating = "asteroid"
	postdig_icon_change = TRUE
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	base_icon_state  = "asteroid"
	turf_type = /turf/open/floor/planetary/asteroid
	floor_variance = 20
	max_icon_states = 12
	digResult = /obj/item/stack/ore/glass

	//planetary attributes

	initial_gas_mix = AIRLESS_ATMOS
	baseturfs = /turf/open/floor/planetary/asteroid

/* Ice */

/turf/open/floor/planetary/ice/asteroid
	diggable = TRUE
	digResult = /obj/item/stack/ore/ice
	dig_amount = 2

	//planetary attributes

	initial_gas_mix = AIRLESS_ATMOS
	baseturfs = /turf/open/floor/planetary/asteroid


/turf/open/floor/planetary/ice/asteroid/lit
	light_range = 2
	light_power = 0.8
