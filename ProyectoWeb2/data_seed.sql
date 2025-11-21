USE worldcupguide_db;

-- =============================================
-- 1. ESTADIOS (STADIUMS)
-- =============================================

-- MEXICO (IDs 1-3)
INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Estadio BBVA', 'Nuevo Leon', 53500, 'https://upload.wikimedia.org/wikipedia/commons/a/a9/EstadioCFMonterrey.jpg');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Estadio Akron', 'Jalisco', 48000, 'https://estadioakron.mx/img/acceso_directo/acceso_como_llego.jpg');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Estadio Azteca', 'Ciudad de México', 83000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGDgBSqla6L8-YWUPWocdWGByUmsIPqY3vzQ&s');

-- CANADA (IDs 4-5)
INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('BC Place', 'Vancouver', 54500, 'https://img.archiexpo.es/images_ae/photo-g/151879-10285000.webp');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('BMO Field', 'Toronto', 30000, 'https://static2.gensler.com/uploads/image/65575/project_BMO_large_01_1475515240.jpg');

-- USA (IDs 6-16)
INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Mercedes-Benz Stadium', 'Atlanta', 71000, 'https://cdn.prod.website-files.com/5ddedb3aabcf2c01a3f45461/64ba3cf5ea0a30cccb7accf9_Falcon-66-copy-e1510676998489.jpg');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Gillette Stadium', 'Boston', 65878, 'https://eu-images.contentstack.com/v3/assets/blt31d6b0704ba96e9d/blt167db0a23f81fe3d/67ffb27c8d01533bb9f63a38/GettyImages-2209756667.jpg');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('AT&T Stadium', 'Dallas', 80000, 'https://www.lonestarlive.com/resizer/v2/C2SKYGBSQNEVDD26W7PI67ZOPY.jpg?auth=6385d7b298bb4778fe94268939d3b9bcf6f10bea0b27aecf5c36fe32d491bf19&width=1280&smart=true&quality=90');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('NRG Stadium', 'Houston', 72220, 'https://www.afa.com.ar/Sitio/media/manager/1000/750/c/aHR0cHM6Ly93d3cuYWZhLmNvbS5hci91cGxvYWQvbm90aWNpYXMvNDY5OS81NTExNTQ5NzIuanBn');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Arrowhead Stadium', 'Kansas City', 76416, 'https://a57.foxsports.com/statics.foxsports.com/www.foxsports.com/content/uploads/2024/02/1408/814/1da64565-chiefs1.jpg?ve=1&tl=1');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('SoFi Stadium', 'Los Ángeles', 70240, 'https://upload.wikimedia.org/wikipedia/commons/6/68/Aerial_view_of_SoFi_Stadium_%28July_2022%29.jpg');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Hard Rock Stadium', 'Miami', 64767, 'https://hbre.us/wp-content/uploads/2020/01/AdobeStock_305521418_Editorial_Use_Only-scaled.jpeg');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('MetLife Stadium', 'Nueva York/NJ', 82500, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Metlife_stadium_%28Aerial_view%29.jpg/1200px-Metlife_stadium_%28Aerial_view%29.jpg');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Lincoln Financial Field', 'Filadelfia', 69796, 'https://s3.amazonaws.com/cdn.chatsports.com/wp-content/uploads/2014/07/stads/lincoln-feeld.jpg');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Levis Stadium', 'San Francisco', 68500, 'https://paramountlimo.com/wp-content/uploads/2025/02/levis-stadium-scaled.jpeg');

INSERT INTO Stadiums(Name, City, Capacity, ImageUrl)
VALUES('Lumen Field', 'Seattle', 68740, 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Qwest_Field%2C_Seattle%2C_USA-1June2009.jpg');


-- =============================================
-- 2. HOTELES (HOTELS)
-- =============================================

-- MEXICO
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

-- CANADA (Vancouver - BC Place - ID 4)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('JW Marriott Parq Vancouver', '39 Smithe St, Vancouver, BC V6B 0R3, Canadá', 4.2, 'Wi-Fi de Pago, Estacionamiento de Pago, Aire acondicionado, Desayuno de Pago, Gimnasio, Bar', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGlfMaIMDmOxL2bGTu5mSt6PQeMCJG3Fwrr2AE8tZDoy64EIZZcsD5sxrnirIbv3Xdle3MTm4pdCseAxnH49bFfslBYxexhCx0PD77M99shbHuGFbuVfgI-yBkutBJqhOILE0Z6A5inOzKDJr0RYyhdNFkCrD_oUYERQyQFiTgB73vUs5SRuY6PAw=w408-h272-k-no', 4);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('The DOUGLAS, Autograph Collection', '45 Smithe St, Vancouver, BC V6B 0R3, Canadá', 4.2, 'Wi-Fi de Pago, Estacionamiento de Pago, Aire acondicionado, Desayuno de Pago, Gimnasio, Bar, Lavanderia', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqPcft2pykiM_erMIf5GcW71jbgbLEQUeFBg&s', 4);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hampton Inn & Suites by Hilton Vancouver-Downtown', '111 Robson St, Vancouver, BC V6B 2A8, Canadá', 4.3, 'Este hotel moderno y tranquilo se encuentra a una cuadra del Estadio BC Place, sede de los Vancouver Whitecaps y BC Lions.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-RL4J64X8oDK_yFkat3Zqwi2Mf2tNTt8FzQ&s', 4);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Smithe House', '225 Smithe St, Vancouver, BC V6B 1E7, Canadá', 5, 'Wi-Fi gratis, Estacionamiento de Pago, Aire acondicionado, Gimnasio, Apto para niños', 'https://images.trvl-media.com/lodging/105000000/104440000/104438700/104438673/cc4f0357.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill', 4);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Rosedale on Robson Suite Hotel', '838 Hamilton St, Vancouver, BC V6B 6A2, Canadá', 4.2, 'Hotel de suites moderno ubicado a 7 minutos a pie del centro de la ciudad y a 5 minutos a pie del teatro Queen Elizabeth.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2c/1f/bb/59/hotel-tower.jpg?w=900&h=500&s=1', 4);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Sandman Hotel Vancouver Downtown', '180 W Georgia St, Vancouver, BC V6B 4P4, Canadá', 4.2, 'Este hotel tranquilo se encuentra a una cuadra de los eventos deportivos del Rogers Arena y del BC Place, y a 9 minutos a pie de las tiendas y los restaurantes del histórico distrito de Gastown.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTfPu33jjJjdUR4pUkSvJhBOT0VVwZ52vUMQ&s', 4);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hilton Vancouver Downtown', '433 Robson St, Vancouver, BC V6B 6L9, Canadá', 4.5, 'Este hotel tranquilo con fachada de vidrio se encuentra en el centro de la ciudad, a 2 km del parque Stanley y a 4 km del acuario de Vancouver.', 'https://www.hilton.com/im/en/YVRWGHH/19175847/yvrwg-pool-2.jpg?impolicy=crop&cw=5000&ch=2799&gravity=NorthWest&xposition=0&yposition=267&rw=768&rh=430', 4);

