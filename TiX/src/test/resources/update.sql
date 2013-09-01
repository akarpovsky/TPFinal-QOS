ALTER TABLE "Friend" RENAME TO __friend;
ALTER TABLE "Notification" RENAME TO __notification;
ALTER TABLE "ProfileImage" RENAME TO __profileimage;
ALTER TABLE "Publications" RENAME TO __publication;
ALTER TABLE "RequestNotification" RENAME TO __requestnotification;
ALTER TABLE "User" RENAME TO __user;
ALTER TABLE "SimpleNotification" RENAME TO __simplenotification;
ALTER TABLE "PasswordRecoveryRequest" RENAME TO __passwordrecoveryrequest;

-- ejecutar spring2_dump.sql!!!

insert into users(id, nickname, firstname, lastname, email, password, birthdate, daysaheadtoshowbdays, image) 
	select id, nickname, name, surname, email, password, birthdate, 5, null from __user;

insert into users_users(users_id, friends_id) 
	select "idFrom", "idTo" from __friend;

insert into notification(id, creationdate, read, from_id, to_id) 
	select id, "creationDate", read, "fromUserId", "toUserId" 
	from __notification n
	where NOT EXISTS(select * from __requestnotification r where r."notificationId" = n.id);

insert into simplenotification (id, type) 
	select "notificationId", 'FRIENDSHIP_REQUESTED' from __simplenotification;

update users set passwordrecoveryrequestcode = (select "Cod" from __passwordrecoveryrequest where "UserId" = id);

update users set image = (select "Image" from __profileimage p where users.id = p."UserId");

insert into simplepublication(id, data, date, owner_id, target_id) 
	select id, data, date, "UserId", "UserId" from __publication;

insert into request(id, creationdate, pending, read, from_id, to_id) 
	select "notificationId", "creationDate", pending, read, "fromUserId", "toUserId" 
	from __requestnotification r, __notification n
	where r."notificationId" = n.id;

insert into friendrequest select "notificationId" from __requestnotification;

-- update sequences
SELECT setval('users_id_seq', (select greatest(count(*), 1) from users), 't');
SELECT setval('notification_id_seq', (select greatest(count(*), 1) from notification), 't');
SELECT setval('publicationcomment_id_seq', (select greatest(count(*), 1) from simplepublication), 't');
SELECT setval('request_id_seq', (select greatest(count(*), 1) from request), 't');

insert into hibernate_sequences(sequence_name, sequence_next_hi_value) values ('AbstractPublication', 1);

-- drop all tables along with its segquences
DROP TABLE __friend CASCADE;
DROP TABLE __notification CASCADE;
DROP TABLE __profileimage CASCADE;
DROP TABLE __publication CASCADE;
DROP TABLE __requestnotification CASCADE;
DROP TABLE __user CASCADE;
DROP TABLE __simplenotification CASCADE;
DROP TABLE __passwordrecoveryrequest CASCADE;