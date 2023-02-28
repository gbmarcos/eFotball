const mockClubsResponse =
    '''[{"id":1,"name":"IFK Norrköping","logo":"JWQqFdNCdvUScA.png","background":"VSQYloSoiUWTqg.png","banner_url":null,"slug":"ifk","flags":521,"inserted":1607874405},{"id":2,"name":"Malmö FF","logo":"QL031SIZjLstLw.png","background":"CwrfYvuCwBfuXQ.png","banner_url":null,"slug":"mff","flags":641,"inserted":1607955909},{"id":26,"name":"sverige","logo":"ybhDukSDIN4r_g.png","background":"VT6lZLThxRIrcw.png","banner_url":null,"slug":"tyskland","flags":3593,"inserted":1608144309},{"id":28,"name":"Örgryte IF","logo":"De7bdBztbS7Tjg.png","background":null,"banner_url":null,"slug":"öis","flags":513,"inserted":1608209649}]''';

const mockUserResponse = '''
{
    "id": 67,
    "username": "fabian",
    "avatar": null,
    "country_id": 231,
    "flags": 0,
    "console": 0,
    "token": "wkcgooxG-PGm",
    "first_name": "Fabian",
    "last_name": "Quintanar",
    "email": "fabian@doctype.se",
    "birth_year": 1995,
    "birth_month": 8,
    "birth_day": 13,
    "gender": null,
    "friends": null,
    "friend_requests": null,
    "sent_friend_requests": null,
    "notifications": null,
    "chats": null,
    "active_matches": null,
    "ta_permissions_map": null,
    "oa_permissions_map": null,
    "twitch_username": null,
    "lobby_check_in": null
}''';
const mockUserResponseWithLobbyChekIn = '''
{
    "id": 67,
    "username": "fabian",
    "avatar": "7qPgpa9e7Hs_xA.jpg",
    "country_id": 231,
    "flags": 6,
    "console": 0,
    "token": "wkcgooxG-PGm",
    "permissions": 4095,
    "first_name": "Fabian",
    "last_name": "Quintanar",
    "email": "fabian@doctype.se",
    "birth_year": null,
    "birth_month": null,
    "birth_day": null,
    "gender": null,
    "friends": null,
    "friend_requests": null,
    "sent_friend_requests": null,
    "notifications": [
        {
            "id": 830,
            "type": 3,
            "from_user": null,
            "data": {
                "id": 151,
                "tournament": {
                    "id": 219,
                    "name": "Test Flutter Tournament",
                    "logo": "nF-yLMwJRklOaw.png",
                    "banner": null,
                    "flags": 33
                },
                "user1": {
                    "id": 90,
                    "username": "fabian2",
                    "avatar": null,
                    "country_id": 231,
                    "flags": 0,
                    "console": 0
                },
                "user2": {
                    "id": 67,
                    "username": "fabian",
                    "avatar": "7qPgpa9e7Hs_xA.jpg",
                    "country_id": 231,
                    "flags": 6,
                    "console": 0
                },
                "team1": {
                    "id": 16,
                    "name": "Östersunds FK",
                    "logo": "TwDhgyDtxAtW7Q.png"
                },
                "team2": {
                    "id": 3,
                    "name": "Djurgården",
                    "logo": "5nUj50T3_g_NcA.png"
                },
                "walkover_time": 1634595330
            },
            "seen": false,
            "inserted": 1634594430
        },
        {
            "id": 827,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 219,
                "name": "Test Flutter Tournament",
                "image": "nF-yLMwJRklOaw.png"
            },
            "seen": false,
            "inserted": 1634594309
        },
        {
            "id": 824,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 218,
                "name": "Playstation Test tournament",
                "image": "FFS6alin4SJFrA.png"
            },
            "seen": false,
            "inserted": 1634590334
        },
        {
            "id": 822,
            "type": 2,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 218,
                "name": "Playstation Test tournament",
                "image": "FFS6alin4SJFrA.png"
            },
            "seen": true,
            "inserted": 1634589349
        }
    ],
    "chats": null,
    "active_matches": null,
    "ta_permissions_map": null,
    "oa_permissions_map": null,
    "tca_permissions_map": null,
    "twitch_username": null,
    "lobby_check_in": {
        "id": 151,
        "tournament": {
            "id": 219,
            "name": "Test Flutter Tournament",
            "logo": "nF-yLMwJRklOaw.png",
            "banner": null,
            "flags": 33
        },
        "user1": {
            "id": 90,
            "username": "fabian2",
            "avatar": null,
            "country_id": 231,
            "flags": 0,
            "console": 0
        },
        "user2": {
            "id": 67,
            "username": "fabian",
            "avatar": "7qPgpa9e7Hs_xA.jpg",
            "country_id": 231,
            "flags": 6,
            "console": 0
        },
        "team1": {
            "id": 16,
            "name": "Östersunds FK",
            "logo": "TwDhgyDtxAtW7Q.png"
        },
        "team2": {
            "id": 3,
            "name": "Djurgården",
            "logo": "5nUj50T3_g_NcA.png"
        },
        "walkover_time": 1634595330
    }
}
''';

