/datum/component/beauty
	var/beauty = 0

/datum/component/beauty/Initialize(beautyamount)
	if(!ismovableatom(parent))
<<<<<<< HEAD
<<<<<<< HEAD
		. = COMPONENT_INCOMPATIBLE
		CRASH("Someone put a beauty component on a non-atom/movable, not everything can be pretty.")
=======
		return COMPONENT_INCOMPATIBLE
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
		return COMPONENT_INCOMPATIBLE
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	beauty = beautyamount
	RegisterSignal(COMSIG_ENTER_AREA, .proc/enter_area)
	RegisterSignal(COMSIG_EXIT_AREA, .proc/exit_area)
	var/area/A = get_area(parent)
	if(!A || A.outdoors)
		return
	A.totalbeauty += beauty
	A.update_beauty()

/datum/component/beauty/proc/enter_area(area/A)
	if(A.outdoors) //Fuck the outside.
		return FALSE
	A.totalbeauty += beauty
	A.update_beauty()

/datum/component/beauty/proc/exit_area(area/A)
	if(A.outdoors) //Fuck the outside.
		return FALSE
	A.totalbeauty -= beauty
	A.update_beauty()

/datum/component/beauty/Destroy()
	. = ..()
	var/area/A = get_area(parent)
	if(!A || A.outdoors)
		return
	A.totalbeauty -= beauty
	A.update_beauty()
