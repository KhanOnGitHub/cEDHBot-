CREATE TRIGGER INSERTINTORELATIONS AFTER INSERT ON Game
    BEGIN
        INSERT INTO Plays(PID, GID)
        SELECT G.PID1, G.ID
        FROM Game G
        WHERE G.ID = (SELECT MAX(ID) FROM Game);

        INSERT INTO Plays(PID, GID)
        SELECT G.PID2, G.ID
        FROM Game G
        WHERE G.ID = (SELECT MAX(ID) FROM Game);

        INSERT INTO Plays(PID, GID)
        SELECT G.PID3, G.ID
        FROM Game G
        WHERE G.ID = (SELECT MAX(ID) FROM Game);

        INSERT INTO Plays(PID, GID)
        SELECT G.PID4, G.ID
        FROM Game G
        WHERE G.ID = (SELECT MAX(ID) FROM Game);

        UPDATE Plays, Game SET Plays.WINNER = 'Y'
        WHERE (Plays.PID = Game.Winner);

    END;