const userWithNotifications = '''
{
    "id": 67,
    "username": "fabian",
    "avatar": "7qPgpa9e7Hs_xA.jpg",
    "country_id": 231,
    "flags": 6,
    "console": 0,
    "token": "wkcgooxG-PGm",
    "permissions": 4095,
    "first_name": "Fabian",
    "last_name": "Quintanar",
    "email": "fabian@doctype.se",
    "birth_year": null,
    "birth_month": null,
    "birth_day": null,
    "gender": null,
    "friends": [
        {
            "id": 90,
            "username": "fabian2",
            "avatar": null,
            "country_id": 231,
            "flags": 0,
            "console": 0,
            "online_status": 0,
            "inserted": 1635850689
        }
    ],
    "friend_requests": null,
    "sent_friend_requests": null,
    "notifications": [
        {
            "id": 1485,
            "type": 3,
            "from_user": null,
            "data": {
                "id": 267,
                "tournament": {
                    "id": 289,
                    "name": "Test-tournament 31",
                    "logo": null,
                    "banner": null,
                    "flags": 33
                },
                "user1": {
                    "id": 67,
                    "username": "fabian",
                    "avatar": "7qPgpa9e7Hs_xA.jpg",
                    "country_id": 231,
                    "flags": 6,
                    "console": 0
                },
                "user2": {
                    "id": 90,
                    "username": "fabian2",
                    "avatar": null,
                    "country_id": 231,
                    "flags": 0,
                    "console": 0
                },
                "team1": {
                    "id": 7,
                    "name": "IF Elfsborg",
                    "logo": "eJKqfl7CKTeyAQ.png"
                },
                "team2": {
                    "id": 10,
                    "name": "IK Sirius",
                    "logo": "HpRke0el_qE7yQ.png"
                },
                "walkover_time": 1637620240
            },
            "seen": false,
            "inserted": 1637619340
        },
        {
            "id": 1483,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 289,
                "name": "Test-tournament 31"
            },
            "seen": false,
            "inserted": 1637619307
        },
        {
            "id": 1481,
            "type": 3,
            "from_user": null,
            "data": {
                "id": 266,
                "tournament": {
                    "id": 288,
                    "name": "Test-tournament 30",
                    "logo": null,
                    "banner": null,
                    "flags": 33
                },
                "user1": {
                    "id": 67,
                    "username": "fabian",
                    "avatar": "7qPgpa9e7Hs_xA.jpg",
                    "country_id": 231,
                    "flags": 6,
                    "console": 0
                },
                "user2": {
                    "id": 90,
                    "username": "fabian2",
                    "avatar": null,
                    "country_id": 231,
                    "flags": 0,
                    "console": 0
                },
                "team1": {
                    "id": 11,
                    "name": "Kalmar FF",
                    "logo": "6j1QF-tB_I2ExA.png"
                },
                "team2": {
                    "id": 7,
                    "name": "IF Elfsborg",
                    "logo": "eJKqfl7CKTeyAQ.png"
                },
                "walkover_time": 1637620000
            },
            "seen": false,
            "inserted": 1637619100
        },
        {
            "id": 1479,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 288,
                "name": "Test-tournament 30"
            },
            "seen": false,
            "inserted": 1637619064
        },
        {
            "id": 1477,
            "type": 3,
            "from_user": null,
            "data": {
                "id": 265,
                "tournament": {
                    "id": 287,
                    "name": "Test-tournament 29",
                    "logo": null,
                    "banner": null,
                    "flags": 33
                },
                "user1": {
                    "id": 67,
                    "username": "fabian",
                    "avatar": "7qPgpa9e7Hs_xA.jpg",
                    "country_id": 231,
                    "flags": 6,
                    "console": 0
                },
                "user2": {
                    "id": 90,
                    "username": "fabian2",
                    "avatar": null,
                    "country_id": 231,
                    "flags": 0,
                    "console": 0
                },
                "team1": {
                    "id": 6,
                    "name": "Helsingborgs IF",
                    "logo": "KAazJBEI3eF8yg.png"
                },
                "team2": {
                    "id": 14,
                    "name": "Varbergs BoIS",
                    "logo": "ICcYu2Cjq_3gLQ.png"
                },
                "walkover_time": 1637617179
            },
            "seen": false,
            "inserted": 1637616279
        },
        {
            "id": 1475,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 287,
                "name": "Test-tournament 29"
            },
            "seen": false,
            "inserted": 1637616264
        },
        {
            "id": 1474,
            "type": 5,
            "from_user": {
                "id": 90,
                "username": "fabian2",
                "avatar": null,
                "country_id": 231,
                "flags": 0,
                "console": 0
            },
            "data": {
                "tournament_id": 286,
                "name": "Test-tournament 28",
                "match_id": 324
            },
            "seen": false,
            "inserted": 1637616008
        },
        {
            "id": 1472,
            "type": 3,
            "from_user": null,
            "data": {
                "id": 264,
                "tournament": {
                    "id": 286,
                    "name": "Test-tournament 28",
                    "logo": null,
                    "banner": null,
                    "flags": 33
                },
                "user1": {
                    "id": 67,
                    "username": "fabian",
                    "avatar": "7qPgpa9e7Hs_xA.jpg",
                    "country_id": 231,
                    "flags": 6,
                    "console": 0
                },
                "user2": {
                    "id": 90,
                    "username": "fabian2",
                    "avatar": null,
                    "country_id": 231,
                    "flags": 0,
                    "console": 0
                },
                "team1": {
                    "id": 4,
                    "name": "Falkenbergs FF",
                    "logo": "pOuQ4e67NO-oxQ.png"
                },
                "team2": {
                    "id": 15,
                    "name": "Örebro SK",
                    "logo": "DOsgRCJs_OrhgQ.png"
                },
                "walkover_time": 1637616879
            },
            "seen": false,
            "inserted": 1637615979
        },
        {
            "id": 1470,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 286,
                "name": "Test-tournament 28"
            },
            "seen": false,
            "inserted": 1637615726
        },
        {
            "id": 1469,
            "type": 5,
            "from_user": {
                "id": 90,
                "username": "fabian2",
                "avatar": null,
                "country_id": 231,
                "flags": 0,
                "console": 0
            },
            "data": {
                "tournament_id": 285,
                "name": "Test-tournament 27",
                "match_id": 322
            },
            "seen": false,
            "inserted": 1637615537
        },
        {
            "id": 1467,
            "type": 3,
            "from_user": null,
            "data": {
                "id": 263,
                "tournament": {
                    "id": 285,
                    "name": "Test-tournament 27",
                    "logo": null,
                    "banner": null,
                    "flags": 33
                },
                "user1": {
                    "id": 67,
                    "username": "fabian",
                    "avatar": "7qPgpa9e7Hs_xA.jpg",
                    "country_id": 231,
                    "flags": 6,
                    "console": 0
                },
                "user2": {
                    "id": 90,
                    "username": "fabian2",
                    "avatar": null,
                    "country_id": 231,
                    "flags": 0,
                    "console": 0
                },
                "team1": {
                    "id": 1,
                    "name": "AIK",
                    "logo": "83tuDeC2rjMJ2g.png"
                },
                "team2": {
                    "id": 14,
                    "name": "Varbergs BoIS",
                    "logo": "ICcYu2Cjq_3gLQ.png"
                },
                "walkover_time": 1637616309
            },
            "seen": false,
            "inserted": 1637615409
        },
        {
            "id": 1465,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 285,
                "name": "Test-tournament 27"
            },
            "seen": false,
            "inserted": 1637615390
        },
        {
            "id": 1462,
            "type": 3,
            "from_user": null,
            "data": {
                "id": 262,
                "tournament": {
                    "id": 284,
                    "name": "Test-tournament 26",
                    "logo": null,
                    "banner": null,
                    "flags": 33
                },
                "user1": {
                    "id": 67,
                    "username": "fabian",
                    "avatar": "7qPgpa9e7Hs_xA.jpg",
                    "country_id": 231,
                    "flags": 6,
                    "console": 0
                },
                "user2": {
                    "id": 90,
                    "username": "fabian2",
                    "avatar": null,
                    "country_id": 231,
                    "flags": 0,
                    "console": 0
                },
                "team1": {
                    "id": 11,
                    "name": "Kalmar FF",
                    "logo": "6j1QF-tB_I2ExA.png"
                },
                "team2": {
                    "id": 1,
                    "name": "AIK",
                    "logo": "83tuDeC2rjMJ2g.png"
                },
                "walkover_time": 1637616069
            },
            "seen": false,
            "inserted": 1637615169
        },
        {
            "id": 1460,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 284,
                "name": "Test-tournament 26"
            },
            "seen": false,
            "inserted": 1637615136
        },
        {
            "id": 1457,
            "type": 3,
            "from_user": null,
            "data": {
                "id": 261,
                "tournament": {
                    "id": 283,
                    "name": "Test-tournament 25",
                    "logo": null,
                    "banner": null,
                    "flags": 33
                },
                "user1": {
                    "id": 67,
                    "username": "fabian",
                    "avatar": "7qPgpa9e7Hs_xA.jpg",
                    "country_id": 231,
                    "flags": 6,
                    "console": 0
                },
                "user2": {
                    "id": 90,
                    "username": "fabian2",
                    "avatar": null,
                    "country_id": 231,
                    "flags": 0,
                    "console": 0
                },
                "team1": {
                    "id": 16,
                    "name": "Östersunds FK",
                    "logo": "TwDhgyDtxAtW7Q.png"
                },
                "team2": {
                    "id": 2,
                    "name": "BK Häcken",
                    "logo": "KOKC-oieRNmjgA.png"
                },
                "walkover_time": 1637613099
            },
            "seen": false,
            "inserted": 1637612199
        },
        {
            "id": 1455,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 283,
                "name": "Test-tournament 25"
            },
            "seen": false,
            "inserted": 1637612160
        },
        {
            "id": 1452,
            "type": 3,
            "from_user": null,
            "data": {
                "id": 260,
                "tournament": {
                    "id": 282,
                    "name": "Test-tournament 24",
                    "logo": null,
                    "banner": null,
                    "flags": 33
                },
                "user1": {
                    "id": 67,
                    "username": "fabian",
                    "avatar": "7qPgpa9e7Hs_xA.jpg",
                    "country_id": 231,
                    "flags": 6,
                    "console": 0
                },
                "user2": {
                    "id": 90,
                    "username": "fabian2",
                    "avatar": null,
                    "country_id": 231,
                    "flags": 0,
                    "console": 0
                },
                "team1": {
                    "id": 4,
                    "name": "Falkenbergs FF",
                    "logo": "pOuQ4e67NO-oxQ.png"
                },
                "team2": {
                    "id": 3,
                    "name": "Djurgården",
                    "logo": "5nUj50T3_g_NcA.png"
                },
                "walkover_time": 1637610339
            },
            "seen": false,
            "inserted": 1637609439
        },
        {
            "id": 1450,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 282,
                "name": "Test-tournament 24"
            },
            "seen": false,
            "inserted": 1637609407
        },
        {
            "id": 1449,
            "type": 5,
            "from_user": {
                "id": 90,
                "username": "fabian2",
                "avatar": null,
                "country_id": 231,
                "flags": 0,
                "console": 0
            },
            "data": {
                "tournament_id": 281,
                "name": "Test-tournament 23",
                "match_id": 318
            },
            "seen": false,
            "inserted": 1637609221
        },
        {
            "id": 1447,
            "type": 3,
            "from_user": null,
            "data": {
                "id": 259,
                "tournament": {
                    "id": 281,
                    "name": "Test-tournament 23",
                    "logo": null,
                    "banner": null,
                    "flags": 33
                },
                "user1": {
                    "id": 67,
                    "username": "fabian",
                    "avatar": "7qPgpa9e7Hs_xA.jpg",
                    "country_id": 231,
                    "flags": 6,
                    "console": 0
                },
                "user2": {
                    "id": 90,
                    "username": "fabian2",
                    "avatar": null,
                    "country_id": 231,
                    "flags": 0,
                    "console": 0
                },
                "team1": {
                    "id": 2,
                    "name": "BK Häcken",
                    "logo": "KOKC-oieRNmjgA.png"
                },
                "team2": {
                    "id": 1,
                    "name": "AIK",
                    "logo": "83tuDeC2rjMJ2g.png"
                },
                "walkover_time": 1637610098
            },
            "seen": false,
            "inserted": 1637609198
        }
    ],
    "chats": null,
    "active_matches": [
        {
            "tournament_id": 277,
            "match_id": 313
        }
    ],
    "ta_permissions_map": null,
    "oa_permissions_map": null,
    "tca_permissions_map": null,
    "twitch_username": null,
    "lobby_check_in": null
}
''';
const mockNews = r'''
[
    {
        "id": 37,
        "title": "Anmäl dig till FIFA-turneringen eAkademin Online",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "cCoGlN2GOOqabQ.jpg",
        "author": null,
        "preview": "\n<p>I samband med att eAkademin, som drivs av Malmö FF och Malmö Fria Läroverk, har öppet hus inför höstterminen arrangerar MFF nu FIFA-turneringen eAkademin Online.</p>\n\n\n\n<figure><img width=\"1024\" height=\"576\" src=\"https://www.mff.se/app/uploads/2021/04/eAkademin-Online_v2_1920x1080-1024x576.jpeg\" alt=\"\"/></figure>\n\n\n\n<div style=\"height:30px\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2>Anmälan</h2>\n\n\n\n<p>Turneringen genomförs <strong>onsdagen den 28 april</strong> med start klockan 18:00 och har plats för 32 spelare.</p>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<div class=\"wp-block-buttons aligncenter\">\n<div class=\"wp-block-button is-style-mff-button\"><a href=\"https://www.efotboll.se/tournament/215\" rel=\"nofollow\">ANMÄL DIG HÄR!</a></div>\n</div>\n\n\n\n<div style=\"height:50px\" class=\"wp-block-spacer\"></div>\n\n\n\n<p><strong>OBS:</strong> Du måste vara född 2004-2006 för att få delta</p>\n\n\n\n<div style=\"height:36px\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2>Regler</h2>\n\n\n\n<ul><li>Du måste vara född 2004-2006 för att få delta</li><li>Alla matcher spelas på PS4 i BO1</li><li>Alla matcher spelas på FUT Stadion eller Challenger Stadion</li><li>Alla matcher spelas i Ultimate team</li><li>Inga lånekort/lånespelare är tillåtet</li><li>Lämnar någon innan matchen är slut (rage quit) så förlorar spelaren matchen och motståndaren går vidare med en 3–0-seger</li><li>Ta alltid bild på slutresultatet.</li><li>Admin har alltid rätt och kan justera reglerna efter hand.</li></ul>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2>Priser</h2>\n\n\n\n<p>Första pris är en coachinglektion med MFFESPORTS proffsspelare Zacharias Johansson.</p>\n\n\n\n<div style=\"height:100px\" class=\"wp-block-spacer\"></div>\n\n\n<div class=\"wp-block-mff-latest-news alignfull\">\n\n\t\t\t\n\n\t\t\t<div class=\"container\">\n\n\t\t\t\t<div class=\"row\">\n\n\t\t\t\t\t<div class=\"title-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"social-media-links\">\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"button-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\n\t\n\t<div>\n\n\t\t\t\t\t<div class=\"term-filter\">\n\t\t\t\t<div class=\"container\">\n\n\t\t\t\t\t\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\tNyheter\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\n\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t\n\t\t<div class=\"posts\">\n\n\t\t\t<div class=\"posts-row\">\n\n\t\t\t\t<div class=\"post\">\n\n\t\t\t\t\t\n\t\t\t\t\t\t<div class=\"post-content-wrapper\">\n\t\t\t\t\t\t\t<figure>\n\t\t\t\t\t\t\t</figure>\n\t\t\t\t\t\t\t<span></span>\n\n\t\t\t\t\t\t\t<div class=\"texts\">\n\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\n\t\t\t\t\t\t\t\t<div class=\"meta\">\n\t\t\t\t\t\t\t\t\t<time>{{post.date}}</time>\n\t\t\t\t\t\t\t\t\t<span>{{term.name}}</span>\n\t\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\t\n\t\t</div>\n\n\t</div>\n\n\t\n</div>\n\n\n<p>The post <a href=\"https://www.mff.se/anmal-dig-till-fifa-turneringen-eakademin-online/\" rel=\"nofollow\">Anmäl dig till FIFA-turneringen eAkademin Online</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>\n",
        "inserted": 1619181420,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    },
    {
        "id": 38,
        "title": "Anmäl dig till FIFA-turneringen eAkademin Online",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "LDB-BCFV5AWf1w.jpg",
        "author": null,
        "preview": "\n<p>I samband med att eAkademin, som drivs av Malmö FF och Malmö Fria Läroverk, har öppet hus inför höstterminen arrangerar MFF nu FIFA-turneringen eAkademin Online.</p>\n\n\n\n<figure><img width=\"1024\" height=\"576\" src=\"https://www.mff.se/app/uploads/2021/04/eAkademin-Online_v2_1920x1080-1024x576.jpeg\" alt=\"\"/></figure>\n\n\n\n<div style=\"height:30px\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2>Anmälan</h2>\n\n\n\n<p>Turneringen genomförs <strong>onsdagen den 28 april</strong> med start klockan 18:00 och har plats för 32 spelare.</p>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<div class=\"wp-block-buttons aligncenter\">\n<div class=\"wp-block-button is-style-mff-button\"><a href=\"https://www.efotboll.se/tournament/215\" rel=\"nofollow\">ANMÄL DIG HÄR!</a></div>\n</div>\n\n\n\n<div style=\"height:50px\" class=\"wp-block-spacer\"></div>\n\n\n\n<p><strong>OBS:</strong> Du måste vara född 2004-2006 för att få delta</p>\n\n\n\n<div style=\"height:36px\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2>Regler</h2>\n\n\n\n<ul><li>Du måste vara född 2004-2006 för att få delta</li><li>Alla matcher spelas på PS4 i BO1</li><li>Alla matcher spelas på FUT Stadion eller Challenger Stadion</li><li>Alla matcher spelas i Ultimate team</li><li>Inga lånekort/lånespelare är tillåtet</li><li>Lämnar någon innan matchen är slut (rage quit) så förlorar spelaren matchen och motståndaren går vidare med en 3–0-seger</li><li>Ta alltid bild på slutresultatet.</li><li>Admin har alltid rätt och kan justera reglerna efter hand.</li></ul>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2>Priser</h2>\n\n\n\n<p>Första pris är en coachinglektion med MFFESPORTS proffsspelare Zacharias Johansson.</p>\n\n\n\n<div style=\"height:100px\" class=\"wp-block-spacer\"></div>\n\n\n<div class=\"wp-block-mff-latest-news alignfull\">\n\n\t\t\t\n\n\t\t\t<div class=\"container\">\n\n\t\t\t\t<div class=\"row\">\n\n\t\t\t\t\t<div class=\"title-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"social-media-links\">\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"button-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\n\t\n\t<div>\n\n\t\t\t\t\t<div class=\"term-filter\">\n\t\t\t\t<div class=\"container\">\n\n\t\t\t\t\t\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\tNyheter\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\n\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t\n\t\t<div class=\"posts\">\n\n\t\t\t<div class=\"posts-row\">\n\n\t\t\t\t<div class=\"post\">\n\n\t\t\t\t\t\n\t\t\t\t\t\t<div class=\"post-content-wrapper\">\n\t\t\t\t\t\t\t<figure>\n\t\t\t\t\t\t\t</figure>\n\t\t\t\t\t\t\t<span></span>\n\n\t\t\t\t\t\t\t<div class=\"texts\">\n\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\n\t\t\t\t\t\t\t\t<div class=\"meta\">\n\t\t\t\t\t\t\t\t\t<time>{{post.date}}</time>\n\t\t\t\t\t\t\t\t\t<span>{{term.name}}</span>\n\t\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\t\n\t\t</div>\n\n\t</div>\n\n\t\n</div>\n\n\n<p>The post <a href=\"https://www.mff.se/anmal-dig-till-fifa-turneringen-eakademin-online/\" rel=\"nofollow\">Anmäl dig till FIFA-turneringen eAkademin Online</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>\n",
        "inserted": 1619181420,
        "org": {
            "id": 2,
            "name": "Malmö FF",
            "logo": "QL031SIZjLstLw.png",
            "background": "CwrfYvuCwBfuXQ.png",
            "banner_url": null,
            "slug": "mff",
            "flags": 641,
            "inserted": 1607955909
        },
        "flags": null
    },
    {
        "id": 36,
        "title": "Bajen land",
        "category": null,
        "content": "",
        "image": "aou4109zCtYkWQ.png",
        "thumbnail": "y4TXmydIaoad8w.png",
        "author": null,
        "preview": "<p>hej alla bajen fans, du när det äntligen dags för derby</p>",
        "inserted": 1617698907,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    },
    {
        "id": 25,
        "title": "Här är spelschemat i eAllsvenskan",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "AtJ4aJgxhMMDgg.jpg",
        "author": null,
        "preview": "\n<p>Tisdag den 30 mars drar eAllsvenskan säsong 3 igång. Vi inleder gruppspelet med ett Skånederby mot Helsingborgs IF.</p>\n\n\n\n<figure><img width=\"1024\" height=\"683\" src=\"https://www.mff.se/app/uploads/2021/03/wetteus-zacke-eallsvenskan-1024x683.jpg\" alt=\"\"/><figcaption>Zackarias Johansson och Oskar Wettéus i MFFESPORT</figcaption></figure>\n\n\n\n<div style=\"height:30px\" class=\"wp-block-spacer\"></div>\n\n\n\n<p>Sammanlagt 17 klubbar är med i årets upplaga av eAllsvenskan och gör upp om titeln som Sveriges bästa klubb på FIFA 21.</p>\n\n\n\n<div class=\"wp-block-columns\">\n<div class=\"wp-block-column\">\n<figure><img width=\"819\" height=\"1024\" src=\"https://www.mff.se/app/uploads/2021/03/eallsvenskan-gruppspel-819x1024.jpeg\" alt=\"\"/></figure>\n</div>\n\n\n\n<div class=\"wp-block-column\">\n<p>I gruppspelet spelar alla mot alla, där sedan de fyra bästa från varje grupp tar sig vidare till slutspelet i början av juni.</p>\n\n\n\n<p>Eftersom grupp A består av nio lag kommer alla lag att stå över en omgång i gruppspelet..</p>\n\n\n\n<p>Varje möte består av två individuella matcher där det sammanlagda resultatet räknas ihop. Nytt för i år är att den ena matchen spelas på PlayStation 4 och den andra på Xbox One.</p>\n\n\n\n<p>Matcherna sänds <a href=\"https://www.twitch.tv/eallsvenskan\" rel=\"nofollow\">på eAllsvenskans Twitchkanal</a>.</p>\n</div>\n</div>\n\n\n\n<div style=\"height:30px\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2>Spelschema</h2>\n\n\n\n<p><strong>Omgång 1:</strong><br>Malmö FF – Helsingborgs IF<br>Tisdag 30 mars 18:00</p>\n\n\n\n<p><strong>Omgång 2:</strong><br>Malmö FF – GIF Sundsvall<br>Onsdag 7 april 15:30</p>\n\n\n\n<p><strong>Omgång 3:</strong><br>Trelleborgs FF – Malmö FF<br>Tisdag 13 april 16:30</p>\n\n\n\n<p><strong>Omgång 4:</strong><br><em>BYE (Malmö FF står över runda 4)</em></p>\n\n\n\n<p><strong>Omgång 5:</strong><br>Varbergs BoIS – Malmö FF<br>Tisdag 27 april 13:00</p>\n\n\n\n<p><strong>Omgång 6:</strong><br>Malmö FF – IFK Göteborg<br>Tisdag 27 april 19:00</p>\n\n\n\n<p><strong>Omgång 7:</strong><br>Örgryte IS – Malmö FF<br>Onsdag 5 maj 18:00</p>\n\n\n\n<p><strong>Omgång 8:</strong><br>AFC Eskilstuna – Malmö FF<br>Tisdag 11 maj 16:15</p>\n\n\n\n<p><strong>Omgång 9:</strong><br>Malmö FF – Degerfors IF<br>Tisdag 11 maj 20:00</p>\n\n\n\n<div style=\"height:70px\" class=\"wp-block-spacer\"></div>\n\n\n<div class=\"wp-block-mff-latest-news alignfull\">\n\n\t\t\t\n\n\t\t\t<div class=\"container\">\n\n\t\t\t\t<div class=\"row\">\n\n\t\t\t\t\t<div class=\"title-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"social-media-links\">\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"button-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\n\t\n\t<div>\n\n\t\t\t\t\t<div class=\"term-filter\">\n\t\t\t\t<div class=\"container\">\n\n\t\t\t\t\t\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\tNyheter\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\n\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t\n\t\t<div class=\"posts\">\n\n\t\t\t<div class=\"posts-row\">\n\n\t\t\t\t<div class=\"post\">\n\n\t\t\t\t\t\n\t\t\t\t\t\t<div class=\"post-content-wrapper\">\n\t\t\t\t\t\t\t<figure>\n\t\t\t\t\t\t\t</figure>\n\t\t\t\t\t\t\t<span></span>\n\n\t\t\t\t\t\t\t<div class=\"texts\">\n\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\n\t\t\t\t\t\t\t\t<div class=\"meta\">\n\t\t\t\t\t\t\t\t\t<time>{{post.date}}</time>\n\t\t\t\t\t\t\t\t\t<span>{{term.name}}</span>\n\t\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\t\n\t\t</div>\n\n\t</div>\n\n\t\n</div>\n\n\n\n<div class=\"wp-block-mff-sponsors-partners style-dark alignfull\"><div class=\"block-content-wrapper\">\n<div class=\"wp-block-mff-logos-row\"><div class=\"title\"><div class=\"lines\"><h3>huvudpartners</h3></div></div><div class=\"images-container\"><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://eleda.se\" rel=\"nofollow\"><img width=\"1172\" height=\"255\" src=\"https://www.mff.se/app/uploads/2020/02/Eleda-Bla%CC%8A.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://eu.puma.com/se/sv/home\" rel=\"nofollow\"><img width=\"114\" height=\"58\" src=\"https://www.mff.se/app/uploads/2018/11/puma-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://vwmalmo.se/Anlaggningar/Malmo/\" rel=\"nofollow\"><img width=\"80\" height=\"80\" src=\"https://www.mff.se/app/uploads/2020/04/2020-04-14_volkswagen-vw-80x80-1.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://tictac.se\" rel=\"nofollow\"><img width=\"116\" height=\"50\" src=\"https://www.mff.se/app/uploads/2018/11/tictac-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://unibet.se\" rel=\"nofollow\"><img width=\"141\" height=\"50\" src=\"https://www.mff.se/app/uploads/2019/12/unibet_bla%CC%8A-e1577707425231.png\" alt=\"\"/></a></div></div></div></div>\n\n\n\n<div class=\"wp-block-mff-logos-row\"><div class=\"title\"><div class=\"lines\"><h3>officiella partners</h3></div></div><div class=\"images-container\"><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.apqel.se/\" rel=\"nofollow\"><img width=\"100\" height=\"66\" src=\"https://www.mff.se/app/uploads/2020/01/ApQ_100x66.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://bemt.nu\" rel=\"nofollow\"><img width=\"80\" height=\"24\" src=\"https://www.mff.se/app/uploads/2018/11/bemt-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://cabonline.se\" rel=\"nofollow\"><img width=\"150\" height=\"30\" src=\"https://www.mff.se/app/uploads/2019/03/2019-03-25_cabonline.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://elitfonster.se\" rel=\"nofollow\"><img width=\"136\" height=\"33\" src=\"https://www.mff.se/app/uploads/2018/11/elitfonster-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://exakta.se\" rel=\"nofollow\"><img width=\"127\" height=\"25\" src=\"https://www.mff.se/app/uploads/2018/11/exacta-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.lansforsakringar.se/skane/privat/om-oss/\" rel=\"nofollow\"><img width=\"136\" height=\"25\" src=\"https://www.mff.se/app/uploads/2018/11/lansfors-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.simplify.se\" rel=\"nofollow\"><img width=\"1403\" height=\"360\" src=\"https://www.mff.se/app/uploads/2019/10/2019-10-29_Simplify_logo_blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.spendrups.se\" rel=\"nofollow\"><img width=\"135\" height=\"32\" src=\"https://www.mff.se/app/uploads/2019/03/2019-03-25_spendrups.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.sydsvenskan.se\" rel=\"nofollow\"><img width=\"142\" height=\"25\" src=\"https://www.mff.se/app/uploads/2018/11/sydsvenskan-blue.png\" alt=\"\"/></a></div></div></div></div>\n</div></div>\n<p>The post <a href=\"https://www.mff.se/har-ar-spelschemat-i-eallsvenskan/\" rel=\"nofollow\">Här är spelschemat i eAllsvenskan</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>\n",
        "inserted": 1617020418,
        "org": {
            "id": 2,
            "name": "Malmö FF",
            "logo": "QL031SIZjLstLw.png",
            "background": "CwrfYvuCwBfuXQ.png",
            "banner_url": null,
            "slug": "mff",
            "flags": 641,
            "inserted": 1607955909
        },
        "flags": null
    },
    {
        "id": 24,
        "title": "eAllsvenskan startar den 30 mars.",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "enyxQrhf1mWvcQ.jpg",
        "author": null,
        "preview": "\n<p>Den tredje säsongen av eAllsvenskan drar igång den 30 mars. Zackarias Johanssson och Oskar Wettéus kommer att representera Malmö FF.</p>\n\n\n\n<figure><img width=\"1024\" height=\"683\" src=\"https://www.mff.se/app/uploads/2021/03/oskar-zacke-eallsvenskan-1024x683.jpg\" alt=\"\"/></figure>\n\n\n\n<div style=\"height:26px\" class=\"wp-block-spacer\"></div>\n\n\n\n<p>En vinst och en andraplats är MFF:s facit i eAllsvenskan – och snart är det alltså dags för en tredje säsong där 17 klubbar tävlar om att bli svenska mästare i FIFA.</p>\n\n\n\n<p>eAllsvenskan inleds på tisdagen den 30 mars med ett gruppspel och matcherna sänds inledningsvis på <a href=\"https://www.twitch.tv/eallsvenskan\" rel=\"nofollow\">eAllsvenskans Twitchkanal</a>.</p>\n\n\n\n<div style=\"height:49px\" class=\"wp-block-spacer\"></div>\n\n\n<div class=\"wp-block-mff-latest-news alignfull\">\n\n\t\t\t\n\n\t\t\t<div class=\"container\">\n\n\t\t\t\t<div class=\"row\">\n\n\t\t\t\t\t<div class=\"title-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"social-media-links\">\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"button-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\n\t\n\t<div>\n\n\t\t\t\t\t<div class=\"term-filter\">\n\t\t\t\t<div class=\"container\">\n\n\t\t\t\t\t\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\tNyheter\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\n\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t\n\t\t<div class=\"posts\">\n\n\t\t\t<div class=\"posts-row\">\n\n\t\t\t\t<div class=\"post\">\n\n\t\t\t\t\t\n\t\t\t\t\t\t<div class=\"post-content-wrapper\">\n\t\t\t\t\t\t\t<figure>\n\t\t\t\t\t\t\t</figure>\n\t\t\t\t\t\t\t<span></span>\n\n\t\t\t\t\t\t\t<div class=\"texts\">\n\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\n\t\t\t\t\t\t\t\t<div class=\"meta\">\n\t\t\t\t\t\t\t\t\t<time>{{post.date}}</time>\n\t\t\t\t\t\t\t\t\t<span>{{term.name}}</span>\n\t\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\t\n\t\t</div>\n\n\t</div>\n\n\t\n</div>\n\n\n<p>The post <a href=\"https://www.mff.se/eallsvenskan-startar-den-30-mars/\" rel=\"nofollow\">eAllsvenskan startar den 30 mars.</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>\n",
        "inserted": 1616154323,
        "org": {
            "id": 2,
            "name": "Malmö FF",
            "logo": "QL031SIZjLstLw.png",
            "background": "CwrfYvuCwBfuXQ.png",
            "banner_url": null,
            "slug": "mff",
            "flags": 641,
            "inserted": 1607955909
        },
        "flags": null
    },
    {
        "id": 23,
        "title": "dnqdnwqjldnlwjqd",
        "category": null,
        "content": "",
        "image": "QghttGAU9oAJsQ.jpg",
        "thumbnail": null,
        "author": null,
        "preview": "<p>dwqndjknwqjkdnwqjkndjkwqndjnwqjdnjqwnd</p>",
        "inserted": 1615227627,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    },
    {
        "id": 22,
        "title": "mandcnwqldnjqw",
        "category": null,
        "content": "",
        "image": "NLf31pTPqb0VGg.jpg",
        "thumbnail": null,
        "author": null,
        "preview": "<p>Hej alla, vad är det för turnering idag</p>",
        "inserted": 1615227497,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    },
    {
        "id": 21,
        "title": "Nu börjar eTrophy - Vem tar plats i eFotbollslandslaget?",
        "category": null,
        "content": "",
        "image": "w_ZrzoldHZyiQQ.jpg",
        "thumbnail": null,
        "author": null,
        "preview": "<p>wlkdklwnqdlknwqlkdnlkwqndlknwqlkdnqwlkdnlqw</p>",
        "inserted": 1615223294,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    },
    {
        "id": 20,
        "title": "OliBoli7 och OpTolle först att bli finalklara i eTrophy",
        "category": null,
        "content": "",
        "image": "0f90s6Lg_kPmqw.jpg",
        "thumbnail": null,
        "author": null,
        "preview": "<p>dlwdlknwqlkdnklwqndlkwnqkldnlkwqndlkwnqkldnwlqkdlkwnqldnwqldnq</p>",
        "inserted": 1615223188,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    },
    {
        "id": 19,
        "title": "Turnering Svff cup 2021",
        "category": null,
        "content": "",
        "image": "0endyaOssquJrg.jpg",
        "thumbnail": null,
        "author": null,
        "preview": "<p>-,wqmdökqmdökmwqökdmöwkqmdökmwqökdmöwkqmdökwmqödkmqw</p>",
        "inserted": 1615222818,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    },
    {
        "id": 18,
        "title": "Zackarias Johansson klar för eChampions League",
        "category": null,
        "content": "",
        "image": "dDQWc4ABqGxJLQ.jpg",
        "thumbnail": "kxZYa_1QQZ7Dbg.jpg",
        "author": null,
        "preview": "<p>Under söndagen kvalificerade sig Malmö FF:s Zackarias Johansson till eChampions League. Han är en av 32 spelare i världen som har kvalificerat sig till den prestigefyllda turneringen.</p><p><img src=\"https://www.mff.se/app/uploads/2021/02/zackarias-johansson-1024x578.jpg\" height=\"578\" width=\"1024\"></p><p>Zackarias Johansson är inne på sitt tredje år i MFFESPORT och förutom en förstaplats i eAllsvenskan och landslagsspel kan nu ”Zacke” lägga till ytterligare en tung merit till sitt CV.</p><p>I söndags blev han nämligen en av 32 spelare i världen att kvala in till eChampions League (esportens motsvarighet till Champions League). Han vann 12 av 14 matcher under de två kvalhelgerna och kommer tillsammans med den absoluta världseliten att göra upp i slutspelet som påbörjas i maj.</p><p>Stort grattis, Zackarias!</p><p><br></p><p><br></p><p><br></p><p>Nyheter</p><p><br></p><p>{{post.date}} {{term.name}}</p><p>The post <a href=\"https://www.mff.se/zackarias-johansson-klar-for-echampions-league/\" rel=\"nofollow\">Zackarias Johansson klar för eChampions League</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>",
        "inserted": 1613375692,
        "org": {
            "id": 2,
            "name": "Malmö FF",
            "logo": "QL031SIZjLstLw.png",
            "background": "CwrfYvuCwBfuXQ.png",
            "banner_url": null,
            "slug": "mff",
            "flags": 641,
            "inserted": 1607955909
        },
        "flags": null
    },
    {
        "id": 33,
        "title": "Zackarias Johansson klar för eChampions League",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "LvIG7XgFIksM2A.jpg",
        "author": null,
        "preview": "\n<p>Under söndagen kvalificerade sig Malmö FF:s Zackarias Johansson till eChampions League. Han är en av 32 spelare i världen som har kvalificerat sig till den prestigefyllda turneringen.</p>\n\n\n\n<figure><img width=\"1024\" height=\"578\" src=\"https://www.mff.se/app/uploads/2021/02/zackarias-johansson-1024x578.jpg\" alt=\"\"/></figure>\n\n\n\n<div style=\"height:28px\" class=\"wp-block-spacer\"></div>\n\n\n\n<p>Zackarias Johansson är inne på sitt tredje år i MFFESPORT och förutom en förstaplats i eAllsvenskan och landslagsspel kan nu ”Zacke” lägga till ytterligare en tung merit till sitt CV. </p>\n\n\n\n<p>I söndags blev han nämligen en av 32 spelare i världen att kvala in till eChampions League (esportens motsvarighet till Champions League). Han vann 12 av 14 matcher under de två kvalhelgerna och kommer tillsammans med den absoluta världseliten att göra upp i slutspelet som påbörjas i maj.</p>\n\n\n\n<p>Stort grattis, Zackarias!</p>\n\n\n\n<div style=\"height:49px\" class=\"wp-block-spacer\"></div>\n\n\n<div class=\"wp-block-mff-latest-news alignfull\">\n\n\t\t\t\n\n\t\t\t<div class=\"container\">\n\n\t\t\t\t<div class=\"row\">\n\n\t\t\t\t\t<div class=\"title-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"social-media-links\">\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"button-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\n\t\n\t<div>\n\n\t\t\t\t\t<div class=\"term-filter\">\n\t\t\t\t<div class=\"container\">\n\n\t\t\t\t\t\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\tNyheter\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\n\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t\n\t\t<div class=\"posts\">\n\n\t\t\t<div class=\"posts-row\">\n\n\t\t\t\t<div class=\"post\">\n\n\t\t\t\t\t\n\t\t\t\t\t\t<div class=\"post-content-wrapper\">\n\t\t\t\t\t\t\t<figure>\n\t\t\t\t\t\t\t</figure>\n\t\t\t\t\t\t\t<span></span>\n\n\t\t\t\t\t\t\t<div class=\"texts\">\n\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\n\t\t\t\t\t\t\t\t<div class=\"meta\">\n\t\t\t\t\t\t\t\t\t<time>{{post.date}}</time>\n\t\t\t\t\t\t\t\t\t<span>{{term.name}}</span>\n\t\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\t\n\t\t</div>\n\n\t</div>\n\n\t\n</div>\n\n\n<p>The post <a href=\"https://www.mff.se/zackarias-johansson-klar-for-echampions-league/\" rel=\"nofollow\">Zackarias Johansson klar för eChampions League</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>\n",
        "inserted": 1613375692,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    },
    {
        "id": 17,
        "title": "Instruktörer till FIFA-akademin klara",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "Hj8hzNUkAOZzUg.png",
        "author": null,
        "preview": "<p>Zackarias Johansson och Oskar Hemby är klara som instruktörer till FIFA-akademin som Malmö FF bedriver tillsammans med Malmö Fria Läroverk.</p><p><img src=\"https://www.mff.se/app/uploads/2021/02/oskar-zacke-1024x576.png\" height=\"576\" width=\"1024\">Oskar Hemby och Zackarias Johansson</p><h2>Zackarias Johansson, FIFA-coach</h2><p>Zackarias är en av landets bästa FIFA-spelare och har tre år bakom sig i MFF med bland annat en förstaplats och en andraplats i eAllsvenskan som facit.</p><p>I egenskap av professionell FIFA-spelare kommer Zackarias att instruera eleverna i hur de ska utvecklas som FIFA-spelare.</p><h2>Oskar Hemby, hälsocoach</h2><p>Oskar Hemby har precis som Zackarias varit en del av MFFESPORT sedan starten och är ledande i Sverige inom frågor som rör hälsa och esport. Oskar kommer att vara ansvarig för de hälsomässiga aspekterna med utbildning inom ergonomi, kost, sömn och fysisk träning.</p><p>Första terminen startar i augusti 2021 och du kan ansöka via <a href=\"http://www.skanegy.se\" rel=\"nofollow\">skanegy.se</a> fram till den 15 februari.</p><p><em>Har du frågor kring skolan och ansökningsprocessen? Kontakta </em><a href=\"mailto:henrik.jonsson@laroverken.se\" rel=\"nofollow\"><em>henrik.jonsson@laroverken.se</em></a></p><p><br></p><p><br></p><p><br></p><p>Nyheter</p><p><br></p><p>  {{post.date}} {{term.name}}</p><h3>huvudpartners</h3><p><a href=\"http://eleda.se\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/02/Eleda-Bla%CC%8A.png\" height=\"255\" width=\"1172\"></a></p><p><a href=\"https://eu.puma.com/se/sv/home\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2018/11/puma-blue.png\" height=\"58\" width=\"114\"></a></p><p><a href=\"https://vwmalmo.se/Anlaggningar/Malmo/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/04/2020-04-14_volkswagen-vw-80x80-1.png\" height=\"80\" width=\"80\"></a></p><p><a href=\"http://limitado.se\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/01/2020-01-31_limitado-blue.png\" height=\"736\" width=\"4622\"></a></p><p><a href=\"http://tictac.se\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2018/11/tictac-blue.png\" height=\"50\" width=\"116\"></a></p><p><a href=\"http://unibet.se\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2019/12/unibet_bla%CC%8A-e1577707425231.png\" height=\"50\" width=\"141\"></a></p><h3>officiella partners</h3><p><img src=\"https://www.mff.se/app/uploads/2020/01/ApQ_100x66.png\" height=\"66\" width=\"100\"></p><p><img src=\"https://www.mff.se/app/uploads/2018/11/bemt-blue.png\" height=\"24\" width=\"80\"></p><p><img src=\"https://www.mff.se/app/uploads/2019/03/2019-03-25_cabonline.png\" height=\"30\" width=\"150\"></p><p><img src=\"https://www.mff.se/app/uploads/2018/11/elitfonster-blue.png\" height=\"33\" width=\"136\"></p><p><img src=\"https://www.mff.se/app/uploads/2018/11/exacta-blue.png\" height=\"25\" width=\"127\"></p><p><img src=\"https://www.mff.se/app/uploads/2018/11/lansfors-blue.png\" height=\"25\" width=\"136\"></p><p><img src=\"https://www.mff.se/app/uploads/2019/10/2019-10-29_Simplify_logo_blue.png\" height=\"360\" width=\"1403\"></p><p><img src=\"https://www.mff.se/app/uploads/2019/03/2019-03-25_spendrups.png\" height=\"32\" width=\"135\"></p><p><img src=\"https://www.mff.se/app/uploads/2018/11/sydsvenskan-blue.png\" height=\"25\" width=\"142\"></p><p>The post <a href=\"https://www.mff.se/instruktorer-till-fifa-akademin-klara/\" rel=\"nofollow\">Instruktörer till FIFA-akademin klara</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>",
        "inserted": 1612261193,
        "org": {
            "id": 2,
            "name": "Malmö FF",
            "logo": "QL031SIZjLstLw.png",
            "background": "CwrfYvuCwBfuXQ.png",
            "banner_url": null,
            "slug": "mff",
            "flags": 641,
            "inserted": 1607955909
        },
        "flags": null
    },
    {
        "id": 32,
        "title": "Instruktörer till FIFA-akademin klara",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "0Q9BQwnwyv6HQw.png",
        "author": null,
        "preview": "\n<p>Zackarias Johansson och Oskar Hemby är klara som instruktörer till FIFA-akademin som Malmö FF bedriver tillsammans med Malmö Fria Läroverk.</p>\n\n\n\n<figure><img width=\"1024\" height=\"576\" src=\"https://www.mff.se/app/uploads/2021/02/oskar-zacke-1024x576.png\" alt=\"\"/><figcaption>Oskar Hemby och Zackarias Johansson</figcaption></figure>\n\n\n\n<div style=\"height:50px\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2>Zackarias Johansson, FIFA-coach</h2>\n\n\n\n<p>Zackarias är en av landets bästa FIFA-spelare och har tre år bakom sig i MFF med bland annat en förstaplats och en andraplats i eAllsvenskan som facit.</p>\n\n\n\n<p>I egenskap av professionell FIFA-spelare kommer Zackarias att instruera eleverna i hur de ska utvecklas som FIFA-spelare.</p>\n\n\n\n<div style=\"height:25px\" class=\"wp-block-spacer\"></div>\n\n\n\n<h2>Oskar Hemby, hälsocoach</h2>\n\n\n\n<p>Oskar Hemby har precis som Zackarias varit en del av MFFESPORT sedan starten och är ledande i Sverige inom frågor som rör hälsa och esport. Oskar kommer att vara ansvarig för de hälsomässiga aspekterna med utbildning inom ergonomi, kost, sömn och fysisk träning.</p>\n\n\n\n<p>Första terminen startar i augusti 2021 och du kan ansöka via <a href=\"http://www.skanegy.se\" rel=\"nofollow\">skanegy.se</a> fram till den 15 februari.</p>\n\n\n\n<div style=\"height:15px\" class=\"wp-block-spacer\"></div>\n\n\n\n<p><em>Har du frågor kring skolan och ansökningsprocessen? Kontakta <a href=\"mailto:henrik.jonsson@laroverken.se\" rel=\"nofollow\">henrik.jonsson@laroverken.se</a></em></p>\n\n\n\n<div style=\"height:50px\" class=\"wp-block-spacer\"></div>\n\n\n<div class=\"wp-block-mff-latest-news alignfull\">\n\n\t\t\t\n\n\t\t\t<div class=\"container\">\n\n\t\t\t\t<div class=\"row\">\n\n\t\t\t\t\t<div class=\"title-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"social-media-links\">\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"button-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\n\t\n\t<div>\n\n\t\t\t\t\t<div class=\"term-filter\">\n\t\t\t\t<div class=\"container\">\n\n\t\t\t\t\t\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\tNyheter\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\n\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t\n\t\t<div class=\"posts\">\n\n\t\t\t<div class=\"posts-row\">\n\n\t\t\t\t<div class=\"post\">\n\n\t\t\t\t\t\n\t\t\t\t\t\t<div class=\"post-content-wrapper\">\n\t\t\t\t\t\t\t<figure>\n\t\t\t\t\t\t\t</figure>\n\t\t\t\t\t\t\t<span></span>\n\n\t\t\t\t\t\t\t<div class=\"texts\">\n\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\n\t\t\t\t\t\t\t\t<div class=\"meta\">\n\t\t\t\t\t\t\t\t\t<time>{{post.date}}</time>\n\t\t\t\t\t\t\t\t\t<span>{{term.name}}</span>\n\t\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\t\n\t\t</div>\n\n\t</div>\n\n\t\n</div>\n\n\n\n<div class=\"wp-block-mff-sponsors-partners style-dark alignfull\"><div class=\"block-content-wrapper\">\n<div class=\"wp-block-mff-logos-row\"><div class=\"title\"><div class=\"lines\"><h3>huvudpartners</h3></div></div><div class=\"images-container\"><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://eleda.se\" rel=\"nofollow\"><img width=\"1172\" height=\"255\" src=\"https://www.mff.se/app/uploads/2020/02/Eleda-Bla%CC%8A.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://eu.puma.com/se/sv/home\" rel=\"nofollow\"><img width=\"114\" height=\"58\" src=\"https://www.mff.se/app/uploads/2018/11/puma-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://vwmalmo.se/Anlaggningar/Malmo/\" rel=\"nofollow\"><img width=\"80\" height=\"80\" src=\"https://www.mff.se/app/uploads/2020/04/2020-04-14_volkswagen-vw-80x80-1.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://tictac.se\" rel=\"nofollow\"><img width=\"116\" height=\"50\" src=\"https://www.mff.se/app/uploads/2018/11/tictac-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://unibet.se\" rel=\"nofollow\"><img width=\"141\" height=\"50\" src=\"https://www.mff.se/app/uploads/2019/12/unibet_bla%CC%8A-e1577707425231.png\" alt=\"\"/></a></div></div></div></div>\n\n\n\n<div class=\"wp-block-mff-logos-row\"><div class=\"title\"><div class=\"lines\"><h3>officiella partners</h3></div></div><div class=\"images-container\"><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.apqel.se/\" rel=\"nofollow\"><img width=\"100\" height=\"66\" src=\"https://www.mff.se/app/uploads/2020/01/ApQ_100x66.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://bemt.nu\" rel=\"nofollow\"><img width=\"80\" height=\"24\" src=\"https://www.mff.se/app/uploads/2018/11/bemt-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://cabonline.se\" rel=\"nofollow\"><img width=\"150\" height=\"30\" src=\"https://www.mff.se/app/uploads/2019/03/2019-03-25_cabonline.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://elitfonster.se\" rel=\"nofollow\"><img width=\"136\" height=\"33\" src=\"https://www.mff.se/app/uploads/2018/11/elitfonster-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"http://exakta.se\" rel=\"nofollow\"><img width=\"127\" height=\"25\" src=\"https://www.mff.se/app/uploads/2018/11/exacta-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.lansforsakringar.se/skane/privat/om-oss/\" rel=\"nofollow\"><img width=\"136\" height=\"25\" src=\"https://www.mff.se/app/uploads/2018/11/lansfors-blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.simplify.se\" rel=\"nofollow\"><img width=\"1403\" height=\"360\" src=\"https://www.mff.se/app/uploads/2019/10/2019-10-29_Simplify_logo_blue.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.spendrups.se\" rel=\"nofollow\"><img width=\"135\" height=\"32\" src=\"https://www.mff.se/app/uploads/2019/03/2019-03-25_spendrups.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.sydsvenskan.se\" rel=\"nofollow\"><img width=\"142\" height=\"25\" src=\"https://www.mff.se/app/uploads/2018/11/sydsvenskan-blue.png\" alt=\"\"/></a></div></div></div></div>\n</div></div>\n<p>The post <a href=\"https://www.mff.se/instruktorer-till-fifa-akademin-klara/\" rel=\"nofollow\">Instruktörer till FIFA-akademin klara</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>\n",
        "inserted": 1612261193,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    },
    {
        "id": 16,
        "title": "Oskar Wettéus vinnare av eSkånecupen 20/21",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "QtIORK_x8xUKKw.jpg",
        "author": null,
        "preview": "<p>MFFESPORT:s Oskar Wettéus vann på onsdagskvällen årets upplaga av eSkånecupen i FIFA 21. I finalen besegrade han dansken Oliver Proovstgaard Nielsen i två raka matcher.</p><p><img src=\"https://www.mff.se/app/uploads/2021/01/WhatsApp-Image-2020-12-17-at-20.33.08-1024x682.jpeg\" height=\"682\" width=\"1024\"></p><p>eSkånecupen 20/21 avgjordes endast digitalt med tanke på smittspridningen i samhället och efter åtta deltävlingar ägde finalen runt på onsdagskvällen. När krutröken lagt sig stod MFFESPORT:s nyförvärv Oskar Wettéus kvar som segrare efter en spännande final mot Oliver Proovstgaard Nielsen.</p><p>– Oerhört skönt, det var tuffa matcher. Jag hade en god känsla att jag skulle ta det, allt kändes bra hela finaldagen. Nu är det bara att jobba vidare och fortsätta leverera. I Malmö vinner man, säger Oskar Wettéus, som också passade på att hylla turneringen i intervjun efter vinsten.</p><p>Utöver prispengarna på 4 000 kronor tilldelas Oskar också en gamingstol från Noblechairs för sin förstaplats.</p><p>Finalspelet sänds live på mff.se och under de två veckorna turneringen har pågått har över 1 000 FIFA-spelare deltagit och slagits om den 30 000 kronor stora prispotten.</p><p>Malmö FF vill tacka sina huvudpartners till eSkånecupen: Xtrfy, Puma, TicTac och Noblechairs, samt övriga turneringspartners för att ni gjorde turneringen möjlig.</p><h3>huvudpartners eskånecupen</h3><p><a href=\"https://xtrfy.com/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/Xtrfy_vit.png\" height=\"401\" width=\"1191\"></a></p><p><a href=\"https://eu.puma.com/se/en/home\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/PUMA_vit.png\" height=\"470\" width=\"946\"></a></p><p><a href=\"https://tictac.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/tictac_vit.png\" height=\"507\" width=\"1182\"></a></p><p><a href=\"https://noblechairs.com/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/noblechairs-vit-1.png\" height=\"3543\" width=\"18898\"></a></p><h3>turneringspartners</h3><p><a href=\"https://akeab.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/Akea-Eleda-Logo-vit.png\" height=\"743\" width=\"2000\"></a></p><p><a href=\"https://bergkvarabuss.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/BergkvaraBuss_Logotyp_Vit.png\" height=\"583\" width=\"3371\"></a></p><p><a href=\"https://lillaglassfabriken.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/Lilla-Glassfabriken.png\" height=\"1000\" width=\"2000\"></a></p><p><a href=\"https://www.escapetravel.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/Escape-Sport-vit.png\" height=\"385\" width=\"1116\"></a></p><p><a href=\"https://www.gdr.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/GdR-vit.png\" height=\"1156\" width=\"3041\"></a></p><p><a href=\"https://www.re-new.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/Re-new-vit.png\" height=\"322\" width=\"862\"></a></p><p><a href=\"https://ahnelovsindustrimalning.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/ahnelo%CC%88vs_vit.png\" height=\"735\" width=\"2894\"></a></p><p><a href=\"https://www.hedbergs.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/Fordstore-Hedbergs-Bil-vit.png\" height=\"111\" width=\"846\"></a></p><p><a href=\"https://mobill.se/home\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/Mobill_vit.png\" height=\"414\" width=\"2005\"></a></p><p><a href=\"https://www.premiemax.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/Premiemax-vit.png\" height=\"62\" width=\"492\"></a></p><p><a href=\"https://rormontorensyd.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/Ro%CC%88rmonto%CC%88ren-vit.png\" height=\"524\" width=\"3200\"></a></p><p><a href=\"https://www.tvattmaskinservice.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/bengtssonstva%CC%88tt_vit-1-1.png\" height=\"138\" width=\"1000\"></a></p><p><a href=\"https://www.klimatreglering.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/Klimatreglering_vit.png\" height=\"89\" width=\"861\"></a></p><p><a href=\"https://www.malmocityfastigheter.se/\" rel=\"nofollow\"><img src=\"https://www.mff.se/app/uploads/2020/12/MCF-vit.png\" height=\"1371\" width=\"1670\"></a></p><p>The post <a href=\"https://www.mff.se/oskar-wetteus-vinnare-av-eskanecupen-20-21/\" rel=\"nofollow\">Oskar Wettéus vinnare av eSkånecupen 20/21</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>",
        "inserted": 1610012349,
        "org": {
            "id": 2,
            "name": "Malmö FF",
            "logo": "QL031SIZjLstLw.png",
            "background": "CwrfYvuCwBfuXQ.png",
            "banner_url": null,
            "slug": "mff",
            "flags": 641,
            "inserted": 1607955909
        },
        "flags": null
    },
    {
        "id": 31,
        "title": "Oskar Wettéus vinnare av eSkånecupen 20/21",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "kaSjhqk0sXZ5Iw.jpg",
        "author": null,
        "preview": "\n<p>MFFESPORT:s Oskar Wettéus vann på onsdagskvällen årets upplaga av eSkånecupen i FIFA 21. I finalen besegrade han dansken Oliver Proovstgaard Nielsen i två raka matcher.</p>\n\n\n\n<figure><img width=\"1024\" height=\"682\" src=\"https://www.mff.se/app/uploads/2021/01/WhatsApp-Image-2020-12-17-at-20.33.08-1024x682.jpeg\" alt=\"\"/></figure>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<p>eSkånecupen 20/21 avgjordes endast digitalt med tanke på smittspridningen i samhället och efter åtta deltävlingar ägde finalen runt på onsdagskvällen. När krutröken lagt sig stod MFFESPORT:s nyförvärv Oskar Wettéus kvar som segrare efter en spännande final mot Oliver Proovstgaard Nielsen.</p>\n\n\n\n<p>– Oerhört skönt, det var tuffa matcher. Jag hade en god känsla att jag skulle ta det, allt kändes bra hela finaldagen. Nu är det bara att jobba vidare och fortsätta leverera. I Malmö vinner man, säger Oskar Wettéus, som också passade på att hylla turneringen i intervjun efter vinsten.</p>\n\n\n\n<p>Utöver prispengarna på 4 000 kronor tilldelas Oskar också en gamingstol från Noblechairs för sin förstaplats.</p>\n\n\n\n<p>Finalspelet sänds live på mff.se och under de två veckorna turneringen har pågått har över 1 000 FIFA-spelare deltagit och slagits om den 30 000 kronor stora prispotten.</p>\n\n\n\n<p>Malmö FF vill tacka sina huvudpartners till eSkånecupen: Xtrfy, Puma, TicTac och Noblechairs, samt övriga turneringspartners för att ni gjorde turneringen möjlig. </p>\n\n\n\n<div style=\"height:53px\" class=\"wp-block-spacer\"></div>\n\n\n\n<div class=\"wp-block-mff-sponsors-partners style-dark alignfull\"><div class=\"block-content-wrapper\">\n<div class=\"wp-block-mff-logos-row\"><div class=\"title\"><div class=\"lines\"><h3>huvudpartners eskånecupen</h3></div></div><div class=\"images-container\"><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://xtrfy.com/\" rel=\"nofollow\"><img width=\"1191\" height=\"401\" src=\"https://www.mff.se/app/uploads/2020/12/Xtrfy_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://eu.puma.com/se/en/home\" rel=\"nofollow\"><img width=\"946\" height=\"470\" src=\"https://www.mff.se/app/uploads/2020/12/PUMA_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://tictac.se/\" rel=\"nofollow\"><img width=\"1182\" height=\"507\" src=\"https://www.mff.se/app/uploads/2020/12/tictac_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://noblechairs.com/\" rel=\"nofollow\"><img width=\"18898\" height=\"3543\" src=\"https://www.mff.se/app/uploads/2020/12/noblechairs-vit-1.png\" alt=\"\"/></a></div></div></div></div>\n\n\n\n<div class=\"wp-block-mff-logos-row\"><div class=\"title\"><div class=\"lines\"><h3>turneringspartners</h3></div></div><div class=\"images-container\"><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://akeab.se/\" rel=\"nofollow\"><img width=\"2000\" height=\"743\" src=\"https://www.mff.se/app/uploads/2020/12/Akea-Eleda-Logo-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://bergkvarabuss.se/\" rel=\"nofollow\"><img width=\"3371\" height=\"583\" src=\"https://www.mff.se/app/uploads/2020/12/BergkvaraBuss_Logotyp_Vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://lillaglassfabriken.se/\" rel=\"nofollow\"><img width=\"2000\" height=\"1000\" src=\"https://www.mff.se/app/uploads/2020/12/Lilla-Glassfabriken.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.escapetravel.se/\" rel=\"nofollow\"><img width=\"1116\" height=\"385\" src=\"https://www.mff.se/app/uploads/2020/12/Escape-Sport-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.gdr.se/\" rel=\"nofollow\"><img width=\"3041\" height=\"1156\" src=\"https://www.mff.se/app/uploads/2020/12/GdR-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.re-new.se/\" rel=\"nofollow\"><img width=\"862\" height=\"322\" src=\"https://www.mff.se/app/uploads/2020/12/Re-new-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://ahnelovsindustrimalning.se/\" rel=\"nofollow\"><img width=\"2894\" height=\"735\" src=\"https://www.mff.se/app/uploads/2020/12/ahnelo%CC%88vs_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.hedbergs.se/\" rel=\"nofollow\"><img width=\"846\" height=\"111\" src=\"https://www.mff.se/app/uploads/2020/12/Fordstore-Hedbergs-Bil-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://mobill.se/home\" rel=\"nofollow\"><img width=\"2005\" height=\"414\" src=\"https://www.mff.se/app/uploads/2020/12/Mobill_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.premiemax.se/\" rel=\"nofollow\"><img width=\"492\" height=\"62\" src=\"https://www.mff.se/app/uploads/2020/12/Premiemax-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://rormontorensyd.se/\" rel=\"nofollow\"><img width=\"3200\" height=\"524\" src=\"https://www.mff.se/app/uploads/2020/12/Ro%CC%88rmonto%CC%88ren-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.tvattmaskinservice.se/\" rel=\"nofollow\"><img width=\"1000\" height=\"138\" src=\"https://www.mff.se/app/uploads/2020/12/bengtssonstva%CC%88tt_vit-1-1.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.klimatreglering.se/\" rel=\"nofollow\"><img width=\"861\" height=\"89\" src=\"https://www.mff.se/app/uploads/2020/12/Klimatreglering_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.malmocityfastigheter.se/\" rel=\"nofollow\"><img width=\"1670\" height=\"1371\" src=\"https://www.mff.se/app/uploads/2020/12/MCF-vit.png\" alt=\"\"/></a></div></div></div></div>\n</div></div>\n\n\n<p>The post <a href=\"https://www.mff.se/oskar-wetteus-vinnare-av-eskanecupen-20-21/\" rel=\"nofollow\">Oskar Wettéus vinnare av eSkånecupen 20/21</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>\n",
        "inserted": 1610012349,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    },
    {
        "id": 15,
        "title": "Se finalen av eSkånecupen",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "9JmJWg5AZ-2nXQ.jpg",
        "author": null,
        "preview": "\n<figure><img width=\"1024\" height=\"579\" src=\"https://www.mff.se/app/uploads/2021/01/5-1-1024x579.jpg\" alt=\"\"/></figure>\n\n\n\n<div style=\"height:21px\" class=\"wp-block-spacer\"></div>\n\n\n\n<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/497193379\" style=\"position: absolute; top: 0; left: 0; width: 100%; height: 100%\"></iframe></div>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<p>Klockan 18:00 på trettondagen drar det stora finalspelet av eSkånecupen igång. Du ser det här.  </p>\n\n\n\n<p>Efter åtta deltävlingar är det dags att få en vinnare av eSkånecupen, klockan 18:00 börjar det stora finalspelet. De åtta finalisterna har lottats in i två grupper där alla möter alla i varje grupp innan det endast finns två spelare kvar. </p>\n\n\n\n<p>En av de som kvalificerat sig till finalspelen är Malmö FF:s egna FIFA-spelare Oskar Wetteus. <br><br>Hela finalspelet ser du live här på mff.se och kommentator är ingen mindre än MFF:s medlemsansvarig och SLO Pierre Nordberg som kommer att guida er igenom matcherna tillsammans med Victor Dahling.</p>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<div class=\"wp-block-mff-sponsors-partners style-dark alignfull\"><div class=\"block-content-wrapper\">\n<div class=\"wp-block-mff-logos-row\"><div class=\"title\"><div class=\"lines\"><h3>huvudpartners eskånecupen</h3></div></div><div class=\"images-container\"><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://xtrfy.com/\" rel=\"nofollow\"><img width=\"1191\" height=\"401\" src=\"https://www.mff.se/app/uploads/2020/12/Xtrfy_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://eu.puma.com/se/en/home\" rel=\"nofollow\"><img width=\"946\" height=\"470\" src=\"https://www.mff.se/app/uploads/2020/12/PUMA_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://tictac.se/\" rel=\"nofollow\"><img width=\"1182\" height=\"507\" src=\"https://www.mff.se/app/uploads/2020/12/tictac_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://noblechairs.com/\" rel=\"nofollow\"><img width=\"18898\" height=\"3543\" src=\"https://www.mff.se/app/uploads/2020/12/noblechairs-vit-1.png\" alt=\"\"/></a></div></div></div></div>\n\n\n\n<div class=\"wp-block-mff-logos-row\"><div class=\"title\"><div class=\"lines\"><h3>turneringspartners</h3></div></div><div class=\"images-container\"><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://akeab.se/\" rel=\"nofollow\"><img width=\"2000\" height=\"743\" src=\"https://www.mff.se/app/uploads/2020/12/Akea-Eleda-Logo-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://bergkvarabuss.se/\" rel=\"nofollow\"><img width=\"3371\" height=\"583\" src=\"https://www.mff.se/app/uploads/2020/12/BergkvaraBuss_Logotyp_Vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://lillaglassfabriken.se/\" rel=\"nofollow\"><img width=\"2000\" height=\"1000\" src=\"https://www.mff.se/app/uploads/2020/12/Lilla-Glassfabriken.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.escapetravel.se/\" rel=\"nofollow\"><img width=\"1116\" height=\"385\" src=\"https://www.mff.se/app/uploads/2020/12/Escape-Sport-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.gdr.se/\" rel=\"nofollow\"><img width=\"3041\" height=\"1156\" src=\"https://www.mff.se/app/uploads/2020/12/GdR-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.re-new.se/\" rel=\"nofollow\"><img width=\"862\" height=\"322\" src=\"https://www.mff.se/app/uploads/2020/12/Re-new-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://ahnelovsindustrimalning.se/\" rel=\"nofollow\"><img width=\"2894\" height=\"735\" src=\"https://www.mff.se/app/uploads/2020/12/ahnelo%CC%88vs_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.hedbergs.se/\" rel=\"nofollow\"><img width=\"846\" height=\"111\" src=\"https://www.mff.se/app/uploads/2020/12/Fordstore-Hedbergs-Bil-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://mobill.se/home\" rel=\"nofollow\"><img width=\"2005\" height=\"414\" src=\"https://www.mff.se/app/uploads/2020/12/Mobill_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.premiemax.se/\" rel=\"nofollow\"><img width=\"492\" height=\"62\" src=\"https://www.mff.se/app/uploads/2020/12/Premiemax-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://rormontorensyd.se/\" rel=\"nofollow\"><img width=\"3200\" height=\"524\" src=\"https://www.mff.se/app/uploads/2020/12/Ro%CC%88rmonto%CC%88ren-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.tvattmaskinservice.se/\" rel=\"nofollow\"><img width=\"1000\" height=\"138\" src=\"https://www.mff.se/app/uploads/2020/12/bengtssonstva%CC%88tt_vit-1-1.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.klimatreglering.se/\" rel=\"nofollow\"><img width=\"861\" height=\"89\" src=\"https://www.mff.se/app/uploads/2020/12/Klimatreglering_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.malmocityfastigheter.se/\" rel=\"nofollow\"><img width=\"1670\" height=\"1371\" src=\"https://www.mff.se/app/uploads/2020/12/MCF-vit.png\" alt=\"\"/></a></div></div></div></div>\n</div></div>\n\n\n\n<div style=\"height:49px\" class=\"wp-block-spacer\"></div>\n\n\n<p>The post <a href=\"https://www.mff.se/se-finalen-av-eskanecupen/\" rel=\"nofollow\">Se finalen av eSkånecupen</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>\n",
        "inserted": 1609925362,
        "org": {
            "id": 2,
            "name": "Malmö FF",
            "logo": "QL031SIZjLstLw.png",
            "background": "CwrfYvuCwBfuXQ.png",
            "banner_url": null,
            "slug": "mff",
            "flags": 641,
            "inserted": 1607955909
        },
        "flags": null
    },
    {
        "id": 30,
        "title": "Se finalen av eSkånecupen",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "E-KR7me8aJMXhw.jpg",
        "author": null,
        "preview": "\n<figure><img width=\"1024\" height=\"579\" src=\"https://www.mff.se/app/uploads/2021/01/5-1-1024x579.jpg\" alt=\"\"/></figure>\n\n\n\n<div style=\"height:21px\" class=\"wp-block-spacer\"></div>\n\n\n\n<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/497193379\" style=\"position: absolute; top: 0; left: 0; width: 100%; height: 100%\"></iframe></div>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<p>Klockan 18:00 på trettondagen drar det stora finalspelet av eSkånecupen igång. Du ser det här.  </p>\n\n\n\n<p>Efter åtta deltävlingar är det dags att få en vinnare av eSkånecupen, klockan 18:00 börjar det stora finalspelet. De åtta finalisterna har lottats in i två grupper där alla möter alla i varje grupp innan det endast finns två spelare kvar. </p>\n\n\n\n<p>En av de som kvalificerat sig till finalspelen är Malmö FF:s egna FIFA-spelare Oskar Wetteus. <br><br>Hela finalspelet ser du live här på mff.se och kommentator är ingen mindre än MFF:s medlemsansvarig och SLO Pierre Nordberg som kommer att guida er igenom matcherna tillsammans med Victor Dahling.</p>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<div class=\"wp-block-mff-sponsors-partners style-dark alignfull\"><div class=\"block-content-wrapper\">\n<div class=\"wp-block-mff-logos-row\"><div class=\"title\"><div class=\"lines\"><h3>huvudpartners eskånecupen</h3></div></div><div class=\"images-container\"><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://xtrfy.com/\" rel=\"nofollow\"><img width=\"1191\" height=\"401\" src=\"https://www.mff.se/app/uploads/2020/12/Xtrfy_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://eu.puma.com/se/en/home\" rel=\"nofollow\"><img width=\"946\" height=\"470\" src=\"https://www.mff.se/app/uploads/2020/12/PUMA_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://tictac.se/\" rel=\"nofollow\"><img width=\"1182\" height=\"507\" src=\"https://www.mff.se/app/uploads/2020/12/tictac_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://noblechairs.com/\" rel=\"nofollow\"><img width=\"18898\" height=\"3543\" src=\"https://www.mff.se/app/uploads/2020/12/noblechairs-vit-1.png\" alt=\"\"/></a></div></div></div></div>\n\n\n\n<div class=\"wp-block-mff-logos-row\"><div class=\"title\"><div class=\"lines\"><h3>turneringspartners</h3></div></div><div class=\"images-container\"><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://akeab.se/\" rel=\"nofollow\"><img width=\"2000\" height=\"743\" src=\"https://www.mff.se/app/uploads/2020/12/Akea-Eleda-Logo-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://bergkvarabuss.se/\" rel=\"nofollow\"><img width=\"3371\" height=\"583\" src=\"https://www.mff.se/app/uploads/2020/12/BergkvaraBuss_Logotyp_Vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://lillaglassfabriken.se/\" rel=\"nofollow\"><img width=\"2000\" height=\"1000\" src=\"https://www.mff.se/app/uploads/2020/12/Lilla-Glassfabriken.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.escapetravel.se/\" rel=\"nofollow\"><img width=\"1116\" height=\"385\" src=\"https://www.mff.se/app/uploads/2020/12/Escape-Sport-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.gdr.se/\" rel=\"nofollow\"><img width=\"3041\" height=\"1156\" src=\"https://www.mff.se/app/uploads/2020/12/GdR-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.re-new.se/\" rel=\"nofollow\"><img width=\"862\" height=\"322\" src=\"https://www.mff.se/app/uploads/2020/12/Re-new-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://ahnelovsindustrimalning.se/\" rel=\"nofollow\"><img width=\"2894\" height=\"735\" src=\"https://www.mff.se/app/uploads/2020/12/ahnelo%CC%88vs_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.hedbergs.se/\" rel=\"nofollow\"><img width=\"846\" height=\"111\" src=\"https://www.mff.se/app/uploads/2020/12/Fordstore-Hedbergs-Bil-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://mobill.se/home\" rel=\"nofollow\"><img width=\"2005\" height=\"414\" src=\"https://www.mff.se/app/uploads/2020/12/Mobill_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.premiemax.se/\" rel=\"nofollow\"><img width=\"492\" height=\"62\" src=\"https://www.mff.se/app/uploads/2020/12/Premiemax-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://rormontorensyd.se/\" rel=\"nofollow\"><img width=\"3200\" height=\"524\" src=\"https://www.mff.se/app/uploads/2020/12/Ro%CC%88rmonto%CC%88ren-vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.tvattmaskinservice.se/\" rel=\"nofollow\"><img width=\"1000\" height=\"138\" src=\"https://www.mff.se/app/uploads/2020/12/bengtssonstva%CC%88tt_vit-1-1.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.klimatreglering.se/\" rel=\"nofollow\"><img width=\"861\" height=\"89\" src=\"https://www.mff.se/app/uploads/2020/12/Klimatreglering_vit.png\" alt=\"\"/></a></div></div><div class=\"image-wrapper\"><div class=\"logo\"><a href=\"https://www.malmocityfastigheter.se/\" rel=\"nofollow\"><img width=\"1670\" height=\"1371\" src=\"https://www.mff.se/app/uploads/2020/12/MCF-vit.png\" alt=\"\"/></a></div></div></div></div>\n</div></div>\n\n\n\n<div style=\"height:49px\" class=\"wp-block-spacer\"></div>\n\n\n<p>The post <a href=\"https://www.mff.se/se-finalen-av-eskanecupen/\" rel=\"nofollow\">Se finalen av eSkånecupen</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>\n",
        "inserted": 1609925362,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    },
    {
        "id": 14,
        "title": "Stor framgång för eSkånecupen,  Dags att få en vinnare",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "rA1v83wxlQz11A.jpg",
        "author": null,
        "preview": "<p>Tävlande över landsgränserna och en tuff kamp om platserna i deltävlingarna är resultatet av årets upplaga av eSkånecupen. Imorgon ska en vinnare koras när det är dags för den stora finaldagen.</p><p><img src=\"https://www.mff.se/app/uploads/2021/01/5-1024x579.jpg\" height=\"579\" width=\"1024\"></p><p>Över tusen entusiastiska FIFA-spelare har under årsskiftet tävlat i Malmö FF:s och MFFESPORT:s onlineturnering eSkånecupen. På trettondagen väntas den stora finaldagen.</p><p>– Gensvaret har varit fantastiskt och det har varit en kamp om platserna till deltävlingarna. Det har varit tävlande från hela Skandinavien och kvalitén på spelarna som tagit sig till finaldagen är väldigt hög, säger Filip Ahlström, projektledare för MFFESPORT.</p><p>I åtta dagar har deltävlingar genomförts. Vinnaren har belönats med tvåtusen kronor och kvalificerat sig till den stora finaldagen. Inför varje deltävling har 128 tävlingsplatser släppts via en registreringslänk där trycket på anmälan varit så stort att platserna till samtliga deltävlingar tagit slut på bara några minuter.</p><p>En av de som kvalificerat sig till finalen är Malmö FF:s egna FIFA-spelare Oskar Wetteus.</p><p>– Det är fantastiskt roligt att föreningen tagit initiativ till att arrangera ytterligare en turnering. Det finns tyvärr inte så många turneringar för oss och utan turneringar blir tävlingssäsongen väldigt kort. Det är också väldigt kul att så många duktiga spelare anmält sig till eSkånecupen. Så det kommer bli tufft att ta sig till den stora finalen men vi siktar på en hemmaseger i eSkånecupen, säger Oskar Wetteus. </p><p><em>Finalspelen inleds klockan 18:00 den 6 januari och livesänds med kommentatorer på mff.se.</em></p><p><img src=\"https://www.mff.se/app/uploads/2021/02/BB200805LT077-scaled.jpg\"></p><h2><strong>Förnya årskort</strong></h2><p>Nu kan alla årskortsinnehavare förnya sina årskort till nästa säsong.</p><p><a href=\"http://www.mff.se/arskort-2021\" rel=\"nofollow\">Läs mer</a></p><p><br></p><p><br></p><p><br></p><p>Nyheter</p><p><br></p><p>{{post.date}} {{term.name}}</p><p>The post <a href=\"https://www.mff.se/stor-framgang-for-eskanecupen-dags-att-fa-en-vinnare/\" rel=\"nofollow\">Stor framgång för eSkånecupen, Dags att få en vinnare</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>",
        "inserted": 1609837389,
        "org": {
            "id": 2,
            "name": "Malmö FF",
            "logo": "QL031SIZjLstLw.png",
            "background": "CwrfYvuCwBfuXQ.png",
            "banner_url": null,
            "slug": "mff",
            "flags": 641,
            "inserted": 1607955909
        },
        "flags": null
    },
    {
        "id": 29,
        "title": "Stor framgång för eSkånecupen,  Dags att få en vinnare",
        "category": null,
        "content": "",
        "image": null,
        "thumbnail": "3e_349hKlrPSNQ.jpg",
        "author": null,
        "preview": "\n<p>Tävlande över landsgränserna och en tuff kamp om platserna i deltävlingarna är resultatet av årets upplaga av eSkånecupen. Imorgon ska en vinnare koras när det är dags för den stora finaldagen.</p>\n\n\n\n<figure><img width=\"1024\" height=\"579\" src=\"https://www.mff.se/app/uploads/2021/01/5-1024x579.jpg\" alt=\"\"/></figure>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<p>Över tusen entusiastiska FIFA-spelare har under årsskiftet tävlat i Malmö FF:s och MFFESPORT:s onlineturnering eSkånecupen. På trettondagen väntas den stora finaldagen. </p>\n\n\n\n<p>– Gensvaret har varit fantastiskt och det har varit en kamp om platserna till deltävlingarna. Det har varit tävlande från hela Skandinavien och kvalitén på spelarna som tagit sig till finaldagen är väldigt hög, säger Filip Ahlström, projektledare för MFFESPORT.</p>\n\n\n\n<p>I åtta dagar har deltävlingar genomförts. Vinnaren har belönats med tvåtusen kronor och kvalificerat sig till den stora finaldagen. Inför varje deltävling har 128 tävlingsplatser släppts via en registreringslänk där trycket på anmälan varit så stort att platserna till samtliga deltävlingar tagit slut på bara några minuter.</p>\n\n\n\n<p>En av de som kvalificerat sig till finalen är Malmö FF:s egna FIFA-spelare Oskar Wetteus.</p>\n\n\n\n<p>– Det är fantastiskt roligt att föreningen tagit initiativ till att arrangera ytterligare en turnering. Det finns tyvärr inte så många turneringar för oss och utan turneringar blir tävlingssäsongen väldigt kort. Det är också väldigt kul att så många duktiga spelare anmält sig till eSkånecupen. Så det kommer bli tufft att ta sig till den stora finalen men vi siktar på en hemmaseger i eSkånecupen, säger Oskar Wetteus. </p>\n\n\n\n<p><em>Finalspelen inleds klockan 18:00 den 6 januari och livesänds med kommentatorer på mff.se.<br></em></p>\n\n\n\n<div style=\"height:20px\" class=\"wp-block-spacer\"></div>\n\n\n\n<div class=\"wp-block-mff-wp-theme-image-text-block alignwide image-text has-very-light-gray-background-color\"><figure><img src=\"https://www.mff.se/app/uploads/2021/03/BB201108PA107-scaled.jpg\" alt=\"\"/></figure><div class=\"image-text__content\">\n<h2><strong>KÖP årskort</strong></h2>\n\n\n\n<p>Säkra din plats till den allsvenska säsongen 2021.</p>\n\n\n\n<div class=\"wp-block-button is-style-mff-button\"><a href=\"http://www.mff.se/arskort-2021\" rel=\"nofollow\">Läs mer</a></div>\n</div></div>\n\n\n<div class=\"wp-block-mff-latest-news alignfull\">\n\n\t\t\t\n\n\t\t\t<div class=\"container\">\n\n\t\t\t\t<div class=\"row\">\n\n\t\t\t\t\t<div class=\"title-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"social-media-links\">\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\n\t\t\t\t\t\t\n\t\t\t\t\t</div>\n\n\t\t\t\t\t<div class=\"button-wrapper\">\n\t\t\t\t\t\t\t\t\t\t\t</div>\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\n\t\n\t<div>\n\n\t\t\t\t\t<div class=\"term-filter\">\n\t\t\t\t<div class=\"container\">\n\n\t\t\t\t\t\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\tNyheter\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\n\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t\n\t\t<div class=\"posts\">\n\n\t\t\t<div class=\"posts-row\">\n\n\t\t\t\t<div class=\"post\">\n\n\t\t\t\t\t\n\t\t\t\t\t\t<div class=\"post-content-wrapper\">\n\t\t\t\t\t\t\t<figure>\n\t\t\t\t\t\t\t</figure>\n\t\t\t\t\t\t\t<span></span>\n\n\t\t\t\t\t\t\t<div class=\"texts\">\n\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\t\t\t\t\t\t\t\t<h3></h3>\n\n\t\t\t\t\t\t\t\t<div class=\"meta\">\n\t\t\t\t\t\t\t\t\t<time>{{post.date}}</time>\n\t\t\t\t\t\t\t\t\t<span>{{term.name}}</span>\n\t\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\n\n\t\t\t\t</div>\n\n\t\t\t</div>\n\n\t\t\t\n\t\t</div>\n\n\t</div>\n\n\t\n</div>\n\n\n<p>The post <a href=\"https://www.mff.se/stor-framgang-for-eskanecupen-dags-att-fa-en-vinnare/\" rel=\"nofollow\">Stor framgång för eSkånecupen,  Dags att få en vinnare</a> appeared first on <a href=\"https://www.mff.se\" rel=\"nofollow\">Malmö FF</a>.</p>\n",
        "inserted": 1609837389,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        },
        "flags": null
    }
]
''';

