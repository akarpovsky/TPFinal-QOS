/* Creamos tres usuarios, uno con permisos de administrador*/

INSERT INTO users VALUES (1, 1966, 'normal@normal.com', 'a',NULL, 'REGULAR');
INSERT INTO users VALUES (2, 1992, 'otro@otro.com', 'a',NULL, 'REGULAR');
INSERT INTO users VALUES (3, 1990, 'admin@admin.com', 'a',NULL, 'ADMIN');
INSERT INTO users VALUES (4, 2000, 'vacio@vacio.com', 'a',NULL, 'REGULAR');

/* Se generan las distintas instalaciones (casa, trabajo, etc) y se les asignan a los usuarios*/
/* INS Number | Location | Name | User */

INSERT INTO installation VALUES(1,0,'Casa',1);
INSERT INTO installation VALUES(2,NULL,'Trabajo',1);
INSERT INTO installation VALUES(3,1,'Club de Golf',1);
INSERT INTO installation VALUES(4,2,'Ministerio',1);
INSERT INTO installation VALUES(5,2,'Casa',2);
INSERT INTO installation VALUES(6,NULL,'Universidad',2);

/* Se generan los distintos ISPs disponibles*/

INSERT INTO isp VALUES(1,'Unknown');
INSERT INTO isp VALUES(2,'Arnet');
INSERT INTO isp VALUES(3,'Fibertel');
INSERT INTO isp VALUES(4,'Speedy');
INSERT INTO isp VALUES(5,'Zion Internet');

/* El usuario "NORMAL" tendrá 4 instalaciones: Casa, Trabajo, Club de Golf, Ministerio */
INSERT INTO users_installation VALUES(1,1);
INSERT INTO users_installation VALUES(1,2);
INSERT INTO users_installation VALUES(1,3);
INSERT INTO users_installation VALUES(1,4);
/* El usuario "OTRO" tendrá 2 instalaciones: Casa y Universidad */
INSERT INTO users_installation VALUES(2,5);
INSERT INTO users_installation VALUES(2,6);

/* Usuario "NORMAL" instalación "CASA" */
INSERT INTO records VALUES (1,20,53,'2013-04-14 16:20:12.345678',55,50,false,false,1,1,1);
INSERT INTO records VALUES (2,25,58,'2013-04-14 16:20:12.345678',44,50,false,false,1,5,1);
INSERT INTO records VALUES (3,22,66,'2013-04-12 16:20:12.345678',60,89,false,false,1,5,1);
INSERT INTO records VALUES (4,29,50,'2013-04-15 16:20:12.345678',66,66,false,false,1,5,1);
INSERT INTO records VALUES (5,30,89,'2013-04-13 16:20:12.345678',68,58,false,false,1,1,1);
INSERT INTO records VALUES (6,10,78,'2013-04-12 16:20:12.345678',77,52,false,false,1,1,1);
INSERT INTO records VALUES (7,16,69,'2013-04-11 16:20:12.345678',99,57,false,false,1,1,1);
INSERT INTO records VALUES (8,22,50,'2013-04-10 16:20:12.345678',48,88,false,false,1,5,1);
INSERT INTO records VALUES (9,30,50,'2013-04-08 16:20:12.345678',78,87,false,false,1,1,1);

/* Usuario "NORMAL" instalación "Trabajo" */
INSERT INTO records VALUES (10,20,53,'2013-04-14 16:20:12.345678',55,50,false,false,2,1,1);
INSERT INTO records VALUES (11,25,58,'2013-04-14 16:20:12.345678',44,50,false,false,2,2,1);
INSERT INTO records VALUES (12,22,66,'2013-04-12 16:20:12.345678',60,89,false,false,2,2,1);
INSERT INTO records VALUES (13,29,50,'2013-04-15 16:20:12.345678',66,66,false,false,2,2,1);
INSERT INTO records VALUES (14,30,89,'2013-04-13 16:20:12.345678',68,58,false,false,2,2,1);
INSERT INTO records VALUES (15,10,78,'2013-04-12 16:20:12.345678',77,52,false,false,2,2,1);
INSERT INTO records VALUES (16,16,69,'2013-04-11 16:20:12.345678',99,57,false,false,2,1,1);
INSERT INTO records VALUES (17,22,50,'2013-04-10 16:20:12.345678',48,88,false,false,2,1,1);
INSERT INTO records VALUES (18,30,50,'2013-04-08 16:20:12.345678',78,87,false,false,2,1,1);