-- CANADA (Toronto - BMO Field - ID 5)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('The Parkdale Hostellerie', '83 Elm Grove Ave, Toronto, ON M6K 2J2, Canadá', 3, 'Este hostal informal, ubicado en una casa de ladrillos en una calle comercial pintoresca, se encuentra a 2 minutos a pie de la estación de tren ligero más cercana.', 'https://static.where-e.com/Canada/The-Parkdale-Hostellerie_a84e4488eff4dc5a6aa92293a508c98c.jpg', 5);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('The Drake Hotel', '1150 Queen St W, Toronto, ON M6J 1J3, Canadá', 4.3, 'Este hotel boutique moderno, con exhibiciones y colecciones de arte contemporáneo, se encuentra a 3 km de la galería Art Gallery of Ontario y a 4 km de la Torre CN.', 'https://costar.brightspotcdn.com/dims4/default/4c2c8f4/2147483647/strip/true/crop/4625x3081+0+0/resize/2100x1399!/quality/100/?url=http%3A%2F%2Fcostar-brightspot.s3.us-east-1.amazonaws.com%2Fe7%2F64%2F98bc98bd40259679968291197322%2Fthedrake.jpg', 5);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('1 Hotel Toronto', '550 Wellington St W, Toronto, ON M5V 2V4, Canadá', 4.6, 'Este hotel elegante se encuentra frente al parque en el centro de la ciudad, a un minuto a pie de una parada de tranvía, a 1 km de la Torre CN y a 4 km del Museo Real de Ontario.', 'https://media.blogto.com/uploads/2021/09/14/1631649333-20211009-1Hotel-23.jpg?w=1400&cmd=resize&height=2500&quality=70', 5);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Ace Hotel Toronto', '51 Camden St, Toronto, ON M5V 1V2, Canadá', 4.4, 'En una zona repleta de restaurantes, bares y cafeterías, este moderno hotel se encuentra a 1 km de la Torre CN y de la Galería de Arte de Ontario, y a 2 km de la estación de tren Union.', 'https://www.endicott.com/_next/image?url=https%3A%2F%2Fendicottfiles.com%2FAce1.jpg&w=2048&q=75', 5);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hotel X Toronto, a Destination by Hyatt Hotel', '111 Princes Blvd, Toronto, ON M6K 3C3, Canadá', 4.5, 'Wi-Fi gratis, Desayuno de Pago, Estacionamiento de Pago, Aire acondicionado, Gimnasio', 'https://image-tc.galaxy.tf/wijpeg-c5m72u9hivv3gjxek2n2k8y4d/hotel-x-toronto.jpg?width=1920', 5);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('The Alexandra Hotel', '77 Ryerson Ave, Toronto, ON M5T 2V4, Canadá', 3.4, 'Este hotel económico y funcional se encuentra a 14 minutos a pie de la Galería de Arte de Ontario, a 1.9 km de la Torre CN y a 2.2 km del Rogers Centre, sede del equipo de béisbol Toronto Blue Jays.', 'https://alexandra.ontariocahotel.com/data/Pics/OriginalPhoto/15830/1583081/1583081016/pic-the-alexandra-hotel-toronto-1.JPEG', 5);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Toronto Travellers Home', '588 Dundas St W, Toronto, ON M5T 1H5, Canadá', 2.5, 'Este hostal sencillo solo para adultos, ubicado en una casa de ladrillos rojos, se encuentra a 3 minutos a pie de una estación de metro.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/bf/d3/de/very-small-but-clean.jpg?w=900&h=-1&s=1', 5);

-- USA (Atlanta - Mercedes-Benz Stadium - ID 6)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('REVERB Downtown Atlanta', '89 Centennial Olympic Park Dr NW, Atlanta, GA 30313, Estados Unidos', 4, '89 Centennial Olympic Park Dr NW, Atlanta, GA 30313, Estados Unidos', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZyultymo6b_vb44kCa09jrURpViyiA-utGg&s', 6);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Clarion Inn & Suites Atlanta Downtown', '186 Northside Dr SW, Atlanta, GA 30313, Estados Unidos', 3.5, 'Este hotel económico y tranquilo se encuentra junto a la interestatal 20, a 12 minutos a pie de una estación de metro y a 1.6 kilómetros del Georgia Aquarium.', 'https://cintl.com/wp-content/uploads/2018/05/blog-feature-benzClarion.jpg', 6);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Origin Atlanta, a Wyndham Hotel', '110 Mitchell St SW, Atlanta, GA 30303, Estados Unidos', 3.8, 'Wi-Fi gratis, Desayuno de Pago, Estacionamiento de Pago, Aire acondicionado, Bar, Gimnasio', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/693101197.jpg?k=8a8d4f294b9c853f9fcf033a1fd4b6ceaa1ab82f4f9b09673cecf277518800e2&o=', 6);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Glenn Hotel, Autograph Collection', '110 Marietta St NW, Atlanta, GA 30303, Estados Unidos', 4.4, 'Este hotel de lujo se encuentra en el centro de la ciudad, a 4 minutos a pie del Parque Olímpico del Centenario.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwFj1BcSIvN8oIjzGRMs8Zi_50LvzjC9QGPw&s', 6);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Omni Atlanta Hotel at Centennial Park', '190 Marietta St NW, Atlanta, GA 30303, Estados Unidos', 4.2, 'Wi-Fi de Pago, Desayuno de Pago, Estacionamiento de Pago, Lavanderia, Bar, Gimnasio', 'https://assets.simpleviewinc.com/simpleview/image/upload/crm/alhitx/239-3-2114_jpeg-a063f8799763b3f_a06579f6-a132-b463-11ab2fa07415b631.jpg', 6);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hilton Garden Inn Atlanta Downtown', '275 Baker St NW, Atlanta, GA 30313, Estados Unidos', 4.2, 'Este hotel moderno se encuentra a 4 minutos a pie del Georgia World Congress Center y del Georgia Aquarium.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/484913160.jpg?k=899f90d5a8dbeddcba7bc6da9a0b86aa1fb63ac3df676d3271bdc66e231f2255&o=', 6);