const mockTournaments = r'''
[
    {
        "id": 201,
        "name": "Test 2 Juli",
        "logo": "RFickFz6EnBOtg.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 1,
        "starts_at": 1625833440,
        "ends_at": null,
        "format": 3,
        "participants": 4,
        "slots": 6,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 202,
        "name": "Test 1",
        "logo": null,
        "banner": null,
        "flags": 34,
        "custom_banner": null,
        "internal_flags": 0,
        "starts_at": 1625593669,
        "ends_at": null,
        "format": 2,
        "participants": 0,
        "slots": 8,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 199,
        "name": "test 29 Juni",
        "logo": "dxtmKev0ecOgRA.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 1,
        "starts_at": 1624885140,
        "ends_at": null,
        "format": 3,
        "participants": 2,
        "slots": 2,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 195,
        "name": "Test 26 Juli",
        "logo": "cFLVCmihdWS9Mw.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 1,
        "starts_at": 1624705620,
        "ends_at": null,
        "format": 3,
        "participants": 4,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 193,
        "name": "testing starting tournament",
        "logo": null,
        "banner": null,
        "flags": 178,
        "custom_banner": null,
        "internal_flags": 3,
        "starts_at": 1624505636,
        "ends_at": null,
        "format": 3,
        "participants": 4,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 189,
        "name": "test test",
        "logo": "jnxvdhrII0js_g.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 1,
        "starts_at": 1623880680,
        "ends_at": null,
        "format": 3,
        "participants": 4,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 188,
        "name": "Safari Test",
        "logo": null,
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 0,
        "starts_at": 1623867120,
        "ends_at": null,
        "format": 3,
        "participants": 0,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 177,
        "name": "cup",
        "logo": "2K6MPs5Au0JmJQ.png",
        "banner": null,
        "flags": 34,
        "custom_banner": null,
        "internal_flags": 0,
        "starts_at": 1623010080,
        "ends_at": null,
        "format": 3,
        "participants": 0,
        "slots": 10,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 69,
        "name": "Test Creating Tournament",
        "logo": null,
        "banner": "RgQd9Fg-Ogk_hw.jpg",
        "flags": 34,
        "custom_banner": null,
        "internal_flags": 0,
        "starts_at": 1615221840,
        "ends_at": null,
        "format": 1,
        "participants": 0,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": {
            "id": 2,
            "name": "Malmö FF",
            "logo": "QL031SIZjLstLw.png",
            "background": "CwrfYvuCwBfuXQ.png",
            "banner_url": null,
            "slug": "mff",
            "flags": 641,
            "inserted": 1607955909
        }
    },
    {
        "id": 60,
        "name": "test",
        "logo": "0wQTNl1qg6iJCw.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1614280519,
        "ends_at": null,
        "format": 1,
        "participants": 0,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 57,
        "name": "cup",
        "logo": "WNpB5ZP-6yXUJg.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1613006220,
        "ends_at": null,
        "format": 1,
        "participants": 1,
        "slots": 2,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 56,
        "name": "cup",
        "logo": "vJjJDzoD6p4ZYw.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1612746960,
        "ends_at": null,
        "format": 1,
        "participants": 0,
        "slots": 2,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 50,
        "name": "Testing second row of tournaments",
        "logo": "S1QGtsselqX0Pw.png",
        "banner": null,
        "flags": 242,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1605120998,
        "ends_at": null,
        "format": 0,
        "participants": 0,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 48,
        "name": "Testing Ties",
        "logo": null,
        "banner": null,
        "flags": 50,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1605048960,
        "ends_at": null,
        "format": 0,
        "participants": 2,
        "slots": null,
        "game_id": "fifa21",
        "game_settings": "",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 44,
        "name": "Testmiljö",
        "logo": "xeaTsFFo4WOwbA.png",
        "banner": "MUjD_n2uyXo8Qw.png",
        "flags": 66,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1602788400,
        "ends_at": null,
        "format": 1,
        "participants": 1,
        "slots": 16,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 200,
        "name": "Testing editing brackets",
        "logo": null,
        "banner": null,
        "flags": 50,
        "custom_banner": null,
        "internal_flags": 3,
        "starts_at": 1625005751,
        "ends_at": 1625007577,
        "format": 3,
        "participants": 4,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 198,
        "name": "TEST 27 JUNI",
        "logo": "OLkQ1SeM4OWIJw.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 3,
        "starts_at": 1624776060,
        "ends_at": 1624776544,
        "format": 3,
        "participants": 4,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 192,
        "name": "New test",
        "logo": null,
        "banner": null,
        "flags": 178,
        "custom_banner": null,
        "internal_flags": 3,
        "starts_at": 1624505421,
        "ends_at": 1624655150,
        "format": 3,
        "participants": 4,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 187,
        "name": "Test  Juni event",
        "logo": "zY3IpFIT5JHVgA.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 3,
        "starts_at": 1623842040,
        "ends_at": 1623842388,
        "format": 3,
        "participants": 4,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 186,
        "name": "Grupp A",
        "logo": "zyys-BrQy0ZBHA.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 3,
        "starts_at": 1623134820,
        "ends_at": 1623137986,
        "format": 3,
        "participants": 6,
        "slots": 6,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 183,
        "name": "Testing ladder",
        "logo": null,
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 3,
        "starts_at": 1622507498,
        "ends_at": 1622507654,
        "format": 3,
        "participants": 3,
        "slots": 10,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 182,
        "name": "New ladder",
        "logo": null,
        "banner": null,
        "flags": 34,
        "custom_banner": null,
        "internal_flags": 3,
        "starts_at": 1622506647,
        "ends_at": 1622506796,
        "format": 3,
        "participants": 3,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 73,
        "name": "test",
        "logo": "c7lVLAHAsA67DA.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 3,
        "starts_at": 1615407840,
        "ends_at": 1615408981,
        "format": 1,
        "participants": 6,
        "slots": 8,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 70,
        "name": "Test",
        "logo": "8BGCdR_yqqQRdA.png",
        "banner": null,
        "flags": 354,
        "custom_banner": null,
        "internal_flags": 3,
        "starts_at": 1615317060,
        "ends_at": 1615318021,
        "format": 1,
        "participants": 7,
        "slots": 8,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        }
    },
    {
        "id": 66,
        "name": "test",
        "logo": "avtkMVTCv6r2jg.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1614875520,
        "ends_at": 1614875560,
        "format": 1,
        "participants": 2,
        "slots": 8,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 65,
        "name": "test",
        "logo": "IxfQPdCOl0ZY9g.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1614804480,
        "ends_at": 1614804631,
        "format": 1,
        "participants": 3,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        }
    },
    {
        "id": 64,
        "name": "AIK Cup",
        "logo": "me9VIBOklaiEUQ.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1614795660,
        "ends_at": 1614796026,
        "format": 1,
        "participants": 3,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 61,
        "name": "test",
        "logo": "JXQ24ZiBRniW_w.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1614281100,
        "ends_at": 1614282270,
        "format": 1,
        "participants": 4,
        "slots": 4,
        "game_id": "pes20",
        "game_settings": "null",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 55,
        "name": "AIK Cup",
        "logo": "TFS_MzTE6ylzXA.png",
        "banner": null,
        "flags": 98,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1612524360,
        "ends_at": 1612524530,
        "format": 1,
        "participants": 3,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 45,
        "name": "cup",
        "logo": "kufAmdrQgCCb2Q.png",
        "banner": "GD5aMDofqvlD0g.png",
        "flags": 66,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1602759240,
        "ends_at": 1612523856,
        "format": 1,
        "participants": 4,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 54,
        "name": "Quick check in modal test",
        "logo": "5MQUmDgZJTeO_w.png",
        "banner": null,
        "flags": 50,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1607459760,
        "ends_at": 1607460456,
        "format": 1,
        "participants": 2,
        "slots": 2,
        "game_id": "fifa21",
        "game_settings": "",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 53,
        "name": "Testing notifications 2",
        "logo": null,
        "banner": null,
        "flags": 50,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1605976740,
        "ends_at": 1605976828,
        "format": 2,
        "participants": 2,
        "slots": 2,
        "game_id": "fifa21",
        "game_settings": "",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    },
    {
        "id": 49,
        "name": "Testing Swiss",
        "logo": null,
        "banner": null,
        "flags": 114,
        "custom_banner": null,
        "internal_flags": 2,
        "starts_at": 1605049200,
        "ends_at": 1605049563,
        "format": 2,
        "participants": 2,
        "slots": 4,
        "game_id": "fifa21",
        "game_settings": "",
        "win_points": 3,
        "tie_points": 1,
        "loss_points": 0,
        "org": null
    }
]''';




