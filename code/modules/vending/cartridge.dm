//This one's from bay12
/obj/machinery/vending/cart
	name = "\improper PTech"
	desc = "Cartridges for PDAs."
	product_slogans = "Carts to go!"
	icon_state = "cart"
	icon_deny = "cart-deny"
	products = list(/obj/item/cartridge/medical = 10,
		            /obj/item/cartridge/engineering = 10,
		            /obj/item/cartridge/security = 10,
					/obj/item/cartridge/janitor = 10,
					/obj/item/cartridge/signal/toxins = 10,
<<<<<<< HEAD
<<<<<<< HEAD
					/obj/item/device/pda/heads = 10,
=======
					/obj/item/pda/heads = 10,
>>>>>>> e21815eb30cc2da3bac71509167772e91a39fa45
=======
					/obj/item/pda/heads = 10,
>>>>>>> b9d276e1ef401fa41078832fee131d756106b516
					/obj/item/cartridge/captain = 3,
					/obj/item/cartridge/quartermaster = 10)
	armor = list("melee" = 100, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
