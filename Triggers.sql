CREATE TRIGGER INSERTINTOPLAYS AFTER INSERT ON Game
    FOR EACH ROW BEGIN
        INSERT INTO Plays(PID, GID)
        SELECT Game.P1, Game.ID
        FROM Game 
        WHERE Game.ID = (SELECT MAX(ID) FROM Game);

        INSERT INTO Plays(PID, GID)
        SELECT Game.P2, Game.ID
        FROM Game 
        WHERE Game.ID = (SELECT MAX(ID) FROM Game);

        INSERT INTO Plays(PID, GID)
        SELECT Game.P3, Game.ID
        FROM Game 
        WHERE Game.ID = (SELECT MAX(ID) FROM Game);

        INSERT INTO Plays(PID, GID)
        SELECT Game.P4, Game.ID
        FROM Game 
        WHERE Game.ID = (SELECT MAX(ID) FROM Game);

        UPDATE Plays, Game SET Plays.WINNER = 'Y'
        WHERE (Plays.PID = Game.Winner);

    END$$

CREATE TRIGGER INSERTINTOHAS AFTER INSERT ON Game
    FOR EACH ROW BEGIN
        INSERT INTO Has(GID, PID, DID)
        SELECT Game.ID, Game.P1, Game.D1
        From Game
        WHERE Game.ID = (SELECT MAX(ID) FROM Game);

        INSERT INTO Has(GID, PID, DID)
        SELECT Game.ID, Game.P2, Game.D3
        From Game
        WHERE Game.ID = (SELECT MAX(ID) FROM Game);

        INSERT INTO Has(GID, PID, DID)
        SELECT Game.ID, Game.P3, Game.D3
        From Game
        WHERE Game.ID = (SELECT MAX(ID) FROM Game);

        INSERT INTO Has(GID, PID, DID)
        SELECT Game.ID, Game.P3, Game.D3
        From Game
        WHERE Game.ID = (SELECT MAX(ID) FROM Game);

    END$$