const mockSocialMedia = r'''
[
    {
        "id": 436,
        "media_id": 1435891676782989318,
        "platform": 1,
        "image": "https://pbs.twimg.com/ext_tw_video_thumb/1435891599402229760/pu/img/BQrCI-tZzmOmb6Oz.jpg",
        "content": "Här är vår eAkademi!\n\n✔️ Första läsåret är påbörjat. ",
        "url": "https://twitter.com/mffesport/status/1435891676782989318",
        "inserted": 1631178227
    },
    {
        "id": 433,
        "media_id": 1434850812963008515,
        "platform": 1,
        "image": null,
        "content": "👇 Förhandsboka ditt signerade exemplar av FIFA22 Malmö FF Edition! \n",
        "url": "https://twitter.com/mffesport/status/1434850812963008515",
        "inserted": 1630930066
    },
    {
        "id": 430,
        "media_id": 1433764206428446721,
        "platform": 1,
        "image": null,
        "content": "📄 Nytt samarbetsavtal med EA!\n\nAvtalet innebär bland annat att alla MFF:are kan förboka sitt signerade exemplar av EA SPORTS FIFA 22 på måndag den 6 september!\n",
        "url": "https://twitter.com/mffesport/status/1433764206428446721",
        "inserted": 1630670999
    },
    {
        "id": 392,
        "media_id": 1421497847745236996,
        "platform": 1,
        "image": null,
        "content": "I semifinalen tar det stopp. @Zackey_00 förlorar med 2–1 mot SD Eibar och är därmed utslaget ur Bracara e-cup. \n\nBra kämpat Zacke! 👏",
        "url": "https://twitter.com/mffesport/status/1421497847745236996",
        "inserted": 1627746471
    },
    {
        "id": 391,
        "media_id": 1421474230445789189,
        "platform": 1,
        "image": null,
        "content": "✅ @Zackey_00 vinner kvartsfinalen och vi ställs mot SD Eibar i semifinalen i Bracara e-cup! \n\nMatchen startar kl 17:00 – se streamen här:\n",
        "url": "https://twitter.com/mffesport/status/1421474230445789189",
        "inserted": 1627740840
    },
    {
        "id": 389,
        "media_id": 1421110959737905156,
        "platform": 1,
        "image": null,
        "content": "Vi vinner med 2–1 mot FC Porto och @Zackey_00 är vidare i Bracura e-Cup! 💪\n\nImorgon, lördag kl 15:00 väntar en kvartsfinal mot @CDTondela1933! \n\nSe streamen här:\n",
        "url": "https://twitter.com/mffesport/status/1421110959737905156",
        "inserted": 1627654230
    },
    {
        "id": 388,
        "media_id": 1421083939633078275,
        "platform": 1,
        "image": "https://pbs.twimg.com/media/E7i0TGiWUAAr2Ud.jpg",
        "content": "Under helgen representerar @Zackey_00 oss i Bracara e-Cup! 🏆 \n\nI turneringen deltar lag som Sevilla, Redbull Leipzig och PSG. Vi inleder med att ställas mot FC Porto, idag kl 15:30. 👊\n\nSe streamen här:\n ",
        "url": "https://twitter.com/mffesport/status/1421083939633078275",
        "inserted": 1627647788
    },
    {
        "id": 298,
        "media_id": 1400525253781164042,
        "platform": 1,
        "image": "https://pbs.twimg.com/media/E2-qSo-XoAANavP.jpg",
        "content": "Vår resa i @eAllsvenskan tar slut i semifinalen. ",
        "url": "https://twitter.com/mffesport/status/1400525253781164042",
        "inserted": 1622746215
    },
    {
        "id": 292,
        "media_id": 1400487491854077957,
        "platform": 1,
        "image": "https://pbs.twimg.com/media/E2-H8mAXIAojS3h.jpg",
        "content": "✅ Klara för semifinal!\n\n@OskarWetteus inledde med en stabil 2–0-seger och @Zackey_00 kunde kontrollerat spela hem dubbelmötet!\n\nSemifinalen spelas klockan 20:00 mot Örgryte. ",
        "url": "https://twitter.com/mffesport/status/1400487491854077957",
        "inserted": 1622737212
    },
    {
        "id": 286,
        "media_id": 1400436385161547780,
        "platform": 1,
        "image": "https://pbs.twimg.com/media/E29ZdVAXwAIpeVQ.jpg",
        "content": "Vi närmar oss avspark – kvartsfinalerna startar vid 17:30!\n\nMatcherna livesänds på två streams 👇\n\n🅰️  \n🅱️   ",
        "url": "https://twitter.com/mffesport/status/1400436385161547780",
        "inserted": 1622725027
    }
]
''';

