/turf/open/floor/planetary/lava/plasma
	name = "liquid plasma"
	desc = "A flowing stream of chilled liquid plasma. You probably shouldn't get in."
	icon_state = "liquidplasma"
	baseturfs = /turf/open/floor/planetary/lava/plasma/
	slowdown = 2
	light_range = 3
	light_power = 0.75
	light_color = LIGHT_COLOR_PURPLE
	particle_emitter = null

/turf/open/floor/planetary/lava/plasma/attackby(obj/item/I, mob/user, params)
	var/obj/item/reagent_containers/glass/C = I
	if(C.reagents.total_volume >= C.volume)
		to_chat(user, "<span class='danger'>[C] is full.</span>")
		return
	C.reagents.add_reagent(/datum/reagent/toxin/plasma, rand(5, 10))
	user.visible_message("<span class='notice'>[user] scoops some plasma from the [src] with \the [C].</span>", "<span class='notice'>You scoop out some plasma from the [src] using \the [C].</span>")
	return TRUE

/turf/open/floor/planetary/lava/plasma/burn_stuff(AM)
	. = 0

	if(is_safe())
		return FALSE

	var/thing_to_check = src
	if (AM)
		thing_to_check = list(AM)
	for(var/thing in thing_to_check)
		if(isobj(thing))
			var/obj/O = thing
			if((O.resistance_flags & (FREEZE_PROOF)) || O.throwing)
				continue

		else if (isliving(thing))
			. = 1
			var/mob/living/L = thing
			if(L.movement_type & FLYING)
				continue	//YOU'RE FLYING OVER IT
			if("snow" in L.weather_immunities)
				continue

			var/buckle_check = L.buckling
			if(!buckle_check)
				buckle_check = L.buckled
			if(isobj(buckle_check))
				var/obj/O = buckle_check
				if(O.resistance_flags & FREEZE_PROOF)
					continue

			else if(isliving(buckle_check))
				var/mob/living/live = buckle_check
				if("snow" in live.weather_immunities)
					continue

			L.adjustFireLoss(2)
			if(L)
				L.adjust_fire_stacks(20) //dipping into a stream of plasma would probably make you more flammable than usual
				L.adjust_bodytemperature(-rand(50,65)) //its cold, man
				if(ishuman(L))//are they a carbon?
					var/list/plasma_parts = list()//a list of the organic parts to be turned into plasma limbs
					var/list/robo_parts = list()//keep a reference of robotic parts so we know if we can turn them into a plasmaman
					var/mob/living/carbon/human/PP = L
					var/S = PP.dna.species
					if(istype(S, /datum/species/plasmaman) || istype(S, /datum/species/android)) //ignore plasmamen/robotic species
						continue

					for(var/BP in PP.bodyparts)
						var/obj/item/bodypart/NN = BP
						if(IS_ORGANIC_LIMB(NN) && NN.limb_id != "plasmaman") //getting every organic, non-plasmaman limb (augments/androids are immune to this)
							plasma_parts += NN
						if(!IS_ORGANIC_LIMB(NN))
							robo_parts += NN

					if(prob(35)) //checking if the delay is over & if the victim actually has any parts to nom
						PP.adjustToxLoss(15)
						PP.adjustFireLoss(25)
						if(plasma_parts.len)
							var/obj/item/bodypart/NB = pick(plasma_parts) //using the above-mentioned list to get a choice of limbs for dismember() to use
							NB.limb_id = "plasmaman" //change the species_id of the limb to that of a plasmaman
							NB.static_icon = 'icons/mob/species/plasmaman/bodyparts.dmi'
							NB.no_update = TRUE
							NB.change_bodypart_status()
							PP.force_scream()
							if(!HAS_TRAIT(PP, TRAIT_ANALGESIA))
								PP.visible_message(
									"<span class='warning'>[L] screams in pain as [L.p_their()] [NB] melts down to the bone!</span>",
									"<span class='userdanger'>You scream out in pain as your [NB] melts down to the bone, leaving an eerie plasma-like glow where flesh used to be!</span>")
							else
								PP.visible_message(
									"<span class='warning'>[L] lets out panicked gasps as [L.p_their()] [NB] melts down to the bone!</span>",
									"<span class='userdanger'>You gasp in shock as your [NB] melts down to the bone, leaving an eerie plasma-like glow where flesh used to be!</span>")
						if(!plasma_parts.len && !robo_parts.len) //a person with no potential organic limbs left AND no robotic limbs, time to turn them into a plasmaman
							PP.IgniteMob()
							PP.set_species(/datum/species/plasmaman)
							PP.visible_message(
								"<span class='warning'>[L] bursts into a brilliant purple flame as [L.p_their()] entire body is that of a skeleton!</span>",
								"<span class='userdanger'>Your senses numb as all of your remaining flesh is turned into a purple slurry, sloshing off your body and leaving only your bones to show in a vibrant purple!</span>")
