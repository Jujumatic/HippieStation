<<<<<<< HEAD
<<<<<<< HEAD
/obj/item/device/integrated_electronics/detailer
=======
/obj/item/integrated_electronics/detailer
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
/obj/item/integrated_electronics/detailer
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	name = "assembly detailer"
	desc = "A combination autopainter and flash anodizer designed to give electronic assemblies a colorful, wear-resistant finish."
	icon = 'icons/obj/assemblies/electronic_tools.dmi'
	icon_state = "detailer"
	flags_1 = CONDUCT_1 | NOBLUDGEON_1
	w_class = WEIGHT_CLASS_SMALL
	var/data_to_write = null
	var/accepting_refs = FALSE
	var/detail_color = COLOR_ASSEMBLY_WHITE
	var/list/color_list = list(
		"black" = COLOR_ASSEMBLY_BLACK,
		"gray" = COLOR_FLOORTILE_GRAY,
		"machine gray" = COLOR_ASSEMBLY_BGRAY,
		"white" = COLOR_ASSEMBLY_WHITE,
		"red" = COLOR_ASSEMBLY_RED,
		"orange" = COLOR_ASSEMBLY_ORANGE,
		"beige" = COLOR_ASSEMBLY_BEIGE,
		"brown" = COLOR_ASSEMBLY_BROWN,
		"gold" = COLOR_ASSEMBLY_GOLD,
		"yellow" = COLOR_ASSEMBLY_YELLOW,
		"gurkha" = COLOR_ASSEMBLY_GURKHA,
		"light green" = COLOR_ASSEMBLY_LGREEN,
		"green" = COLOR_ASSEMBLY_GREEN,
		"light blue" = COLOR_ASSEMBLY_LBLUE,
		"blue" = COLOR_ASSEMBLY_BLUE,
		"purple" = COLOR_ASSEMBLY_PURPLE
		)

<<<<<<< HEAD
<<<<<<< HEAD
/obj/item/device/integrated_electronics/detailer/Initialize()
	.=..()
	update_icon()

/obj/item/device/integrated_electronics/detailer/update_icon()
=======
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
/obj/item/integrated_electronics/detailer/Initialize()
	.=..()
	update_icon()

/obj/item/integrated_electronics/detailer/update_icon()
<<<<<<< HEAD
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	cut_overlays()
	var/mutable_appearance/detail_overlay = mutable_appearance('icons/obj/assemblies/electronic_tools.dmi', "detailer-color")
	detail_overlay.color = detail_color
	add_overlay(detail_overlay)

<<<<<<< HEAD
<<<<<<< HEAD
/obj/item/device/integrated_electronics/detailer/attack_self(mob/user)
=======
/obj/item/integrated_electronics/detailer/attack_self(mob/user)
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
/obj/item/integrated_electronics/detailer/attack_self(mob/user)
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
	var/color_choice = input(user, "Select color.", "Assembly Detailer") as null|anything in color_list
	if(!color_list[color_choice])
		return
	if(!in_range(src, user))
		return
	detail_color = color_list[color_choice]
	update_icon()