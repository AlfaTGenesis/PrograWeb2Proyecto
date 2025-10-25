USE worldcupguide_db;

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Estadio BBVA', 'Nuevo Leon', 53500, 'https://upload.wikimedia.org/wikipedia/commons/a/a9/EstadioCFMonterrey.jpg');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Estadio Akron', 'Jalisco', 48000, 'https://estadioakron.mx/img/acceso_directo/acceso_como_llego.jpg');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Estadio Azteca', 'Ciudad de México', 83000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGDgBSqla6L8-YWUPWocdWGByUmsIPqY3vzQ&s');

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Confort Ejecutivo Suites Linda Vista', 'Sta. Rosa 5700, Torres de Linda Vista, 67126 Guadalupe, N.L.', 4.1, 'Wi-Fi Gratis, Estacionamiento Gratuito, Aire acondicionado, Lavanderia', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFLjBy_3ogQ7u32Zhs-siA_-ct3flKMfewy8sz5jnCZAL2J2je07ZfA6aK34EseLVeGCGrrAZmqtyLRJU_h5fgSGRt-tGGA9NcuI-dWuA74QpsCcndckVmXfunM5rJI0PY8os3qIXwxEb9KK6BSFCLxjcRC4T8Al-sNgtHqxgShwtMbRCd4Y8GH=w324-h312-n-k-no', 1);
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Four Points by Sheraton Monterrey Linda Vista', 'Av. Miguel Alemán 6064, Torres de Linda Vista, 67138 Guadalupe, N.L.', 4.5, 'Las habitaciones sencillas cuentan con Wi-Fi gratis y TV de pantalla plana, frigobar, tetera y cafetera. Se ofrece servicio a la habitación.', 'https://nltravel.s3.us-east-2.amazonaws.com/wp-content/uploads/2023/05/31133210/136473523.jpeg', 1);
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('City Express by Marriott Monterrey Lindavista', 'Av. Miguel Alemán 5331, Las Americas, 67130 Guadalupe, N.L.', 4.4, 'Este hotel moderno y económico se encuentra junto a la Carretera Federal 54, a 6 km del parque de atracciones Bosque Mágico y a 20 km del Aeropuerto Internacional de Monterrey.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/30/3f/74/de/exterior.jpg?w=900&h=500&s=1', 1);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hotel SR Guadalajara Zapopan', 'Pte. Manuel Gómez Morín 7306-int 5, Granja, 45010 Zapopan, Jal.', 4.2, 'Este hotel económico de carretera con una fachada colorida se encuentra a 3 km del parque metropolitano de Guadalajara.', 'https://images.trvl-media.com/lodging/12000000/11940000/11936000/11935972/e4cd453e.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill', 2);
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('One Guadalajara Periférico Poniente', 'Periférico Poniente # 7306 Fracc, Anillo Perif. Pte., Granja, 45010 Zapopan, Jal.', 4.2, 'Este hotel funcional se encuentra a 3 km del parque Metropolitano, a 8 km del museo Trompo Mágico y a 11 km del bosque Los Colomos.', 'https://tse1.mm.bing.net/th/id/OIP.USza78lV4ccrVYOak89KXwHaE7?pid=Api&P=0&h=180', 2);
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Fiesta Inn Guadalajara Periférico Poniente', 'Lateral Perif. Pte. 3176, Granja, 45010 Zapopan, Jal.', 4.4, 'Este hotel informal se encuentra junto al anillo periférico Manuel Gómez Morin, a 4 km del estadio Akron y a 12 km del templo expiatorio del Santísimo Sacramento.', 'https://image-tc.galaxy.tf/wijpeg-1evgn1w6ey9dodmxd94a8f20l/exterior-4-result.jpg', 2);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hotel Cuore', 'Calz. de Tlalpan 3325, Sta. Úrsula Coapa, Coyoacán, 04650 Ciudad de México, CDMX', 4.1, 'Wifi gratis, Desayuno de pago, Accesibilidad, Estacionamiento, Aire Acondicionado', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_bSGRbYe_UL8jXauU_ek2Tms-x6Tjn7nCjw&s', 3);
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Villas y Suites Real Azteca', 'Calz. de Tlalpan 3441, Sta. Úrsula Coapa, Coyoacán, 04650 Ciudad de México, CDMX', 3.8, 'Este hotel sencillo, ubicado a 12 minutos a pie del Estadio Azteca, se encuentra a 2 minutos a pie de la estación Estadio Azteca y a 3 km del Museo Anahuacalli.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5fZd52aYoDt9sh4vUu5mrcSssh99LpgO-GQ&s', 3);
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Fiesta Inn Periférico Sur', 'Periferico Sur 5530, Pedregal de Carrasco, Coyoacán, 04700 Ciudad de México, CDMX', 4.4, 'Este moderno hotel junto a la carretera se encuentra a 2 km de los partidos de fútbol del Estadio Azteca, a 4 km del parque nacional Bosque de Tlalpan y a 8 km del Museo Frida Kahlo.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl7ubVf6OcPW7aAz2vhQ4IO7kavOWhdXrA4Q&s', 3);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Parque Fundidora', 'Parque público con juegos, senderos para caminar, un centro de espectáculos, el Parque Plaza Sésamo y más.', 'Parque', 'https://media.admagazine.com/photos/67eca5c650bed541eea0b131/master/w_1600%2Cc_limit/IMG_9184.png', 1);
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES( 'Parque España', 'Entrada accesible para personas en silla de ruedas, estacionamiento accesible ', 'Parque Acuatico', 'https://nltravel.s3.us-east-2.amazonaws.com/wp-content/uploads/2024/08/26123045/6xB321iE.jpeg', 1);
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES( 'Muscera', 'Cuenta con 80 personajes famosos hechos de cera y exhibicion de esculturas de otros materiales y los que estan por agregarse', 'Museo', 'https://sic.cultura.gob.mx/imagenes_cache/museo_1892_i_50212.png', 1);
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES( 'Parque Expedición Amazonia', 'Parque con 80 especies de pájaros y otros animales silvestres, estatuas de dinosaurios, espectáculos y más.', 'Parque', 'https://nltravel.s3.us-east-2.amazonaws.com/wp-content/uploads/2023/05/29100227/IMG_5946-scaled.jpg', 1);
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES( 'Expo Feria Guadalupe', 'Expo Feria Guadalupe, la cual es considerada la feria mas importante del norte de México', 'Parque de diversiones', 'https://www.guadalupe.gob.mx/assets/puntos_turisticos/principal-3.jpg', 1);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Lago del Estadio', 'Parque de diversiones, para eventos', 'Parque de diversioens', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4noTtwo3mrLhfBGUUyD3n82rz_FZcT-ypMw99JGfU3FMxekf0TQv2AzOHSAg10Vj7ejPJdeMzAK8BhuWf6lS1zFQt2T6v8XSeTkb1PKEc-gOOiLIzPjxUXpcLpM0N4pNwnSe2UsGKQ=w408-h306-k-no', 2);
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Parque Metropolitano de Guadalajara', 'Parque popular con más de 100 hectáreas verdes, caminos, renta de bicicletas y áreas para pícnic.', 'Parque', 'https://lh3.googleusercontent.com/gps-cs-s/AG0ilSytYjZmF_57i6augrfD9--fwoSkpI-0r_lsFfd1npmH5OmTdZK3C8aEkmrcVZM13c4IqTG2qTauOsnXQRQbWZ6suyvwmpClZ8H4g0KfYL1gWSxayCSY0ipB-mTBGHviq7lgHaSx=w426-h240-k-no', 2);
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Centro Acuático Code Metropolitano', 'Centro acuatico de eventos', 'Centro Acuatico', 'https://lh3.googleusercontent.com/gps-cs-s/AG0ilSxDrecRdgU_dsQYVhofii1hvS2YkAYgILsYwokBNnGhJv1aCv4L33GYyRGjRTpWRMhrHYqCM0y7sYk9rUDAS5fCLFbZfgpOVndw_jRhNpXjW6v7kfr8y8dTA7VeG_gezDLjIwSs1w=w408-h306-k-no', 2);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Parque Ecológico Santa Úrsula (Hermandad Coyoacán-Arlington)', 'Parque de juegos, donde podran jugar tanto niños como mascotas.', 'Parque de juegos', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4nr1pTwmSz5aIOxg3MQg1NnohxOoQlohzJbyCJz9mFUu6oYrrfl5oSqnl1I1y4Nkv-1u1b-fqdaH7JcS7tAvO57Ld3D_-doX0ZpdyiOBITMJa2mD2ie5--vt6rgydquBOS_EzH3t=w408-h306-k-no', 3);
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('KidZania Cuicuilco', 'Area de juegos para los niños, donde podran divertirse siendo lo que quieran ser.', 'Centro de juegos', 'https://cdn.mexicodestinos.com/lugares/kidzania-cuicuilco-ciudad-de-mexico-princ-min.jpg', 3);
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Six Flags México', 'Centro de juegos mecanicos, desde la rueda de la fortuna, hasta una montaña rusa.', 'Parque de diversiones', 'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npBx7XAYOTGflj2ARFGnvdz0g2tkwTSeB3rFA6e3XMsxh7qTCWI6kC2DTeYq8eL1QTwJ7FphttcDsKl7076SI4-1hi5NOSvDjDKpeCLlswUpQkiFJup4ld4OsrR7htC9eNtdYrO=w408-h306-k-no', 3);
