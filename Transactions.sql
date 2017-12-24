--find
SELECT G.ID, G.P1, G.P2, G.P3, G.P4, G.D1, G.D2, G.D3, G.D4
FROM Game
WHERE G.P1 = ? OR G.P2 = ? OR G.P3 = ? OR G.P4 = ?;