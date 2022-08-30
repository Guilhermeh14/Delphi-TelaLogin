CREATE DATABASE IF NOT EXISTS  Login;
USE Login;

CREATE TABLE Login (
	Usuario VARCHAR(30),
    Senha VARCHAR(30),
    PRIMARY KEY(Usuario)
);

INSERT INTO Login VALUES
('gui','gui3641');