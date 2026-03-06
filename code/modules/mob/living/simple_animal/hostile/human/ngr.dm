/mob/living/simple_animal/hostile/human/ngr
	name = "New Gorlex Republic Initiate"
	desc = "A member of the New Gorlex Republic, low ranking, thankless, and unarmed."
	icon_state = "syndicate"
	icon_living = "syndicate"
	speak_chance = 0
	stat_attack = HARD_CRIT
	atmos_requirements = IMMUNE_ATMOS_REQS
	maxbodytemp = 400
	unsuitable_atmos_damage = 15
	faction = list(FACTION_RAMZI)
	loot = list()
	check_friendly_fire = TRUE
	dodging = TRUE
	rapid_melee = 2
	mob_spawner = /obj/effect/mob_spawn/human/corpse/ramzi

	armor_base = /obj/item/clothing/suit/armor/vest/syndie
