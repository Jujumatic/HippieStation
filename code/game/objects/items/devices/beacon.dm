<<<<<<< HEAD
<<<<<<< HEAD
/obj/item/device/beacon
=======
/obj/item/beacon
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
/obj/item/beacon
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	name = "\improper tracking beacon"
	desc = "A beacon used by a teleporter."
	icon = 'icons/obj/device.dmi'
	icon_state = "beacon"
	item_state = "beacon"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	var/enabled = TRUE
	var/renamed = FALSE

<<<<<<< HEAD
<<<<<<< HEAD
/obj/item/device/beacon/Initialize()
=======
/obj/item/beacon/Initialize()
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
/obj/item/beacon/Initialize()
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	. = ..()
	if (enabled)
		GLOB.teleportbeacons += src
	else 
		icon_state = "beacon-off"

<<<<<<< HEAD
<<<<<<< HEAD
/obj/item/device/beacon/Destroy()
	GLOB.teleportbeacons.Remove(src)
	return ..()

/obj/item/device/beacon/attack_self(mob/user)
=======
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
/obj/item/beacon/Destroy()
	GLOB.teleportbeacons.Remove(src)
	return ..()

/obj/item/beacon/attack_self(mob/user)
<<<<<<< HEAD
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	enabled = !enabled
	if (enabled)
		icon_state = "beacon"
		GLOB.teleportbeacons += src
	else 
		icon_state = "beacon-off"
		GLOB.teleportbeacons.Remove(src)
	to_chat(user, "<span class='notice'>You [enabled ? "enable" : "disable"] the beacon.</span>")
	return

<<<<<<< HEAD
<<<<<<< HEAD
/obj/item/device/beacon/attackby(obj/item/W, mob/user)
=======
/obj/item/beacon/attackby(obj/item/W, mob/user)
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
/obj/item/beacon/attackby(obj/item/W, mob/user)
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	if(istype(W, /obj/item/pen)) // needed for things that use custom names like the locator
		var/new_name = stripped_input(user, "What would you like the name to be?")
		if(!user.canUseTopic(src, BE_CLOSE))
			return
		if(new_name)
			name = new_name
			renamed = TRUE
		return
	else	
		return ..()