-- USA (Boston - Gillette Stadium - ID 7)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hilton Garden Inn Foxborough Patriot Place', '27 Patriot Pl, Foxborough, MA 02035, Estados Unidos', 4.4, 'Wi-Fi gratis, Desaayuno de Pago, Estacionamiento gratuito, Piscina cuibierta, Bar, Gimnasio', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/484922441.jpg?k=89271a44faf8753a800f48b1369227bf4c8fd49591dfdac48b60bec0b0f68ec3&o=', 7);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Renaissance Boston Patriot Place Hotel', '28 Patriot Pl, Foxborough, MA 02035, Estados Unidos', 4.4, 'Este hotel se encuentra a 5 minutos a pie del Estadio Gillette y a 15 de la parada de MBTA de Gillette Stadium.', 'https://image-tc.galaxy.tf/wijpeg-9syn4kjwcd8ye30qvm84lmyt8/renaissance-bospatriotplace-exterior2013-142.jpg?width=1920', 7);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Red Fox Motel', '96 Washington St, Foxborough, MA 02035, Estados Unidos', 3.4, 'Wi-Fi gratis, Estacionamiento gratuito', 'https://images.trvl-media.com/lodging/14000000/13280000/13279300/13279271/8700da3f.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill', 7);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Americas Best Value Inn Foxboro', '105 Washington St, Foxborough, MA 02035, Estados Unidos', 3.8, 'Este hotel sin pretensiones se encuentra a 16 minutos a pie del recinto deportivo y de ocio Gillette Stadium y a 17 minutos en coche del zoológico Capron Park Zoo.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/36132192.jpg?k=aedca90c865c19b1745a92b67a9254976df70ad3354f4939a3659b524dae4ebc&o=', 7);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Home2 Suites by Hilton Walpole Foxboro', '2375 Boston Providence Hwy, Walpole, MA 02081, Estados Unidos', 4.2, 'Wi-Fi gratis, Desasyuno incluido, Estacionamiento gratuito, Piscina cubierta, Gimnasio', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/484922764.jpg?k=3ae86999ad30db4f0e3688ceb8942f9a7023a21ecb11f04c3a7777bdf38306b4&o=', 7);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Walpole Motel', '2200 Providence Hwy, Walpole, MA 02081, Estados Unidos', 2.6, 'Wi-Fi gratis, Estacionamiento gratuito, Aire acondicionado, Campo de golf', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/115601133.jpg?k=b7b15cd41a72e2b063b59ebf37be89e5e1d0e4e4e2598a9862500e86a7596e5d&o=&hp=1', 7);

-- USA (Dallas - AT&T Stadium - ID 8)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Motel 6 Arlington, TX – Entertainment District', '910 N Collins St, Arlington, TX 76011, Estados Unidos', 3.1, 'En un barrio comercial a una milla tanto de la Interestatal 30 como del Estadio Choctaw de los Texas Rangers.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/501673019.jpg?k=90a180c10982fb6acdb0e17e3a1c2601b8b14cb381fd8b3280a3bed49154b684&o=', 8);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('The Sanford House Inn & Spa', '506 N Center St, Arlington, TX 76011, Estados Unidos', 4.7, 'Este hotel elegante, ubicado en una mansión refinada y varios edificios adyacentes, se encuentra a 2 kilómetros de la Universidad de Texas en Arlington.', 'https://images.trvl-media.com/lodging/1000000/980000/977400/977321/7b9ea1b9.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill', 8);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Executive Inn of Arlington, Near AT&T Stadium', '314 N Collins St, Arlington, TX 76011, Estados Unidos', 3.1, 'Este hotel económico de poca altura se encuentra a 11 minutos a pie del estadio AT&T.', 'https://images.trvl-media.com/lodging/96000000/95810000/95802300/95802215/0bea54dd.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill', 8);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Budget Host Inn', '1000 E Division St, Arlington, TX 76011, Estados Unidos', 2.8, 'Este hotel económico y discreto se encuentra en un área comercial, a 5 kilómetros de Six Flags Hurricane Harbor y a 2 kilómetros del estadio AT&T.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiCy1P4U_5j77BZt_wGNqdZ6NKx6sRmqYoDQ&s', 8);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Live! by Loews - Arlington, Texas', '1600 E Randol Mill Rd, Arlington, TX 76011, Estados Unidos', 4.5, 'Hotel refinado que se encuentra entre los estadios y los lugares de eventos en el distrito de entretenimiento del Texas Live!, a menos de 2 km del parque temático Six Flags Over Texas.', 'https://cdn.loewshotels.com/loewshotels.com-2466770763/cms/cache/v2/5da7787638b31.jpg/1920x1080/resize/80/9e40712c5a8678d68ed59d110b3751ad.jpg', 8);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Drury Plaza Hotel Dallas Arlington', '101 W Road to Six Flags St, Arlington, TX 76011, Estados Unidos', 4.8, 'Wi-Fi gratis, Desayuno, Estacionamiento gratuito, Campo de golf, Jacuzzi, Restaurante', 'https://i0.wp.com/fortworthreport.org/wp-content/uploads/2024/07/drury-hotel-arlington.jpg?fit=659%2C422&quality=89&ssl=1', 8);

-- USA (Houston - NRG Stadium - ID 9)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Wingate Houston near NRG Park/Medical Center', '8600 Kirby Dr, Houston, TX 77054, Estados Unidos', 2.7, 'Este hotel tranquilo, ubicado frente al estadio NRG, sede del equipo de la NFL Houston Texans, se encuentra a 5 kilómetros del centro médico Memorial Hermann-Texas.', 'https://www.wyndhamhotels.com/content/dam/property-images/en-us/wg/us/tx/houston/55202/55202_exterior_view_1.jpg', 9);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Quality Inn & Suites NRG Park - Medical Center', '2364 S Loop W, Houston, TX 77054, Estados Unidos', 3.2, 'Este hotel sencillo se encuentra junto a la interestatal 610, a 4.9 kilómetros de Rice University y a 12.7 kilómetros del centro de convenciones George R. Brown.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/600061362.jpg?k=d4bc733636e80e8e72619be0df2761557d6795440c5a39e06ef71d1601547ac8&o=', 9);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Sterling Inn & Suites', '2500 S Loop W, Houston, TX 77054, Estados Unidos', 3.7, 'Wi-Fi gratis, Estacionamiento gratuito, Aire acondicionado, Campo de golf', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/21607277.jpg?k=0cc278007528021d070bf785b1056252d9055a1298d196650e104995b6527ca3&o=&hp=1', 9);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Astro Best Inn', '9430 S Main St, Houston, TX 77025, Estados Unidos', 3.2, 'Wi-Fi gratis, Estacionamiento gratuito, Aire acondicionado.', 'https://q-xx.bstatic.com/xdata/images/hotel/max500/86298910.jpg?k=b407d5c71f68281c7f9080eda0f7592fc79bac546b01b070c387302388b779fa&o=', 9);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Holiday Inn Houston S - NRG Area - Med Ctr by IHG', '8111 Kirby Dr, Houston, TX 77054, Estados Unidos', 3.8, 'Este hotel sencillo se encuentra a 5 minutos en automóvil de la I-610, a 1.3 kilómetros del parque Reliant, con su astrodomo y estadio.', 'https://digital.ihg.com/is/image/ihg/holiday-inn-houston-8591463039-4x3', 9);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Staybridge Suites Houston - Medical Center by IHG', '9000 S Main St, Houston, TX 77025, Estados Unidos', 4, 'Este hotel de suites moderno se encuentra en un área residencial arbolada junto a la carretera US-90 Alt., a 15 minutos a pie del NRG Astrodome.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/247842950.jpg?k=66796978757acedc83b0ea57968a164e80c9064a6fa156a01eb42eceb0c5b1f9&o=', 9);

