/obj/machinery/computer/shuttle/ferry
	name = "transport ferry console"
	desc = "A console that controls the transport ferry."
	circuit = /obj/item/circuitboard/computer/ferry
	shuttleId = "ferry"
	possible_destinations = "ferry_home;ferry_away"
	req_access = list(ACCESS_CENT_GENERAL)

<<<<<<< HEAD
<<<<<<< HEAD
	var/aiControlDisabled = TRUE
=======
	var/allow_silicons = FALSE
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
	var/allow_silicons = FALSE
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	var/allow_emag = FALSE

/obj/machinery/computer/shuttle/ferry/emag_act(mob/user)
	if(!allow_emag)
		to_chat(user, "<span class='warning'>[src]'s security firewall is far too powerful for you to bypass.</span>")
		return FALSE
	return ..()

/obj/machinery/computer/shuttle/ferry/attack_ai()
<<<<<<< HEAD
<<<<<<< HEAD
	return aiControlDisabled? FALSE : ..()
=======
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	return allow_silicons ? ..() : FALSE

/obj/machinery/computer/shuttle/ferry/attack_robot()
	return allow_silicons ? ..() : FALSE
<<<<<<< HEAD
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516

/obj/machinery/computer/shuttle/ferry/request
	name = "ferry console"
	circuit = /obj/item/circuitboard/computer/ferry/request
	var/last_request //prevents spamming admins
	var/cooldown = 600
	possible_destinations = "ferry_home;ferry_away"
	req_access = list(ACCESS_CENT_GENERAL)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/machinery/computer/shuttle/ferry/request/Topic(href, href_list)
	..()
	if(href_list["request"])
		if(last_request && (last_request + cooldown > world.time))
			return
		last_request = world.time
		to_chat(usr, "<span class='notice'>Your request has been recieved by CentCom.</span>")
		to_chat(GLOB.admins, "<b>FERRY: <font color='blue'>[ADMIN_LOOKUPFLW(usr)] (<A HREF='?_src_=holder;[HrefToken()];secrets=moveferry'>Move Ferry</a>)</b> is requesting to move the transport ferry to CentCom.</font>")
