
// A collection of pre-set uplinks, for admin spawns.
/obj/item/radio/uplink/Initialize(mapload, _owner, _tc_amount = 20)
	. = ..()
	icon_state = "radio"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	AddComponent(/datum/component/uplink, _owner, FALSE, TRUE, null, _tc_amount)

/obj/item/radio/uplink/nuclear/Initialize()
	. = ..()
	GET_COMPONENT(hidden_uplink, /datum/component/uplink)
	hidden_uplink.set_gamemode(/datum/game_mode/nuclear)

<<<<<<< HEAD
<<<<<<< HEAD
/obj/item/device/radio/uplink/clownop/Initialize()
=======
/obj/item/radio/uplink/clownop/Initialize()
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
/obj/item/radio/uplink/clownop/Initialize()
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	. = ..()
	GET_COMPONENT(hidden_uplink, /datum/component/uplink)
	hidden_uplink.set_gamemode(/datum/game_mode/nuclear/clown_ops)

<<<<<<< HEAD
<<<<<<< HEAD
/obj/item/device/multitool/uplink/Initialize(mapload, _owner, _tc_amount = 20)
=======
/obj/item/multitool/uplink/Initialize(mapload, _owner, _tc_amount = 20)
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
/obj/item/multitool/uplink/Initialize(mapload, _owner, _tc_amount = 20)
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	. = ..()
	AddComponent(/datum/component/uplink, _owner, FALSE, TRUE, null, _tc_amount)

/obj/item/pen/uplink/Initialize(mapload, _owner, _tc_amount = 20)
	. = ..()
	AddComponent(/datum/component/uplink)
	traitor_unlock_degrees = 360

/obj/item/radio/uplink/old
	name = "dusty radio"
	desc = "A dusty looking radio."

/obj/item/radio/uplink/old/Initialize(mapload, _owner, _tc_amount = 10)
	. = ..()
	GET_COMPONENT(hidden_uplink, /datum/component/uplink)
	hidden_uplink.name = "dusty radio"
