/*
 *	These absorb the functionality of the plant bag, ore satchel, etc.
 *	They use the use_to_pickup, quick_gather, and quick_empty functions
 *	that were already defined in weapon/storage, but which had been
 *	re-implemented in other classes.
 *
 *	Contains:
 *		Trash Bag
 *		Mining Satchel
 *		Plant Bag
 *		Sheet Snatcher
 *		Book Bag
 *      Biowaste Bag
 *
 *	-Sayu
 */

//  Generic non-item
/obj/item/storage/bag
	slot_flags = SLOT_BELT

/obj/item/storage/bag/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.allow_quick_gather = TRUE
	STR.allow_quick_empty = TRUE
	STR.display_numerical_stacking = TRUE
	STR.click_gather = TRUE

// -----------------------------
//          Trash bag
// -----------------------------
/obj/item/storage/bag/trash
	name = "trash bag"
	desc = "It's the heavy-duty black polymer kind. Time to take out the trash!"
	icon = 'icons/obj/janitor.dmi'
	icon_state = "trashbag"
	item_state = "trashbag"
	lefthand_file = 'icons/mob/inhands/equipment/custodial_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/custodial_righthand.dmi'

	w_class = WEIGHT_CLASS_BULKY

/obj/item/storage/bag/trash/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.max_combined_w_class = 30
	STR.max_items = 30
	STR.cant_hold = typecacheof(list(/obj/item/disk/nuclear))

/obj/item/storage/bag/trash/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] puts [src] over [user.p_their()] head and starts chomping at the insides! Disgusting!</span>")
	playsound(loc, 'sound/items/eatfood.ogg', 50, 1, -1)
	return (TOXLOSS)

/obj/item/storage/bag/trash/update_icon()
	if(contents.len == 0)
		icon_state = "[initial(icon_state)]"
	else if(contents.len < 12)
		icon_state = "[initial(icon_state)]1"
	else if(contents.len < 21)
		icon_state = "[initial(icon_state)]2"
	else icon_state = "[initial(icon_state)]3"

/obj/item/storage/bag/trash/cyborg

/obj/item/storage/bag/trash/proc/janicart_insert(mob/user, obj/structure/janitorialcart/J)
	J.put_in_cart(src, user)
	J.mybag=src
	J.update_icon()

/obj/item/storage/bag/trash/cyborg/janicart_insert(mob/user, obj/structure/janitorialcart/J)
	return

/obj/item/storage/bag/trash/bluespace
	name = "trash bag of holding"
	desc = "The latest and greatest in custodial convenience, a trashbag that is capable of holding vast quantities of garbage."
	icon_state = "bluetrashbag"
	flags_2 = NO_MAT_REDEMPTION_2

/obj/item/storage/bag/trash/bluespace/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_combined_w_class = 60
	STR.max_items = 60

// -----------------------------
//        Mining Satchel
// -----------------------------

/obj/item/storage/bag/ore
	name = "mining satchel"
	desc = "This little bugger can be used to store and transport ores."
	icon = 'icons/obj/mining.dmi'
	icon_state = "satchel"
	slot_flags = SLOT_BELT | SLOT_POCKET
	w_class = WEIGHT_CLASS_NORMAL
<<<<<<< HEAD
<<<<<<< HEAD
	storage_slots = 8
	max_combined_w_class = 16 //Doesn't matter what this is, so long as it's more or equal to storage_slots * ore.w_class
	max_w_class = WEIGHT_CLASS_HUGE
	can_hold = list(/obj/item/stack/ore)
	var/spam_protection = FALSE //If this is TRUE, the holder won't receive any messages when they fail to pick up ore through crossing it
	var/datum/component/mobhook

=======
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	component_type = /datum/component/storage/concrete/stack
	var/spam_protection = FALSE //If this is TRUE, the holder won't receive any messages when they fail to pick up ore through crossing it
	var/datum/component/mobhook

/obj/item/storage/bag/ore/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage/concrete/stack)
	STR.allow_quick_empty = TRUE
	STR.can_hold = typecacheof(list(/obj/item/stack/ore))
	STR.max_w_class = WEIGHT_CLASS_HUGE
	STR.max_combined_stack_amount = 50

<<<<<<< HEAD
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
/obj/item/storage/bag/ore/equipped(mob/user)
	. = ..()
	if (mobhook && mobhook.parent != user)
		QDEL_NULL(mobhook)
	if (!mobhook)
		mobhook = user.AddComponent(/datum/component/redirect, list(COMSIG_MOVABLE_MOVED), CALLBACK(src, .proc/Pickup_ores, user))