/* Usuario "NORMAL" instalación "Club de Golf" */
INSERT INTO records VALUES (19,20,53,'2013-04-14 16:20:12.345678',55,50,false,false,3,1,1);
INSERT INTO records VALUES (20,25,58,'2013-04-14 16:20:12.345678',44,50,false,false,3,2,1);
INSERT INTO records VALUES (21,22,66,'2013-04-12 16:20:12.345678',60,89,false,false,3,2,1);
INSERT INTO records VALUES (22,29,50,'2013-04-15 16:20:12.345678',66,66,false,false,3,2,1);
INSERT INTO records VALUES (23,30,89,'2013-04-13 16:20:12.345678',68,58,false,false,3,3,1);
INSERT INTO records VALUES (24,10,78,'2013-04-12 16:20:12.345678',77,52,false,false,3,2,1);
INSERT INTO records VALUES (25,16,69,'2013-04-11 16:20:12.345678',99,57,false,false,3,1,1);
INSERT INTO records VALUES (26,22,50,'2013-04-10 16:20:12.345678',48,88,false,false,3,3,1);
INSERT INTO records VALUES (27,30,50,'2013-04-08 16:20:12.345678',78,87,false,false,3,1,1);

/* Usuario "NORMAL" instalación "Ministerio" */
INSERT INTO records VALUES (28,20,53,'2013-04-14 16:20:12.345678',55,50,false,false,4,1,1);
INSERT INTO records VALUES (29,25,58,'2013-04-14 16:20:12.345678',44,50,false,false,4,2,1);
INSERT INTO records VALUES (30,22,66,'2013-04-12 16:20:12.345678',60,89,false,false,4,3,1);
INSERT INTO records VALUES (31,29,50,'2013-04-15 16:20:12.345678',66,66,false,false,4,1,1);
INSERT INTO records VALUES (32,30,89,'2013-04-13 16:20:12.345678',68,58,false,false,4,1,1);
INSERT INTO records VALUES (33,10,78,'2013-04-12 16:20:12.345678',77,52,false,false,4,2,1);
INSERT INTO records VALUES (34,16,69,'2013-04-11 16:20:12.345678',99,57,false,false,4,3,1);
INSERT INTO records VALUES (35,22,50,'2013-04-10 16:20:12.345678',48,88,false,false,4,4,1);
INSERT INTO records VALUES (36,30,50,'2013-04-08 16:20:12.345678',78,87,false,false,4,1,1);

/* Usuario "OTRO" instalación "Casa" */

INSERT INTO records VALUES (37,10,18,'2013-04-12 16:20:12.345678',77,12,false,false,5,2,2);
INSERT INTO records VALUES (38,44,11,'2013-04-11 16:20:12.345678',99,45,false,false,5,1,2);
INSERT INTO records VALUES (39,44,13,'2013-04-10 16:20:12.345678',48,65,false,false,5,1,2);
INSERT INTO records VALUES (40,30,11,'2013-04-08 16:20:12.345678',78,87,false,false,5,3,2);

SELECT SETVAL('users_id_seq', (SELECT MAX(id) FROM users)+1);
SELECT SETVAL('installation_id_seq', (SELECT MAX(id) FROM installation)+1);
SELECT SETVAL('records_id_seq', (SELECT MAX(id) FROM records)+1);
SELECT SETVAL('isp_id_seq', (SELECT MAX(id) FROM isp)+1);