-- USA (Kansas City - Arrowhead Stadium - ID 10)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Best Western Plus Kansas City Sports Complex Hotel', '4011 Blue Ridge Cut Off, Kansas City, MO 64133, Estados Unidos', 3.6, 'Este hotel tranquilo se encuentra junto a la carretera I-70, a 10 minutos a pie de los partidos de béisbol del estadio Kauffman.', 'https://img.easemytrip.com/EMTHOTEL-74691/70/a/l/32489110_333838.jpg', 10);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hotel Lotus Kansas City Stadium', '3830 Blue Ridge Cutoff, Kansas City, MO 64133, Estados Unidos', 3.9, 'Este hotel sencillo se encuentra junto a la carretera I-70, a menos de 1.6 kilómetros de los partidos de béisbol del estadio Kauffman.', 'https://media-cdn.tripadvisor.com/media/photo-s/22/e4/30/7f/hotel-lotus-exterior.jpg', 10);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Americas Best Value Inn Kansas City E Independence', '13710 E 42nd Terrace S, Independence, MO 64055, Estados Unidos', 3.1, 'Wi-Fi gratis, Estacionamiento gratuito, Aire acondicionado, Campo de golf, Bar', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/769822259.jpg?k=87608099cf4b57a439a9ea1c308adb65c1f308774502822f43a04175bd367614&o=', 10);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Budget Inn', '9900 E US Hwy 40, Independence, MO 64055, Estados Unidos', 3.1, 'Wi-Fi gratis, Estacionamiento gratuito', 'https://assets.simpleviewinc.com/simpleview/image/upload/crm/fingerlakesvc/budget-inn-farmington-exterior-1--ca95b48a5056b3a_ca95b602-5056-b3a8-491891e811bcb3c3.jpg', 10);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Super 8 by Wyndham Independence Kansas City', '4032 S Lynn Ct Dr, Independence, MO 64055, Estados Unidos', 3.6, 'Este hotel económico y sencillo se encuentra a 7 minutos en automóvil del estadio Kauffman y a 16 minutos en automóvil del parque de atracciones Oceans of Fun.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/364225739.jpg?k=c8b6495f8b663d6358098f2b8fdc1ee922a8c583bc3c95c98d99affa87c1be84&o=', 10);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Days Inn by Wyndham Independence', '13712 E 42nd Terrace S, Independence, MO 64055, Estados Unidos', 3, 'Este hotel sencillo de 2 pisos se encuentra junto a la interestatal 70, a menos de 4.8 kilómetros del Royal Meadows Golf Club.', 'https://www.wyndhamhotels.com/content/dam/property-images/en-us/di/us/mo/independence/47682/47682_exterior_view_1.jpg', 10);

-- USA (Los Angeles - SoFi Stadium - ID 11)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hollywood Park Motel', '823-825 Prairie Ave, Inglewood, CA 90301, Estados Unidos', 4, 'Wi-Fi gratis, Estacionamiento gratuito.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/339713183.jpg?k=8975910859ba16b23d299b6539417268b1b75d7433b36991f19ed57de85edae9&o=', 11);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('The Lum Hotel Los Angeles Stadium District', '3900 W Century Blvd, Inglewood, CA 90303, Estados Unidos', 3.7, 'Este hotel informal y moderno se encuentra en una calle principal amplia, a 1.6 km del estadio SoFi, a 4.8 km del aeropuerto internacional de Los Ángeles', 'https://images.trvl-media.com/lodging/74000000/73670000/73661200/73661156/2bae71ca.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill', 11);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Holly Crest Hotel', '4027 W Century Blvd, Inglewood, CA 90304, Estados Unidos', 2.7, 'Este hotel económico y sencillo se encuentra junto a una calle comercial concurrida, a 3 kilómetros del parque Darby.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/268124496.jpg?k=94cd15e52ca9d3e61c09e3305b22ed6e627352b0624a4e611c30f3ffcf29cb54&o=&hp=1', 11);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Motel 6 Inglewood, CA', '4123 W Century Blvd, Inglewood, CA 90304, Estados Unidos', 3.5, 'Este sencillo motel se encuentra en un área comercial concurrida, a 4.8 km del aeropuerto internacional de Los Ángeles, a 16 km de los restaurantes en Marina del Rey', 'https://images.trvl-media.com/lodging/1000000/30000/26400/26337/f63fd40a.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill', 11);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Tradewinds Airport Hotel', '4200 W Century Blvd #456, Inglewood, CA 90304, Estados Unidos', 2.6, 'Este hotel de aeropuerto original con suites se encuentra frente a una parada de autobús, a menos de 1 km de Hollywood Park Casino.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQpxZ7R2dsFCT8n256Rh6JXrybzw40FrZtsA&s', 11);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('CRESTRIDGE INN', '4230 W Century Blvd, Inglewood, CA 90304, Estados Unidos', 4.5, 'Wi-Fi gratis, Estacionamiento gratis.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/692817437.jpg?k=ae7d4d582aa6ee931a9eb50577de88e507af6f1106e3d6455fca31d8398b6b87&o=', 11);

-- USA (Miami - Hard Rock Stadium - ID 12)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Miami Gardens Inn & Suites', '16805 NW 12th Ave, Miami, FL 33169, Estados Unidos', 3.3, 'Este hotel económico y sencillo, ubicado en un edificio colorido con columnas y estatuas de piedra, se encuentra junto a la carretera I-95, a 11.2 km de la ciudad Sunny Isles Beach.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/253778173.jpg?k=a7fa57dbe57af1bf8852e9259e483c578b02ce4ec600fe55521027911fe0667e&o=', 12);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('North Miami Beach Gardens Inn & Suites', '148 NW 167th St, North Miami Beach, FL 33169, Estados Unidos', 2.6, 'Situado en una carretera comercial, este hotel sin pretensiones se encuentra a menos de una milla de la I-95.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/b0/a3/34/pool-area.jpg?w=700&h=-1&s=1', 12);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hampton Inn & Suites Ft. Lauderdale/Miramar', '10990 Marks Way, Miramar, FL 33025, Estados Unidos', 4.4, 'Este hotel moderno se encuentra a 6.4 km del casino del hipódromo Calder y a 9.6 km de los senderos junto al lago del parque regional Miramar.', 'https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/crm/visitflorida/47407_zsey3t5o4d6jch37g4fp3l854rzs8t2e_97f809a5-5056-a36a-0bcb6c4bf1a5cd6f.jpg', 12);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('SpringHill Suites by Marriott Fort', '10880 Marks Way, Miramar, FL 33025, Estados Unidos', 4.3, 'Este hotel de suites se encuentra en un parque industrial ligero, junto a la carretera estatal 823, a 5 millas (8 km) del Hard Rock Stadium.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/629816719.jpg?k=fd2a2df6d033beeacd9e88d3d58f422bfdc66e76f31556c202dfd080b0a3cf0f&o=', 12);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Milan Aventura hotel', '18501 NE 25th Ct, North Miami Beach, FL 33160, Estados Unidos', 4.6, 'Wi-Fi gratis, Desayuno de pago, Estacionamiento gratuito.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/615004240.jpg?k=4cb57244fc380099c21acf9151ab6c953b9888e6ba974e49a2e3fc999e12df00&o=', 12);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Courtyard by Marriott Miami Aventura Mall', '2825 NE 191st St, Aventura, FL 33180, Estados Unidos', 4.3, 'Este hotel moderno se encuentra a 3 minutos a pie del centro comercial Aventura y a 5 km de Sunny Isles Beach.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMiER3c9LQntD9HisiiXZrcGaneAdMDSzS5A&s', 12);