/obj/item/storage/bag/ore/dropped()
	. = ..()
	if (mobhook)
		QDEL_NULL(mobhook)

/obj/item/storage/bag/ore/proc/Pickup_ores(mob/living/user)
	var/show_message = FALSE
	var/obj/structure/ore_box/box
	var/turf/tile = user.loc
	if (!isturf(tile))
		return
	if (istype(user.pulling, /obj/structure/ore_box))
		box = user.pulling
<<<<<<< HEAD
<<<<<<< HEAD
	for(var/A in tile)
		if (!is_type_in_typecache(A, can_hold))
			continue
		if (box)
			user.transferItemToLoc(A, box)
			show_message = TRUE
		else if(can_be_inserted(A, TRUE, user))
			handle_item_insertion(A, TRUE, user)
			show_message = TRUE
		else
			if(!spam_protection)
				to_chat(user, "<span class='warning'>Your [name] is full and can't hold any more!</span>")
				spam_protection = TRUE
				continue
=======
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	GET_COMPONENT(STR, /datum/component/storage)
	if(STR)
		for(var/A in tile)
			if (!is_type_in_typecache(A, STR.can_hold))
				continue
			if (box)
				user.transferItemToLoc(A, box)
				show_message = TRUE
			else if(SendSignal(COMSIG_TRY_STORAGE_INSERT, A, user, TRUE))
				show_message = TRUE
			else
				if(!spam_protection)
					to_chat(user, "<span class='warning'>Your [name] is full and can't hold any more!</span>")
					spam_protection = TRUE
					continue
<<<<<<< HEAD
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	if(show_message)
		playsound(user, "rustle", 50, TRUE)
		if (box)
			user.visible_message("<span class='notice'>[user] offloads the ores beneath them into [box].</span>", \
			"<span class='notice'>You offload the ores beneath you into your [box].</span>")
		else
			user.visible_message("<span class='notice'>[user] scoops up the ores beneath them.</span>", \
				"<span class='notice'>You scoop up the ores beneath you with your [name].</span>")
	spam_protection = FALSE

/obj/item/storage/bag/ore/cyborg
	name = "cyborg mining satchel"

/obj/item/storage/bag/ore/holding //miners, your messiah has arrived
	name = "mining satchel of holding"
	desc = "A revolution in convenience, this satchel allows for huge amounts of ore storage. It's been outfitted with anti-malfunction safety measures."
	icon_state = "satchel_bspace"

/obj/item/storage/bag/ore/holding/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage/concrete/stack)
	STR.max_items = INFINITY
	STR.max_combined_w_class = INFINITY
	STR.max_combined_stack_amount = INFINITY

// -----------------------------
//          Plant bag
// -----------------------------

/obj/item/storage/bag/plants
	name = "plant bag"
	icon = 'icons/obj/hydroponics/equipment.dmi'
	icon_state = "plantbag"
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE

/obj/item/storage/bag/plants/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 100
	STR.max_items = 100
	STR.can_hold = typecacheof(list(/obj/item/reagent_containers/food/snacks/grown, /obj/item/seeds, /obj/item/grown, /obj/item/reagent_containers/honeycomb))

////////

/obj/item/storage/bag/plants/portaseeder
	name = "portable seed extractor"
	desc = "For the enterprising botanist on the go. Less efficient than the stationary model, it creates one seed per plant."
	icon_state = "portaseeder"

/obj/item/storage/bag/plants/portaseeder/verb/dissolve_contents()
	set name = "Activate Seed Extraction"
	set category = "Object"
	set desc = "Activate to convert your plants into plantable seeds."
	if(usr.stat || !usr.canmove || usr.restrained())
		return
	for(var/obj/item/O in contents)
		seedify(O, 1)

// -----------------------------
//        Sheet Snatcher
// -----------------------------
// Because it stacks stacks, this doesn't operate normally.
// However, making it a storage/bag allows us to reuse existing code in some places. -Sayu

/obj/item/storage/bag/sheetsnatcher
	name = "sheet snatcher"
	desc = "A patented Nanotrasen storage system designed for any kind of mineral sheet."
	icon = 'icons/obj/mining.dmi'
	icon_state = "sheetsnatcher"

	var/capacity = 300; //the number of sheets it can carry.
	w_class = WEIGHT_CLASS_NORMAL
	component_type = /datum/component/storage/concrete/stack

