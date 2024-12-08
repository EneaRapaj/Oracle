           SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = "tabnam";
DELETE FROM LENDA ;
DROP TABLE DEPARTAMENTI_STUDENTI  ;
DROP TABLE NOTA  ;
DROP TABLE LENDA ;
DROP TABLE STUDENTI ; 
DROP TABLE DEPARTAMENTI;  
--Krijimi  sequencave primary key per tabelat Departamenti dhe Lenda (Krijimi tyre)

CREATE SEQUENCE DepartamentiID_Seq START WITH 1 INCREMENT BY 1;
CREATE TABLE Departamenti (
    DepartamentiID INT DEFAULT DepartamentiID_Seq.NEXTVAL PRIMARY KEY,
    EmriDepartamentit VARCHAR(50) NOT NULL
);

CREATE SEQUENCE LendaID_Seq START WITH 1 INCREMENT BY 1;
CREATE TABLE Lenda (
    LendaID INT DEFAULT LendaID_Seq.NEXTVAL PRIMARY KEY,
    EmriLendes VARCHAR(50) NOT NULL
);

SELECT * FROM Departamenti;
SELECT * FROM Lenda;

--Krijimi Tabelave Tjera 3 cope

CREATE TABLE Studenti (
    StudentiID INT PRIMARY KEY,
    Emri VARCHAR(50) NOT NULL,
    Mbiemri VARCHAR(50) NOT NULL,
    DepartamentiID INT,
    FOREIGN KEY (DepartamentiID) REFERENCES Departamenti(DepartamentiID)
);
SELECT * FROM Studenti;
CREATE TABLE Nota (
    NotaID INT PRIMARY KEY,
    Nota DECIMAL(3, 1) NOT NULL CHECK (Nota BETWEEN 4 AND 10),
    LendaID INT,
    StudentiID INT,
     Data_Nota DATE  ,
    FOREIGN KEY (LendaID) REFERENCES Lenda(LendaID),
    FOREIGN KEY (StudentiID) REFERENCES Studenti(StudentiID)
   
);
SELECT * FROM Nota;

CREATE TABLE Departamenti_Studenti (
    DepartamentiStudentiID INT PRIMARY KEY,
    DepartamentiID INT,
    StudentiID INT,
    FOREIGN KEY (DepartamentiID) REFERENCES Departamenti(DepartamentiID),
    FOREIGN KEY (StudentiID) REFERENCES Studenti(StudentiID)
);

SELECT * FROM Nota;

--shtojmë një kufizim të tipit CHECK që vlerësimi të jetë midis 4 

ALTER TABLE Nota
ADD CONSTRAINT CheckNotaRange CHECK (Nota BETWEEN 4 AND 10);

--Shtimi elementeve neper tabela
-- Popullimi i tabelës Departamenti
INSERT INTO Departamenti (EmriDepartamentit) VALUES ('Inxhinieri Kompjuterike');
INSERT INTO Departamenti (EmriDepartamentit) VALUES ('Matematikë');
INSERT INTO Departamenti (EmriDepartamentit) VALUES ('Inxhinjeri Elektronike');
INSERT INTO Departamenti (EmriDepartamentit) VALUES ('IMI');
INSERT INTO Departamenti (EmriDepartamentit) VALUES ('Inxhinjeri Informatike');
INSERT INTO Departamenti (EmriDepartamentit) VALUES ('Inxhinjeri Telekom');
INSERT INTO Departamenti (EmriDepartamentit) VALUES ('Inxhinjeri Software');
SELECT * FROM Departamenti;
 -- Popullimi i tabelës Lenda

INSERT INTO Lenda (EmriLendes) VALUES ('Programim');
INSERT INTO Lenda (EmriLendes) VALUES ('Analizë Matematikore');
INSERT INTO Lenda (EmriLendes) VALUES ('Fizike');
INSERT INTO Lenda (EmriLendes) VALUES ('Elektroteknike 1');
INSERT INTO Lenda (EmriLendes) VALUES ('Probbilitet');
INSERT INTO Lenda (EmriLendes) VALUES ('Komunikim Inxhinjerik');
SELECT * FROM Lenda;

-- Popullimi i tabelës Studenti
INSERT INTO Studenti (StudentiID,Emri, Mbiemri, DepartamentiID) VALUES (1,'John', 'Doe', 21);
INSERT INTO Studenti (StudentiID,Emri, Mbiemri, DepartamentiID) VALUES (2,'Ben', 'Muco', 22);
INSERT INTO Studenti (StudentiID,Emri, Mbiemri, DepartamentiID) VALUES (3,'Kesi', 'Kovalsi', 24);
INSERT INTO Studenti (StudentiID,Emri, Mbiemri, DepartamentiID) VALUES (4,'Besiana', 'Mucolli', 27);
INSERT INTO Studenti (StudentiID,Emri, Mbiemri, DepartamentiID) VALUES (5,'Iliriano', 'Lara', 23);
INSERT INTO Studenti (StudentiID,Emri, Mbiemri, DepartamentiID) VALUES (6,'Erlinda', 'Orogeni', 23);
INSERT INTO Studenti (StudentiID,Emri, Mbiemri, DepartamentiID) VALUES (7,'Ariel', 'Dudushi', 25);
INSERT INTO Studenti (StudentiID,Emri, Mbiemri, DepartamentiID) VALUES (8,'Nikol', 'Dauti', 25);
INSERT INTO Studenti (StudentiID,Emri, Mbiemri, DepartamentiID) VALUES (9,'Manuela', 'Hoxha', 26);
INSERT INTO Studenti (StudentiID,Emri, Mbiemri, DepartamentiID) VALUES (10,'Ariana', 'Gjimani', 26);
SELECT * FROM Studenti;