-- USA (Nueva York/NJ - MetLife Stadium - ID 13)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Super 8 by Wyndham Meadowlands', '395 Washington Ave, Carlstadt, NJ 07072, Estados Unidos', 2.7, 'Situado a una milla de la I-95, este hotel sin pretensiones se encuentra a 15 minutos a pie tanto del hipódromo de Meadowlands como del estadio Metlife.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhprsJzThjqGq7ACJZff3xdPwgVXncYq1xgg&s', 13);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hampton Inn Carlstadt-At The Meadowlands', '304 Paterson Plank Rd, Carlstadt, NJ 07072, Estados Unidos', 4.2, 'Hotel sencillo se encuentra a minutos del estadio MetLife y a 2 kilómetros del entretenimiento en vivo en el Izod Center.', 'https://www.hilton.com/im/en/CLDNJHX/18414245/exterior-street-view.jpg?impolicy=crop&cw=4650&ch=2587&gravity=NorthWest&xposition=0&yposition=513&rw=768&rh=430', 13);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Residence Inn by Marriott East Rutherford', '10 Murray Hill Pkwy, East Rutherford, NJ 07073, Estados Unidos', 4.2, 'Este hotel de suites informal se encuentra a menos de 2 kilómetros del complejo Meadowlands Racing and Entertainment, a 3 kilómetros del estadio MetLife.', 'https://images.trvl-media.com/lodging/2000000/1560000/1554600/1554585/6ede6b4e.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill', 13);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Fairfield Inn East Rutherford Meadowlands', '850 Paterson Plank Rd, East Rutherford, NJ 07073, Estados Unidos', 4.1, 'Este hotel informal, ubicado a 3 minutos a pie de la parada de autobús a la ciudad de Nueva York en Paterson Plank Road.', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/46/b0/f0/exterior.jpg?w=900&h=500&s=1', 13);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Holiday Inn Express & Suites Meadowlands Area', '100 Paterson Plank Rd, Carlstadt, NJ 07072, Estados Unidos', 4.1, 'Este hotel moderno se encuentra a 3.5 kilómetros del estadio MetLife, a 11.9 kilómetros de Westfield Garden State Plaza y a 19.3 kilómetros del centro de Manhattan.', 'https://digital.ihg.com/is/image/ihg/holiday-inn-express-and-suites-carlstadt-4184197028-4x3', 13);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('The Park Hotel at Meadowlands', 'Two Meadowlands Plaza, East Rutherford, NJ 07073, Estados Unidos', 3.6, 'Este hotel de conferencias de gran altura se encuentra a 6 minutos en coche del complejo deportivo Meadowlands.', 'https://cf.bstatic.com/xdata/images/hotel/max500/636777872.jpg?k=0dfa27c17461352230620cfa804574eac33c2ed192dc3b125432373e897f1419&o=&hp=1', 13);

-- USA (Filadelfia - Lincoln Financial Field - ID 14)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Courtyard by Marriott Philadelphia South', '1001 Intrepid Ave, Philadelphia, PA 19112, Estados Unidos', 4.5, 'Este hotel refinado se encuentra a 1.6 kilómetros del Museo Histórico Sueco Americano y a 11.2 kilómetros de la Campana de la Libertad y del Independence Hall.', 'https://ensemble.net/wp-content/uploads/2023/08/Navy-Yard-Marriott-Exterior-Dusk-1-scaled.jpg', 14);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Holiday Inn Philadelphia Arpt-Stadium Area by IHG', '2033 Penrose Ave, Philadelphia, PA 19145, Estados Unidos', 3.8, 'Wi-Fi gratis, Estacionamiento de pago, Desayuno de pago, Aire acondicionado, Gimnasio, Bar', 'https://digital.ihg.com/is/image/ihg/holiday-inn-philadelphia-8875761542-original', 14);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Live! Casino & Hotel Philadelphia', '900 Packer Ave, Philadelphia, PA 19148, Estados Unidos', 4.2, 'Este hotel casino tranquilo junto a la carretera interestatal 76 se encuentra a 6 minutos a pie de los juegos de béisbol de Citizens Bank Park.', 'https://www.visitphilly.com/wp-content/uploads/2021/01/crtsy-Live-Casino-Hotel-Philadelphia-rendering-2200x1237px.jpg', 14);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Super 8 by Wyndham Gloucester', '1200 Crescent Blvd, Gloucester City, NJ 08030, Estados Unidos', 3.3, 'Wi-FI gratis, Desayuno, Estacionamiento gratuito, Piscina, Campo de golf, Aire acondicionado', 'https://www.wyndhamhotels.com/content/dam/property-images/en-us/se/us/nj/gloucester-city/11358/11358_exterior_view_2.jpg', 14);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Rodeway Inn', '801 Crescent Blvd, Brooklawn, NJ 08030, Estados Unidos', 3.2, 'Wi-Fi gratis, Estacionamiento gratuito, Piscina cubierta, Aire acondicionado, Jacuzzi', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/169841186.jpg?k=267cbc8ee1758be0ecfaf7ac31418ad020f2c60797edfe33f8484fcdf8181628&o=', 14);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Red Carpet Inn Brooklawn, NJ', '418 US-130, Brooklawn, NJ 08030, Estados Unidos', 3.2, 'Wi-FI gratis, Estacionamiento gratuito, Accesible.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/8926940.jpg?k=7d5aee130cd4643fdb9cfd0d4b6c9749554acbab216aa0e911cfb2cfbb9a4259&o=&hp=1', 14);

