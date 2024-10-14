/* Ice Ice Baby */

/turf/open/floor/planetary/ice
	name = "ice sheet"
	desc = "A sheet of solid ice. Looks slippery."
	icon = 'icons/turf/snow.dmi'
	icon_state = "ice"
	slowdown = 1
	bullet_sizzle = TRUE
	footstep = FOOTSTEP_ICE
	barefootstep = FOOTSTEP_ICE
	clawfootstep = FOOTSTEP_ICE
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	floor_variants = FALSE

/turf/open/floor/planetary/ice/Initialize(mapload, inherited_virtual_z)
	. = ..()
	MakeSlippery(TURF_WET_PERMAFROST, INFINITY, 0, INFINITY, TRUE)

/turf/open/floor/planetary/ice/smooth
	icon_state = "ice_turf-255"
	icon = 'icons/turf/floors/ice_turf.dmi'
	base_icon_state = "ice_turf"
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_BORDER
	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_FLOOR_ICE)
	canSmoothWith = list(SMOOTH_GROUP_FLOOR_ICE)
