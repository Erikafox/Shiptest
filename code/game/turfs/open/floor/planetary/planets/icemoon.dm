/* baseturf */

/turf/open/floor/planetary/icemoon
	gender = PLURAL
	name = "icy rock"
	desc = "The coarse rock that covers the surface."
	icon = 'icons/turf/snow.dmi'
	icon_state = "icemoon_ground_coarse1"
	icon_plating = "icemoon_ground_coarse1"
	base_icon_state = "icemoon_ground_coarse"
	flags_1 = NONE
	footstep = FOOTSTEP_ICE
	barefootstep = FOOTSTEP_ICE
	clawfootstep = FOOTSTEP_ICE
	planetary_atmos = TRUE
	broken_states = list("icemoon_ground_cracked")
	burnt_states = list("icemoon_ground_smooth")
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	digResult = /obj/item/stack/sheet/mineral/snow
	floor_variance = 100
	max_icon_states = 7
	diggable = FALSE

	baseturfs = /turf/open/floor/planetary/icemoon
	light_color = ICEMOON_LIGHTING
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS

/turf/open/floor/planetary/icemoon/cracked
	floor_variance = 0
	icon_state = "icemoon_ground_cracked"
	base_icon_state = "icemoon_ground_cracked"

/turf/open/floor/planetary/icemoon/smooth
	floor_variance = 0
	icon_state = "icemoon_ground_smooth"
	base_icon_state = "icemoon_ground_smooth"

/turf/open/floor/planetary/icemoon/iceberg
	gender = PLURAL
	name = "cracked ice floor"
	desc = "A sheet of solid ice. It seems too cracked to be slippery anymore."
	icon = 'icons/turf/snow.dmi'
	baseturfs = /turf/open/floor/planetary/icemoon/iceberg
	icon_state = "iceberg"
	icon_plating = "iceberg"
	base_icon_state = "iceberg"
	flags_1 = NONE
	footstep = FOOTSTEP_ICE
	barefootstep = FOOTSTEP_ICE
	clawfootstep = FOOTSTEP_ICE
	broken_states = list("iceberg")
	burnt_states = list("iceberg")
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	diggable = FALSE

/turf/open/floor/planetary/icemoon/lit
	baseturfs = /turf/open/floor/planetary/icemoon/lit
	light_power = 1
	light_range = 2

/turf/open/floor/planetary/icemoon/cracked/lit
	light_power = 1
	light_range = 2

/turf/open/floor/planetary/icemoon/smooth/lit
	light_power = 1
	light_range = 2

/turf/open/floor/planetary/icemoon/iceberg/lit
	light_range = 2
	light_power = 1

/* snow */

/turf/open/floor/planetary/snow/icemoon
	baseturfs = /turf/open/floor/planetary/icemoon
	planetary_atmos = TRUE
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS
	diggable = TRUE

/turf/open/floor/planetary/snow/icemoon/under
	icon_state = "snow_dug"

/turf/open/floor/planetary/snow/icemoon/ice
	name = "icy snow"
	desc = "Looks colder."
	baseturfs = /turf/open/floor/planetary/snow/icemoon/ice
	icon_state = "snow-ice"
	icon_plating = "snow-ice"
	base_icon_state = "snow_cavern"
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	max_icon_states = 7
	diggable = FALSE

/turf/open/floor/planetary/snow/icemoon/lit
	light_range = 2
	light_power = 1
	baseturfs = /turf/open/floor/planetary/snow/icemoon/lit

/turf/open/floor/planetary/snow/icemoon/under/lit
	light_range = 2
	light_power = 1
	baseturfs = /turf/open/floor/planetary/snow/icemoon/under/lit

/turf/open/floor/planetary/snow/icemoon/ice/lit
	light_range = 2
	light_power = 1
	baseturfs = /turf/open/floor/planetary/snow/icemoon/ice/lit

/* Plasma */

/turf/open/floor/planetary/lava/plasma/iceplanet
	baseturfs = /turf/open/floor/planetary/lava/plasma/iceplanet