-- Popullimi i tabelës Nota
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (1,8, 21, 1, TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (2,8, 22, 1,TO_DATE('2023/10/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (3,8, 23, 1,TO_DATE('2023/10/07 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (4,5, 24, 1,TO_DATE('2023/10/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (5,6, 25, 1,TO_DATE('2023/10/26 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (6,10, 26, 1,TO_DATE('2023/10/30 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (7,10, 21, 2,TO_DATE('2023/11/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (8,10, 22, 2,TO_DATE('2023/07/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (9,10, 23, 2,TO_DATE('2023/12/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (10,10, 24, 2,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (11,10, 25, 2,TO_DATE('2023/07/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (12,10, 26, 2,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (13,5, 21, 3,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (14,7, 22, 3,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (15,7, 23, 3,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (16,8, 24, 3,TO_DATE('2023/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (17,6, 25, 3,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (18,5, 26, 3,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (19,8, 21, 4,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (20,7, 22, 4,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (21,8, 23, 4,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (22,7, 24, 4,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (23,8, 25, 4,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (24,7, 26, 4,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (25,7, 21, 5,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (26,9, 22, 5,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (27,6, 23, 5,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (28,6, 24, 5,TO_DATE('2023/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (29,7, 25, 5,TO_DATE('2023/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (30,7, 26, 5,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (31,8, 21, 6,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (32,8, 22, 6,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (33,8, 23, 6,TO_DATE('2023/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (34,9, 24, 6,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (35,9, 25, 6,TO_DATE('2023/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (36,10, 26, 6,TO_DATE('2023/09/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (37,5, 21, 7,TO_DATE('2023/04/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (38,8, 22, 7,TO_DATE('2023/08/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (39,8, 23, 7,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (40,8, 24, 7,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (41,8, 25, 7,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (42,8, 26, 7,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (43,9, 21, 8,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (44,7, 22, 8,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (45,9, 23, 8,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (46,7, 24, 8,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (47,9, 25, 8,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (48,7, 26, 8,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (49,8, 21, 9,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (50,8, 22, 9,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (51,8, 23, 9,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (52,8, 24, 9,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (53,8, 25, 9,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (54,8, 26, 9,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (55,7, 21, 10,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (56,7, 22, 10,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (57,7, 23, 10,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (58,7, 24, 10,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (59,7, 25, 10,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO Nota (NotaId,Nota, LendaID, StudentiID,Data_Nota) VALUES (60,7, 26, 10,TO_DATE('2023/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));

SELECT * FROM Nota;


-- Listo të gjithë studentët dhe emrat e departamenteve përkatëse
SELECT S.Emri, S.Mbiemri, D.EmriDepartamentit
FROM Studenti S
JOIN Departamenti D ON S.DepartamentiID = D.DepartamentiID;

-- Listo studentët që kanë të paktën 2 nota mbi 8
SELECT S.Emri, S.Mbiemri
FROM Studenti S
JOIN Nota N ON S.StudentiID = N.StudentiID
WHERE N.Nota > 8
GROUP BY S.StudentiID,S.Emri,S.Mbiemri
HAVING COUNT(N.NotaID) >= 2;

SELECT * FROM NOTA ;

-- Llogarit notën mesatare të çdo lënde dhe listo vetëm ato me mesatare mbi 7
SELECT L.EmriLendes, AVG(N.Nota) AS Mesatarja
FROM Lenda L
JOIN Nota N ON L.LendaID = N.LendaID
GROUP BY L.LendaID,L.EmriLendes
HAVING AVG(N.Nota) > 7;

-- Listo listën e studentëve dhe notat e tyre për çdo lëndë
SELECT S.Emri, S.Mbiemri, L.EmriLendes, N.Nota
FROM Studenti S
JOIN Nota N ON S.StudentiID = N.StudentiID
JOIN Lenda L ON N.LendaID = L.LendaID;

-- Rankimi studenteve
CREATE VIEW RankStudentet AS
SELECT S.Emri, S.Mbiemri, AVG(N.Nota) AS Mesatarja, RANK() OVER (ORDER BY AVG(N.Nota) DESC) AS Renditja
FROM Studenti S
JOIN Nota N ON S.StudentiID = N.StudentiID
GROUP BY S.StudentiID,S.Emri, S.Mbiemri;

-- Rankimi studenteve 2 muaj

CREATE VIEW Mesatarja_Departamenti AS
SELECT D.EmriDepartamentit, AVG(N.Nota) AS Mesatarja
FROM Departamenti D
JOIN Studenti S ON D.DepartamentiID = S.DepartamentiID
JOIN NOTA N ON S.STUDENTIID = N.STUDENTIID
WHERE 
    Data_Nota >= ADD_MONTHS(SYSDATE, -2)
GROUP BY D.EmriDepartamentit ;

SELECT D.EmriDepartamentit, AVG(N.Nota) AS Mesatarja
FROM Departamenti D
JOIN Studenti S ON D.DepartamentiID = S.DepartamentiID
JOIN NOTA N ON S.STUDENTIID = N.STUDENTIID
WHERE 
    Data_Nota >= ADD_MONTHS(SYSDATE, -2)
GROUP BY D.EmriDepartamentit ;