<<<<<<< HEAD
<<<<<<< HEAD
	allow_quick_empty = 1 // this function is superceded

/obj/item/storage/bag/sheetsnatcher/can_be_inserted(obj/item/W, stop_messages = 0)
	if(!istype(W, /obj/item/stack/sheet) || istype(W, /obj/item/stack/sheet/mineral/sandstone) || istype(W, /obj/item/stack/sheet/mineral/wood))
		if(!stop_messages)
			to_chat(usr, "The snatcher does not accept [W].")
		return 0 //I don't care, but the existing code rejects them for not being "sheets" *shrug* -Sayu
	var/current = 0
	for(var/obj/item/stack/sheet/S in contents)
		current += S.amount
	if(capacity == current)//If it's full, you're done
		if(!stop_messages)
			to_chat(usr, "<span class='danger'>The snatcher is full.</span>")
		return 0
	return 1


// Modified handle_item_insertion.  Would prefer not to, but...
/obj/item/storage/bag/sheetsnatcher/handle_item_insertion(obj/item/W, prevent_warning = 0)
	var/obj/item/stack/sheet/S = W
	if(!istype(S))
		return 0

	var/amount
	var/inserted = 0
	var/current = 0
	for(var/obj/item/stack/sheet/S2 in contents)
		current += S2.amount
	if(capacity < current + S.amount)//If the stack will fill it up
		amount = capacity - current
	else
		amount = S.amount

	for(var/obj/item/stack/sheet/sheet in contents)
		if(S.type == sheet.type) // we are violating the amount limitation because these are not sane objects
			sheet.amount += amount	// they should only be removed through procs in this file, which split them up.
			S.amount -= amount
			inserted = 1
			break

	if(!inserted || !S.amount)
		usr.dropItemToGround(S)
		if (usr.client && usr.s_active != src)
			usr.client.screen -= S
		S.dropped(usr)
		if(!S.amount)
			qdel(S)
		else
			if(S.pulledby)
				S.pulledby.stop_pulling()
			S.forceMove(src)

	orient2hud(usr)
	if(usr.s_active)
		usr.s_active.show_to(usr)
	update_icon()
	return 1


// Sets up numbered display to show the stack size of each stored mineral
// NOTE: numbered display is turned off currently because it's broken
/obj/item/storage/bag/sheetsnatcher/orient2hud(mob/user)
	var/adjusted_contents = contents.len

	//Numbered contents display
	var/list/datum/numbered_display/numbered_contents
	if(display_contents_with_number)
		numbered_contents = list()
		adjusted_contents = 0
		for(var/obj/item/stack/sheet/I in contents)
			adjusted_contents++
			var/datum/numbered_display/D = new/datum/numbered_display(I)
			D.number = I.amount
			numbered_contents.Add( D )

	var/row_num = 0
	var/col_count = min(7,storage_slots) -1
	if (adjusted_contents > 7)
		row_num = round((adjusted_contents-1) / 7) // 7 is the maximum allowed width.
	standard_orient_objs(row_num, col_count, numbered_contents)
	return


// Modified quick_empty verb drops appropriate sized stacks
/obj/item/storage/bag/sheetsnatcher/quick_empty()
	var/location = get_turf(src)
	for(var/obj/item/stack/sheet/S in contents)
		while(S.amount)
			var/obj/item/stack/sheet/N = new S.type(location)
			var/stacksize = min(S.amount,N.max_amount)
			N.amount = stacksize
			S.amount -= stacksize
		if(!S.amount)
			qdel(S)// todo: there's probably something missing here
	orient2hud(usr)
	if(usr.s_active)
		usr.s_active.show_to(usr)
	update_icon()

// Instead of removing
/obj/item/storage/bag/sheetsnatcher/remove_from_storage(obj/item/W, atom/new_location)
	var/obj/item/stack/sheet/S = W
	if(!istype(S))
		return 0

	//I would prefer to drop a new stack, but the item/attack_hand code
	// that calls this can't recieve a different object than you clicked on.
	//Therefore, make a new stack internally that has the remainder.
	// -Sayu

	if(S.amount > S.max_amount)
		var/obj/item/stack/sheet/temp = new S.type(src)
		temp.amount = S.amount - S.max_amount
		S.amount = S.max_amount

	return ..(S,new_location)
=======
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
/obj/item/storage/bag/sheetsnatcher/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage/concrete/stack)
	STR.allow_quick_empty = TRUE
	STR.can_hold = typecacheof(list(/obj/item/stack/sheet))
	STR.cant_hold = typecacheof(list(/obj/item/stack/sheet/mineral/sandstone, /obj/item/stack/sheet/mineral/wood))
	STR.max_combined_stack_amount = 300