const mockOrgRankingFifa = '''
    [
    null,
    [
        {
            "id": 24,
            "username": "sam1",
            "avatar": null,
            "country_id": 1,
            "flags": 24,
            "console": 1,
            "elo": 1073,
            "rank": 2
        },
        {
            "id": 64,
            "username": "mark1234",
            "avatar": null,
            "country_id": 210,
            "flags": 0,
            "console": 1,
            "elo": 1003,
            "rank": 7
        },
        {
            "id": 58,
            "username": "StefanTest1",
            "avatar": null,
            "country_id": 26,
            "flags": 0,
            "console": 1,
            "elo": 999,
            "rank": 57
        },
        {
            "id": 20,
            "username": "james",
            "avatar": "8e1Lq1w4rbp7Wg.png",
            "country_id": 231,
            "flags": 4,
            "console": 1,
            "elo": 987,
            "rank": 59
        },
        {
            "id": 60,
            "username": "james2",
            "avatar": null,
            "country_id": 231,
            "flags": 16,
            "console": 1,
            "elo": 984,
            "rank": 60
        },
        {
            "id": 1,
            "username": "mark",
            "avatar": "tws9DOS8BiTZag.jpg",
            "country_id": 210,
            "flags": 4,
            "console": 1,
            "elo": 983,
            "rank": 61
        },
        {
            "id": 2,
            "username": "Sam",
            "avatar": "7LFASZKsnF-gYg.png",
            "country_id": 210,
            "flags": 4,
            "console": 1,
            "elo": 971,
            "rank": 61
        }
    ]
]
    ''';
