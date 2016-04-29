DROP DATABASE teamproj;

CREATE DATABASE teamproj;

USE teamproj;

-- SectionTextTable
CREATE TABLE SectionTextTable (
    SectionNumber INT(6) NOT NULL,
    Title VARCHAR(12),
    TextContent TEXT,
    PRIMARY KEY (SectionNumber)
);

-- ANOVATable
CREATE TABLE ANOVATable (
    DataSetName VARCHAR(15) NOT NULL,
    DF_Metric INT(6),
    DF_Error INT(6),
    DF_CTotal INT(6),
    SS_Metric INT(10),
    SS_Error BIGINT(12),
    SS_CTotal INT(10),
    MS_Metric INT(10),
    MS_Error INT(10),
    F_Ratio DECIMAL(6, 4),
    ProbF DECIMAL(6, 4),
    SectionNumber INT(6),
    FOREIGN KEY (SectionNumber) REFERENCES SectionTextTable(SectionNumber) ON DELETE CASCADE,
    PRIMARY KEY (DataSetName)
);

-- MeanRankScoreTable
CREATE TABLE MeanRankScoreTable (
    DataSetName VARCHAR(15) NOT NULL,
    GOID INT(6) NOT NULL,
    CM INT(6),
    ESM INT(6),
    MI INT(6),
    SS INT(6),
    RMSD INT(6),
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

-- Image
CREATE TABLE Image (
    FileName VARCHAR(15) NOT NULL,
    SectionNumber INT(6),
    FOREIGN KEY (SectionNumber) REFERENCES SectionTextTable(SectionNumber) ON DELETE CASCADE,
    PRIMARY KEY (FileName)
);

INSERT INTO SectionTextTable VALUES
    (2, "Title", "Text Content"),
    (4, "Title", "Text Content"),
    (6, "Title", "Text Content");

INSERT INTO ANOVATable VALUES
    ("Proteus300",   9, 170, 179, 13569157,   73592772,   87161929, 1507684,   432899,   3.4828,  0.0006, 2),
    ("Homestrad150", 9, 170, 179, 13569157,   73592772,   87161929, 1507684,   432899,   3.4828,  0.0006, 4),
    ("UC350",        9, 530, 539, 1112516443, 6182332735, 72948491, 123612938, 11664779, 10.5971, 0.0001, 6);

INSERT INTO MeanRankScoreTable VALUES
    ("Proteus300",   16301,  2708,   1193,  845,    2690,   1342,  2321,   851,    1140,   2637,   872,  2),
    ("Proteus300",   16491,  2286,   2161,  2000,   2285,   2061,  2237,   2001,   1542,   1780,   1984, 2),
    ("Proteus300",   166,    2362,   1798,  1597,   2369,   1727,  2138,   1598,   1427,   1999,   1631, 2),
    ("Proteus300",   16740,  1972,   1949,  1996,   1970,   1990,  1887,   1996,   1889,   1863,   2015, 2),
    ("Proteus300",   16746,  3163,   3241,  3353,   3166,   3301,  2954,   3352,   670,    315,    3347, 2),
    ("Proteus300",   16787,  2370,   2362,  1936,   2367,   2450,  2787,   1950,   1436,   1572,   1887, 2),
    ("Proteus300",   16798,  3483,   3286,  3173,   3467,   3067,  3276,   3184,   391,    913,    3083, 2),
    ("Proteus300",   16829,  2850,   2252,  2270,   2846,   2281,  2578,   2277,   964,    1484,   2236, 2), 
    ("Proteus300",   16853,  3213,   2903,  2516,   3212,   2690,  3094,   2509,   562,    963,    2544, 2),
    ("Proteus300",   3677,   1836,   1982,  1571,   1840,   1981,  1909,   1573,   1985,   2019,   1602, 2),
    ("Proteus300",   3779,   3597,   3542,  3263,   3577,   3319,  3568,   3285,   263,    560,    3003, 2),
    ("Proteus300",   42802,  3547,   3613,  3825,   3549,   3818,  3825,   3822,   306,    660,    3808, 2),
    ("Proteus300",   4298,   3497,   3522,  3628,   3503,   3631,  3591,   3630,   351,    280,    3567, 2),
    ("Proteus300",   4497,   3773,   3650,  3386,   3758,   4476,  3497,   3387,   98,     427,    3353, 2),
    ("Proteus300",   46872,  1650,   1874,  2093,   1654,   1880,  1731,   2088,   2278,   2006,   2100, 2),
    ("Proteus300",   4871,   2,      2897,  12,     2,      3841,  3853,   238,    3652,   488,    1,    2),
    ("Proteus300",   5344,   2737,   2935,  3255,   2770,   3076,  2969,   3245,   1108,   745,    3278, 2),
    ("Proteus300",   5515,   1618,   1649,  1540,   1612,   1767,  1731,   1543,   2145,   2090,   1535, 2),
    ("Proteus300",   5524,   2635,   1904,  1699,   2660,   1969,  2590,   1705,   1136,   1920,   1755, 2),
    ("Proteus300",   5525,   2552,   2397,  2264,   2560,   2159,  2354,   2274,   1266,   1422,   2214, 2),
    ("Proteus300",   8233,   3497,   5522,  3628,   3503,   3631,  3591,   3630,   351,    280,    3567, 2),
    ("Proteus300",   8483,   3789,   3728,  3590,   3776,   3573,  3653,   3586,   75,     347,    3651, 2);

INSERT INTO MeanRankScoreTable VALUES
    ("Homestrad150", 166,    1680,   846,   818,    1677,   951,   1606,   819,    649,    1340,   826,  4),
    ("Homestrad150", 16740,  1183,   834,   757,    1182,   774,   1413,   750,    942,    1320,   769,  4),
    ("Homestrad150", 16787,  1482,   750,   949,    1473,   832,   1776,   950,    1017,   1204,   927,  4),
    ("Homestrad150", 16798,  2333,   56,    146,    2333,   478,   2019,   154,    94,     1530,   190,  4),
    ("Homestrad150", 16853,  1805,   724,   589,    1779,   917,   1106,   596,    716,    1464,   612,  4),
    ("Homestrad150", 16874,  1878,   919,   564,    1876,   981,   1799,   566,    372,    1327,   595,  4),
    ("Homestrad150", 19843,  753,    1887,  1172,   757,    1962,  1614,   1279,   1165,   156,    705,  4),
    ("Homestrad150", 3723,   526,    1435,  835,    528,    1242,  913,    858,    1726,   1085,   743,  4),
    ("Homestrad150", 44548,  2179,   2283,  2337,   2194,   2337,  2335,   2337,   134,    1909,   2292, 4),
    ("Homestrad150", 46872,  1176,   1199,  1230,   1176,   1203,  1169,   1229,   1179,   1152,   1234, 4),
    ("Homestrad150", 4812,   1406,   1407,  37,     1368,   1246,  1951,   38,     565,    1038,   30,   4),
    ("Homestrad150", 49,     276,    1443,  880,    308,    1383,  1710,   850,    2313,   2069,   929,  4),
    ("Homestrad150", 5104,   2179,   2283,  2337,   2194,   2337,  2335,   2337,   134,    1909,   2292, 4),
    ("Homestrad150", 5344,   2209,   2214,  2206,   2208,   2199,  2201,   2204,   141,    343,    2206, 4),
    ("Homestrad150", 5515,   1216,   1016,  1002,   1219,   994,   1187,   999,    1119,   1426,   1015, 4),
    ("Homestrad150", 5524,   1789,   875,   706,    1785,   962,   1691,   709,    507,    1312,   714,  4),
    ("Homestrad150", 8083,   2179,   2283,  2337,   2194,   2337,  2335,   2337,   134,    1909,   2292, 4),
    ("Homestrad150", 8201,   2179,   2283,  2337,   2194,   2337,  2335,   2337,   134,    1909,   2292, 4);

INSERT INTO MeanRankScoreTable VALUES
    ("UC350",        15288,  12732, 12667,  12545, 12723,  12373,  12535, 12541,  63,     309,    12475, 6),
    ("UC350",        16208,  12749, 12765,  12754, 12750,  12752,  12761, 12754,  26,     12636,  12699, 6),
    ("UC350",        19843,  12583, 12533,  12449, 12581,  11772,  10108, 12443,  229,    833,    12282, 6),
    ("UC350",        19901,  9368,  7436,   9607,  9293,   9310,   6144,  9583,   4312,   5421,   9693,  6),
    ("UC350",        3823,   12344, 12597,  12583, 12453,  12317,  10502, 12572,  283,    380,    12660, 6),
    ("UC350",        42132,  12749, 12765,  12754, 12750,  12752,  12761, 12754,  26,     12636,  12699, 6),
    ("UC350",        4601,   7044,  5519,   3897,  7209,   5143,   7160,  3772,   5485,   6476,   4555,  6),
    ("UC350",        4674,   12738, 12745,  12666, 12745,  12671,  12713, 12669,  35,     620,    12567, 6),
    ("UC350",        48029,  12749, 12765,  12754, 12750,  12752,  12761, 12754,  26,     12636,  12699, 6),
    ("UC350",        4869,   10855, 12468,  12609, 11012,  12591,  11997, 12610,  1310,   68,     12445, 6),
    ("UC350",        49,     12583, 12533,  12449, 12581,  11772,  10108, 12443,  229,    833,    12282, 6),
    ("UC350",        5125,   11295, 12439,  11820, 11291,  12203,  9338,  11858,  1563,   545,    11589, 6),
    ("UC350",        51537,  6671,  9339,   11196, 6788,   9540,   7511,  11199,  5174,   2397,   11040, 6),
    ("UC350",        5344,   10558, 11242,  11464, 10586,  10685,  9950,  11470,  2205,   1708,   11370, 6),
    ("UC350",        8083,   11594, 12453,  12377, 11584,  12322,  9522,  12389,  1206,   318,    12208, 6),
    ("UC350",        8201,   12775, 12775,  12615, 12775,  12571,  12713, 12610,  1,      17,     12576, 6),
    ("UC350",        8236,   10813, 8371,   9073,  10826,  9098,   11414, 9063,   1573,   3653,   9135,  6),
    ("UC350",        8237,   12773, 12771,  12723, 12773,  12724,  12759, 12723,  3,      1523,   12658, 6),
    ("UC350",        8483,   12769, 12769,  12767, 12769,  12765,  12767, 12767,  7,      398,    12752, 6);