SET DATESTYLE TO US, SQL;

INSERT INTO users (birthdate, email, firstname, lastname, nickname, password) VALUES
	('1/6/1992', 'gcastigl@gmail.com', 'Gonzalo', 'Castiglione', 'gcastigl', '123456'),
	('5/26/1992', 'jmozzino@gmail.com', 'Jorge', 'Mozzino', 'xp500', '123456'),
	('11/12/1992', 'karpoa@gmail.com', 'Alan', 'Karpovsky', 'karpo', '123456'),
	('11/16/1992', 'farolfo@gmail.com', 'Franco', 'Arolfo', 'farolfo', '123456');

INSERT INTO users_users (users_id, friends_id) VALUES 
	(1, 2), (2, 1),
	(2,3), (3,2);