const mockOrgFeaturedPlayer = '''
[
    {
        "user_id": 2,
        "username": "Sam",
        "alt_username": "Zacke",
        "image": "dPLBRBEIoVodOw.png",
        "first_name": "Samuel",
        "last_name": "Agirman",
        "birth_day": null,
        "birth_month": null,
        "birth_year": null,
        "country_id": 210,
        "stats": {
            "wins": 21,
            "losses": 11,
            "ties": 0,
            "drops": 0,
            "matches": 20,
            "goals_scored": 78,
            "goals_conceded": 103,
            "fifa_elo": 1031,
            "pes_elo": 1000
        }
    },
    {
        "user_id": 16,
        "username": "MrMJohnsson",
        "alt_username": "tensa-L",
        "image": "Xw-vCUh5IbmvUw.png",
        "first_name": "Matthias",
        "last_name": "Johnsson",
        "birth_day": 2,
        "birth_month": 4,
        "birth_year": 1979,
        "country_id": 210,
        "stats": {
            "wins": 0,
            "losses": 0,
            "ties": 0,
            "drops": 0,
            "matches": 0,
            "goals_scored": 0,
            "goals_conceded": 0,
            "fifa_elo": 1000,
            "pes_elo": 1000
        }
    },
    {
        "user_id": 24,
        "username": "sam1",
        "alt_username": "Wettèus",
        "image": "mbAwEsDCYusvNw.png",
        "first_name": "samuel",
        "last_name": "agirman",
        "birth_day": 3,
        "birth_month": 4,
        "birth_year": 1921,
        "country_id": 1,
        "stats": {
            "wins": 24,
            "losses": 9,
            "ties": 0,
            "drops": 0,
            "matches": 25,
            "goals_scored": 146,
            "goals_conceded": 80,
            "fifa_elo": 1019,
            "pes_elo": 984
        }
    }
]
''';

