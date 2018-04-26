/datum/component/swarming
	var/offset_x = 0
	var/offset_y = 0
	var/is_swarming = FALSE
	var/list/swarm_members = list()

/datum/component/swarming/Initialize(max_x = 24, max_y = 24)
	offset_x = rand(-max_x, max_x)
	offset_y = rand(-max_y, max_y)

	RegisterSignal(COMSIG_MOVABLE_CROSSED, .proc/join_swarm)
	RegisterSignal(COMSIG_MOVABLE_UNCROSSED, .proc/leave_swarm)

/datum/component/swarming/proc/join_swarm(atom/movable/AM)
	GET_COMPONENT_FROM(other_swarm, /datum/component/swarming, AM)
	if(!other_swarm)
		return
	swarm()
	swarm_members |= other_swarm
	other_swarm.swarm()
	other_swarm.swarm_members |= src

/datum/component/swarming/proc/leave_swarm(atom/movable/AM)
	GET_COMPONENT_FROM(other_swarm, /datum/component/swarming, AM)
<<<<<<< HEAD
<<<<<<< HEAD
	if(!other_swarm || !other_swarm in swarm_members)
=======
	if(!other_swarm || !(other_swarm in swarm_members))
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
	if(!other_swarm || !(other_swarm in swarm_members))
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
		return
	swarm_members -= other_swarm
	if(!swarm_members.len)
		unswarm()
	other_swarm.swarm_members -= src
	if(!other_swarm.swarm_members.len)
		other_swarm.unswarm()

/datum/component/swarming/proc/swarm()
	var/atom/movable/owner = parent
	if(!is_swarming)
		is_swarming = TRUE
		animate(owner, pixel_x = owner.pixel_x + offset_x, pixel_y = owner.pixel_y + offset_y, time = 2)

/datum/component/swarming/proc/unswarm()
	var/atom/movable/owner = parent
	if(is_swarming)
		animate(owner, pixel_x = owner.pixel_x - offset_x, pixel_y = owner.pixel_y - offset_y, time = 2)
		is_swarming = FALSE