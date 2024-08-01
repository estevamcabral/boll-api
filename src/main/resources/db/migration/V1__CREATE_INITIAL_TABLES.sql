-- Criação do schema se ele não existir
CREATE SCHEMA IF NOT EXISTS privateSchema;

-- Criação da tabela COMPANY
CREATE TABLE privateSchema.COMPANY (
                                       id VARCHAR(36) NOT NULL,
                                       name VARCHAR(40),
                                       email VARCHAR(40),
                                       cnpj VARCHAR(14),
                                       CONSTRAINT PK_COMPANY PRIMARY KEY (id)
);

-- Criação da tabela COURT
CREATE TABLE privateSchema.COURT (
                                     id VARCHAR(36) NOT NULL,
                                     id_company VARCHAR(36) NOT NULL,
                                     type VARCHAR(30) NOT NULL,
                                     CONSTRAINT PK_COURT PRIMARY KEY (id),
                                     CONSTRAINT FK_COURT_0 FOREIGN KEY (id_company) REFERENCES privateSchema.COMPANY (id)
);

-- Criação da tabela DATE
CREATE TABLE privateSchema.DATE (
                                    id VARCHAR(36) NOT NULL,
                                    id_court VARCHAR(36) NOT NULL,
                                    day DATE NOT NULL,
                                    hour_start TIME(0) NOT NULL,
                                    hour_end TIME(0) NOT NULL,
                                    price DECIMAL(5,2) NOT NULL,
                                    isAvailable BIT(1) DEFAULT '1' NOT NULL,
                                    CONSTRAINT PK_DATE PRIMARY KEY (id, id_court),
                                    CONSTRAINT FK_DATE_0 FOREIGN KEY (id_court) REFERENCES privateSchema.COURT (id)
);

-- Criação da tabela GAME
CREATE TABLE privateSchema.GAME (
                                    id VARCHAR(36) NOT NULL,
                                    isOpen BIT(1) DEFAULT '0' NOT NULL,
                                    numberPlayers INT DEFAULT 0,
                                    spaceAvailable INT DEFAULT 0,
                                    id_date VARCHAR(36) NOT NULL,
                                    id_court VARCHAR(36) NOT NULL,
                                    CONSTRAINT PK_GAME PRIMARY KEY (id),
                                    CONSTRAINT FK_GAME_0 FOREIGN KEY (id_date, id_court) REFERENCES privateSchema.DATE (id, id_court)
);

-- Criação da tabela PLAYER
CREATE TABLE privateSchema.PLAYER (
                                      id VARCHAR(36) NOT NULL,
                                      name VARCHAR(40) NOT NULL,
                                      email VARCHAR(40) NOT NULL,
                                      telephone VARCHAR(11) NOT NULL,
                                      CONSTRAINT PK_PLAYER PRIMARY KEY (id)
);

-- Criação da tabela GAME_PLAYER
CREATE TABLE privateSchema.GAME_PLAYER (
                                           id_player VARCHAR(36) NOT NULL,
                                           id_game VARCHAR(36) NOT NULL,
                                           CONSTRAINT PK_GAME_PLAYER PRIMARY KEY (id_player, id_game),
                                           CONSTRAINT FK_GAME_PLAYER_PLAYERID FOREIGN KEY (id_player) REFERENCES privateSchema.PLAYER (id),
                                           CONSTRAINT FK_GAME_PLAYER_GAMEID FOREIGN KEY (id_game) REFERENCES privateSchema.GAME (id)
);
