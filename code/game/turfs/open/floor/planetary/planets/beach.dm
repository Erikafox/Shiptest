/* Sand */

/turf/open/floor/planetary/sand/beach
	name = "sand"
	planetary_atmos = TRUE
	digResult = /obj/item/stack/ore/glass/beach

	//planetary attributes
	light_color = BEACHPLANET_LIGHTING
	initial_gas_mix = LIGHT_COLOR_TUNGSTEN
	baseturfs = /turf/open/floor/planetary/sand/beach

/turf/open/floor/planetary/sand/beach/Initialize(mapload, inherited_virtual_z)
	. = ..()
	icon_state = "[base_icon_state]"

/turf/open/floor/planetary/sand/beach/lit
	light_range = 2
	light_power = 0.80

/turf/open/floor/planetary/sand/beach/dense
	icon_state = "light_sand"
	planetary_atmos = TRUE
	base_icon_state = "light_sand"

/turf/open/floor/planetary/sand/beach/dense/lit
	light_range = 2
	light_power = 0.80

/* Dirt */

/turf/open/floor/planetary/dirt/beach
	planetary_atmos = TRUE
	//planetary attributes
	light_color = BEACHPLANET_LIGHTING
	initial_gas_mix = BEACHPLANET_DEFAULT_ATMOS
	baseturfs = /turf/open/floor/planetary/sand/beach

/turf/open/floor/planetary/dirt/beach/dark
	icon_state = "greenerdirt"

/turf/open/floor/planetary/dirt/beach/lit
	light_range = 2
	light_power = 0.80

/turf/open/floor/planetary/dirt/beach/dark/lit
	light_range = 2
	light_power = 0.80

/* Grass */

/turf/open/floor/planetary/grass/beach
	planetary_atmos = TRUE
	//planetary attributes
	light_color = BEACHPLANET_LIGHTING
	initial_gas_mix = BEACHPLANET_DEFAULT_ATMOS
	baseturfs = /turf/open/floor/planetary/dirt/beach

/turf/open/floor/planetary/grass/beach/dark
	icon_state = "junglegrass"
	base_icon_state = "junglegrass"
	smooth_icon = 'icons/turf/floors/junglegrass.dmi'

/turf/open/floor/planetary/grass/beach/lit
	light_range = 2
	light_power = 0.80

/turf/open/floor/planetary/grass/beach/dark/lit
	light_range = 2
	light_power = 0.80
