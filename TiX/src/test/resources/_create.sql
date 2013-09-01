DROP TABLE IF EXISTS  "Friend" CASCADE;
DROP TABLE IF EXISTS  "PasswordRecoveryRequest" CASCADE;
DROP TABLE IF EXISTS  "ProfileImage" CASCADE;
DROP TABLE IF EXISTS  "Publications" CASCADE;
DROP TABLE IF EXISTS  "SimpleNotification" CASCADE;
DROP TABLE IF EXISTS  "RequestNotification" CASCADE;
DROP TABLE IF EXISTS  "Notification" CASCADE;
DROP TABLE IF EXISTS  "User" CASCADE;

SET DATESTYLE TO US, SQL;

CREATE TABLE "User"
(
  id serial NOT NULL PRIMARY KEY,
  nickname character varying(40) NOT NULL UNIQUE,
  name character varying(40) NOT NULL,
  surname character varying(40) NOT NULL,
  email character varying(40) NOT NULL UNIQUE,
  password character varying(40) NOT NULL,
  birthdate timestamp NOT NULL
);
ALTER TABLE "User" OWNER TO paw;


CREATE TABLE "Friend"
(
  "idFrom" integer NOT NULL,
  "idTo" integer NOT NULL,
  CONSTRAINT "PK_FRIEND" PRIMARY KEY ("idFrom" , "idTo")
);
ALTER TABLE "Friend" OWNER TO paw;
ALTER TABLE "Friend" ADD CONSTRAINT "FK_ID_FROM" FOREIGN KEY ("idFrom") REFERENCES "User" (id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE CASCADE;
ALTER TABLE "Friend" ADD CONSTRAINT "FK_ID_TO" FOREIGN KEY ("idTo") REFERENCES "User" (id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE CASCADE;

CREATE TABLE "PasswordRecoveryRequest"
(
   "UserId" integer NOT NULL, 
   "Cod" character varying NOT NULL UNIQUE, 
    PRIMARY KEY ("UserId"),
    FOREIGN KEY ("UserId") REFERENCES "User"(id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE CASCADE
);
ALTER TABLE "PasswordRecoveryRequest" OWNER TO paw;


CREATE TABLE "ProfileImage"
(
  "UserId" integer NOT NULL,
  "Image" bytea NOT NULL,
  CONSTRAINT "ProfileImage_pkey" PRIMARY KEY ("UserId" ),
  CONSTRAINT "ProfileImage_UserId_fkey" FOREIGN KEY ("UserId")
      REFERENCES "User" (id) MATCH SIMPLE
	ON UPDATE RESTRICT ON DELETE CASCADE
);
ALTER TABLE "ProfileImage" OWNER TO paw;          


CREATE TABLE "Publications"
(
  "id" SERIAL NOT NULL,
  "UserId" integer NOT NULL,
  "data" character varying(200) NOT NULL,
  "date" timestamp NOT NULL,
  CONSTRAINT "Publications_pkey" PRIMARY KEY ("id"),
  CONSTRAINT "Publications_UserId_fkey" FOREIGN KEY ("UserId")
      REFERENCES "User" (id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE CASCADE
);
ALTER TABLE "Publications" OWNER TO paw;	


CREATE TABLE "Notification"
(
  "id" serial NOT NULL,
  "creationDate" timestamp NOT NULL,
  "read" boolean NOT NULL,
  "fromUserId" integer NOT NULL,
  "toUserId" integer NOT NULL,
  CONSTRAINT "PK_ID" PRIMARY KEY (id ),
  CONSTRAINT "FK_NOTIF_ID_FROM" FOREIGN KEY ("fromUserId") REFERENCES "User" (id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE CASCADE,
  CONSTRAINT "FK_NOTIF_ID_TO" FOREIGN KEY ("toUserId") REFERENCES "User" (id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE CASCADE
);
ALTER TABLE "Notification" OWNER TO paw;


CREATE TABLE "RequestNotification"(
  "notificationId" serial NOT NULL,
  "type" character varying(40) NOT NULL,
  "pending" boolean NOT NULL,
  PRIMARY KEY ("notificationId"),
  CONSTRAINT "FK_SIMPLENOTIF_ID" FOREIGN KEY ("notificationId") REFERENCES "Notification" (id)
);
ALTER TABLE "RequestNotification" OWNER TO paw;


CREATE TABLE "SimpleNotification"
(
  "notificationId" integer NOT NULL,
  "type" character varying(40) NOT NULL,
  PRIMARY KEY ("notificationId"),
  CONSTRAINT "FK_SIMPLENOTIF_ID" FOREIGN KEY ("notificationId") REFERENCES "Notification" (id)
);
ALTER TABLE "SimpleNotification" OWNER TO paw;

