/* Baseturf */

//It's intentional that rockplanets don't have a /planetary, and instead go straight to /sand at this moment.

/turf/open/floor/planetary/sand/rockplanet
	name = "iron sand"
	icon_state = "dry_soft"
	base_icon_state = "dry_soft"
	floor_variance = 100
	max_icon_states = 7

	baseturfs = /turf/open/floor/planetary/asteroid/rockplanet
	digResult = /obj/item/stack/ore/glass/rockplanet

	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS
	planetary_atmos = TRUE
	light_color = COLOR_ROCKPLANET_LIGHT

/turf/open/floor/planetary/sand/rockplanet/lit
	light_range = 2
	light_power = 0.6

/turf/open/floor/planetary/sand/rockplanet/cracked
	name = "iron cracked sand"
	icon_state = "dry_cracked0"
	base_icon_state = "dry_cracked"

/turf/open/floor/planetary/sand/rockplanet/cracked/lit
	light_range = 2
	light_power = 0.6

/turf/open/floor/planetary/rockplanet/wet
	icon_state = "wet_soft0"
	base_icon_state = "wet_soft"

/turf/open/floor/planetary/rockplanet/wet/lit
	light_range = 2
	light_power = 0.6

/turf/open/floor/planetary/rockplanet/wet/cracked
	name = "iron cracked sand"
	icon_state = "wet_cracked0"
	base_icon_state = "wet_cracked"

/turf/open/floor/planetary/rockplanet/wet/cracked/lit
	light_range = 2
	light_power = 0.6

/* grass */

/turf/open/floor/planetary/grass/rockplanet
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS
	light_color = COLOR_ROCKPLANET_LIGHT
	name = "dry grass"
	desc = "A patch of dry grass."

/* Dirt */

/turf/open/floor/planetary/dirt/rockplanet
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS
	light_color = COLOR_ROCKPLANET_LIGHT
	name = "mud"
	icon_state = "greenerdirt"

/* Water */

/turf/open/water/rockplanet
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS
	light_color = COLOR_ROCKPLANET_LIGHT
	name = "pond"


/* Non-Planetary Tiles */

///plating

/turf/open/floor/plating/rockplanet
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS
	planetary_atmos = TRUE
	name = "exterior plating"

/turf/open/floor/plating/rockplanet/lit
	light_range = 2
	light_power = 0.6

/turf/open/floor/plating/rust/rockplanet
	name = "exterior plating"
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS
	planetary_atmos = TRUE
	light_color = COLOR_ROCKPLANET_LIGHT

/turf/open/floor/plating/rust/rockplanet/lit
	light_range = 2
	light_power = 0.6

//plasteel

/turf/open/floor/plasteel/stairs/rockplanet
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS
	name = "exterior stairs"

/turf/open/floor/plasteel/stairs/rockplanet/lit
	light_range = 2
	light_power = 0.6
	light_color = COLOR_ROCKPLANET_LIGHT

/turf/open/floor/plasteel/rockplanet
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS
	name = "exterior floor"

/turf/open/floor/plasteel/rockplanet/lit
	light_range = 2
	light_power = 0.6
	light_color = COLOR_ROCKPLANET_LIGHT

/turf/open/floor/plasteel/patterned/rockplanet
	name = "exterior floor"
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS

/turf/open/floor/plasteel/patterned/rockplanet/lit
	light_range = 2
	light_power = 0.6
	light_color = COLOR_ROCKPLANET_LIGHT

/turf/open/floor/plasteel/patterned/brushed/rockplanet
	name = "exterior floor"
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS

/turf/open/floor/plasteel/patterned/brushed/rockplanet/lit
	light_range = 2
	light_power = 0.6
	light_color = COLOR_ROCKPLANET_LIGHT

/turf/open/floor/plasteel/patterned/ridged/rockplanet
	name = "exterior floor"
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS

/turf/open/floor/plasteel/patterned/ridged/rockplanet/lit
	light_range = 2
	light_power = 0.6
	light_color = COLOR_ROCKPLANET_LIGHT

/turf/open/floor/wood/rockplanet
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS
	light_color = COLOR_ROCKPLANET_LIGHT

/turf/open/floor/pod/rockplanet
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS
	light_color = COLOR_ROCKPLANET_LIGHT

///reinforced floors

/turf/open/floor/engine/hull/rockplanet
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS

/turf/open/floor/engine/hull/rockplanet/lit
	light_range = 2
	light_power = 0.6
	light_color = COLOR_ROCKPLANET_LIGHT

/turf/open/floor/engine/hull/reinforced/rockplanet
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS

/turf/open/floor/engine/hull/reinforced/rockplanet/lit
	light_range = 2
	light_power = 0.6
	light_color = COLOR_ROCKPLANET_LIGHT

/// concrete

/turf/open/floor/concrete/rockplanet
	planetary_atmos = TRUE
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS

/turf/open/floor/concrete/rockplanet/lit
	light_range = 2
	light_power = 0.6
	light_color = COLOR_ROCKPLANET_LIGHT

///titanium

/turf/open/floor/mineral/titanium/tiled/rockplanet
	planetary_atmos = TRUE
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS

/turf/open/floor/mineral/titanium/tiled/rockplanet/lit
	light_range = 2
	light_power = 0.6
	light_color = COLOR_ROCKPLANET_LIGHT

///snow
/turf/open/floor/planetary/asteroid/snow/lit/rockplanet
	light_color = COLOR_ROCKPLANET_LIGHT
	baseturfs = /turf/open/floor/planetary/asteroid/rockplanet/lit
	initial_gas_mix = ROCKPLANET_DEFAULT_ATMOS
