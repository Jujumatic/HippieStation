#define WIRE_RECEIVE		(1<<0)
#define WIRE_PULSE			(1<<1)
#define WIRE_PULSE_SPECIAL	(1<<2)
#define WIRE_RADIO_RECEIVE	(1<<3)
#define WIRE_RADIO_PULSE	(1<<4)

/obj/item/assembly
	name = "assembly"
	desc = "A small electronic device that should never exist."
	icon = 'icons/obj/assemblies/new_assemblies.dmi'
	icon_state = ""
	flags_1 = CONDUCT_1
	w_class = WEIGHT_CLASS_SMALL
	materials = list(MAT_METAL=100)
	throwforce = 2
	throw_speed = 3
	throw_range = 7

	var/secured = TRUE
	var/list/attached_overlays = null
	var/obj/item/assembly_holder/holder = null
	var/wire_type = WIRE_RECEIVE | WIRE_PULSE
	var/attachable = FALSE // can this be attached to wires
	var/datum/wires/connected = null

	var/next_activate = 0 //When we're next allowed to activate - for spam control

<<<<<<< HEAD
<<<<<<< HEAD
/obj/item/device/assembly/get_part_rating()
	return 1

/obj/item/device/assembly/proc/on_attach()
=======
/obj/item/assembly/get_part_rating()
	return 1
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45

/obj/item/assembly/proc/on_attach()

/obj/item/assembly/proc/on_detach()

=======
/obj/item/assembly/get_part_rating()
	return 1

/obj/item/assembly/proc/on_attach()

/obj/item/assembly/proc/on_detach()

>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
/obj/item/assembly/proc/holder_movement()							//Called when the holder is moved
	return

/obj/item/assembly/proc/describe()									// Called by grenades to describe the state of the trigger (time left, etc)
	return "The trigger assembly looks broken!"


/obj/item/assembly/proc/is_secured(mob/user)
	if(!secured)
		to_chat(user, "<span class='warning'>The [name] is unsecured!</span>")
		return FALSE
	return TRUE


//Called when another assembly acts on this one, var/radio will determine where it came from for wire calcs
/obj/item/assembly/proc/pulsed(radio = 0)
	if(wire_type & WIRE_RECEIVE)
		INVOKE_ASYNC(src, .proc/activate)
	if(radio && (wire_type & WIRE_RADIO_RECEIVE))
		INVOKE_ASYNC(src, .proc/activate)
	return TRUE


//Called when this device attempts to act on another device, var/radio determines if it was sent via radio or direct
/obj/item/assembly/proc/pulse(radio = 0)
	if(connected && wire_type)
		connected.pulse_assembly(src)
		return TRUE
	if(holder && (wire_type & WIRE_PULSE))
		holder.process_activation(src, 1, 0)
	if(holder && (wire_type & WIRE_PULSE_SPECIAL))
		holder.process_activation(src, 0, 1)
	return TRUE


// What the device does when turned on
/obj/item/assembly/proc/activate()
	if(QDELETED(src) || !secured || (next_activate > world.time))
		return FALSE
	next_activate = world.time + 30
	return TRUE


/obj/item/assembly/proc/toggle_secure()
	secured = !secured
	update_icon()
	return secured


/obj/item/assembly/attackby(obj/item/W, mob/user, params)
	if(isassembly(W))
		var/obj/item/assembly/A = W
		if((!A.secured) && (!secured))
			holder = new/obj/item/assembly_holder(get_turf(src))
			holder.assemble(src,A,user)
			to_chat(user, "<span class='notice'>You attach and secure \the [A] to \the [src]!</span>")
		else
			to_chat(user, "<span class='warning'>Both devices must be in attachable mode to be attached together.</span>")
		return
	if(istype(W, /obj/item/screwdriver))
		if(toggle_secure())
			to_chat(user, "<span class='notice'>\The [src] is ready!</span>")
		else
			to_chat(user, "<span class='notice'>\The [src] can now be attached!</span>")
		return
	..()


/obj/item/assembly/examine(mob/user)
	..()
	if(secured)
		to_chat(user, "\The [src] is secured and ready to be used.")
	else
		to_chat(user, "\The [src] can be attached to other things.")


/obj/item/assembly/attack_self(mob/user)
	if(!user)
		return FALSE
	user.set_machine(src)
	interact(user)
	return TRUE

<<<<<<< HEAD
<<<<<<< HEAD
/obj/item/device/assembly/interact(mob/user)
=======
/obj/item/assembly/interact(mob/user)
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
/obj/item/assembly/interact(mob/user)
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	return ui_interact(user)
