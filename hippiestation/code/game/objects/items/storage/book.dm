
/obj/item/storage/book/bible/bless(mob/living/carbon/human/H, mob/living/user)
	var/heal_amt = 10
	var/list/hurt_limbs = H.get_damaged_bodyparts(1, 1)

	if(LAZYLEN(hurt_limbs))
		for(var/X in hurt_limbs)
			var/obj/item/bodypart/affecting = X
			if(affecting.status == BODYPART_ROBOTIC)
				if(item_heal_robotic(H, user, heal_amt ,0))//You may only heal one bodypart at a time using this proc so you do have to hit them more often.
					H.visible_message("<span class='notice'>[user] mends the dents of [H] with the power of [deity_name]!</span>")
					to_chat(H, "<span class='boldnotice'>May the power of [deity_name] find your metal unwanting!</span>")
					playsound(src.loc, 'sound/items/drill_use.ogg', 25, 1, -1)
					return TRUE
				else if(item_heal_robotic(H, user, 0, heal_amt ))
					H.visible_message("<span class='notice'>[user] fixes the wiring of [H] with the power of [deity_name]!</span>")
					to_chat(H, "<span class='boldnotice'>May the power of [deity_name] restore your currents!</span>")
					playsound(src.loc, 'sound/items/drill_use.ogg', 25, 1, -1)
					return TRUE
			else if(affecting.heal_damage(heal_amt, heal_amt))
				H.update_damage_overlays()
				H.visible_message("<span class='notice'>[user] heals [H] with the power of [deity_name]!</span>")
				playsound(src.loc, "punch", 25, 1, -1)
				return TRUE

/obj/item/storage/book/curator
	name = "The Universal Book of All Languages"
	desc = "An enormous looking book that supposedly contains all of the languages known in the entire universe. It seems like you might be able to add something to it..."
	w_class = WEIGHT_CLASS_HUGE	//Big boy
	var/refreshing = FALSE

/obj/item/storage/book/curator/attack_self(mob/living/carbon/M)
	if(!istype(mob/living))
		return
	if(!M.can_read(src))
		return FALSE
	var/web = "<head><title>The Universal Book of All Languages</title></head><h1>The Universal Book of All Languages</h1><br><br><font size = '3'>Currently existing languages:</font><br><font size = '2'>"
	var/datum/DBQuery/query_curatorlanguagesid = SSdbcore.NewQuery("SELECT MAX id FROM [format_table_name("curator_languages")]")
	var/id_max = sanitizeSQL(id)
	var/id = 0
	var/language_name
	var/language_author
	var/language_description
	for(1 to id_max)
		var/datum/DBQuery/query_curatorlanguageinfo = SSdbcore.NewQuery("SELECT language_name,language_author,language_description,language_words FROM [format_table_name("curator_languages")] WHERE id = '[id]'")
		language_name = sanitizeSQL(language_name)
		language_author = sanitizeSQL(language_author)
		language_description = sanitizeSQL(language_description)
		qdel(query_curatorlanguageinfo)
		web += "<a href='byond://?src=[REF(src)];[language_name]=1'><font color='#cc66ff'>[language_name]</font></a><br>"
		web += "[language_author]<br>"
		web += "[language_description]<br><br>"
		id += 1
	web += "<a href='byond://?src=[REF(src)];new_language=1'><font color='#cc66ff'>Make a new language</font></a><br>"
	web += "</font>"
	qdel(query_curatorlanguagesid)