-- USA (San Francisco - Levis Stadium - ID 15)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hilton Santa Clara', '4949 Great America Pkwy, Santa Clara, CA 95054, Estados Unidos', 4.2, 'Este hotel de lujo se encuentra frente al centro de convenciones de Santa Clara, a 3 minutos a pie del estadio Levis.', 'https://www.hilton.com/im/en/SJCSCHF/3258952/sjcschf-hscexterior2014lrg-2.jpg?impolicy=crop&cw=5000&ch=2799&gravity=NorthWest&xposition=0&yposition=44&rw=768&rh=430', 15);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hyatt Regency Santa Clara Hotel', '5101 Great America Pkwy, Santa Clara, CA 95054, Estados Unidos', 4.3, 'Este hotel refinado, ubicado frente al parque de atracciones Great America de California, se encuentra a 13 minutos a pie del estadio Levis.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/300918130.jpg?k=d7dfab07b2d28115bdb0819129b2c369153ca4f7931f3dd9358a4c414dde0324&o=', 15);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('SureStay by Best Western Sunnyvale Silicon Valley', '1280 Persian Dr, Sunnyvale, CA 94089, Estados Unidos', 3.3, 'Wi-Fi gratis, Desayuno incluido, Estacionamiento gratuito, Aire acondicionado, Gimnasio, Campo de Golf.', 'https://media-cdn.tripadvisor.com/media/photo-s/30/b5/b1/df/exterior.jpg', 15);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Aloft Santa Clara', '510 America Center Ct, San Jose, CA 95002, Estados Unidos', 4.2, 'Este moderno hotel se encuentra en la localidad tecnológica de Santa Clara, en Silicon Valley, a casi 2 kilómetros del Levis stadium.', 'https://images.trvl-media.com/lodging/12000000/11630000/11628700/11628699/9e5359a0.jpg?impolicy=resizecrop&rw=575&rh=575&ra=fill', 15);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Extended Stay America Suites- San Jose', '2131 Gold St, Alviso, CA 95002, Estados Unidos', 4, 'Este hotel de suites informal se encuentra a 1.6 kilómetros de la carretera I-237 y del Levis Stadium, sede de los San Francisco 49ers.', 'https://www.extendedstayamerica.com/dA/b5a57365dc2148e5b2e2b6d004a27ed2/8718-ESA-I_exterior1_T_240412.jpg', 15);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Hyatt House Santa Clara', '3915 Rivermark Plaza, Santa Clara, CA 95054, Estados Unidos', 4.4, 'Este moderno hotel de estadía extendida se encuentra a 3 kilómetros del Levis Stadium, a 5 kilómetros del Centro de Convenciones de Santa Clara.', 'https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2017/07/27/0925/Hyatt-House-Santa-Clara-P033-Exterior.jpg/Hyatt-House-Santa-Clara-P033-Exterior.16x9.jpg', 15);

-- USA (Seattle - Lumen Field - ID 16)
INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Silver Cloud Hotel - Seattle Stadium', '1046 1st Ave S, Seattle, WA 98134, Estados Unidos', 4.4, 'Este hotel sencillo tiene vista a la bahía de Elliott y se ubica frente al estadio de béisbol T‑Mobile Park, a 3.2 km de la emblemática torre Space Needle.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/205882630.jpg?k=a7423ffd090cfaae6452ac83d313d8c80eb8ffb89b4cd69da6c21470f8721754&o=', 16);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Embassy Suites by Hilton Seattle', '255 S King St, Seattle, WA 98104, Estados Unidos', 4.5, 'El desayuno y los eventos sociales nocturnos frecuentes están incluidos. También hay un restaurante informal abierto las 24 horas.', 'https://www.hilton.com/im/en/SEAPSES/21796992/hotel-exterior-sunset-with-water-view.jpg?impolicy=crop&cw=5000&ch=2799&gravity=NorthWest&xposition=0&yposition=265&rw=768&rh=430', 16);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Populus Seattle', '100 S King St, Seattle, WA 98104, Estados Unidos', 4.7, 'Wi-Fi gratis, Desayuno de pago, Estacionamiento de pago, Aire acondicionado, Bar, Gimnasio', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgeQDxIA4fPabdhRtL5E8Z-MmPWxFR1xKG6w&s', 16);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('The American Hotel Hostel', '520 S King St, Seattle, WA 98104, Estados Unidos', 4.1, 'Este hostal tranquilo y céntrico se encuentra en un edificio renovado de 1926, a 2 kilómetros del acuario de Seattle.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/153239481.jpg?k=871b4eae068061256cfd0e856c2d36034b0227e52b764992d55041c76490bdeb&o=', 16);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Best Western Plus Pioneer Square Hotel Downtown', '77 Yesler Wy, Seattle, WA 98104, Estados Unidos', 4.3, 'Este hotel sencillo y moderno se encuentra en un edificio victoriano, entre las tiendas y los restaurantes de la histórica Pioneer Square.', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/578972841.jpg?k=885abefd94ff0dfa3d9d1129848e7873f58f8f0c43544d463435043232a4331f&o=', 16);

INSERT INTO Hotels(Name, Address, Stars, Description, ImageUrl, StadiumId)
VALUES('Arctic Club Hotel', '700 3rd Ave, Seattle, WA 98104, Estados Unidos', 4.5, 'Ubicado en el antiguo club de pioneros de la fiebre del oro de Klondike, y que data de 1916, este hotel de lujo se encuentra a 5 minutos a pie de Pike Place Market.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStm8FXPrbi3fil0P7D8G0_l6kuDcnTj-GR4Q&s', 16);


-- =============================================
-- 3. ATRACCIONES (TOURISTATTRACTIONS)
-- =============================================

-- MEXICO
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

-- CANADA (Vancouver - ID 4)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Vancouver Lookout', 'Los visitantes suben en un ascensor panorámico a un observatorio con vistas de 360° de la ciudad.', 'Mirador', 'https://images.spaicelabs.com/images/flus6j8v/production/eff5250c0f1fc96b1dac2f51bdb0a7a7d9287895-1080x1080.jpg?w=3840&fm=webp&q=75&fit=max', 4);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Mundo de la ciencia', 'Exhibiciones y películas interactivas de ciencia para niños de 1-5 años a adolescentes en un domo geodésico.', 'Museo', 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Science_World_at_TELUS_World_of_Science.jpg', 4);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Nelson Park', 'Espacio verde sencillo con senderos pavimentados, áreas de descanso, fuente tranquila y parque para perros.', 'Parque', 'https://cloudinary-assets.dostuffmedia.com/res/dostuff-media/image/upload/venue-420828/1524679699.jpg', 4);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('English Bay Beach', 'Playa concurrida con canchas de voleibol, además de un puesto de comida y el Cactus Club Cafe para comer.', 'Parque', 'https://www.worldbeachguide.com/photos/english-bay-vancouver.jpg', 4);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Acuario de Vancouver', 'Acuario que se centra en la conservación, con atracciones aptas para niños y fauna marina local y exótica.', 'Parque', 'https://image.wmsm.co/63716ee1b8b13/acuario-de-vancouver.webp?quality=80&width=1200&height=630&aspect_ratio=1200%3A630', 4);

-- CANADA (Toronto - ID 5)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Toronto Music Garden', 'Yo Yo Ma participó en el diseño de este pintoresco jardín con conciertos de verano y visitas guiadas.', 'Parque', 'https://blogto-production2-baselayer-display.blogto.com/articles/20190524-toronto-music-garden-2.jpg', 5);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Harbourfront Centre', 'Centro cultural junto al lago con danza, arte moderno, artesanías, espacios teatrales y actividades anuales.', 'Plaza Cultural', 'https://d1l57x9nwbbkz.cloudfront.net/files/s3fs-public/banners/2024-07/harbourfront-centre-day-destination-toronto.jpg?VersionId=TSyIosRtNsxxr6Oa8L8Wl3TR8HeG2esd', 5);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('EdgeWalk at the CN Tower', 'Atracción en la que los participantes usan trajes y arneses para recorrer la azotea de la Torre CN a 356 m.', 'Deporte Extremo', 'https://www.cntower.ca/sites/default/files/styles/16_9_scale_and_crop_medium/public/images/Untitled-1.png.webp?itok=uVxSP6Yv', 5);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Toronto City Hall', 'Emblemática estructura contemporánea que alberga la oficina del alcalde y cuenta con visitas guiadas.', 'Estructura Contemporanea', 'https://www.torontojourney416.com/wp-content/uploads/2022/02/city-hall-2021-2.jpg', 5);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Old City Hall', 'Edificio cívico de 1899 de estilo románico richardsoniano con una torre de reloj y gárgolas.', 'Edificio Contemporaneo', 'https://www.shutterstock.com/shutterstock/photos/140884675/display_1500/stock-photo-toronto-old-city-hall-140884675.jpg', 5);


