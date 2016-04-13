-- SectionTextTable – { SectionNumber (PK), Title, TextContent  }
-- ANOVATable – {DataSetName(PK), DF_Metric, DF_Error, DF_CTotal, SS_Metric, SS_Error, SS_CTotal, MS_Metric, MS_Error, F_Ratio, ProbF, SectionNumber (FK)  }
-- MeanRankScoreTable – { DataSetName (PK), GOID (PK),  Metric, Value, SectionNumber}
--  **MeanRankScoreTable - { DataSetName (PK), GOID (PK), CM, ESM, MI, SS, RMSD, rRMSD, SI, TMSCORE, wRMSD, SO }
-- Image – {FileName (PK), SectionNumber} 

CREATE DATABASE teamproj;

USE teamproj;

CREATE TABLE SectionTextTable (
    SectionNumber INT(6) NOT NULL,
    Title VARCHAR(12),
    TextContent TEXT,
    PRIMARY KEY (SectionNumber)
);

CREATE TABLE ANOVATable (
    DataSetName VARCHAR(15) NOT NULL,
    DF_Metric INT(6),
    DF_Error INT(6),
    DF_CTotal INT(6),
    SS_Metric INT(10),
    SS_Error INT(10),
    SS_CTotal INT(10),
    MS_Metric INT(10),
    MS_Error INT(10),
    F_Ratio DECIMAL(6, 4),
    ProbF DECIMAL(6, 4),
    SectionNumber INT(6),
    FOREIGN KEY (SectionNumber) REFERENCES SectionTextTable(SectionNumber) ON DELETE CASCADE,
    PRIMARY KEY (DataSetName)
);

CREATE TABLE MeanRankScoreTable (
    DataSetName VARCHAR(15) NOT NULL,
    GOID INT(6) NOT NULL,
    CM INT(6),
    ESM INT(6),
    MI INT(6),
    SS INT(6),
    SSRMSD INT(6),
    rRMSD INT(6),
    SI INT(6),
    TMSCORE INT(6),
    wRMSD INT(6),
    SO INT(6),
    SectionNumber Int(6),    
    FOREIGN KEY (SectionNumber) REFERENCES SectionTextTable(SectionNumber) ON DELETE CASCADE,
    FOREIGN KEY (DataSetName) REFERENCES ANOVATable(DataSetName) ON DELETE CASCADE,
    PRIMARY KEY (DataSetName, GOID)
);

CREATE TABLE Image (
    FileName VARCHAR(15) NOT NULL,
    SectionNumber INT(6),
    FOREIGN KEY (SectionNumber) REFERENCES SectionTextTable(SectionNumber) ON DELETE CASCADE,
    PRIMARY KEY (FileName)
);

INSERT INTO SectionTextTable VALUES
    (2, "Title", "Text Content");

INSERT INTO ANOVATable VALUES
    ("Proteus300", 9, 170, 179, 13569157, 73592772, 87161929, 1507684, 432899, 3.4828, 0.0006, 2);

INSERT INTO MeanRankScoreTable VALUES
    ("Proteus300", 16301, 2708, 1193, 845,  2690, 1342, 2321, 851,  1140, 2637, 872,  2),
    ("Proteus300", 16491, 2286, 2161, 2000, 2285, 2061, 2237, 2001, 1542, 1780, 1984, 2),
    ("Proteus300", 166,   2362, 1798, 1597, 2369, 1727, 2138, 1598, 1427, 1999, 1631, 2),
    ("Proteus300", 16740, 1972, 1949, 1996, 1970, 1990, 1887, 1996, 1889, 1863, 2015, 2),
    ("Proteus300", 16746, 3163, 3241, 3353, 3166, 3301, 2954, 3352, 670,  315,  3347, 2),
    ("Proteus300", 16787, 2370, 2362, 1936, 2367, 2450, 2787, 1950, 1436, 1572, 1887, 2),
    ("Proteus300", 16798, 3483, 3286, 3173, 3467, 3067, 3276, 3184, 391,  913,  3083, 2),
    ("Proteus300", 16829, 2850, 2252, 2270, 2846, 2281, 2578, 2277, 964,  1484, 2236, 2), 
    ("Proteus300", 16853, 3213, 2903, 2516, 3212, 2690, 3094, 2509, 562,  963,  2544, 2),
    ("Proteus300", 3677,  1836, 1982, 1571, 1840, 1981, 1909, 1573, 1985, 2019, 1602, 2),
    ("Proteus300", 3779,  3597, 3542, 3263, 3577, 3319, 3568, 3285, 263,  560,  3003, 2),
    ("Proteus300", 42802, 3547, 3613, 3825, 3549, 3818, 3825, 3822, 306,  660,  3808, 2),
    ("Proteus300", 4298,  3497, 3522, 3628, 3503, 3631, 3591, 3630, 351,  280,  3567, 2),
    ("Proteus300", 4497,  3773, 3650, 3386, 3758, 4476, 3497, 3387, 98,   427,  3353, 2),
    ("Proteus300", 46872, 1650, 1874, 2093, 1654, 1880, 1731, 2088, 2278, 2006, 2100, 2),
    ("Proteus300", 4871,  2,    2897, 12,   2,    3841, 3853, 238,  3652, 488,  1,    2),
    ("Proteus300", 5344,  2737, 2935, 3255, 2770, 3076, 2969, 3245, 1108, 745,  3278, 2),
    ("Proteus300", 5515,  1618, 1649, 1540, 1612, 1767, 1731, 1543, 2145, 2090, 1535, 2),
    ("Proteus300", 5524,  2635, 1904, 1699, 2660, 1969, 2590, 1705, 1136, 1920, 1755, 2),
    ("Proteus300", 5525,  2552, 2397, 2264, 2560, 2159, 2354, 2274, 1266, 1422, 2214, 2),
    ("Proteus300", 8233,  3497, 5522, 3628, 3503, 3631, 3591, 3630, 351,  280,  3567, 2),
    ("Proteus300", 8483,  3789, 3728, 3590, 3776, 3573, 3653, 3586, 75,   347,  3651, 2);
    