/obj/item/sensor_device
	name = "handheld crew monitor" //Thanks to Gun Hog for the name!
	desc = "A miniature machine that tracks suit sensors across the station."
	icon = 'icons/obj/device.dmi'
	icon_state = "scanner"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = SLOT_BELT

<<<<<<< HEAD
/obj/item/device/sensor_device/attack_self(mob/user)
=======
/obj/item/sensor_device/attack_self(mob/user)
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
	GLOB.crewmonitor.show(user,src) //Proc already exists, just had to call it