const mockStreams = '''
[
    {
        "url": "https://www.youtube.com/watch?v=b_sQ9bMltGU",
        "tournament_id": null,
        "twitch_user_id": null,
        "twitch_username": null,
        "user_id": null,
        "username": "",
        "status": null,
        "thumbnail_url": null,
        "viewers": null,
        "org":
        {
            "id": 28,
            "name": "Örgryte IF",
            "logo": "De7bdBztbS7Tjg.png",
            "background": null,
            "banner_url": null,
            "slug": "öis",
            "flags": 513,
            "inserted": 1608209649
        }
    },
    {
        "url": "https://www.youtube.com/watch?v=zrn7V3bMJvg",
        "tournament_id": null,
        "twitch_user_id": null,
        "twitch_username": null,
        "user_id": null,
        "username": "",
        "status": null,
        "thumbnail_url": null,
        "viewers": null,
        "org":
        {
            "id": 26,
            "name": "sverige",
            "logo": "ybhDukSDIN4r_g.png",
            "background": "VT6lZLThxRIrcw.png",
            "banner_url": null,
            "slug": "tyskland",
            "flags": 3593,
            "inserted": 1608144309
        }
    },
    {
        "url": "https://www.youtube.com/watch?v=aAmP-WcI6dg",
        "tournament_id": null,
        "twitch_user_id": null,
        "twitch_username": null,
        "user_id": null,
        "username": "",
        "status": null,
        "thumbnail_url": null,
        "viewers": null,
        "org":
        {
            "id": 2,
            "name": "Malmö FF",
            "logo": "QL031SIZjLstLw.png",
            "background": "CwrfYvuCwBfuXQ.png",
            "banner_url": null,
            "slug": "mff",
            "flags": 641,
            "inserted": 1607955909
        }
    }
]
''';