-- USA (Atlanta - ID 6)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Georgia International Plaza', 'Entrada accesible, se permiten perros, sanitario publico.', 'Parque', 'https://takepicshere.com/wp-content/uploads/2022/03/Georgia-International-Plaza-ATL-TPH-LSM04.jpg', 6);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('World of Coca-Cola', 'Recuerdos, películas y exhibiciones (algunas interactivas) sobre el refresco que debutó en Atlanta en 1886.', 'Museo', 'https://a.travel-assets.com/findyours-php/viewfinder/images/res70/27000/27287-World-Of-Coca-Cola.jpg', 6);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Acuario de Georgia', 'Uno de los acuarios más grandes del mundo con exhibiciones permanentes, galerías interactivas y animales.', 'Acuario', 'https://upload.wikimedia.org/wikipedia/commons/0/00/Georgia_Aquarium_Jan_2006.jpg', 6);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Parque Olímpico del Centenario', 'Sede de los JJ.OO. de 1996 que ahora está lleno de senderos, jardines acuáticos y la Fuente de los Anillos.', 'Parque', 'https://a.travel-assets.com/findyours-php/viewfinder/images/res70/543000/543175-atlanta.jpg', 6);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Underground Atlanta', 'Esta zona histórica es ahora un centro comercial y de entretenimiento con restaurantes, eventos y visitas.', 'Zona Historica', 'https://upload.wikimedia.org/wikipedia/commons/c/ca/Atlanta_Underground.jpg', 6);

-- USA (Boston - ID 7)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Storybook Trail', 'Zona de senderismo para hacer caminatas, observar aves, ideal para niños y perros', 'Zona de Senderismo', 'https://www.visitdelohio.com/wp-content/uploads/2024/04/The-Storybook-Trail-scaled.jpg', 7);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('The Nature Trail and Cranberry Bog', 'Senderismo, accesible para todas las personas, niños y perros', 'Reserva Natural', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/4f/c3/93/bog-shed.jpg?w=1200&h=-1&s=1', 7);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Kersey Point car top boat launch', 'Parque de entorno natural, ideal para senderismo con niños y perros', 'Parque', 'https://www.massachusettspaddler.com/x/cdn/?https://storage.googleapis.com/production-websitebuilder-v1-0-9/279/200279/9vUi31Nu/1e212beff3d245a0918eb874ffbbe59c', 7);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Showcase Cinema de Lux Patriot Place', 'Cine moderno de varias pantallas con proyección digital, equipos de sonido y fiestas personalizadas.', 'Cine', 'https://www.patriot-place.com/wp-content/uploads/2019/06/Showcase-CDL-001.jpg', 7);

-- USA (Dallas - ID 8)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Urban Air Trampoline and Adventure Park', 'Enorme centro de trampolines interior con saltos abiertos, clases de gimnasia, dodgeball y fiestas.', 'Parque de atracciones', 'https://northernvirginiamag.com/wp-content/uploads/2025/04/urbanairexterior.webp', 8);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Cidercade Arlington', 'Salon de juegos accesible para todas las personas.', 'Salon recreativo', 'https://cidercade.com/wp-content/uploads/2023/09/Arlington-Exterior_1-1024x683.jpg', 8);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Arlington Museum of Art', 'Museo que expone un listado rotativo de exhibiciones ambulantes dedicadas al arte texano contemporáneo.', 'Museo', 'https://upload.wikimedia.org/wikipedia/commons/d/d0/Arlington_April_2019_19_%28Arlington_Museum_of_Art%29.jpg', 8);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Six Flags Over Texas', 'Parque temático de atracciones de 81 ha con más de 50 juegos, además de bandas en vivo y shows familiares.', 'Parque de diversiones', 'https://a.travel-assets.com/findyours-php/viewfinder/images/res70/553000/553934-arlington-texas.jpg', 8);

-- USA (Houston - ID 9)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Six Flags AstroWorld', 'Entradas para toda la familia, para disfrutar de un buen rato en familia', 'Parque de diversiones', 'https://upload.wikimedia.org/wikipedia/commons/7/7b/Six_Flags_Astroworld_entrance_gate.jpg', 9);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Schweppe Park', 'Entrada accesible para todo publico, lugar para hacer picnics, varios juegos para los niños y mas.', 'Parque', 'https://static.where-e.com/United_States/Schweppe-Park_255ea68713f286dfcc9a0c95e35bc759.jpg', 9);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Color Factory Houston', 'Espacio de arte extravagante en coloridas instalaciones interactivas, con una piscina de pelotas y globos.', 'Museo', 'https://res.cloudinary.com/sagacity/image/upload/c_crop,h_1707,w_2560,x_0,y_0/c_limit,dpr_auto,f_auto,fl_lossy,q_80,w_1080/CF_H19_49333_rh0myl.jpg', 9);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Museo de Ciencias Naturales de Houston', 'Museo con sala de dinosaurios y otras exhibiciones permanentes, planetario, teatro IMAX y mariposario.', 'Museo', 'https://upload.wikimedia.org/wikipedia/commons/5/58/HMNS.jpg', 9);

-- USA (Kansas City - ID 10)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Cool Crest Family Fun Center', 'Lugar con minigolf, sala de videojuegos, karts, jaulas de bateo, área de juegos para niños y pizzería bajo un mismo techo.', 'Parque de atracciones', 'https://img.p.mapq.st/?url=https://media-cdn.tripadvisor.com/media/photo-o/09/4d/64/59/cool-crest-fun-park.jpg?w=3840&q=75', 10);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Blue River Trailhead', 'Perfecta zona para andar caminando, en bicicleta, con amigos y familiares', 'Zona de Senderismo', 'https://cloudfront.traillink.com/photos/blue-river-trail-(shelbyville)_176222_sc.jpg', 10);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Blue Valley Park', 'Parque urbano de 96 ha cuenta con una cancha de golf de disco, un campo de béisbol, un área de juegos y un chapoteadero en verano.', 'Parque', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9umicmxncTVRrrobSGpvCDw4weOd27wgvmA&s', 10);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Spirit of Freedom Fountain', 'Entrada accesible para todas las edades.', 'Parque Acuatico', 'https://i0.wp.com/kcstudio.org/wp-content/uploads/2018/03/Spirit-of-Freedom-005.jpg?fit=1200%2C900&ssl=1', 10);