/obj/item/storage/book/curator/Topic(href, href_list)
	var/mob/living/carbon/M = usr
	var/datum/DBQuery/query_curatorlanguagesid = SSdbcore.NewQuery("SELECT MAX id FROM [format_table_name("curator_languages")]")
	var/id_max = sanitizeSQL(id)
	var/language_name
	var/language_author
	var/language_description
	var/list/language_words = list()
	var/incrementid = 0
	qdel(query_curatorlanguagesid)

	if(href_list["new_language"])
		language_name = input(M, "What will this language be called?")
		language_author = input(M, "Who created this language?")
		language_description = input(M, "What is the description of this language (e.g. how it was made)?")
		language_words = input(M, "What is the first word that this language will use?")
		language_words = json_encode(language_words)
		id_new = id_max + 1
		if(language_name && language_author && language_description && language_words)
			var/datum/DBQuery/query_curatorlanguagenewlanguage = SSdbcore.NewQuery("INSERT INTO [format_table_name("curator_languages")] (id,language_name,language_author,language_description,language_words,language_ckey) VALUES ('[id_new]', '[language_name]', '[language_author]', '[language_description]', '[language_words]', '[M.key]')")
			qdel(query_curatorlanguagenewlanguage)
	for(incrementid to id_max)
		var/datum/DBQuery/query_curatorlanguageinfo = SSdbcore.NewQuery("SELECT language_name,language_author,language_description,language_words,language_ckey FROM [format_table_name("curator_languages")] WHERE id = '[incrementid]'")
		language_name = sanitizeSQL(language_name)
		language_author = sanitizeSQL(language_author)
		language_description = sanitizeSQL(language_description)
		language_words = json_decode(sanitizeSQL(language_words))
		qdel(query_curatorlanguageinfo)
		var/change_name = (incrementid+1)*1000
		var/change_description = (incrementid+1)*1000000
		var/add_syllables = (incrementid+1)*(-1000)
		var/remove_syllables = (incrementid+1)*(-1000000)
		var/delete_this_language = (incrementid+1)*10000000000

		if(href_list["back"] || href_list["refresh"])
			if(!refreshing)
				web = "<head><title>The Universal Book of All Languages</title></head><h1>The Universal Book of All Languages</h1><br><br><font size = '3'>Currently existing languages:</font><br><font size = '2'>"
			web += "<a href='byond://?src=[REF(src)];[language_name]=1'><font color='#cc66ff'>[language_name]</font></a><br>"
			web += "[language_author]<br>"
			web += "[language_description]<br><br>"
			refreshing = TRUE
		if(href_list["[language_name]"])
			break
			var/language_key = sanitizeSQL(language_ckey)
			web = "<head><title>The Universal Book of All Languages</title></head><h1>The Universal Book of All Languages</h1><br><br><font size = '3'>Language name: [language_name]</font><br>Language author: [language_author]<br>Language description: [language_description]<br> Language words: [language_words]<br><br>"
			web += "<font size = '3'>What would you like to do with this language?</font><br><br>"
			web += "<a href='byond://?src=[REF(src)];[change_name]=1'><font color='#cc66ff'>Change language name</font></a><br>"
			web += "<a href='byond://?src=[REF(src)];[change_description]=1'><font color='#cc66ff'>Change language description</font></a><br>"
			web += "<a href='byond://?src=[REF(src)];[add_syllables]=1'><font color='#cc66ff'>Add language words</font></a><br>"
			web += "<a href='byond://?src=[REF(src)];[remove_syllables]=1'><font color='#cc66ff'>Remove language words</font></a><br>"
			web += "<a href='byond://?src=[REF(src)];[incrementid]=1'><font color='#cc66ff'>Learn this language</font></a><br>"
			web += "<a href='byond://?src=[REF(src)];back=1'><font color='#cc66ff'>Change language name</font></a><br>"
			if(language_key == M.key)
				web += "<a href='byond://?src=[REF(src)];[Delete_this_language]=1'><font color='#cc66ff'>Delete language</font></a><br>"

		if(href_list["[change_name]"])
			break
			var/newname = input(M, "What will the new name of the language be?")
			if(newname)
				var/datum/DBQuery/query_curatorlanguages_newlanguagename = SSdbcore.NewQuery("UPDATE [format_table_name("curator_languages")] SET language_name = '[language_name]' WHERE id = '[incrementid]'")
				qdel(query_curatorlanguages_newlanguagename)
		if(href_list["[change_description]"])
			break
			var/newdescription = input(M, "What will the new description of the language be?")
			if(newdescription)
				var/datum/DBQuery/query_curatorlanguages_newlanguagedescription = SSdbcore.NewQuery("UPDATE [format_table_name("curator_languages")] SET language_words = '[language_words]' WHERE id = '[incrementid]'")
				qdel(query_curatorlanguages_newlanguagedescription)
		if(href_list["[add_syllables]"])
			break
			var/list/newsyllables = input(M, "What new word do you want to add?")
			if(newsyllables)
				for(var/word in newsyllables)
					if(!word in language_words)
						language_words += word
				language_words = json_encode(language_words)
				var/datum/DBQuery/query_curatorlanguages_newlanguagesyllables = SSdbcore.NewQuery("UPDATE [format_table_name("curator_languages")] SET language_words = '[language_words]' WHERE id = '[incrementid]'")
				qdel(query_curatorlanguages_newlanguagesyllables)
		if(href_list["[remove_syllables]"])
			break
			var/list/removesyllables = input(H, "What words do you want to remove?")
			if(removesyllables)
				for(var/word in removesyllables)
					if(word in language_words)
						language_words -= word
				language_words = json_encode(language_words)
				var/datum/DBQuery/query_curatorlanguages_removelanguagesyllables = SSdbcore.NewQuery("UPDATE [format_table_name("curator_languages")] SET language_words = '[language_words]' WHERE id = '[incrementid]'")
				qdel(query_curatorlanguages_removelanguagesyllables)
		if(href_list["[delete_this_language]"])
			break
			var/decision
			decision = input(M, "Are you sure you want to delete this language? It will be lost forever!") in list("Yes","No")
			if(decision == "Yes")
				decision = TRUE
			else
				decision = FALSE
			if(decision)
				var/datum/DBQuery/query_curatorlanguages_deletelanguage = SSdbcore.NewQuery("DELETE FROM [format_table_name("curator_languages") WHERE id = '[incrementid]'")
		if(href_list["[incrementid]"])
			break
			if(M)
				var/mob/living/owner = M
				/datum/language/curator/C = new
				C.name = language_name
				C.desc = language_description
				C.syllables = language_words
				owner.grant_language(C)
		incrementid += 1
	web += "<a href='byond://?src=[REF(src)];new_language=1'><font color='#cc66ff'>Make a new language</font></a><br>"
	web += "</font>"
	qdel(query_curatorlanguageid)
	refreshing = FALSE
	web += "<a href='byond://?src=[REF(src)];refresh=1'><font color='#cc66ff'>Refresh the page</font></a><br>"