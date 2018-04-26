/mob/living/brain/say(message, language)
	if(!(container && istype(container, /obj/item/mmi)))
		return //No MMI, can't speak, bucko./N
	else
		if(prob(emp_damage*4))
			if(prob(10))//10% chane to drop the message entirely
				return
			else
				message = Gibberish(message, (emp_damage*6))//scrambles the message, gets worse when emp_damage is higher

		..()

/mob/living/brain/get_spans()
	return ..() | SPAN_ROBOT

/mob/living/brain/radio(message, message_mode, list/spans, language)
<<<<<<< HEAD
<<<<<<< HEAD
	if(message_mode == MODE_HEADSET && istype(container, /obj/item/device/mmi))
		var/obj/item/device/mmi/R = container
=======
	if(message_mode == MODE_HEADSET && istype(container, /obj/item/mmi))
		var/obj/item/mmi/R = container
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
	if(message_mode == MODE_HEADSET && istype(container, /obj/item/mmi))
		var/obj/item/mmi/R = container
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
		if(R.radio)
			R.radio.talk_into(src, message, , get_spans(), language)
			return ITALICS | REDUCE_RANGE
	else
		return ..()

/mob/living/brain/lingcheck()
	return LINGHIVE_NONE

/mob/living/brain/treat_message(message)
	message = capitalize(message)
	return message

/mob/living/brain/could_speak_in_language(datum/language/dt)
	if(istype(container, /obj/item/mmi/posibrain/soul_vessel))
		// soul vessels can only speak ratvarian.
		. = ispath(dt, /datum/language/ratvar)
	else
		. = ..()
