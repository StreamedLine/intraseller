User.create(email: 'dave@dave.com', password: 123456789)

Category.create(name: 'product photography')
Category.create(name: 'interview lighting')
school_sports = Category.create(name: 'school sports')
school_sports.items.create(url: "https://www.bhphotovideo.com/c/product/1333060-REG/nikon_nikon_d7500_dslr_camera.html?sts=pi")
school_sports.items.create(url: "https://www.bhphotovideo.com/c/product/1214161-REG/nikon_1559_d500_dslr_camera_body.html")

Item.create(url: "https://www.bhphotovideo.com/c/product/1369441-REG/sony_ilce7rm2_b_alpha_a7r_iii_mirrorless.html")
Item.create(url: "https://www.bhphotovideo.com/c/product/1029860-REG/sony_ilce6000l_b_alpha_a6000_mirrorless_digital.html")
Item.create(url: "https://www.bhphotovideo.com/c/product/1259245-REG/savage_led_sb_led_portrait_kit.html")
Item.create(url: "https://www.bhphotovideo.com/c/product/1222773-REG/sony_soa6300bk_alpha_a6300_mirrorless_digital.html")
Item.create(url: "https://www.bhphotovideo.com/c/product/1233412-REG/canon_powershot_elph_360_hs.html")
Item.create(url: "https://www.bhphotovideo.com/c/product/1332304-REG/canon_1791c001_powershot_sx730_hs_digital.html")
Item.create(url: "https://www.bhphotovideo.com/c/product/1127274-REG/nikon_26499_coolpix_p900_digital_camera.html")
Item.create(url: "https://www.bhphotovideo.com/c/product/1110382-REG/canon_9779b001_powershot_sx530_hs_digital.html")
Item.create(url: "https://www.bhphotovideo.com/c/product/1280827-REG/panasonic_lumix_dmc_fz2500_digital_camera.html