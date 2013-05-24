﻿
/*Creamos tres usuarios, uno con permisos de administrador*/

INSERT INTO users VALUES (0, 1966, 'normal@normal.com', 'a',NULL, 'REGULAR');
INSERT INTO users VALUES (1, 1992, 'otro@otro.com', 'a',NULL, 'REGULAR');
INSERT INTO users VALUES (2, 1990, 'admin@admin.com', 'a',NULL, 'ADMIN');
INSERT INTO users VALUES (3, 2000, 'vacio@vacio.com', 'a',NULL, 'REGULAR');

/* Se generan las distintas instalaciones (casa, trabajo, etc) y se les asignan a los usuarios*/

INSERT INTO installation VALUES(0,'Casa');
INSERT INTO installation VALUES(1,'Trabajo');
INSERT INTO installation VALUES(2,'Club de Golf');
INSERT INTO installation VALUES(3,'Ministerio');
INSERT INTO installation VALUES(4,'Casa');
INSERT INTO installation VALUES(5,'Universidad');

/* El usuario "NORMAL" tendrá 4 instalaciones: Casa, Trabajo, Club de Golf, Ministerio */
INSERT INTO users_installation VALUES(0,0);
INSERT INTO users_installation VALUES(0,1);
INSERT INTO users_installation VALUES(0,2);
INSERT INTO users_installation VALUES(0,3);
/* El usuario "OTRO" tendrá 2 instalaciones: Casa y Universidad */
INSERT INTO users_installation VALUES(1,4);
INSERT INTO users_installation VALUES(1,5);

/* Usuario "NORMAL" instalación "CASA" */
INSERT INTO records VALUES (1,20,53,'2013-04-14 16:20:12.345678',55,50,0,0);
INSERT INTO records VALUES (2,25,58,'2013-04-14 16:20:12.345678',44,50,0,0);
INSERT INTO records VALUES (3,22,66,'2013-04-12 16:20:12.345678',60,89,0,0);
INSERT INTO records VALUES (4,29,50,'2013-04-15 16:20:12.345678',66,66,0,0);
INSERT INTO records VALUES (5,30,89,'2013-04-13 16:20:12.345678',68,58,0,0);
INSERT INTO records VALUES (6,10,78,'2013-04-12 16:20:12.345678',77,52,0,0);
INSERT INTO records VALUES (7,16,69,'2013-04-11 16:20:12.345678',99,57,0,0);
INSERT INTO records VALUES (8,22,50,'2013-04-10 16:20:12.345678',48,88,0,0);
INSERT INTO records VALUES (9,30,50,'2013-04-08 16:20:12.345678',78,87,0,0);

/* Usuario "NORMAL" instalación "Club de Golf" */
INSERT INTO records VALUES (19,20,53,'2013-04-14 16:20:12.345678',55,50,2,0);
INSERT INTO records VALUES (20,25,58,'2013-04-14 16:20:12.345678',44,50,2,0);
INSERT INTO records VALUES (21,22,66,'2013-04-12 16:20:12.345678',60,89,2,0);
INSERT INTO records VALUES (22,29,50,'2013-04-15 16:20:12.345678',66,66,2,0);
INSERT INTO records VALUES (23,30,89,'2013-04-13 16:20:12.345678',68,58,2,0);
INSERT INTO records VALUES (24,10,78,'2013-04-12 16:20:12.345678',77,52,2,0);
INSERT INTO records VALUES (25,16,69,'2013-04-11 16:20:12.345678',99,57,2,0);
INSERT INTO records VALUES (26,22,50,'2013-04-10 16:20:12.345678',48,88,2,0);
INSERT INTO records VALUES (27,30,50,'2013-04-08 16:20:12.345678',78,87,2,0);

/* Usuario "NORMAL" instalación "Ministerio" */
INSERT INTO records VALUES (28,20,53,'2013-04-14 16:20:12.345678',55,50,3,0);
INSERT INTO records VALUES (29,25,58,'2013-04-14 16:20:12.345678',44,50,3,0);
INSERT INTO records VALUES (30,22,66,'2013-04-12 16:20:12.345678',60,89,3,0);
INSERT INTO records VALUES (31,29,50,'2013-04-15 16:20:12.345678',66,66,3,0);
INSERT INTO records VALUES (32,30,89,'2013-04-13 16:20:12.345678',68,58,3,0);
INSERT INTO records VALUES (33,10,78,'2013-04-12 16:20:12.345678',77,52,3,0);
INSERT INTO records VALUES (34,16,69,'2013-04-11 16:20:12.345678',99,57,3,0);
INSERT INTO records VALUES (35,12,50,'2013-04-10 16:20:12.345678',48,88,3,0);
INSERT INTO records VALUES (36,30,50,'2013-04-08 16:20:12.345678',78,87,3,0);

/* Usuario "OTRO" instalación "Casa" */

INSERT INTO records VALUES (37,10,18,'2013-04-12 16:20:12.345678',77,12,4,1);
INSERT INTO records VALUES (38,43,11,'2013-04-11 16:20:12.345678',99,45,4,1);
INSERT INTO records VALUES (39,43,13,'2013-04-10 16:20:12.345678',48,65,4,1);
INSERT INTO records VALUES (40,30,11,'2013-04-08 16:20:12.345678',78,87,4,1);