-- USA (Los Angeles - ID 11)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Lake Park', 'Entrada accesible para todo publico', 'Lago turistico', 'https://i0.wp.com/cronkitenews.azpbs.org/wp-content/uploads/2021/07/sofi-stadium-park-800x500-1.jpg?fit=780%2C488&ssl=1', 11);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Hollywood Park Casino', 'Casino con mesas que incluyen póker y juegos de California, torneos habituales y diversas opciones gastronómicas.', 'Casino', 'https://wilsonmeany.com/wp-content/uploads/2014/12/HPC_Exterior_v1.jpg', 11);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Jesse Owens Park', 'Parque con una piscina cubierta y áreas de básquetbol, béisbol, fútbol y tenis, además de una zona de juegos.', 'Parque', 'https://parks.lacounty.gov/wp-content/uploads/2018/06/Edited_-JesseOwens-7-of-15-1920x1280.jpg', 11);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Siminski Park', 'Entrada accesible para todo public, incluso para los perros.', 'Parque', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDEFilWZXsCvSmjC27tra3H3GHn5nkSBHw2A&s', 11);

-- USA (Miami - ID 12)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Miramar Pineland Park', 'Parque regional y centro con naturaleza, humedales, bosques de pinos y llanuras con una pasarela y senderos.', 'Parque', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/c9/2e/07/park-area.jpg?w=900&h=500&s=1', 12);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Snake Warriors Island Natural Area', 'Área natural de 21 hectáreas para realizar avistamiento de aves, con senderos, bancos y mesas de pícnic.', 'Reserva Natural', 'https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,q_75,w_1200/v1/crm/ftlauderdale/DSC_03760-0858138e5056b3a_08581730-5056-b3a8-491141d45df5069d.jpg', 12);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Aventura Slide Tower', 'Entrada accesible para todas las personas', 'Parque de atracciones', 'https://strapi-aventura-sound.s3.us-east-2.amazonaws.com/large_Aventura_Mall_External_Shoot_4ea19e6b8e.jpg', 12);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Tidal Cove', 'Centro acuático con un generador de olas para surfear, toboganes acuáticos, piscinas y alquiler de cabañas.', 'Parque acuatico', 'https://symphony.cdn.tambourine.com/tidal-cove-waterpark/media/tidal-cove-homepage-offers-resident-5f3558b340842.jpg', 12);

-- USA (Nueva York/NJ - ID 13)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('American Dream', 'Gran complejo cerrado con tiendas, restaurantes, parque temático, parque acuático y pista de esquí.', 'Centro comercial', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/1b/1f/ac/dreamworks-water-park.jpg?w=1200&h=1200&s=1', 13);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('SEA LIFE New Jersey Aquarium', 'Exposiciones con una variedad de criaturas marinas (la mayoría ofrecen zonas de juego y paquetes grupales).', 'Acuario', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiwUKf-swWZuGoYF1SVP133QhzdTjZ63ybe63H-WSPYEeVkO2ezDaeM-Jv_2ytR5_2fXhbK8HrCbsArfMXJ9gvKDU3K7449iHDa1az1sHr4aw0lY2S62FPQQxg5t0MzrMwb5wci5u19CxE/s1200/IMG_1535.PNG', 13);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Nickelodeon Universe Theme Park', 'Parque de aventuras cubierto con montañas rusas, atracciones de personajes animados, restaurantes informales y juegos infantiles.', 'Parque de diversiones', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/1b/2b/13/nickelodeon-universe.jpg?w=1200&h=-1&s=1', 13);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Ninja Kidz Action Park', 'Entrada accesible para todos los niños', 'Parque de atracciones', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/a0/7a/88/trampolines.jpg?w=1200&h=-1&s=1', 13);

-- USA (Filadelfia - ID 14)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('FDR Park', 'Gran parque urbano con campo de golf, canchas deportivas, lagos para pescar y el Museo Sueco Americano.', 'Parque', 'https://upload.wikimedia.org/wikipedia/commons/4/43/FDR_Park_2A.JPG', 14);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Philadelphias Magic Gardens', 'Recinto de arte folclórico con mosaicos, un laberinto de jardín con esculturas y programas educacionales.', 'Museo', 'https://narmassociation.org/wp-content/uploads/2019/09/Philadelphias-Magic-Gardens2.jpg', 14);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Fort Mifflin', 'Fuerte reconstruido en 1794 y punto de referencia histórico con actividades y eventos educativos.', 'Museo Historico', 'https://www.tclf.org/sites/default/files/thumbnails/image/FortMifflin_signature_BarrettDoherty_2015.jpg', 14);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Jefferson Square', 'Entrada accesible para todo publico, ideal para niños y mascotas para hacer picnic al aire libre.', 'Parque', 'https://images.squarespace-cdn.com/content/v1/594a7ef737c5813e5d8a8f8d/1526590825886-V36KUWPI2JMBKH922PFP/Jefferson_Square_3.JPG', 14);

-- USA (San Francisco - ID 15)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Californias Great America Passenger Drop Off Area', 'Entraba accesible para todo el publico.', 'Parque de Atracciones', 'https://ca-times.brightspotcdn.com/dims4/default/47f0b44/2147483647/strip/true/crop/3135x2261+0+0/resize/1200x865!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F87%2Fde%2Fcb38402d4256a469aae3af1bcc93%2Fga.jpg', 15);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Ulistac Natural Area', 'Parque rústico junto al río con senderos, observación de aves y varias plantas nativas en 16 ha.', 'Parque', 'https://images.squarespace-cdn.com/content/v1/57a2c51ae6f2e10d0618cf57/1585179394580-TKIHQ50UHJP0CINPIN00/image-asset.jpeg', 15);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Intel Museum', 'Museo de eventos tecnológicos importantes, como la invención del chip de silicio y la historia de Intel.', 'Museo', 'https://cdn.prod.website-files.com/634db05856607e33a1442d22/647a42456c8d190bde8bafcc_MoorePano_2880x1200.jpg', 15);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Live Oak Park', 'Terrenos parquizados con una amplia zona de césped que rodea un área de juegos infantiles de arena bastante alejada de la calle.', 'Parque', 'https://www.ci.temple-city.ca.us/ImageRepository/Document?documentID=21806', 15);

-- USA (Seattle - ID 16)
INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Waterfall Garden', 'Entrada accesible para todo tipo de publico.', 'Parque', 'https://media.tacdn.com/media/attractions-splice-spp-674x446/06/70/2b/8b.jpg', 16);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Chinatown-International District', 'Entrada accesible para todo tipo de publico.', 'Atraccion turistica', 'https://upload.wikimedia.org/wikipedia/commons/4/40/Seattle_-_Chinatown_gate_04.jpg', 16);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Klondike Gold Rush National Historical Park', 'Museo sobre la participación de Seattle en la década de 1890 durante la fiebre del oro de Klondike y más historia local.', 'Museo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzVHiJpMd-DfISpCgrWGeEZaRTH53P7BnV2Q&s', 16);

INSERT INTO TouristAttractions(Name, Description, Type, ImageUrl, StadiumId)
VALUES('Seattle Pinball Museum', 'Centro de ocio con partidas ilimitadas a un precio fijo, que ofrece máquinas de pinball clásicas y modernas.', 'Museo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0CUx5NaAIBdW0QiTvVHu2OZlB_rEfkSvdQA&s', 16);