<<<<<<< HEAD
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516

// -----------------------------
//    Sheet Snatcher (Cyborg)
// -----------------------------

/obj/item/storage/bag/sheetsnatcher/borg
	name = "sheet snatcher 9000"
	desc = ""
	capacity = 500//Borgs get more because >specialization

/obj/item/storage/bag/sheetsnatcher/borg/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage/concrete/stack)
	STR.max_combined_stack_amount = 500

// -----------------------------
//           Book bag
// -----------------------------

/obj/item/storage/bag/books
	name = "book bag"
	desc = "A bag for books."
	icon = 'icons/obj/library.dmi'
	icon_state = "bookbag"
	w_class = WEIGHT_CLASS_BULKY //Bigger than a book because physics
	resistance_flags = FLAMMABLE

/obj/item/storage/bag/books/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 21
	STR.max_items = 7
	STR.display_numerical_stacking = FALSE
	STR.can_hold = typecacheof(list(/obj/item/book, /obj/item/storage/book, /obj/item/spellbook))

/*
 * Trays - Agouri
 */
/obj/item/storage/bag/tray
	name = "tray"
	icon = 'icons/obj/food/containers.dmi'
	icon_state = "tray"
	desc = "A metal tray to lay food on."
	force = 5
	throwforce = 10
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_BULKY
	flags_1 = CONDUCT_1
	materials = list(MAT_METAL=3000)

/obj/item/storage/bag/tray/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.insert_preposition = "on"

/obj/item/storage/bag/tray/attack(mob/living/M, mob/living/user)
	. = ..()
	// Drop all the things. All of them.
	var/list/obj/item/oldContents = contents.Copy()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.quick_empty()
	// Make each item scatter a bit
	for(var/obj/item/I in oldContents)
		spawn()
			for(var/i = 1, i <= rand(1,2), i++)
				if(I)
					step(I, pick(NORTH,SOUTH,EAST,WEST))
					sleep(rand(2,4))

	if(prob(50))
		playsound(M, 'sound/items/trayhit1.ogg', 50, 1)
	else
		playsound(M, 'sound/items/trayhit2.ogg', 50, 1)

	if(ishuman(M) || ismonkey(M))
		if(prob(10))
			M.Knockdown(40)
	update_icon()

/obj/item/storage/bag/tray/update_icon()
	cut_overlays()
	for(var/obj/item/I in contents)
		add_overlay(mutable_appearance(I.icon, I.icon_state))

/obj/item/storage/bag/tray/Entered()
	. = ..()
	update_icon()

/obj/item/storage/bag/tray/Exited()
	. = ..()
	update_icon()

/*
 *	Chemistry bag
 */

/obj/item/storage/bag/chemistry
	name = "chemistry bag"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bag"
	desc = "A bag for storing pills, patches, and bottles."
	w_class = WEIGHT_CLASS_TINY
<<<<<<< HEAD
<<<<<<< HEAD
	can_hold = list(/obj/item/reagent_containers/pill, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/glass/bottle)
=======
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	resistance_flags = FLAMMABLE

/obj/item/storage/bag/chemistry/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_combined_w_class = 200
	STR.max_items = 50
	STR.insert_preposition = "in"
	STR.can_hold = typecacheof(list(/obj/item/reagent_containers/pill, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/glass/bottle))

/*
 *  Biowaste bag (mostly for xenobiologists)
 */

/obj/item/storage/bag/bio
	name = "bio bag"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "biobag"
	desc = "A bag for the safe transportation and disposal of biowaste and other biological materials."
	w_class = WEIGHT_CLASS_TINY
<<<<<<< HEAD
<<<<<<< HEAD
	can_hold = list(/obj/item/slime_extract, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/blood, /obj/item/reagent_containers/hypospray/medipen, /obj/item/reagent_containers/food/snacks/deadmouse, /obj/item/reagent_containers/food/snacks/monkeycube)
=======
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	resistance_flags = FLAMMABLE

/obj/item/storage/bag/bio/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_combined_w_class = 200
	STR.max_items = 25
	STR.insert_preposition = "in"
	STR.can_hold = typecacheof(list(/obj/item/slime_extract, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/blood, /obj/item/reagent_containers/hypospray/medipen, /obj/item/reagent_containers/food/snacks/deadmouse, /obj/item/reagent_containers/food/snacks/monkeycube))