const mockNotificationfetch = '{"event":"fetch","data":"null","channel":"tournament-238"}';
const regularNotification =
    '{"event":"notification","data":"{\"id\":968,\"type\":1,\"from_user\":{\"id\":67,\"username\":\"fabian\",\"avatar\":\"7qPgpa9e7Hs_xA.jpg\",\"country_id\":231,\"flags\":6,\"console\":0},\"data\":{\"id\":238,\"name\":\"Test-tournament\"},\"seen\":false,\"inserted\":1635993156}","channel":"private-user-67"}';
const friendStatusUpdate =
    '{"event":"friend-status-update","data":"{\"id\":90,\"online_status\":3}","channel":"private-user-67"}';
const mockNotificationParticipantsUpdate =
    '{"event":"participants-update","data":"null","channel":"tournament-238"}'; //Registration has been accepted

const mockTournamentCollection = '''
{"id":3,"name":"Cup Test 0928","logo":null,"banner":null,"flags":226,"internal_flags":3,"starts_at":1632826800,"ends_at":1632828681,"participants":8,"slots":8,"game_id":"fifa21","game_settings":"{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}","org":null,"stages":[{"id":212,"name":"Cup Test 0928 — Grupp A","logo":null,"banner":null,"flags":34,"stage":0,"format":3,"slots":4,"participants":4,"winners":2,"winning_stage":8,"internal_flags":3,"winning_stage_tournament_id":null},{"id":213,"name":"Cup Test 0928 — Grupp B","logo":null,"banner":null,"flags":34,"stage":0,"format":3,"slots":4,"participants":4,"winners":2,"winning_stage":8,"internal_flags":3,"winning_stage_tournament_id":null},{"id":214,"name":"Cup Test 0928 — Playoffs","logo":null,"banner":null,"flags":34,"stage":1,"format":1,"slots":4,"participants":4,"winners":1,"winning_stage":null,"internal_flags":3,"winning_stage_tournament_id":null}],"description":"\u003cp\u003eCup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928Cup Test 0928\u003c/p\u003e","stream_url":"","discord_url":"","league":null,"prizes":null}
''';

const mockTournamentCollectionList = """
[{"id":9,"name":"tColleTest","logo":"Mjkuws9RmoYwSw.jpg","banner":"Pc_K9cXuWxTpqg.jpg","flags":34,"internal_flags":0,"starts_at":1638376997,"ends_at":null,"participants":0,"slots":2,"game_id":"fifa21","game_settings":"{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}","org":null,"stages":null,"league_id":1},{"id":8,"name":"Test tournament collection 2","logo":null,"banner":null,"flags":33,"internal_flags":0,"starts_at":1638373813,"ends_at":null,"participants":0,"slots":2,"game_id":"fifa21","game_settings":"{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}","org":null,"stages":null,"league_id":1},{"id":7,"name":"Test tournament collection 1","logo":null,"banner":null,"flags":33,"internal_flags":3,"starts_at":1638307117,"ends_at":null,"participants":2,"slots":2,"game_id":"fifa21","game_settings":"{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}","org":null,"stages":null,"league_id":null},{"id":6,"name":"Testing check in","logo":null,"banner":null,"flags":50,"internal_flags":3,"starts_at":1635905053,"ends_at":1635905219,"participants":2,"slots":2,"game_id":"fifa21","game_settings":"{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}","org":null,"stages":null,"league_id":null},{"id":2,"name":"Svenska Cupen","logo":"Y4mjVNUH98wIhA.png","banner":null,"flags":98,"internal_flags":0,"starts_at":1635095280,"ends_at":null,"participants":1,"slots":9,"game_id":"fifa21","game_settings":"{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}","org":null,"stages":null,"league_id":null},{"id":5,"name":"Cup Test 1020","logo":"Zh95NrpDVBn2aA.png","banner":"KXEB-STsmo0h3A.png","flags":98,"internal_flags":3,"starts_at":1634740800,"ends_at":null,"participants":8,"slots":8,"game_id":"fifa21","game_settings":"{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}","org":null,"stages":null,"league_id":null},{"id":4,"name":"Testing Tournament Collection 2","logo":null,"banner":null,"flags":98,"internal_flags":3,"starts_at":1634342195,"ends_at":null,"participants":5,"slots":8,"game_id":"fifa21","game_settings":"{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}","org":null,"stages":null,"league_id":null},{"id":3,"name":"Cup Test 0928","logo":null,"banner":null,"flags":226,"internal_flags":3,"starts_at":1632826800,"ends_at":1632828681,"participants":8,"slots":8,"game_id":"fifa21","game_settings":"{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}","org":null,"stages":null,"league_id":null},{"id":1,"name":"Testing Tournament Collection 1","logo":null,"banner":null,"flags":114,"internal_flags":0,"starts_at":1632326159,"ends_at":null,"participants":1,"slots":4,"game_id":"fifa21","game_settings":"{\"bookings\":true,\"control_type\":\"any\",\"difficulty\":\"worldclass\",\"half_length\":6,\"handballs\":false,\"injuries\":true,\"match_speed\":\"normal\",\"offsides\":true,\"squad_type\":\"online\"}","org":null,"stages":null,"league_id":1}]
""";
