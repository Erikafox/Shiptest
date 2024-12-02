/* Basalt */

/turf/open/floor/planetary/volcanic
	name = "volcanic floor"
	baseturfs = /turf/open/floor/planetary/volcanic
	icon = 'icons/turf/floors.dmi'
	icon_state = "basalt"
	icon_plating = "basalt"
	base_icon_state = "basalt"
	floor_variance = 15
	digResult = /obj/item/stack/ore/glass/basalt
	light_color = COLOR_LAVAPLANET_LIGHT

	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE

/turf/open/floor/planetary/volcanic/lit
	light_range = 2
	light_power = 0.6

/turf/open/floor/planetary/volcanic/Initialize(mapload, inherited_virtual_z)
	. = ..()
	set_basalt_light(src)

/proc/set_basalt_light(turf/open/floor/B)
	switch(B.icon_state)
		if("basalt1", "basalt2", "basalt3")
			B.set_light(2, 0.6, COLOR_LAVAPLANET_LIGHT) //more light
		if("basalt5", "basalt9")
			B.set_light(1.4, 0.6, COLOR_LAVAPLANET_LIGHT) //barely anything!

/turf/open/floor/planetary/volcanic/purple
	icon = 'icons/turf/lavaland_purple.dmi'
	baseturfs = /turf/open/floor/planetary/basalt/purple
	turf_type = /turf/open/floor/planetary/basalt/purple
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE

/turf/open/floor/planetary/vocanic/purple/lit
	light_range = 2
	light_power = 0.6

/* Sand */

/turf/open/floor/planetary/sand/volcanic
	name = "ashen sand"
	desc = "Sand, tinted by the chemicals in the atmosphere to an uncanny shade of purple."
	icon = 'icons/turf/lavaland_purple.dmi'
	baseturfs = /turf/open/floor/planetary/purple
	turf_type = /turf/open/floor/planetary/basalt/purple
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE
	light_color = COLOR_LAVAPLANET_LIGHT

/turf/open/floor/planetary/sand/volcanic/lit
	light_range = 2
	light_power = 0.3

/* Grass */

/turf/open/floor/planetary/grass/lava
	name = "ungodly grass"
	desc = "Common grass, tinged to unnatural colours by chemicals in the atmosphere."
	baseturfs = /turf/open/floor/plating/grass/lava
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	icon_state = "grass-255"
	base_icon_state = "grass"
	planetary_atmos = TRUE
	icon = 'icons/turf/floors/lava_grass_red.dmi'
	smooth_icon = 'icons/turf/floors/lava_grass_red.dmi'

	light_color = COLOR_LAVAPLANET_LIGHT
	gender = PLURAL

/turf/open/floor/planetary/grass/lava/lit
	light_range = 2
	light_power = 0.6

/turf/open/floor/planetary/grass/lava/orange
	icon = 'icons/turf/floors/lava_grass_orange.dmi'
	smooth_icon = 'icons/turf/floors/lava_grass_orange.dmi'
	baseturfs = /turf/open/floor/plating/grass/lava/orange

/turf/open/floor/planetary/grass/lava/orange/lit
	light_range = 2
	light_power = 0.6


/turf/open/floor/planetary/grass/lava/purple
	baseturfs = /turf/open/floor/plating/grass/lava/purple
	icon = 'icons/turf/floors/lava_grass_purple.dmi'
	smooth_icon = 'icons/turf/floors/lava_grass_purple.dmi'

/turf/open/floor/planetary/grass/lava/purple/lit
	light_range = 2
	light_power = 0.6

///The Moss
/turf/open/floor/planetary/grass/lava/moss
	name = "mossy carpet"
	desc = "When the forests burned away and the sky grew dark, the moss learned to feed on the falling ash."
	baseturfs = /turf/open/floor/plating/ashplanet //explosions and damage can destroy the moss
	icon_state = "moss"
	icon = 'icons/turf/lava_moss.dmi'
	base_icon_state = "moss"
	bullet_bounce_sound = null
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	layer = HIGH_TURF_LAYER
	gender = PLURAL
	pixel_x = -9
	pixel_y = -9

/turf/open/floor/planetary/grass/lava/moss/lit
	light_power = 1
	light_range = 2


/* Non-planetary turfs */


///Ruin Turfs (to-do, move all ruin turfs into their own bespoke files)

/turf/open/floor/concrete/pavement/lava
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	light_range = 2
	light_power = 0.6
	light_color = COLOR_LAVAPLANET_LIGHT

/turf/open/floor/concrete/lava
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	light_range = 2
	light_power = 0.6
	light_color = COLOR_LAVAPLANET_LIGHT

/turf/open/floor/concrete/slab_1/lava
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	light_range = 2
	light_power = 0.6
	light_color = COLOR_LAVAPLANET_LIGHT

/turf/open/floor/plating/lava
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	light_range = 2
	light_power = 0.6
	light_color = COLOR_LAVAPLANET_LIGHT

/turf/open/floor/plating/rust/lava
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	light_range = 2
	light_power = 0.6
	light_color = COLOR_LAVAPLANET_LIGHT

/turf/open/floor/plasteel/white/lava
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	light_range = 2
	light_power = 0.6
	light_color = COLOR_LAVAPLANET_LIGHT

/turf/open/floor/plasteel/dark/lava
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	light_range = 2
	light_power = 0.6
	light_color = COLOR_LAVAPLANET_LIGHT
