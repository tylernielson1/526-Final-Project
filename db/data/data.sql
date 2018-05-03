### Drop Tables ###
DROP TABLE IF EXISTS user_favorite_teams;
DROP TABLE IF EXISTS user_favorite_players;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS contract;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS stadiums;
DROP TABLE IF EXISTS leagues;
DROP TABLE IF EXISTS countries;

### Create Tables ###
CREATE TABLE countries
	(code char(2) not null,
	 name varchar(50) not null,
	 continent varchar(50) not null,
	 primary key (code));
	 
CREATE TABLE leagues
	(leagueID int not null auto_increment,
	 name varchar(50) not null,
	 yearFounded int not null,
	 primary key (leagueID));
	 
CREATE TABLE stadiums
	(stadiumID int not null auto_increment,
	 name varchar(255) not null,
	 city varchar(255) not null,
	 yearOpened int not null,
	 capacity int not null,
	 location_code varchar(2) not null,
	 primary key (stadiumID),
	 constraint FK_StadiumCountry FOREIGN KEY (location_code)
	 References countries(code));

CREATE TABLE players
	(playerID int not null auto_increment,
	 firstName varchar(150),
	 lastName varchar(150),
	 nationality char(2) not null,
	 number int not null,
	 position varchar(20) not null,
	 photoPath varchar(300),
	 primary key(playerID),
	 constraint FK_PlayerCountry FOREIGN KEY (nationality)
	 References countries(code));

CREATE TABLE teams
	(teamID int auto_increment,
	 name varchar(100) not null unique,
	 yearFounded int not null,
	 playsInLeague int not null,
	 homeStadium int not null,
	 photoPath varchar(300),
	 primary key (teamID),
	 constraint FK_TeamLeague FOREIGN KEY (playsInLeague)
	 REFERENCES leagues(leagueID),
	 constraint FK_TeamStadium FOREIGN KEY (homeStadium)
	 REFERENCES stadiums(stadiumID));
	 
CREATE TABLE contract
	(player_ID int not null,
	 value numeric(15,2),
	 teamID int not null,
	 primary key (player_ID),
	 constraint FK_PlayerContract FOREIGN KEY (player_ID)
	 REFERENCES players(playerID),
	 constraint FK_ContractTeam FOREIGN KEY (teamID)
	 REFERENCES teams(teamID));

CREATE TABLE users
	(userID int auto_increment,
	 username varchar(50) unique not null,
	 password varchar(500) not null,
	 isAdmin BOOLEAN not null,
	 primary key  (userID));
     
CREATE TABLE user_favorite_players
    (userID int not null,
     favoritePlayer int not null,
     constraint FK_userIDPlayer FOREIGN KEY (userID)
	 References users(userID),
     constraint FK_favoritePlayer FOREIGN KEY (favoritePlayer)
     References players(playerID));

CREATE TABLE user_favorite_teams
	(userID int not null,
	 favoriteTeam int not null,
	 constraint FK_userIDTeam FOREIGN KEY (userID)
	 References users(userID),
	 constraint FK_favoriteTeam FOREIGN KEY (favoriteTeam)
	 References teams(teamID));

/* Countries */
INSERT INTO countries VALUES('ac','Ascension','Africa');
INSERT INTO countries VALUES('ad','Andorra','Europe');
INSERT INTO countries VALUES('ae','United Arab Emirates','Asia');
INSERT INTO countries VALUES('af','Afghanistan','Asia');
INSERT INTO countries VALUES('ag','Antigua and Barbuda','North America');
INSERT INTO countries VALUES('ai','Anguilla','North America');
INSERT INTO countries VALUES('al','Albania','Europe');
INSERT INTO countries VALUES('am','Armenia','Asia');
INSERT INTO countries VALUES('an','Netherlands Antilles','North America');
INSERT INTO countries VALUES('ao','Angola','Africa');
INSERT INTO countries VALUES('ar','Argentina','South America');
INSERT INTO countries VALUES('as','American Samoa','Oceania');
INSERT INTO countries VALUES('at','Austria','Europe');
INSERT INTO countries VALUES('au','Australia','Oceania');
INSERT INTO countries VALUES('aw','Aruba','North America');
INSERT INTO countries VALUES('ax','Aland','Europe');
INSERT INTO countries VALUES('az','Azerbaijan','Asia');
INSERT INTO countries VALUES('ba','Bosnia and Herzegovina','Europe');
INSERT INTO countries VALUES('bb','Barbados','North America');
INSERT INTO countries VALUES('bd','Bangladesh','Asia');
INSERT INTO countries VALUES('be','Belgium','Europe');
INSERT INTO countries VALUES('bf','Burkina Faso','Africa');
INSERT INTO countries VALUES('bg','Bulgaria','Europe');
INSERT INTO countries VALUES('bh','Bahrain','Asia');
INSERT INTO countries VALUES('bi','Burundi','Africa');
INSERT INTO countries VALUES('bj','Benin','Africa');
INSERT INTO countries VALUES('bm','Bermuda','North America');
INSERT INTO countries VALUES('bn','Brunei','Asia');
INSERT INTO countries VALUES('bo','Bolivia','South America');
INSERT INTO countries VALUES('br','Brazil','South America');
INSERT INTO countries VALUES('bs','Bahamas, The','North America');
INSERT INTO countries VALUES('bt','Bhutan','Asia');
INSERT INTO countries VALUES('bv','Bouvet Island','Antarctica');
INSERT INTO countries VALUES('bw','Botswana','Africa');
INSERT INTO countries VALUES('by','Belarus','Europe');
INSERT INTO countries VALUES('bz','Belize','North America');
INSERT INTO countries VALUES('ca','Canada','North America');
INSERT INTO countries VALUES('cc','Cocos (Keeling) Islands','Asia');
INSERT INTO countries VALUES('cd','Congo, (Congo Kinshasa)','Africa');
INSERT INTO countries VALUES('cf','Central African Republic','Africa');
INSERT INTO countries VALUES('cg','Congo, (Congo Brazzaville)','Africa');
INSERT INTO countries VALUES('ch','Switzerland','Europe');
INSERT INTO countries VALUES('ci','Cote d''Ivoire (Ivory Coast)','Africa');
INSERT INTO countries VALUES('ck','Cook Islands','Oceania');
INSERT INTO countries VALUES('cl','Chile','South America');
INSERT INTO countries VALUES('cm','Cameroon','Africa');
INSERT INTO countries VALUES('cn','China, People''s Republic of','Asia');
INSERT INTO countries VALUES('co','Colombia','South America');
INSERT INTO countries VALUES('cr','Costa Rica','North America');
INSERT INTO countries VALUES('cu','Cuba','North America');
INSERT INTO countries VALUES('cv','Cape Verde','Africa');
INSERT INTO countries VALUES('cx','Christmas Island','Asia');
INSERT INTO countries VALUES('cy','Cyprus','Europe');
INSERT INTO countries VALUES('cz','Czech Republic','Europe');
INSERT INTO countries VALUES('de','Germany','Europe');
INSERT INTO countries VALUES('dj','Djibouti','Africa');
INSERT INTO countries VALUES('dk','Denmark','Europe');
INSERT INTO countries VALUES('dm','Dominica','North America');
INSERT INTO countries VALUES('do','Dominican Republic','North America');
INSERT INTO countries VALUES('dz','Algeria','Africa');
INSERT INTO countries VALUES('ec','Ecuador','South America');
INSERT INTO countries VALUES('ee','Estonia','Europe');
INSERT INTO countries VALUES('eg','Egypt','Africa');
INSERT INTO countries VALUES('er','Eritrea','Africa');
INSERT INTO countries VALUES('es','Spain','Europe');
INSERT INTO countries VALUES('et','Ethiopia','Africa');
INSERT INTO countries VALUES('fi','Finland','Europe');
INSERT INTO countries VALUES('fj','Fiji','Oceania');
INSERT INTO countries VALUES('fk','Falkland Islands (Islas Malvinas)','South America');
INSERT INTO countries VALUES('fm','Micronesia','Oceania');
INSERT INTO countries VALUES('fo','Faroe Islands','Europe');
INSERT INTO countries VALUES('fr','France','Europe');
INSERT INTO countries VALUES('ga','Gabon','Africa');
INSERT INTO countries VALUES('gb','United Kingdom','Europe');
INSERT INTO countries VALUES('gd','Grenada','North America');
INSERT INTO countries VALUES('ge','Georgia','Asia');
INSERT INTO countries VALUES('gf','French Guiana','South America');
INSERT INTO countries VALUES('gg','Guernsey','Europe');
INSERT INTO countries VALUES('gh','Ghana','Africa');
INSERT INTO countries VALUES('gi','Gibraltar','Europe');
INSERT INTO countries VALUES('gl','Greenland','North America');
INSERT INTO countries VALUES('gm','Gambia, The','Africa');
INSERT INTO countries VALUES('gn','Guinea','Africa');
INSERT INTO countries VALUES('gp','Guadeloupe','North America');
INSERT INTO countries VALUES('gq','Equatorial Guinea','Africa');
INSERT INTO countries VALUES('gr','Greece','Europe');
INSERT INTO countries VALUES('gs','South Georgia & South Sandwich Islands','Antarctica');
INSERT INTO countries VALUES('gt','Guatemala','North America');
INSERT INTO countries VALUES('gu','Guam','Oceania');
INSERT INTO countries VALUES('gw','Guinea-Bissau','Africa');
INSERT INTO countries VALUES('gy','Guyana','South America');
INSERT INTO countries VALUES('hk','Hong Kong','Asia');
INSERT INTO countries VALUES('hm','Heard Island and McDonald Islands','Antarctica');
INSERT INTO countries VALUES('hn','Honduras','North America');
INSERT INTO countries VALUES('hr','Croatia','Europe');
INSERT INTO countries VALUES('ht','Haiti','North America');
INSERT INTO countries VALUES('hu','Hungary','Europe');
INSERT INTO countries VALUES('id','Indonesia','Asia');
INSERT INTO countries VALUES('ie','Ireland','Europe');
INSERT INTO countries VALUES('il','Israel','Asia');
INSERT INTO countries VALUES('im','Isle of Man','Europe');
INSERT INTO countries VALUES('in','India','Asia');
INSERT INTO countries VALUES('io','British Indian Ocean Territory','Asia');
INSERT INTO countries VALUES('iq','Iraq','Asia');
INSERT INTO countries VALUES('ir','Iran','Asia');
INSERT INTO countries VALUES('is','Iceland','Europe');
INSERT INTO countries VALUES('it','Italy','Europe');
INSERT INTO countries VALUES('je','Jersey','Europe');
INSERT INTO countries VALUES('jm','Jamaica','North America');
INSERT INTO countries VALUES('jo','Jordan','Asia');
INSERT INTO countries VALUES('jp','Japan','Asia');
INSERT INTO countries VALUES('ke','Kenya','Africa');
INSERT INTO countries VALUES('kg','Kyrgyzstan','Asia');
INSERT INTO countries VALUES('kh','Cambodia','Asia');
INSERT INTO countries VALUES('ki','Kiribati','Oceania');
INSERT INTO countries VALUES('km','Comoros','Africa');
INSERT INTO countries VALUES('kn','Saint Kitts and Nevis','North America');
INSERT INTO countries VALUES('kp','Korea, North','Asia');
INSERT INTO countries VALUES('kr','Korea, South','Asia');
INSERT INTO countries VALUES('kw','Kuwait','Asia');
INSERT INTO countries VALUES('ky','Cayman Islands','North America');
INSERT INTO countries VALUES('kz','Kazakhstan','Asia');
INSERT INTO countries VALUES('la','Laos','Asia');
INSERT INTO countries VALUES('lb','Lebanon','Asia');
INSERT INTO countries VALUES('lc','Saint Lucia','North America');
INSERT INTO countries VALUES('li','Liechtenstein','Europe');
INSERT INTO countries VALUES('lk','Sri Lanka','Asia');
INSERT INTO countries VALUES('lr','Liberia','Africa');
INSERT INTO countries VALUES('ls','Lesotho','Africa');
INSERT INTO countries VALUES('lt','Lithuania','Europe');
INSERT INTO countries VALUES('lu','Luxembourg','Europe');
INSERT INTO countries VALUES('lv','Latvia','Europe');
INSERT INTO countries VALUES('ly','Libya','Africa');
INSERT INTO countries VALUES('ma','Morocco','Africa');
INSERT INTO countries VALUES('mc','Monaco','Europe');
INSERT INTO countries VALUES('md','Moldova','Europe');
INSERT INTO countries VALUES('me','Montenegro','Europe');
INSERT INTO countries VALUES('mg','Madagascar','Africa');
INSERT INTO countries VALUES('mh','Marshall Islands','Oceania');
INSERT INTO countries VALUES('mk','Macedonia','Europe');
INSERT INTO countries VALUES('ml','Mali','Africa');
INSERT INTO countries VALUES('mm','Myanmar (Burma)','Asia');
INSERT INTO countries VALUES('mn','Mongolia','Asia');
INSERT INTO countries VALUES('mo','Macau','Asia');
INSERT INTO countries VALUES('mp','Northern Mariana Islands','Oceania');
INSERT INTO countries VALUES('mq','Martinique','North America');
INSERT INTO countries VALUES('mr','Mauritania','Africa');
INSERT INTO countries VALUES('ms','Montserrat','North America');
INSERT INTO countries VALUES('mt','Malta','Europe');
INSERT INTO countries VALUES('mu','Mauritius','Africa');
INSERT INTO countries VALUES('mv','Maldives','Asia');
INSERT INTO countries VALUES('mw','Malawi','Africa');
INSERT INTO countries VALUES('mx','Mexico','North America');
INSERT INTO countries VALUES('my','Malaysia','Asia');
INSERT INTO countries VALUES('mz','Mozambique','Africa');
INSERT INTO countries VALUES('na','Namibia','Africa');
INSERT INTO countries VALUES('nc','New Caledonia','Oceania');
INSERT INTO countries VALUES('ne','Niger','Africa');
INSERT INTO countries VALUES('nf','Norfolk Island','Oceania');
INSERT INTO countries VALUES('ng','Nigeria','Africa');
INSERT INTO countries VALUES('ni','Nicaragua','North America');
INSERT INTO countries VALUES('nl','Netherlands','Europe');
INSERT INTO countries VALUES('no','Norway','Europe');
INSERT INTO countries VALUES('np','Nepal','Asia');
INSERT INTO countries VALUES('nr','Nauru','Oceania');
INSERT INTO countries VALUES('nu','Niue','Oceania');
INSERT INTO countries VALUES('nz','New Zealand','Oceania');
INSERT INTO countries VALUES('om','Oman','Asia');
INSERT INTO countries VALUES('pa','Panama','North America');
INSERT INTO countries VALUES('pe','Peru','South America');
INSERT INTO countries VALUES('pf','French Polynesia','Oceania');
INSERT INTO countries VALUES('pg','Papua New Guinea','Oceania');
INSERT INTO countries VALUES('ph','Philippines','Asia');
INSERT INTO countries VALUES('pk','Pakistan','Asia');
INSERT INTO countries VALUES('pl','Poland','Europe');
INSERT INTO countries VALUES('pm','Saint Pierre and Miquelon','North America');
INSERT INTO countries VALUES('pn','Pitcairn Islands','Oceania');
INSERT INTO countries VALUES('pr','Puerto Rico','North America');
INSERT INTO countries VALUES('pt','Portugal','Europe');
INSERT INTO countries VALUES('pw','Palau','Oceania');
INSERT INTO countries VALUES('py','Paraguay','South America');
INSERT INTO countries VALUES('qa','Qatar','Asia');
INSERT INTO countries VALUES('re','Reunion','Africa');
INSERT INTO countries VALUES('ro','Romania','Europe');
INSERT INTO countries VALUES('rs','Serbia','Europe');
INSERT INTO countries VALUES('ru','Russia','Europe');
INSERT INTO countries VALUES('rw','Rwanda','Africa');
INSERT INTO countries VALUES('sa','Saudi Arabia','Asia');
INSERT INTO countries VALUES('sb','Solomon Islands','Oceania');
INSERT INTO countries VALUES('sc','Seychelles','Africa');
INSERT INTO countries VALUES('sd','Sudan','Africa');
INSERT INTO countries VALUES('se','Sweden','Europe');
INSERT INTO countries VALUES('sg','Singapore','Asia');
INSERT INTO countries VALUES('sh','Saint Helena','Africa');
INSERT INTO countries VALUES('si','Slovenia','Europe');
INSERT INTO countries VALUES('sj','Svalbard','Europe');
INSERT INTO countries VALUES('sk','Slovakia','Europe');
INSERT INTO countries VALUES('sl','Sierra Leone','Africa');
INSERT INTO countries VALUES('sm','San Marino','Europe');
INSERT INTO countries VALUES('sn','Senegal','Africa');
INSERT INTO countries VALUES('so','Somalia','Africa');
INSERT INTO countries VALUES('sr','Suriname','South America');
INSERT INTO countries VALUES('st','Sao Tome and Principe','Africa');
INSERT INTO countries VALUES('sv','El Salvador','North America');
INSERT INTO countries VALUES('sy','Syria','Asia');
INSERT INTO countries VALUES('sz','Swaziland','Africa');
INSERT INTO countries VALUES('ta','Tristan da Cunha','Africa');
INSERT INTO countries VALUES('tc','Turks and Caicos Islands','North America');
INSERT INTO countries VALUES('td','Chad','Africa');
INSERT INTO countries VALUES('tf','French Southern and Antarctic Lands','Antarctica');
INSERT INTO countries VALUES('tg','Togo','Africa');
INSERT INTO countries VALUES('th','Thailand','Asia');
INSERT INTO countries VALUES('tj','Tajikistan','Asia');
INSERT INTO countries VALUES('tk','Tokelau','Oceania');
INSERT INTO countries VALUES('tl','Timor-Leste (East Timor)','Asia');
INSERT INTO countries VALUES('tm','Turkmenistan','Asia');
INSERT INTO countries VALUES('tn','Tunisia','Africa');
INSERT INTO countries VALUES('to','Tonga','Oceania');
INSERT INTO countries VALUES('tr','Turkey','Asia');
INSERT INTO countries VALUES('tt','Trinidad and Tobago','North America');
INSERT INTO countries VALUES('tv','Tuvalu','Oceania');
INSERT INTO countries VALUES('tw','China, Republic of (Taiwan)','Asia');
INSERT INTO countries VALUES('tz','Tanzania','Africa');
INSERT INTO countries VALUES('ua','Ukraine','Europe');
INSERT INTO countries VALUES('ug','Uganda','Africa');
INSERT INTO countries VALUES('um','US Islands','Oceania');
INSERT INTO countries VALUES('us','United States','North America');
INSERT INTO countries VALUES('uy','Uruguay','South America');
INSERT INTO countries VALUES('uz','Uzbekistan','Asia');
INSERT INTO countries VALUES('va','Vatican City','Europe');
INSERT INTO countries VALUES('vc','Saint Vincent and the Grenadines','North America');
INSERT INTO countries VALUES('ve','Venezuela','South America');
INSERT INTO countries VALUES('vg','British Virgin Islands','North America');
INSERT INTO countries VALUES('vi','U.S. Virgin Islands','North America');
INSERT INTO countries VALUES('vn','Vietnam','Asia');
INSERT INTO countries VALUES('vu','Vanuatu','Oceania');
INSERT INTO countries VALUES('wf','Wallis and Futuna','Oceania');
INSERT INTO countries VALUES('ws','Samoa','Oceania');
INSERT INTO countries VALUES('ye','Yemen','Asia');
INSERT INTO countries VALUES('yt','Mayotte','Africa');
INSERT INTO countries VALUES('ze','South Africa','Africa');
INSERT INTO countries VALUES('zm','Zambia','Africa');
INSERT INTO countries VALUES('zw','Zimbabwe','Africa');
INSERT INTO countries VALUES('ss','South Sudan','Africa');

/* leagues */
INSERT INTO leagues(name,yearFounded)
VALUES("Major League Soccer", 1993);

INSERT INTO leagues(name,yearFounded)
VALUES("Bundesliga", 1963);

INSERT INTO leagues(name,yearFounded)
VALUES("Premier League", 1992);

/* stadiums */
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Mercedes-Benz Stadium","Atlanta",2017,71874,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Toyota Park","Bridgeview",2006,20000,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Mapfre Stadium","Columbus",1999,19968,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Audi Field","Washington DC",2018,20000,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Saputo Stadium","Montreal",2008,20801,"ca");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Gillette Stadium","Foxborough",2002,65878,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Yankee Stadium","Bronx",2009,47422,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Red Bull Arena","Harrison",2010,25000,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Orlando City Stadium","Orlando",2017,25500,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Talen Energy Stadium","Chester",2010,18500,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("BMO Field","Toronto",2007,30000,"ca");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Dick's Sporting Goods Park","Commerce City",2007,18061,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Toyota Stadium","Frisco",2005,20500,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("BBVA Compass Stadium","Houston",2012,22039,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("StubHub Center","Carson",2003,27000,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Banc of California Stadium","Los Angeles",2018,22000,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("TCF Bank Stadium","Minneapolis",2009,50805,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Providence Park","Portland",1926,21144,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Rio Tinto Stadium","Sandy",2008,20213,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Avaya Stadium","San Jose",2015,18000,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("CenturyLink Field","Seattle",2002,69000,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Children's Mercy Park","Kansas City",2011,18467,"us");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("BC Place","Vancouver",1983,54500,"ca");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("WWK Arena","Augsburg",2009,30660,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("BayArena","Leverkusen",1958,30210,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Allianz Arena","Munich",2005,75000,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Signal Iduna Park","Dortmund",1974,81360,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Borussia-Park","Monchengladbach",2004,54057,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Jonathan-Heimes-Stadion am Bollenfalltor","Darmstadt",1921,17000,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Commerzbank-Arena","Frankfurt",1925,51500,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Schwarzwald-Stadion","Freiburg im Breisgau",1954,24000,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Volksparkstadion","Hamburg",1953,57000,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Olympiastadion","Berlin",1936,74475,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Wirsol Rhein-Neckar-Arena","Sinsheim",2009,30150,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Audi Sportpark","Ingolstadt",2009,15000,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("RheinEnergieStadion","Cologne",1923,49968,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Red Bull Arena","Leipzig",1954,42959,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Opel Arena","Mainz",2011,34000,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Veltins-Arena","Gelsenkirchen",2001,62271,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Weser-Stadion","Bremen",1947,42100,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Volkswagen Arena","Wolfsburg",2002,30000,"de");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Emirates Stadium","London",2011,30750,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Vitality Stadium","Bournemouth",1895,22616,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("American Express Community Stadium","Falmer",1935,27033,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Turf Moor","Burnley",1898,30602,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Stamford Bridge","London",1898,15200,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Selhurst Park","London",1897,39460,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Goodison Park","Liverpool",1890,31367,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("John Smiths Stadium","Huddersfield",1898,20978,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("King Power Stadium Formerly Walkers Stadium","Leicester",1899,39812,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Anfield","Liverpool",1994,24500,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Etihad Stadium","Manchester",2002,32500,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Old Trafford","Trafford",2005,20937,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("St James Park","Newcastle",1997,28723,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("St Marys Stadium","Southampton",1880,52405,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("bet365 Stadium Formerly Britannia Stadium","Stoke-on-Trent",1997,48707,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Liberty Stadium","Swansea",1919,27111,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Wembley Stadium","London",1886,25136,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("Vicarage Road","Watford",1922,21977,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("The Hawthorns","West Bromwich",1897,42682,"gb");
INSERT INTO stadiums (name,city,yearOpened,capacity,location_code)
VALUES("London Stadium","London",2012,60000,"gb");

/* players */
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brad","Guzan","us",1,"GK","../static/images/players/MLS/bradguzan.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Franco","Escobar","ar",2,"DF","../static/images/players/MLS/francoescobar.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Parkhurst","us",3,"DF","../static/images/players/MLS/michaelparkhurst.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Greg","Garza","us",4,"DF","../static/images/players/MLS/greggarza.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Leandro","Gonzalez Pirez","ar",5,"DF","../static/images/players/MLS/leandrogonzalezpirez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Darlington","Nagbe","us",6,"MF","../static/images/players/MLS/darlingtonnagbe.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Josef","Martinez","ve",7,"FW","../static/images/players/MLS/josefmartinez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ezequiel","Barco","ar",8,"MF","../static/images/players/MLS/ezequielbarco.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Romario","Williams","jm",9,"FW","../static/images/players/MLS/romariowilliams.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Miguel","Almiron","py",10,"MF","../static/images/players/MLS/miguelalmiron.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Miles","Robinson","us",12,"DF","../static/images/players/MLS/milesrobinson.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jose","Hernandez","ve",13,"DF","../static/images/players/MLS/josehernandez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sal","Zizzo","us",14,"DF","../static/images/players/MLS/salzizzo.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Hector","Villalba","ar",15,"FW","../static/images/players/MLS/hectorvillalba.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","McCann","ie",16,"MF","../static/images/players/MLS/chrismccann.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jeff","Larentowicz","us",18,"MF","../static/images/players/MLS/jefflarentowicz.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brandon","Vazquez","us",19,"FW","../static/images/players/MLS/brandonvazquez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Goslin","us",20,"MF","../static/images/players/MLS/chrisgoslin.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("George","Bello","us",21,"DF","../static/images/players/MLS/georgebello.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mikey","Ambrose","us",22,"DF","../static/images/players/MLS/mikeyambrose.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lagos","Kunga","us",23,"FW","../static/images/players/MLS/lagoskunga.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julian","Gressel","de",24,"MF","../static/images/players/MLS/juliangressel.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alec","Kann","us",25,"GK","../static/images/players/MLS/aleckann.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jon","Gallagher","ie",26,"FW","../static/images/players/MLS/jongallagher.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mitch","Hildebrandt","us",27,"GK","../static/images/players/MLS/mitchhildebrandt.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andrew","Wheeler-Omiunu","us",28,"MF","../static/images/players/MLS/andrewwheeleromiunu.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Oliver","Shannon","gb",29,"MF","../static/images/players/MLS/olivershannon.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andrew","Carleton","us",30,"MF","../static/images/players/MLS/andrewcarleton.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Kratz","de",32,"MF","../static/images/players/MLS/kevinkratz.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matt","Polster","us",2,"MF","../static/images/players/MLS/mattpolster.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brandon","Vincent","us",3,"DF","../static/images/players/MLS/brandonvincent.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Johan","Kappelhof","nl",4,"DF","../static/images/players/MLS/johankappelhof.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Ellis","us",5,"DF","../static/images/players/MLS/kevinellis.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dax","McCarty","us",6,"MF","../static/images/players/MLS/daxmccarty.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","de Leeuw","nl",8,"FW","../static/images/players/MLS/michaeldeleeuw.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luis","Solignac","ar",9,"FW","../static/images/players/MLS/luissolignac.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aleksandar","Katai","rs",10,"MF","../static/images/players/MLS/aleksandarkatai.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tony","Tchani","cm",12,"MF","../static/images/players/MLS/tonytchani.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brandt","Bronico","us",13,"MF","../static/images/players/MLS/brandtbronico.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Djordje","Mihailovic","us",14,"MF","../static/images/players/MLS/djordjemihailovic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Grant","Lillard","us",15,"DF","../static/images/players/MLS/grantlillard.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","Campbell","us",16,"DF","../static/images/players/MLS/jonathancampbell.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Diego","Campos","cr",17,"FW","../static/images/players/MLS/diegocampos.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Drew","Conner","us",18,"MF","../static/images/players/MLS/drewconner.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mo","Adams","gb",19,"MF","../static/images/players/MLS/moadams.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Johnson","us",20,"MF","../static/images/players/MLS/danieljohnson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alan","Gordon","us",21,"FW","../static/images/players/MLS/alangordon.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jon","Bakero","es",22,"FW","../static/images/players/MLS/jonbakero.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nemanja","Nikolic","hu",23,"FW","../static/images/players/MLS/nemanjanikolic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jorge","Corrales","cu",25,"DF","../static/images/players/MLS/jorgecorrales.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Dean","us",26,"DF","../static/images/players/MLS/christiandean.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rafael","Ramos","pt",27,"DF","../static/images/players/MLS/rafaelramos.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Elliot","Collier","nz",28,"FW","../static/images/players/MLS/elliotcollier.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefan","Cleveland","us",30,"GK","../static/images/players/MLS/stefancleveland.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bastian","Schweinsteiger","de",31,"MF","../static/images/players/MLS/bastianschweinsteiger.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Patrick","McLain","us",32,"GK","../static/images/players/MLS/patrickmclain.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Richard","Sanchez","mx",45,"GK","../static/images/players/MLS/richardsanchez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ricardo","Clark","us",2,"MF","../static/images/players/MLS/ricardoclark.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Josh","Williams","us",3,"DF","../static/images/players/MLS/joshwilliams.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","Mensah","gh",4,"DF","../static/images/players/MLS/jonathanmensah.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wil","Trapp","us",6,"MF","../static/images/players/MLS/wiltrapp.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Artur",NULL,"br",7,"MF","../static/images/players/MLS/artur.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mohammed","Abu","gh",8,"MF","../static/images/players/MLS/mohammedabu.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pedro","Santos","pt",9,"MF","../static/images/players/MLS/pedrosantos.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Federico","Higuain","ar",10,"MF","../static/images/players/MLS/federicohiguain.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gyasi","Zardes","us",11,"FW","../static/images/players/MLS/gyasizardes.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mike","Grella","us",13,"MF","../static/images/players/MLS/mikegrella.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adam","Jahn","us",14,"FW","../static/images/players/MLS/adamjahn.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Hector","Jimenez","us",16,"MF","../static/images/players/MLS/hectorjimenez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lalas","Abubakar","gh",17,"DF","../static/images/players/MLS/lalasabubakar.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cristian","Martinez","pa",18,"MF","../static/images/players/MLS/cristianmartinez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Milton","Valenzuela","ar",19,"DF","../static/images/players/MLS/miltonvalenzuela.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eduardo","Sosa","ve",20,"MF","../static/images/players/MLS/eduardososa.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gaston","Sauro","ar",22,"DF","../static/images/players/MLS/gastonsauro.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Zack","Steffen","us",23,"GK","../static/images/players/MLS/zacksteffen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jon","Kempin","us",24,"GK","../static/images/players/MLS/jonkempin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Harrison","Afful","gh",25,"DF","../static/images/players/MLS/harrisonafful.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luis","Argudo","us",26,"MF","../static/images/players/MLS/luisargudo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Niko","Hansen","dk",28,"MF","../static/images/players/MLS/nikohansen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Logan","Ketterer","us",30,"GK","../static/images/players/MLS/loganketterer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Connor","Maloney","us",31,"DF","../static/images/players/MLS/connormaloney.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Ousted","dk",1,"GK","../static/images/players/MLS/davidousted.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Taylor","Kemp","us",2,"DF","../static/images/players/MLS/taylorkemp.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Odoi-Atsem","us",3,"DF","../static/images/players/MLS/chrisodoiatsem.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Russell","Canouse","us",4,"MF","../static/images/players/MLS/russellcanouse.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Junior","Moreno","ve",5,"MF","../static/images/players/MLS/juniormoreno.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kofi","Opare","gh",6,"DF","../static/images/players/MLS/kofiopare.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Paul","Arriola","us",7,"MF","../static/images/players/MLS/paularriola.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ulises","Segura","cr",8,"MF","../static/images/players/MLS/ulisessegura.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luciano","Acosta","ar",10,"MF","../static/images/players/MLS/lucianoacosta.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Darren","Mattocks","jm",11,"FW","../static/images/players/MLS/darrenmattocks.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Frederic","Brillant","fr",13,"DF","../static/images/players/MLS/fredericbrillant.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nick","DeLeon","us",14,"MF","../static/images/players/MLS/nickdeleon.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Steve","Birnbaum","us",15,"DF","../static/images/players/MLS/stevebirnbaum.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Patrick","Mullins","us",16,"FW","../static/images/players/MLS/patrickmullins.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Zoltan","Stieber","hu",18,"MF","../static/images/players/MLS/zoltanstieber.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jalen","Robinson","us",20,"DF","../static/images/players/MLS/jalenrobinson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Durkin","us",21,"DF","../static/images/players/MLS/chrisdurkin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yamil","Asad","ar",22,"MF","../static/images/players/MLS/yamilasad.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ian","Harkes","us",23,"MF","../static/images/players/MLS/ianharkes.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jared","Jeffrey","us",25,"MF","../static/images/players/MLS/jaredjeffrey.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Steve","Clark","us",26,"GK","../static/images/players/MLS/steveclark.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joseph","Mora","cr",28,"DF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Oniel","Fisher","jm",91,"DF","../static/images/players/MLS/onielfisher.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Evan","Bush","us",1,"GK","../static/images/players/MLS/evanbush.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Victor","Cabrera","ar",2,"DF","../static/images/players/MLS/victorcabrera.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Lovitz","us",3,"DF","../static/images/players/MLS/daniellovitz.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rudy","Camacho","fr",4,"DF","../static/images/players/MLS/rudycamacho.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Zakaria","Diallo","fr",5,"DF","../static/images/players/MLS/zakariadiallo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Samuel","Piette","ca",6,"MF","../static/images/players/MLS/samuelpiette.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dominic","Oduro","gh",7,"FW","../static/images/players/MLS/dominicoduro.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Saphir","Taider","dz",8,"MF","../static/images/players/MLS/saphirtaider.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alejandro","Silva","uy",9,"MF","../static/images/players/MLS/alejandrosilva.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ignacio","Piatti","ar",10,"MF","../static/images/players/MLS/ignaciopiatti.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Anthony","Jackson-Hamel","ca",11,"FW","../static/images/players/MLS/anthonyjacksonhamel.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ken","Krolicki","jp",13,"MF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Raheem","Edwards","ca",14,"MF","../static/images/players/MLS/raheemedwards.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rod","Fanni","fr",15,"DF","../static/images/players/MLS/rodfanni.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jeisson","Vargas","cl",16,"MF","../static/images/players/MLS/jeissonvargas.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Choiniere","ca",17,"MF","../static/images/players/MLS/davidchoiniere.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Duvall","us",18,"DF","../static/images/players/MLS/chrisduvall.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matteo","Mancosu","it",21,"FW","../static/images/players/MLS/matteomancosu.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jukka","Raitala","fi",22,"DF","../static/images/players/MLS/jukkaraitala.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Clement","Diop","sn",23,"GK","../static/images/players/MLS/clementdiop.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Petrasso","ca",24,"DF","../static/images/players/MLS/michaelpetrasso.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Louis","Beland-Goyette","ca",25,"MF","../static/images/players/MLS/louisbelandgoyette.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kyle","Fisher","us",26,"DF","../static/images/players/MLS/kylefisher.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nick","DePuy","us",27,"FW","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Shamit","Shome","ca",28,"MF","../static/images/players/MLS/shamitshome.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marco","Donadel","it",33,"MF","../static/images/players/MLS/marcodonadel.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jason","Beaulieu","ca",40,"GK","../static/images/players/MLS/jasonbeaulieu.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","Pantemis","ca",41,"GK","../static/images/players/MLS/jamespantemis.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cody","Cropper","us",1,"GK","../static/images/players/MLS/codycropper.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andrew","Farrell","us",2,"DF","../static/images/players/MLS/andrewfarrell.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jalil","Anibaba","us",3,"DF","../static/images/players/MLS/jalilanibaba.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Claude","Dielna","fr",4,"DF","../static/images/players/MLS/claudedielna.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Isaac","Angking","us",5,"MF","../static/images/players/MLS/isaacangking.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Scott","Caldwell","us",6,"MF","../static/images/players/MLS/scottcaldwell.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brian","Wright","ca",7,"FW","../static/images/players/MLS/brianwright.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Tierney","us",8,"DF","../static/images/players/MLS/christierney.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Krisztian","Nemeth","hu",9,"FW","../static/images/players/MLS/krisztiannemeth.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Teal","Bunbury","us",10,"FW","../static/images/players/MLS/tealbunbury.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kelyn","Rowe","us",11,"MF","../static/images/players/MLS/kelynrowe.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nicolas","Samayoa","gt",12,"DF","../static/images/players/MLS/nicolassamayoa.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Diego","Fagundez","uy",14,"FW","../static/images/players/MLS/diegofagundez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brandon","Bye","us",15,"DF","../static/images/players/MLS/brandonbye.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mark","Segbers","us",16,"MF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Juan","Agudelo","us",17,"FW","../static/images/players/MLS/juanagudelo.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brad","Knighton","us",18,"GK","../static/images/players/MLS/bradknighton.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Antonio","Delamea Mlinar","si",19,"DF","../static/images/players/MLS/antoniodelameamlinar.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Zachary","Herivaux","ht",21,"MF","../static/images/players/MLS/zacharyherivaux.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wilfried","Zahibo","fr",23,"MF","../static/images/players/MLS/wilfriedzahibo.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lee","Nguyen","us",24,"MF","../static/images/players/MLS/leenguyen.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luis","Caicedo","co",27,"MF","../static/images/players/MLS/luiscaicedo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matt","Turner","us",30,"GK","../static/images/players/MLS/mattturner.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cristian","Penilla","ec",70,"FW","../static/images/players/MLS/cristianpenilla.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Femi","Hollinger-Janzen","bj",88,"FW","../static/images/players/MLS/femihollingerjanzen.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gabriel","Somi","sy",91,"DF","../static/images/players/MLS/gabrielsomi.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sean","Johnson","us",1,"GK","../static/images/players/MLS/seanjohnson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ben","Sweat","us",2,"DF","../static/images/players/MLS/bensweat.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Anton","Tinnerholm","se",3,"DF","../static/images/players/MLS/antontinnerholm.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Maxime","Chanot","lu",4,"DF","../static/images/players/MLS/maximechanot.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cedric","Hountondji","bj",5,"DF","../static/images/players/MLS/cedrichountondji.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Callens","pe",6,"DF","../static/images/players/MLS/alexandercallens.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Villa","es",7,"FW","../static/images/players/MLS/davidvilla.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Ring","fi",8,"MF","../static/images/players/MLS/alexanderring.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jo","Inge Berget","no",9,"FW","../static/images/players/MLS/joingeberget.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Maximiliano","Moralez","ar",10,"MF","../static/images/players/MLS/maximilianomoralez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ebenezer","Ofori","gh",12,"MF","../static/images/players/MLS/ebenezerofori.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Saad","Abdul-Salaam","us",13,"DF","../static/images/players/MLS/saadabdulsalaam.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kwame","Awuah","ca",14,"MF","../static/images/players/MLS/kwameawuah.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","McNamara","us",15,"MF","../static/images/players/MLS/thomasmcnamara.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","Sands","us",16,"MF","../static/images/players/MLS/jamessands.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","Lewis","us",17,"FW","../static/images/players/MLS/jonathanlewis.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jeff","Caldwell","us",18,"GK","../static/images/players/MLS/jeffcaldwell.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jesus","Medina","py",19,"MF","../static/images/players/MLS/jesusmedina.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ronald","Matarrita","cr",22,"DF","../static/images/players/MLS/ronaldmatarrita.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rodney","Wallace","cr",23,"FW","../static/images/players/MLS/rodneywallace.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joe","Scally","us",25,"DF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ismael","Tajouri","ly",29,"FW","../static/images/players/MLS/ismaeltajouri.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yangel","Herrera","ve",30,"MF","../static/images/players/MLS/yangelherrera.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sebastien","Ibeagha","us",33,"DF","../static/images/players/MLS/sebastienibeagha.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brad","Stuver","us",41,"GK","../static/images/players/MLS/bradstuver.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Politz","us",3,"DF","../static/images/players/MLS/kevinpolitz.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tyler","Adams","us",4,"MF","../static/images/players/MLS/tyleradams.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Connor","Lade","us",5,"DF","../static/images/players/MLS/connorlade.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kyle","Duncan","us",6,"DF","../static/images/players/MLS/kyleduncan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Derrick","Etienne","ht",7,"MF","../static/images/players/MLS/derricketienne.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alejandro","Gamarra","ar",10,"MF","../static/images/players/MLS/alejandrogamarra.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Carlos","Rivas","co",11,"FW","../static/images/players/MLS/carlosrivas.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ben","Mines","us",17,"MF","../static/images/players/MLS/benmines.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ryan","Meara","us",18,"GK","../static/images/players/MLS/ryanmeara.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alex","Muyl","us",19,"MF","../static/images/players/MLS/alexmuyl.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tommy","Redding","us",21,"DF","../static/images/players/MLS/tommyredding.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florian","Valot","fr",22,"MF","../static/images/players/MLS/florianvalot.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cristian","Casseres Jr.","ve",23,"MF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Evan","Louro","us",24,"GK","../static/images/players/MLS/evanlouro.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefano","Bonomo","us",25,"FW","../static/images/players/MLS/stefanobonomo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tim","Parker","us",26,"DF","../static/images/players/MLS/timparker.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sean","Davis","us",27,"MF","../static/images/players/MLS/seandavis.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fidel","Escobar","pa",29,"DF","../static/images/players/MLS/fidelescobar.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luis","Robles","us",31,"GK","../static/images/players/MLS/luisrobles.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aaron","Long","us",33,"DF","../static/images/players/MLS/aaronlong.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Hassan","Ndam","cm",47,"DF","../static/images/players/MLS/hassanndam.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Amir","pa",62,"DF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Royer","at",77,"MF","../static/images/players/MLS/danielroyer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aurelien","Collin","fr",78,"DF","../static/images/players/MLS/aureliencollin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vincent","Bezecourt","fr",88,"MF","../static/images/players/MLS/vincentbezecourt.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marc","Rzatkowski","de",90,"MF","../static/images/players/MLS/marcrzatkowski.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kemar","Lawrence","jm",92,"DF","../static/images/players/MLS/kemarlawrence.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bradley","Wright-Phillips","gb",99,"FW","../static/images/players/MLS/bradleywrightphillips.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joe","Bendik","us",1,"GK","../static/images/players/MLS/joebendik.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","Spector","us",2,"DF","../static/images/players/MLS/jonathanspector.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Amro","Tarek","eg",3,"DF","../static/images/players/MLS/amrotarek.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Will","Johnson","ca",4,"MF","../static/images/players/MLS/willjohnson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dillon","Powers","us",5,"MF","../static/images/players/MLS/dillonpowers.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Richie","Laryea","ca",6,"MF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cristian","Higuita","co",7,"MF","../static/images/players/MLS/cristianhiguita.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Justin","Meram","iq",9,"FW","../static/images/players/MLS/justinmeram.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Josue","Colman","py",10,"MF","../static/images/players/MLS/josuecolman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pierre","da Silva","us",11,"MF","../static/images/players/MLS/pierredasilva.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mohamed","El Monir","ly",13,"DF","../static/images/players/MLS/mohamedelmonir.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dom","Dwyer","us",14,"FW","../static/images/players/MLS/domdwyer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cam","Lindley","us",15,"MF","../static/images/players/MLS/camlindley.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sacha","Kljestan","us",16,"MF","../static/images/players/MLS/sachakljestan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Mueller","us",17,"FW","../static/images/players/MLS/chrismueller.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yoshimar","Yotun","pe",19,"MF","../static/images/players/MLS/yoshimaryotun.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Oriol","Rosell","es",20,"MF","../static/images/players/MLS/oriolrosell.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Scott","Sutter","ch",21,"DF","../static/images/players/MLS/scottsutter.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lamine","Sane","sn",22,"DF","../static/images/players/MLS/laminesane.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Donny","Toia","us",25,"DF","../static/images/players/MLS/donnytoia.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("R.J.","Allen","us",27,"DF","../static/images/players/MLS/rjallen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Schuler","us",28,"DF","../static/images/players/MLS/chrisschuler.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefano","Pinho","br",29,"FW","../static/images/players/MLS/stefanopinho.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mason","Stajduhar","us",31,"GK","../static/images/players/MLS/masonstajduhar.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jose","Villareal","us",33,"MF","../static/images/players/MLS/josevillareal.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Earl","Edwards Jr.","us",36,"GK","../static/images/players/MLS/earledwardsjr.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("PC",NULL,"br",94,"DF","../static/images/players/MLS/pc.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adam","Grinwis","us",99,"GK","../static/images/players/MLS/adamgrinwis.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("John","McCarthy","us",1,"GK","../static/images/players/MLS/johnmccarthy.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Warren","Creavalle","gy",2,"MF","../static/images/players/MLS/warrencreavalle.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jack","Elliott","gb",3,"DF","../static/images/players/MLS/jackelliott.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mark","McKenzie","us",4,"DF","../static/images/players/MLS/markmckenzie.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Olivier","Mbaizo","cm",5,"DF","../static/images/players/MLS/oliviermbaizo.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Haris","Medunjanin","ba",6,"MF","../static/images/players/MLS/harismedunjanin.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Accam","gh",7,"MF","../static/images/players/MLS/davidaccam.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Derrick","Jones","us",8,"MF","../static/images/players/MLS/derrickjones.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fafa","Picault","us",9,"MF","../static/images/players/MLS/fafapicault.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Borek","Dockal","cz",10,"MF","../static/images/players/MLS/borekdockal.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alejandro","Bedoya","us",11,"MF","../static/images/players/MLS/alejandrobedoya.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Keegan","Rosenberry","us",12,"DF","../static/images/players/MLS/keeganrosenberry.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fabian","Herbers","de",14,"MF","../static/images/players/MLS/fabianherbers.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joshua","Yaro","gh",15,"DF","../static/images/players/MLS/joshuayaro.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Richie","Marquez","us",16,"DF","../static/images/players/MLS/richiemarquez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("C.J.","Sapong","us",17,"FW","../static/images/players/MLS/cjsapong.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andre","Blake","jm",18,"GK","../static/images/players/MLS/andreblake.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cory","Burke","jm",19,"FW","../static/images/players/MLS/coryburke.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcus","Epps","us",20,"MF","../static/images/players/MLS/marcusepps.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Anthony","Fontana","us",21,"MF","../static/images/players/MLS/anthonyfontana.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adam","Najem","us",24,"MF","../static/images/players/MLS/adamnajem.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ilsinho",NULL,"br",25,"MF","../static/images/players/MLS/ilsinho.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Auston","Trusty","us",26,"DF","../static/images/players/MLS/austontrusty.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jay","Simpson","gb",27,"FW","../static/images/players/MLS/jaysimpson.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ray","Gaddis","us",28,"DF","../static/images/players/MLS/raygaddis.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jake","McGuire","us",29,"GK","../static/images/players/MLS/jakemcguire.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eric","Ayuk","cm",30,"MF","../static/images/players/MLS/ericayuk.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matthew","Real","us",32,"DF","../static/images/players/MLS/matthewreal.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fabinho","Alves","br",33,"DF","../static/images/players/MLS/fabinhoalves.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Clint","Irwin","us",1,"GK","../static/images/players/MLS/clintirwin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Justin","Morrow","us",2,"DF","../static/images/players/MLS/justinmorrow.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Drew","Moor","us",3,"DF","../static/images/players/MLS/drewmoor.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Bradley","us",4,"MF","../static/images/players/MLS/michaelbradley.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ashtone","Morgan","ca",5,"DF","../static/images/players/MLS/ashtonemorgan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nick","Hagglund","us",6,"DF","../static/images/players/MLS/nickhagglund.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Victor","Vazquez","es",7,"MF","../static/images/players/MLS/victorvazquez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ager","Aketxe","es",8,"MF","../static/images/players/MLS/ageraketxe.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gregory","van der Wiel","nl",9,"DF","../static/images/players/MLS/gregoryvanderwiel.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sebastian","Giovinco","it",10,"FW","../static/images/players/MLS/sebastiangiovinco.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jason","Hernandez","us",12,"DF","../static/images/players/MLS/jasonhernandez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jay","Chapman","ca",14,"MF","../static/images/players/MLS/jaychapman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eriq","Zavaleta","us",15,"DF","../static/images/players/MLS/eriqzavaleta.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jozy","Altidore","us",17,"FW","../static/images/players/MLS/jozyaltidore.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marky","Delgado","us",18,"MF","../static/images/players/MLS/markydelgado.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ben","Spencer","us",19,"FW","../static/images/players/MLS/benspencer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ayo","Akinola","us",20,"FW","../static/images/players/MLS/ayoakinola.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","Osorio","ca",21,"MF","../static/images/players/MLS/jonathanosorio.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordan","Hamilton","ca",22,"FW","../static/images/players/MLS/jordanhamilton.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Mavinga","cd",23,"DF","../static/images/players/MLS/chrismavinga.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alex","Bono","us",25,"GK","../static/images/players/MLS/alexbono.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nicolas","Hasler","li",26,"MF","../static/images/players/MLS/nicolashasler.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Liam","Fraser","ca",27,"MF","../static/images/players/MLS/liamfraser.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Caleb","Patterson-Sewell","us",28,"GK","../static/images/players/MLS/calebpattersonsewell.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mitchell","Taintor","us",46,"DF","../static/images/players/MLS/mitchelltaintor.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julian","Dunn","ca",52,"DF","../static/images/players/MLS/juliandunn.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ryan","Telfer","ca",54,"MF","../static/images/players/MLS/ryantelfer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aidan","Daniels","ca",55,"MF","../static/images/players/MLS/aidandaniels.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tosaint","Ricketts","ca",87,"FW","../static/images/players/MLS/tosaintricketts.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alan","Mariano","ar",88,"MF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Auro",NULL,"br",96,"DF","../static/images/players/MLS/auro.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tim","Howard","us",1,"GK","../static/images/players/MLS/timhoward.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Edgar","Castillo","us",2,"DF","../static/images/players/MLS/edgarcastillo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eric","Miller","us",3,"DF","../static/images/players/MLS/ericmiller.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Danny","Wilson","gb",4,"DF","../static/images/players/MLS/dannywilson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tommy","Smith","nz",5,"DF","../static/images/players/MLS/tommysmith.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefan","Aigner","de",7,"MF","../static/images/players/MLS/stefanaigner.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Johan","Blomberg","se",8,"MF","../static/images/players/MLS/johanblomberg.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yannick","Boli","ci",9,"FW","../static/images/players/MLS/yannickboli.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joe","Mason","ie",10,"FW","../static/images/players/MLS/joemason.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Shkelzen","Gashi","al",11,"FW","../static/images/players/MLS/shkelzengashi.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dominique","Badji","sn",14,"FW","../static/images/players/MLS/dominiquebadji.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dillon","Serna","us",17,"MF","../static/images/players/MLS/dillonserna.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Zac","MacMath","us",18,"GK","../static/images/players/MLS/zacmacmath.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jack","Price","gb",19,"MF","../static/images/players/MLS/jackprice.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bismark","Adjei-Boateng","gh",21,"MF","../static/images/players/MLS/bismarkadjeiboateng.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Micheal","Azira","ug",22,"MF","../static/images/players/MLS/michealazira.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kip","Colvey","nz",23,"DF","../static/images/players/MLS/kipcolvey.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kortne","Ford","us",24,"DF","../static/images/players/MLS/kortneford.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Deklan","Wynne","nz",27,"DF","../static/images/players/MLS/deklanwynne.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jack","McBean","us",32,"FW","../static/images/players/MLS/jackmcbean.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Axel","Sjoberg","se",44,"DF","../static/images/players/MLS/axelsjoberg.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andrew","Dykstra","us",50,"GK","../static/images/players/MLS/andrewdykstra.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Enzo","Martinez","uy",90,"MF","../static/images/players/MLS/enzomartinez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marlon","Hairston","us",94,"MF","../static/images/players/MLS/marlonhairston.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jesse","Gonzalez","us",1,"GK","../static/images/players/MLS/jessegonzalez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Reggie","Cannon","us",2,"DF","../static/images/players/MLS/reggiecannon.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Reto","Ziegler","ch",3,"DF","../static/images/players/MLS/retoziegler.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Anton","Nedyalkov","bg",6,"DF","../static/images/players/MLS/antonnedyalkov.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Carlos","Gruezo","ec",7,"MF","../static/images/players/MLS/carlosgruezo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Victor","Ulloa","mx",8,"MF","../static/images/players/MLS/victorulloa.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cristian","Colman","py",9,"FW","../static/images/players/MLS/cristiancolman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mauro","Diaz","ar",10,"MF","../static/images/players/MLS/maurodiaz.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Santiago","Mosquera","co",11,"MF","../static/images/players/MLS/santiagomosquera.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ryan","Hollingshead","us",12,"MF","../static/images/players/MLS/ryanhollingshead.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tesho","Akindele","ca",13,"FW","../static/images/players/MLS/teshoakindele.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jimmy","Maurer","us",14,"GK","../static/images/players/MLS/jimmymaurer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jacori","Hayes","us",15,"MF","../static/images/players/MLS/jacorihayes.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brandon","Servania","us",18,"MF","../static/images/players/MLS/brandonservania.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Paxton","Pomykal","us",19,"MF","../static/images/players/MLS/paxtonpomykal.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Roland","Lamah","be",20,"MF","../static/images/players/MLS/rolandlamah.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Barrios","co",21,"MF","../static/images/players/MLS/michaelbarrios.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kellyn","Acosta","us",23,"MF","../static/images/players/MLS/kellynacosta.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matt","Hedges","us",24,"DF","../static/images/players/MLS/matthedges.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jesus","Ferreira","co",27,"FW","../static/images/players/MLS/jesusferreira.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bryan","Reynolds","us",29,"FW","../static/images/players/MLS/bryanreynolds.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kyle","Zobeck","us",30,"GK","../static/images/players/MLS/kylezobeck.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Maynor","Figueroa","hn",31,"DF","../static/images/players/MLS/maynorfigueroa.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kris","Reaves","us",32,"DF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Maximiliano","Urruti","ar",37,"FW","../static/images/players/MLS/maximilianourruti.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Richards","us",1,"DF","../static/images/players/MLS/chrisrichards.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alejandro","Fuenmayor","ve",2,"DF","../static/images/players/MLS/alejandrofuenmayor.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adolfo","Machado","pa",3,"DF","../static/images/players/MLS/adolfomachado.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Philippe","Senderos","ch",4,"DF","../static/images/players/MLS/philippesenderos.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Juan","David","co",5,"MF","../static/images/players/MLS/juandavid.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eric","Alexander","us",6,"MF","../static/images/players/MLS/ericalexander.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("DaMarcus","Beasley","us",7,"DF","../static/images/players/MLS/damarcusbeasley.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Memo","Rodriguez","us",8,"MF","../static/images/players/MLS/memorodriguez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mauro","Manotas","co",9,"FW","../static/images/players/MLS/mauromanotas.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tomas","Martinez","ar",10,"MF","../static/images/players/MLS/tomasmartinez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andrew","Wenger","us",11,"MF","../static/images/players/MLS/andrewwenger.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Arturo","Alvarez","sv",12,"MF","../static/images/players/MLS/arturoalvarez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luis","Gil","us",13,"MF","../static/images/players/MLS/luisgil.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Charlie","Ward","gb",14,"MF","../static/images/players/MLS/charlieward.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dylan","Remick","us",15,"DF","../static/images/players/MLS/dylanremick.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Garcia","us",16,"DF","../static/images/players/MLS/kevingarcia.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alberth","Elis","hn",17,"FW","../static/images/players/MLS/alberthelis.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Seitz","us",18,"GK","../static/images/players/MLS/chrisseitz.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mac","Steeves","us",19,"FW","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("A.J.","DeLaGarza","gu",20,"DF","../static/images/players/MLS/ajdelagarza.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("George","Malki","us",21,"DF","../static/images/players/MLS/georgemalki.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Leonardo",NULL,"br",22,"DF","../static/images/players/MLS/leonardo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joe","Willis","us",23,"GK","../static/images/players/MLS/joewillis.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Darwin","Ceren","sv",24,"MF","../static/images/players/MLS/darwinceren.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eric","Bird","us",25,"MF","../static/images/players/MLS/ericbird.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Nelson","us",26,"GK","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Oscar","Boniek","hn",27,"MF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Romell","Quioto","hn",31,"FW","../static/images/players/MLS/romellquioto.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jared","Watts","us",33,"DF","../static/images/players/MLS/jaredwatts.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adam","Lundqvist","se",35,"DF","../static/images/players/MLS/adamlundqvist.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Bingham","us",1,"GK","../static/images/players/MLS/davidbingham.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Perry","Kitchen","us",2,"MF","../static/images/players/MLS/perrykitchen.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ashley","Cole","gb",3,"DF","../static/images/players/MLS/ashleycole.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dave","Romney","us",4,"DF","../static/images/players/MLS/daveromney.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Steres","us",5,"DF","../static/images/players/MLS/danielsteres.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Baggio","Husidic","ba",6,"MF","../static/images/players/MLS/baggiohusidic.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Romain","Alessandrini","fr",7,"MF","../static/images/players/MLS/romainalessandrini.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","dos Santos","mx",8,"MF","../static/images/players/MLS/jonathandossantos.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Zlatan","Ibrahimovic","se",9,"FW","../static/images/players/MLS/zlatanibrahimovic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Giovani","dos Santos","mx",10,"FW","../static/images/players/MLS/giovanidossantos.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ola","Kamara","no",11,"FW","../static/images/players/MLS/olakamara.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brian","Sylvestre","us",12,"GK","../static/images/players/MLS/briansylvestre.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Servando","Carrasco","us",14,"MF","../static/images/players/MLS/servandocarrasco.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ariel","Lassiter","cr",15,"FW","../static/images/players/MLS/ariellassiter.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jorgen","Skjelvik","no",16,"DF","../static/images/players/MLS/jorgenskjelvik.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sebastian","Lletget","us",17,"MF","../static/images/players/MLS/sebastianlletget.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Pontius","us",19,"MF","../static/images/players/MLS/chrispontius.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tomas","Hilliard-Arce","us",20,"DF","../static/images/players/MLS/tomashilliardarce.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Hugo","Arellano","us",21,"DF","../static/images/players/MLS/hugoarellano.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Emrah","Klimenta","me",22,"DF","../static/images/players/MLS/emrahklimenta.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Emmanuel","Boateng","gh",24,"FW","../static/images/players/MLS/emmanuelboateng.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rolf","Feltscher","ve",25,"DF","../static/images/players/MLS/rolffeltscher.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Efrain","Alvarez","us",26,"MF","../static/images/players/MLS/efrainalvarez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Ciani","fr",28,"DF","../static/images/players/MLS/michaelciani.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bradford","Jamieson IV","us",38,"FW","../static/images/players/MLS/bradfordjamiesoniv.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Justin","Vom","us",41,"GK","../static/images/players/MLS/justinvom.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joao","Pedro","pt",88,"MF","../static/images/players/MLS/joaopedro.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tyler","Miller","us",1,"GK","../static/images/players/MLS/tylermiller.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordan","Harvey","us",2,"DF","../static/images/players/MLS/jordanharvey.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Steven","Beitashour","ir",3,"DF","../static/images/players/MLS/stevenbeitashour.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Omar","Gaber","eg",4,"DF","../static/images/players/MLS/omargaber.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dejan","Jakovic","ca",5,"DF","../static/images/players/MLS/dejanjakovic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Latif","Blessing","gh",7,"FW","../static/images/players/MLS/latifblessing.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andre","Horta","pt",8,"MF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Diego","Rossi","uy",9,"FW","../static/images/players/MLS/diegorossi.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Carlos","Vela","mx",10,"FW","../static/images/players/MLS/carlosvela.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aaron","Kovar","us",11,"MF","../static/images/players/MLS/aaronkovar.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mark-Anthony","Kaye","ca",14,"MF","../static/images/players/MLS/markanthonykaye.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Calum","Mallace","gb",16,"MF","../static/images/players/MLS/calummallace.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","Murphy","us",19,"MF","../static/images/players/MLS/jamesmurphy.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eduard","Atuesta","co",20,"MF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marco","Urena","cr",21,"FW","../static/images/players/MLS/marcourena.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luis","Lopez","hn",22,"GK","../static/images/players/MLS/luislopez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Laurent","Ciman","be",23,"DF","../static/images/players/MLS/laurentciman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Charlie","Lyon","us",24,"GK","../static/images/players/MLS/charlielyon.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Walker","Zimmerman","us",25,"DF","../static/images/players/MLS/walkerzimmerman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tristan","Blackmon","us",27,"DF","../static/images/players/MLS/tristanblackmon.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Shaft","Brewer Jr.","us",28,"FW","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Benny","Feilhaber","us",33,"MF","../static/images/players/MLS/bennyfeilhaber.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joao","Moutinho","pt",44,"DF","../static/images/players/MLS/joaomoutinho.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rodrigo","Pacheco","ar",50,"FW","../static/images/players/MLS/rodrigopacheco.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Carter","Manley","us",2,"DF","../static/images/players/MLS/cartermanley.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jerome","Thiesson","ch",3,"DF","../static/images/players/MLS/jeromethiesson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tyrone","Mears","jm",4,"DF","../static/images/players/MLS/tyronemears.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Francisco","Calvo","cr",5,"DF","../static/images/players/MLS/franciscocalvo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sam","Cronin","us",6,"MF","../static/images/players/MLS/samcronin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ibson",NULL,"br",7,"MF","../static/images/players/MLS/ibson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marc","Burch","us",8,"DF","../static/images/players/MLS/marcburch.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Abu","Danladi","gh",9,"FW","../static/images/players/MLS/abudanladi.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Miguel","Ibarra","us",10,"MF","../static/images/players/MLS/miguelibarra.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sam","Nicholson","gb",12,"MF","../static/images/players/MLS/samnicholson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ethan","Finlay","us",13,"MF","../static/images/players/MLS/ethanfinlay.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brent","Kallman","us",14,"DF","../static/images/players/MLS/brentkallman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Boxall","nz",15,"DF","../static/images/players/MLS/michaelboxall.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Harrison","Heath","gb",16,"MF","../static/images/players/MLS/harrisonheath.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Collin","Martin","us",17,"MF","../static/images/players/MLS/collinmartin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Molino","tt",18,"MF","../static/images/players/MLS/kevinmolino.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Frantz","Pangop","cm",19,"MF","../static/images/players/MLS/frantzpangop.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rasmus","Schuller","fi",20,"MF","../static/images/players/MLS/rasmusschuller.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Ramirez","us",21,"FW","../static/images/players/MLS/christianramirez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wyatt","Omsberg","us",22,"DF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mason","Toye","us",23,"FW","../static/images/players/MLS/masontoye.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alex","Kapp","us",24,"GK","../static/images/players/MLS/alexkapp.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Darwin","Quintero","co",25,"FW","../static/images/players/MLS/darwinquintero.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Collen","Warner","us",26,"MF","../static/images/players/MLS/collenwarner.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bertrand","Owundi","cm",27,"DF","../static/images/players/MLS/bertrandowundi.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matt","Lampson","us",28,"GK","../static/images/players/MLS/mattlampson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luiz","Fernando","br",29,"MF","../static/images/players/MLS/luizfernando.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexi","Gomez","pe",32,"MF","../static/images/players/MLS/alexigomez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bobby","Shuttleworth","us",33,"GK","../static/images/players/MLS/bobbyshuttleworth.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jeff","Attinella","us",1,"GK","../static/images/players/MLS/jeffattinella.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alvas","Powell","jm",2,"DF","../static/images/players/MLS/alvaspowell.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vytautas","Andriuskevicius","lt",5,"DF","../static/images/players/MLS/vytautasandriuskevicius.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Roy","Miller","cr",7,"DF","../static/images/players/MLS/roymiller.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Diego","Valeri","ar",8,"MF","../static/images/players/MLS/diegovaleri.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fanendo","Adi","ng",9,"FW","../static/images/players/MLS/fanendoadi.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sebastian","Blanco","ar",10,"MF","../static/images/players/MLS/sebastianblanco.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andy","Polo","pe",11,"FW","../static/images/players/MLS/andypolo.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lawrence","Olum","ke",13,"MF","../static/images/players/MLS/lawrenceolum.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andres","Flores","sv",14,"MF","../static/images/players/MLS/andresflores.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Zarek","Valentin","us",16,"DF","../static/images/players/MLS/zarekvalentin.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jeremy","Ebobisse","us",17,"FW","../static/images/players/MLS/jeremyebobisse.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julio","Cascante","cr",18,"DF","../static/images/players/MLS/juliocascante.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Victor","Arboleda","co",19,"FW","../static/images/players/MLS/victorarboleda.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Guzman","cr",20,"MF","../static/images/players/MLS/davidguzman.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Diego","Chara","co",21,"MF","../static/images/players/MLS/diegochara.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cristhian","Paredes","py",22,"MF","../static/images/players/MLS/cristhianparedes.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jack","Barmby","gb",23,"MF","../static/images/players/MLS/jackbarmby.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Liam","Ridgewell","gb",24,"DF","../static/images/players/MLS/liamridgewell.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bill","Tuiloma","nz",25,"DF","../static/images/players/MLS/billtuiloma.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Modou","Jadama","gm",26,"DF","../static/images/players/MLS/modoujadama.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dairon","Asprilla","co",27,"FW","../static/images/players/MLS/daironasprilla.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Foster","Langsdorf","us",28,"FW","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eryk","Williamson","us",30,"MF","../static/images/players/MLS/erykwilliamson.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marco","Farfan","us",32,"DF","../static/images/players/MLS/marcofarfan.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Larrys","Mabiala","cd",33,"DF","../static/images/players/MLS/larrysmabiala.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kendall","McIntosh","us",43,"GK","../static/images/players/MLS/kendallmcintosh.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Darixon","Vuelto","hn",47,"FW","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jake","Gleeson","nz",90,"GK","../static/images/players/MLS/jakegleeson.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Samuel","Armenteros","se",99,"FW","../static/images/players/MLS/samuelarmenteros.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alex","Horwath","us",1,"GK","../static/images/players/MLS/alexhorwath.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tony","Beltran","us",2,"DF","../static/images/players/MLS/tonybeltran.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adam","Henley","gb",3,"DF","../static/images/players/MLS/adamhenley.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Horst","us",4,"DF","../static/images/players/MLS/davidhorst.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kyle","Beckerman","us",5,"MF","../static/images/players/MLS/kylebeckerman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Damir","Kreilach","hr",6,"MF","../static/images/players/MLS/damirkreilach.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jefferson","Savarino","ve",7,"FW","../static/images/players/MLS/jeffersonsavarino.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stephen","Sunday","ng",8,"MF","../static/images/players/MLS/stephensunday.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joao","Plata","ec",10,"FW","../static/images/players/MLS/joaoplata.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Albert","Rusnak","sk",11,"MF","../static/images/players/MLS/albertrusnak.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brooks","Lennon","us",12,"FW","../static/images/players/MLS/brookslennon.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nick","Besler","us",13,"MF","../static/images/players/MLS/nickbesler.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Justen","Glad","us",15,"DF","../static/images/players/MLS/justenglad.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alfredo","Ortuno","es",16,"FW","../static/images/players/MLS/alfredoortuno.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Demar","Phillips","jm",17,"DF","../static/images/players/MLS/demarphillips.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nick","Rimando","us",18,"GK","../static/images/players/MLS/nickrimando.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luke","Mulholland","gb",19,"MF","../static/images/players/MLS/lukemulholland.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luis","Silva","mx",20,"MF","../static/images/players/MLS/luissilva.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Taylor","Peay","us",21,"DF","../static/images/players/MLS/taylorpeay.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aaron","Herrera","us",22,"DF","../static/images/players/MLS/aaronherrera.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sebastian","Saucedo","us",23,"MF","../static/images/players/MLS/sebastiansaucedo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Connor","Sparrow","us",24,"GK","../static/images/players/MLS/connorsparrow.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Danny","Acosta","us",25,"DF","../static/images/players/MLS/dannyacosta.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Shawn","Barry","us",26,"DF","../static/images/players/MLS/shawnbarry.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Corey","Baird","us",27,"FW","../static/images/players/MLS/coreybaird.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ricky","Lopez-Espin","us",28,"FW","../static/images/players/MLS/rickylopezespin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jose","Hernandez","mx",29,"MF","../static/images/players/MLS/josehernandez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcelo","Silva","uy",30,"DF","../static/images/players/MLS/marcelosilva.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pablo","Ruiz","ar",31,"MF","../static/images/players/MLS/pabloruiz.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordan","Allen","us",70,"MF","../static/images/players/MLS/jordanallen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joel","Qwiberg","se",2,"DF","../static/images/players/MLS/joelqwiberg.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Francois","Affolter","ch",3,"DF","../static/images/players/MLS/francoisaffolter.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Shea","Salinas","us",6,"MF","../static/images/players/MLS/sheasalinas.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Magnus","Eriksson","se",7,"FW","../static/images/players/MLS/magnuseriksson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Wondolowski","us",8,"FW","../static/images/players/MLS/chriswondolowski.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Danny","Hoesen","nl",9,"FW","../static/images/players/MLS/dannyhoesen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jahmir","Hyka","al",10,"MF","../static/images/players/MLS/jahmirhyka.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vako","Qazaishvili","ge",11,"MF","../static/images/players/MLS/vakoqazaishvili.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matt","Bersano","us",12,"GK","../static/images/players/MLS/mattbersano.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jackson","Yueill","us",14,"MF","../static/images/players/MLS/jacksonyueill.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jimmy","Ockford","us",15,"DF","../static/images/players/MLS/jimmyockford.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Wehan","us",16,"MF","../static/images/players/MLS/chriswehan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("JT","Marcinkowski","us",18,"GK","../static/images/players/MLS/jtmarcinkowski.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Anibal","Godoy","pa",20,"MF","../static/images/players/MLS/anibalgodoy.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tommy","Thompson","us",22,"MF","../static/images/players/MLS/tommythompson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florian","Jungwirth","de",23,"DF","../static/images/players/MLS/florianjungwirth.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nick","Lima","us",24,"DF","../static/images/players/MLS/nicklima.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Quincy","Amarikwa","us",25,"FW","../static/images/players/MLS/quincyamarikwa.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eric","Calvillo","us",26,"MF","../static/images/players/MLS/ericcalvillo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fatai","Alashe","us",27,"MF","../static/images/players/MLS/fataialashe.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andrew","Tarbell","us",28,"GK","../static/images/players/MLS/andrewtarbell.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jacob","Akanyirige","us",29,"DF","../static/images/players/MLS/jacobakanyirige.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yeferson","Quintana","uy",30,"DF","../static/images/players/MLS/yefersonquintana.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Harold","Cummings","pa",31,"DF","../static/images/players/MLS/haroldcummings.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gilbert","Fuentes","us",35,"MF","../static/images/players/MLS/gilbertfuentes.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luis","Felipe","us",96,"FW","../static/images/players/MLS/luisfelipe.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Clint","Dempsey","us",2,"FW","../static/images/players/MLS/clintdempsey.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gustav","Svensson","se",4,"MF","../static/images/players/MLS/gustavsvensson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nouhou","Tolo","cm",5,"DF","../static/images/players/MLS/nouhoutolo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Osvaldo","Alonso","cu",6,"MF","../static/images/players/MLS/osvaldoalonso.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cristian","Roldan","us",7,"MF","../static/images/players/MLS/cristianroldan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Victor","Rodriguez","es",8,"MF","../static/images/players/MLS/victorrodriguez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nicolas","Lodeiro","uy",10,"MF","../static/images/players/MLS/nicolaslodeiro.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordan","Morris","us",13,"FW","../static/images/players/MLS/jordanmorris.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chad","Marshall","us",14,"DF","../static/images/players/MLS/chadmarshall.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tony","Alfaro","mx",15,"DF","../static/images/players/MLS/tonyalfaro.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alex","Roldan","us",16,"MF","../static/images/players/MLS/alexroldan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Will","Bruin","us",17,"FW","../static/images/players/MLS/willbruin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kelvin","Leerdam","nl",18,"DF","../static/images/players/MLS/kelvinleerdam.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Harry","Shipp","us",19,"MF","../static/images/players/MLS/harryshipp.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kim","Kee-hee","kr",20,"DF","../static/images/players/MLS/kimkeehee.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordy","Delem","mq",21,"MF","../static/images/players/MLS/jordydelem.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Magnus","Wolff Eikram","no",22,"MF","../static/images/players/MLS/magnuswolffeikram.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Henry","Wingo","us",23,"MF","../static/images/players/MLS/henrywingo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefan","Frei","ch",24,"GK","../static/images/players/MLS/stefanfrei.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Calle","Brown","us",25,"GK","../static/images/players/MLS/callebrown.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lamar","Neagle","us",27,"FW","../static/images/players/MLS/lamarneagle.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Roman","Torres","pa",29,"DF","../static/images/players/MLS/romantorres.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordan","McCrary","us",30,"DF","../static/images/players/MLS/jordanmccrary.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bryan","Meredith","us",35,"GK","../static/images/players/MLS/bryanmeredith.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Handwalla","Bwana","ke",70,"MF","../static/images/players/MLS/handwallabwana.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Waylon","Francis","cr",90,"DF","../static/images/players/MLS/waylonfrancis.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adrian","Zendejas","us",1,"GK","../static/images/players/MLS/adrianzendejas.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Amer","Didic","ca",2,"DF","../static/images/players/MLS/amerdidic.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ike","Opara","us",3,"DF","../static/images/players/MLS/ikeopara.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brad","Evans","us",4,"MF","../static/images/players/MLS/bradevans.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matt","Besler","us",5,"DF","../static/images/players/MLS/mattbesler.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ilie","Sanchez","es",6,"MF","../static/images/players/MLS/iliesanchez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Johnny","Russell","gb",7,"FW","../static/images/players/MLS/johnnyrussell.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Graham","Zusi","us",8,"DF","../static/images/players/MLS/grahamzusi.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yohan","Croizet","fr",10,"MF","../static/images/players/MLS/yohancroizet.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Diego","Rubio","cl",11,"FW","../static/images/players/MLS/diegorubio.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gerso","Fernandes","gw",12,"FW","../static/images/players/MLS/gersofernandes.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gianluca","Busio","us",13,"FW","../static/images/players/MLS/gianlucabusio.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Khiry","Shelton","us",14,"FW","../static/images/players/MLS/khiryshelton.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Seth","Sinovic","us",15,"DF","../static/images/players/MLS/sethsinovic.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Graham","Smith","us",16,"DF","../static/images/players/MLS/grahamsmith.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Roger","Espinoza","hn",17,"MF","../static/images/players/MLS/rogerespinoza.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eric","Dick","us",18,"GK","../static/images/players/MLS/ericdick.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cristian","Lobato","es",19,"MF","../static/images/players/MLS/cristianlobato.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Salloi","hu",20,"FW","../static/images/players/MLS/danielsalloi.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Felipe","Gutierrez","cl",21,"MF","../static/images/players/MLS/felipegutierrez.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Emiliano","Amor","ar",22,"DF","../static/images/players/MLS/emilianoamor.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Colton","Storm","us",23,"DF","../static/images/players/MLS/coltonstorm.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jaylin","Lindsey","us",26,"DF","../static/images/players/MLS/jaylinlindsey.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tim","Melia","us",29,"GK","../static/images/players/MLS/timmelia.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wan","Kuzain","us",75,"MF","../static/images/players/MLS/wankuzain.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matt","Lewis","us",88,"DF","../static/images/players/MLS/mattlewis.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kharlton","Belmar","us",90,"FW","../static/images/players/MLS/kharltonbelmar.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jimmy","Medranda","co",94,"DF","../static/images/players/MLS/jimmymedranda.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefan","Marinovic","nz",1,"GK","../static/images/players/MLS/stefanmarinovic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Doneil","Henry","ca",2,"DF","../static/images/players/MLS/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sean","Franklin","us",3,"DF","../static/images/players/MLS/seanfranklin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kendall","Waston","cr",4,"DF","../static/images/players/MLS/kendallwaston.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Efrain","Juarez","mx",6,"MF","../static/images/players/MLS/efrainjuarez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bernie","Ibini","au",7,"FW","../static/images/players/MLS/bernieibini.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Felipe",NULL,"br",8,"MF","../static/images/players/MLS/felipe.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Anthony","Blondell","ve",9,"FW","../static/images/players/MLS/anthonyblondell.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nicolas","Mezquida","uy",11,"MF","../static/images/players/MLS/nicolasmezquida.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brian","Rowe","us",12,"GK","../static/images/players/MLS/brianrowe.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cristian","Techera","uy",13,"MF","../static/images/players/MLS/cristiantechera.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcel","de Jong","ca",17,"DF","../static/images/players/MLS/marceldejong.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jose","Aja","uy",18,"DF","../static/images/players/MLS/joseaja.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Erik","Hurtado","us",19,"FW","../static/images/players/MLS/erikhurtado.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brek","Shea","us",20,"MF","../static/images/players/MLS/brekshea.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aaron","Maund","us",22,"DF","../static/images/players/MLS/aaronmaund.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kei","Kamara","sl",23,"FW","../static/images/players/MLS/keikamara.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Norman","ca",24,"MF","../static/images/players/MLS/davidnorman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Justin","Fiddes","us",25,"DF","../static/images/players/MLS/justinfiddes.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jake","Nerwinski","us",28,"DF","../static/images/players/MLS/jakenerwinski.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yordy","Reyna","pe",29,"FW","../static/images/players/MLS/yordyreyna.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Russell","Teibert","ca",31,"MF","../static/images/players/MLS/russellteibert.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sean","Melvin","ca",39,"GK","../static/images/players/MLS/seanmelvin.JPG");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Brett","Levis","ca",46,"DF","../static/images/players/MLS/brettlevis.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Simon","Colyn","ca",54,"MF","../static/images/players/MLS/simoncolyn.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ali","Ghazal","eg",66,"MF","../static/images/players/MLS/alighazal.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alphonso","Davies","ca",67,"MF","../static/images/players/MLS/alphonsodavies.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordon","Mutch","gb",77,"MF","../static/images/players/MLS/jordonmutch.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andreas","Luthe","de",1,"GK","../static/images/players/bundesliga/__andreasluthe.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Opare","gh",4,"DF","../static/images/players/bundesliga/__danielopare.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jeffrey","Gouweleeuw","nl",6,"DF","../static/images/players/bundesliga/__jeffreygouweleeuw.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcel","Heller","de",7,"MF","../static/images/players/bundesliga/__marcelheller.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rani","Khedira","de",8,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Shawn","Parker","de",9,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Baier","de",10,"MF","../static/images/players/bundesliga/__danielbaier.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Gregoritsch","at",11,"FW","../static/images/players/bundesliga/__michaelgregoritsch.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fabian","Giefer","de",13,"GK","../static/images/players/bundesliga/__fabiangiefer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jan","Moravek","cz",14,"MF","../static/images/players/bundesliga/__janmoravek.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christoph","Janker","de",16,"DF","../static/images/players/bundesliga/__christophjanker.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","Schmid","fr",17,"MF","../static/images/players/bundesliga/__jonathanschmid.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Koo","Ja-cheol","kr",19,"MF","../static/images/players/bundesliga/__koojacheol.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gojko","Kacar","rs",20,"MF","../static/images/players/bundesliga/__gojkokacar.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sergio","Cordova","ve",21,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marco","Richter","de",23,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ioannis","Gelios","gr",24,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kilian","Jakob","de",25,"DF","../static/images/players/bundesliga/__kilianjakob.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alfredo","Finnbogason","is",27,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Caiuby",NULL,"br",30,"MF","../static/images/players/bundesliga/__caiuby.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Philipp","Max","de",31,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Raphael","Framberger","de",32,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marwin","Hitz","ch",35,"GK","../static/images/players/bundesliga/__marwinhitz.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Martin","Hinteregger","at",36,"DF","../static/images/players/bundesliga/__martinhinteregger.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Danso","at",38,"DF","../static/images/players/bundesliga/__kevindanso.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bernd","Leno","de",1,"GK","../static/images/players/bundesliga/__berndleno.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Panagiotis","Retsos","gr",3,"DF","../static/images/players/bundesliga/__panagiotisretsos.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","Tah","de",4,"DF","../static/images/players/bundesliga/__jonathantah.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sven","Bender","de",5,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lars","Bender","de",8,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Leon","Bailey","jm",9,"FW","../static/images/players/bundesliga/__leonbailey.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julian","Brandt","de",10,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefan","Kiebling","de",11,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lucas","Alario","ar",13,"FW","../static/images/players/bundesliga/__lucasalario.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julian","Baumgartlinger","at",15,"MF","../static/images/players/bundesliga/__julianbaumgartlinger.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tin","Jedvaj","hr",16,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joel","Pohjanpalo","fi",17,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wendell",NULL,"br",18,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Charles","Aranguiz","cl",20,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dominik","Kohr","de",21,"MF","../static/images/players/bundesliga/__dominikkohr.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vladlen","Yurchenko","ua",22,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ramazan","Ozcan","at",28,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kai","Havertz","de",29,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sam","Schreck","de",30,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Volland","de",31,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Niklas","Lomb","de",36,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marlon","Frey","de",37,"MF","../static/images/players/bundesliga/__marlonfrey.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Karim","Bellarabi","de",38,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Benjamin","Henrichs","de",39,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Manuel","Neuer","de",1,"GK","../static/images/players/bundesliga/__manuelneuer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sandro","Wagner","de",2,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Niklas","Sule","de",4,"DF","../static/images/players/bundesliga/__niklassule.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mats","Hummels","de",5,"DF","../static/images/players/bundesliga/__matshummels.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thiago","Alcantara","es",6,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Franck","Ribery","fr",7,"MF","../static/images/players/bundesliga/__franckribery.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Javi","Martinez","es",8,"DF","../static/images/players/bundesliga/__javimartinez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robert","Lewandowski","pl",9,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Arjen","Robben","nl",10,"MF","../static/images/players/bundesliga/__arjenrobben.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","Rodriguez","co",11,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rafinha",NULL,"br",13,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Juan","Bernat","es",14,"DF","../static/images/players/bundesliga/__juanbernat.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lars","Lukas Mai","de",15,"DF","../static/images/players/bundesliga/__larslukasmai.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Meritan","Shabani","rs",16,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jerome","Boateng","de",17,"DF","../static/images/players/bundesliga/__jeromeboateng.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Franck","Evina","de",18,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sebastian","Rudy","de",19,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Felix","Gotze","de",20,"DF","../static/images/players/bundesliga/__felixgotze.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tom","Starke","de",22,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Arturo","Vidal","cl",23,"MF","../static/images/players/bundesliga/__arturovidal.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Corentin","Tolisso","fr",24,"MF","../static/images/players/bundesliga/__corentintolisso.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Muller","de",25,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sven","Ulreich","de",26,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Alaba","at",27,"DF","../static/images/players/bundesliga/__davidalaba.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kingsley","Coman","fr",29,"MF","../static/images/players/bundesliga/__kingsleycoman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Niklas","Dorsch","de",30,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joshua","Kimmich","de",32,"DF","../static/images/players/bundesliga/__joshuakimmich.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Fruchtl","de",36,"GK","../static/images/players/bundesliga/__christianfruchtl.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fabian","Benko","de",40,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Roman","Weidenfeller","de",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dan-Axel","Zagadou","fr",2,"DF","../static/images/players/bundesliga/__danaxelzagadou.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jadon","Sancho","gb",7,"MF","../static/images/players/bundesliga/__jadonsancho.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nuri","Sahin","tr",8,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andriy","Yarmolenko","ua",9,"FW","../static/images/players/bundesliga/__andriyyarmolenko.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mario","Gotze","de",10,"MF","../static/images/players/bundesliga/__mariogotze.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marco","Reus","de",11,"FW","../static/images/players/bundesliga/__marcoreus.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Raphael","Guerreiro","pt",13,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Isak","se",14,"FW","../static/images/players/bundesliga/__alexanderisak.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jeremy","Toljan","de",15,"DF","../static/images/players/bundesliga/__jeremytoljan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Manuel","Akanji","ch",16,"DF","../static/images/players/bundesliga/__manuelakanji.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sebastian","Rode","de",18,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mahmoud","Dahoud","de",19,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Maximilian","Philipp","de",20,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andre","Schurrle","de",21,"MF","../static/images/players/bundesliga/__andreschurrle.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Pulisic","us",22,"MF","../static/images/players/bundesliga/__christianpulisic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Shinji","Kagawa","jp",23,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sokratis","Papastathopoulos","gr",25,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lukasz","Piszczek","pl",26,"DF","../static/images/players/bundesliga/__lukaszpiszczek.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gonzalo","Castro","de",27,"MF","../static/images/players/bundesliga/__gonzalocastro.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcel","Schmelzer","de",29,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julian","Weigl","de",33,"MF","../static/images/players/bundesliga/__julianweigl.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sergio","Gomez","es",34,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dominik","Reimann","de",35,"GK","../static/images/players/bundesliga/__dominikreimann.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Omer","Toprak","tr",36,"DF","../static/images/players/bundesliga/__omertoprak.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Erik","Durm","de",37,"DF","../static/images/players/bundesliga/__erikdurm.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Roman","Burki","ch",38,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michy","Batshuayi","be",44,"FW","../static/images/players/bundesliga/__michybatshuayi.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yann","Sommer","ch",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mandela","Egbo","gb",2,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Reece","Oxford","gb",3,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jannik","Vestergaard","dk",4,"DF","../static/images/players/bundesliga/__jannikvestergaard.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tobias","Strobl","de",5,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christoph","Kramer","de",6,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Patrick","Herrmann","de",7,"MF","../static/images/players/bundesliga/__patrickherrmann.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Denis","Zakaria","ch",8,"MF","../static/images/players/bundesliga/__deniszakaria.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thorgan","Hazard","be",10,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Raffael",NULL,"br",11,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lars","Stindl","de",13,"FW","../static/images/players/bundesliga/__larsstindl.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ibrahima","Traore","gn",16,"MF","../static/images/players/bundesliga/__ibrahimatraore.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Oscar","Wendt","se",17,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Josip","Drmic","ch",18,"FW","../static/images/players/bundesliga/__josipdrmic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fabian","Johnson","us",19,"MF","../static/images/players/bundesliga/__fabianjohnson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julio","Villalba","py",20,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tobias","Sippel","de",21,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Laszlo","Benes","sk",22,"MF","../static/images/players/bundesliga/__laszlobenes.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonas","Hofmann","de",23,"MF","../static/images/players/bundesliga/__jonashofmann.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tony","Jantschke","de",24,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Raul","Bobadilla","py",26,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mickael","Cuisance","fr",27,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matthias","Ginter","de",28,"DF","../static/images/players/bundesliga/__matthiasginter.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mamadou","Doucoure","fr",29,"DF","../static/images/players/bundesliga/__mamadoudoucoure.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nico","Elvedi","ch",30,"DF","../static/images/players/bundesliga/__nicoelvedi.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vincenzo","Grifo","it",32,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Moritz","Nicolas","de",35,"GK","../static/images/players/bundesliga/__moritznicolas.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcel","Benger","de",38,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florian","Mayer","de",42,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Heuer Fernandes","pt",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joao","Renato","br",2,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joevin","Jones","tt",3,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aytac","Sulu","tr",4,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Slobodan","Medojevic","rs",5,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marvin","Mehlem","de",6,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Felix","Platte","de",7,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julian","Von Haacke","de",8,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ji","Dong-won","kr",9,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jan","Rosenthal","de",10,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tobias","Kempe","de",11,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Markus","Steinhofer","de",13,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Terrence","Boyd","us",15,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sandro","Sirigu","de",17,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Peter","Niemeyer","de",18,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Grobkreutz","de",19,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Artur","Sobiech","pl",20,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Immanuel","Hohn","de",21,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joel","Mall","ch",23,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yannick","Stark","de",25,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("McKinze","Gaines","us",27,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Baris","Atik","tr",28,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florian","Stritzel","de",31,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fabian","Holland","de",32,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Romain","Bregerie","fr",33,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Niklas","Kern","de",35,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wilson","Kamavuaka","cd",36,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Leo","Petri","de",37,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Romuald","Lacazette","fr",38,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Paul","Schmieder","de",39,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Silas","Zehnder","de",40,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lukas","Hradecky","fi",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Simon","Falette","fr",3,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ante","Rebic","hr",4,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gelson","Fernandes","ch",5,"MF","../static/images/players/bundesliga/__gelsonfernandes.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","de Guzman","nl",6,"MF","../static/images/players/bundesliga/__jonathandeguzman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Danny","Blum","de",7,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luka","Jovic","rs",8,"FW","../static/images/players/bundesliga/__lukajovic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sebastien","Haller","fr",9,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marco","Fabian","mx",10,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mijat","Gacinovic","rs",11,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Carlos","Salcedo","mx",13,"DF","../static/images/players/bundesliga/__carlossalcedo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Meier","de",14,"FW","../static/images/players/bundesliga/__alexandermeier.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jetro","Willems","nl",15,"DF","../static/images/players/bundesliga/__jetrowillems.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin-Prince","Boateng","gh",17,"MF","../static/images/players/bundesliga/__kevinprinceboateng.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Abraham","ar",19,"DF","../static/images/players/bundesliga/__davidabraham.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Makoto","Hasebe","jp",20,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marc","Stendera","de",21,"MF","../static/images/players/bundesliga/__marcstendera.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Timothy","Chandler","us",22,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marco","Russ","de",23,"DF","../static/images/players/bundesliga/__marcoruss.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Danny","da Costa","de",24,"DF","../static/images/players/bundesliga/__dannydacosta.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Deji-Ousman","Beyreuther","de",26,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marius","Wolf","de",27,"MF","../static/images/players/bundesliga/__mariuswolf.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aymen","Barkok","de",28,"MF","../static/images/players/bundesliga/__aymenbarkok.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sahverdi","Cetin","de",30,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Branimir","Hrgota","se",31,"FW","../static/images/players/bundesliga/__branimirhrgota.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nelson","Mandela Mbouhom","cm",32,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Taleb","Tawatha","il",33,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Leon","Batge","de",34,"GK","../static/images/players/bundesliga/__leonbatge.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Noel","Knothe","de",35,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jan","Zimmermann","de",37,"GK","../static/images/players/bundesliga/__janzimmermann.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Renat","Dadasov","az",38,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Omar","Mascarell","es",39,"MF","../static/images/players/bundesliga/__omarmascarell.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daichi","Kamada","jp",40,"MF","../static/images/players/bundesliga/__daichikamada.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marijan","Cavar","ba",42,"MF","../static/images/players/bundesliga/__marijancavar.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Schwolow","de",1,"GK","../static/images/players/bundesliga/__alexanderschwolow.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aleksandar","Ignjovski","rs",2,"DF","../static/images/players/bundesliga/__aleksandarignjovski.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Philipp","Lienhart","at",3,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Caglar","Soyuncu","tr",4,"DF","../static/images/players/bundesliga/__caglarsoyuncu.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Manuel","Gulde","de",5,"DF","../static/images/players/bundesliga/__manuelgulde.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Amir","Abrashi","al",6,"MF","../static/images/players/bundesliga/__amirabrashi.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florian","Niederlechner","de",7,"FW","../static/images/players/bundesliga/__florianniederlechner.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mike","Frantz","de",8,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lucas","Holer","de",9,"FW","../static/images/players/bundesliga/__lucasholer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marco","Terrazzino","de",13,"MF","../static/images/players/bundesliga/__marcoterrazzino.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Patrick","Kammerbauer","de",14,"DF","../static/images/players/bundesliga/__patrickkammerbauer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pascal","Stenzel","de",15,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yoric","Ravet","fr",16,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lukas","Kubler","de",17,"DF","../static/images/players/bundesliga/__lukaskubler.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nils","Petersen","de",18,"FW","../static/images/players/bundesliga/__nilspetersen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Janik","Haberer","de",19,"MF","../static/images/players/bundesliga/__janikhaberer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marc-Oliver","Kempf","de",20,"DF","../static/images/players/bundesliga/__marcoliverkempf.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Patric","Klandt","de",21,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vincent","Sierro","ch",22,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julian","Schuster","de",23,"MF","../static/images/players/bundesliga/__julianschuster.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Georg","Niedermeier","de",24,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robin","Koch","de",25,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gaetan","Bussmann","fr",26,"DF","../static/images/players/bundesliga/__gaetanbussmann.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nicolas","Hofler","de",27,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonas","Meffert","de",28,"MF","../static/images/players/bundesliga/__jonasmeffert.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Gunter","de",30,"DF","../static/images/players/bundesliga/__christiangunter.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Karim","Guede","sk",31,"MF","../static/images/players/bundesliga/__karimguede.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bartosz","Kapustka","pl",32,"MF","../static/images/players/bundesliga/__bartoszkapustka.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Caleb","Stanko","us",33,"MF","../static/images/players/bundesliga/__calebstanko.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tim","Kleindienst","de",34,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florian","Kath","de",38,"DF","../static/images/players/bundesliga/__floriankath.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rafal","Gikiewicz","pl",44,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Mathenia","de",1,"GK","../static/images/players/bundesliga/__christianmathenia.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dennis","Diekmeier","de",2,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rick","van Drongelen","nl",4,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mergim","Mavraj","al",5,"DF","../static/images/players/bundesliga/__mergimmavraj.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Douglas","Santos","br",6,"DF","../static/images/players/bundesliga/__douglassantos.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bobby","Wood","us",7,"FW","../static/images/players/bundesliga/__bobbywood.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lewis","Holtby","de",8,"MF","../static/images/players/bundesliga/__lewisholtby.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kyriakos","Papadopoulos","gr",9,"DF","../static/images/players/bundesliga/__kyriakospapadopoulos.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andre","Hahn","de",11,"FW","../static/images/players/bundesliga/__andrehahn.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Walace",NULL,"br",12,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julian","Pollersbeck","de",13,"GK","../static/images/players/bundesliga/__julianpollersbeck.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aaron","Hunt","de",14,"MF","../static/images/players/bundesliga/__aaronhunt.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luca","Waldschmidt","de",15,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vasilije","Janjicic","ch",16,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Filip","Kostic","rs",17,"MF","../static/images/players/bundesliga/__filipkostic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bakery","Jatta","gm",18,"MF","../static/images/players/bundesliga/__bakeryjatta.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sven","Schipplock","de",19,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Albin","Ekdal","se",20,"MF","../static/images/players/bundesliga/__albinekdal.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bjarne","Thoelke","de",22,"DF","../static/images/players/bundesliga/__bjarnethoelke.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sejad","Salihovic","ba",23,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gotoku","Sakai","jp",24,"DF","../static/images/players/bundesliga/__gotokusakai.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mats","Kohlert","de",25,"MF","../static/images/players/bundesliga/__matskohlert.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Torles","Knoll","de",26,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nicolai","Muller","de",27,"MF","../static/images/players/bundesliga/__nicolaimuller.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gideon","Jung","de",28,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andreas","Hirzel","ch",30,"GK","../static/images/players/bundesliga/__andreashirzel.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tom","Mickel","de",36,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonas","Behounek","de",38,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jann-Fiete","Arp","de",40,"FW","../static/images/players/bundesliga/__jannfietearp.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tatsuya","Ito","jp",43,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stephan","Ambrosius","de",46,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Josha","Vagnoman","de",47,"DF","../static/images/players/bundesliga/__joshavagnoman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Kraft","de",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Peter","Pekarik","sk",2,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Per","Ciljan Skjelbred","no",3,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Karim","Rekik","nl",4,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Niklas","Stark","de",5,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vladimir","Darida","cz",6,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Esswein","de",7,"MF","../static/images/players/bundesliga/__alexanderesswein.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Salomon","Kalou","ci",8,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ondrej","Duda","sk",10,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mathew","Leckie","aus",11,"FW","../static/images/players/bundesliga/__mathewleckie.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julian","Schieber","de",16,"FW","../static/images/players/bundesliga/__julianschieber.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Maximilian","Mittelstadt","de",17,"DF","../static/images/players/bundesliga/__maximilianmittelstadt.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sinan","Kurt","de",18,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vedad","Ibisevic","ba",19,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Valentino","Lazaro","at",20,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marvin","Plattenhardt","de",21,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rune","Jarstein","no",22,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mitchell","Weiser","de",23,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordan","Torunarigha","de",25,"DF","../static/images/players/bundesliga/__jordantorunarigha.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Arne","Maier","de",26,"MF","../static/images/players/bundesliga/__arnemaier.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Davie","Selke","de",27,"FW","../static/images/players/bundesliga/__davieselke.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fabian","Lustenberger","ch",28,"DF","../static/images/players/bundesliga/__fabianlustenberger.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florian","Baak","de",29,"DF","../static/images/players/bundesliga/__florianbaak.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julius","Kade","de",30,"MF","../static/images/players/bundesliga/__juliuskade.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Palko","Dardai","de",32,"MF","../static/images/players/bundesliga/__palkodardai.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","Klinsmann","us",33,"GK","../static/images/players/bundesliga/__jonathanklinsmann.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Oliver","Baumann","de",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pavel","Kaderabek","cz",3,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ermin","Bicakcic","ba",4,"DF","../static/images/players/bundesliga/__erminbicakcic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Havard","Nordtveit","no",6,"MF","../static/images/players/bundesliga/__havardnordtveit.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lukas","Rupp","de",7,"MF","../static/images/players/bundesliga/__lukasrupp.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eugen","Polanski","pl",8,"MF","../static/images/players/bundesliga/__eugenpolanski.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kerem","Demirbay","de",10,"MF","../static/images/players/bundesliga/__keremdemirbay.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florian","Grillitsch","at",11,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nico","Schulz","de",16,"DF","../static/images/players/bundesliga/__nicoschulz.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Steven","Zuber","ch",17,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nadiem","Amiri","de",18,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mark","Uth","de",19,"FW","../static/images/players/bundesliga/__markuth.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robert","Zulj","at",20,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Benjamin","Hubner","de",21,"DF","../static/images/players/bundesliga/__benjaminhubner.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Vogt","de",22,"MF","../static/images/players/bundesliga/__kevinvogt.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Justin","Hoogma","nl",24,"DF","../static/images/players/bundesliga/__justinhoogma.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Akpoguma","de",25,"DF","../static/images/players/bundesliga/__kevinakpoguma.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Otto","de",26,"FW","../static/images/players/bundesliga/__davidotto.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andrej","Kramaric","hr",27,"FW","../static/images/players/bundesliga/__andrejkramaric.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adam","Szalai","hu",28,"FW","../static/images/players/bundesliga/__adamszalai.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Serge","Gnabry","de",29,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Felix","Passlack","de",31,"DF","../static/images/players/bundesliga/__felixpasslack.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dennis","Geiger","de",32,"MF","../static/images/players/bundesliga/__dennisgeiger.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Stolz","de",33,"GK","../static/images/players/bundesliga/__alexanderstolz.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Meris","Skenderovic","me",35,"MF","../static/images/players/bundesliga/__merisskenderovic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gregor","Kobel","ch",36,"GK","../static/images/players/bundesliga/__gregorkobel.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robin","Hack","de",37,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefan","Posch","at",38,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Johannes","Buhler","de",41,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Rossipal","de",42,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Orjan","Nyland","no",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Frederic","Ananou","de",2,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tobias","Levels","de",3,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Paulo","Otavio","br",4,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Max","Christiansen","de",5,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alfredo","Morales","us",6,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Patrick","Ebert","de",7,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Almog","Cohen","il",8,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Moritz","Hartmann","de",9,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sonny","Kittel","de",10,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dario","Lezcano","py",11,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robert","Leipertz","de",13,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefan","Lex","de",14,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marco","Knaller","at",16,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Maximilian","Thalhammer","de",17,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcel","Gaus","de",19,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefan","Kutschke","de",20,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tobias","Schrock","de",21,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Takahiro","Sekine","jp",22,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ryoma","Watanabe","jp",23,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fabijan","Buntic","hr",24,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Hauke","Wahl","de",25,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Phil","Neumann","de",26,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lukas","Gerlspeck","de",27,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Trasch","de",28,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Pledl","de",30,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marvin","Matip","cm",34,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Timo","Horn","de",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Goden","de",2,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dominique","Heintz","de",3,"DF","../static/images/players/bundesliga/__dominiqueheintz.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Frederik","Sorensen","dk",4,"DF","../static/images/players/bundesliga/__frederiksorensen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dominic","Maroh","si",5,"DF","../static/images/players/bundesliga/__dominicmaroh.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marco","Hoger","de",6,"MF","../static/images/players/bundesliga/__marcohoger.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcel","Risse","de",7,"MF","../static/images/players/bundesliga/__marcelrisse.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Milos","Jojic","rs",8,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Simon","Terodde","de",9,"FW","../static/images/players/bundesliga/__simonterodde.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Simon","Zoller","de",11,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yuya","Osako","jp",13,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonas","Hector","de",14,"DF","../static/images/players/bundesliga/__jonashector.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jhon","Cordoba","co",15,"FW","../static/images/players/bundesliga/__jhoncordoba.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pawel","Olkowski","pl",16,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Clemens","de",17,"MF","../static/images/players/bundesliga/__christianclemens.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Kessler","de",18,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sehrou","Guirassy","fr",19,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Salih","Ozcan","de",20,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Leonardo","Bittencourt","de",21,"MF","../static/images/players/bundesliga/__leonardobittencourt.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jorge","Mere","es",22,"DF","../static/images/players/bundesliga/__jorgemere.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jannes","Horn","de",23,"DF","../static/images/players/bundesliga/__janneshorn.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lukas","Klunter","de",24,"DF","../static/images/players/bundesliga/__lukasklunter.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joao","Queiros","pt",25,"DF","../static/images/players/bundesliga/__joaoqueiros.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Fuhrich","de",26,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Filip","Kusic","rs",27,"DF","../static/images/players/bundesliga/__filipkusic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tim","Handwerker","de",29,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matthias","Lehmann","de",33,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sven","Muller","de",35,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Anas","Ouahim","de",37,"MF","../static/images/players/bundesliga/__anasouahim.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nikolas","Nartey","dk",38,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Claudio","Pizarro","pe",39,"FW","../static/images/players/bundesliga/__claudiopizarro.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yann","Aurel Bisseck","de",40,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vincent","Koziello","fr",41,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fabio","Coltorti","ch",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bernardo",NULL,"br",3,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Willi","Orban","de",4,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dayot","Upamecano","fr",5,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ibrahima","Konate","fr",6,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcel","Sabitzer","at",7,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Naby","Keita","gn",8,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yussuf","Poulsen","dk",9,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Emil","Forsberg","se",10,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Timo","Werner","de",11,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefan","Ilsanker","at",13,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lukas","Klostermann","de",16,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bruma",NULL,"pt",17,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ademola","Lookman","gb",18,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Benno","Schmitz","de",20,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Philipp","Kohn","ch",22,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcel","Halstenberg","de",23,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dominik","Kaiser","de",24,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Konrad","Laimer","at",27,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yvon","Mvogo","ch",28,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jean-Kevin","Augustin","fr",29,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Diego","Demme","de",31,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Peter","Gulacsi","hu",32,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Kampl","si",44,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rene","Adler","de",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Giulio","Donati","it",2,"DF","../static/images/players/bundesliga/__giuliodonati.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Leon","Balogun","ng",3,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Abdou","Diallo","fr",4,"DF","../static/images/players/bundesliga/__abdoudiallo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nigel","de Jong","nl",5,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Danny","Latza","de",6,"MF","../static/images/players/bundesliga/__dannylatza.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robin","Quaison","se",7,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Levin","Oztunal","de",8,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yoshinori","Muto","jp",9,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexandru","Maxim","ro",10,"MF","../static/images/players/bundesliga/__alexandrumaxim.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Emil","Berggreen","dk",11,"FW","../static/images/players/bundesliga/__emilberggreen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marin","Sverko","hr",13,"DF","../static/images/players/bundesliga/__marinsverko.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefan","Bell","de",16,"DF","../static/images/players/bundesliga/__stefanbell.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Brosinski","de",18,"DF","../static/images/players/bundesliga/__danielbrosinski.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Anthony","Ujah","ng",20,"FW","../static/images/players/bundesliga/__anthonyujah.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Karim","Onisiwo","at",21,"FW","../static/images/players/bundesliga/__karimonisiwo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florian","Muller","de",22,"GK","../static/images/players/bundesliga/__florianmuller.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Suat","Serdar","de",23,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jean-Philippe","Gbamin","ci",25,"MF","../static/images/players/bundesliga/__jeanphilippegbamin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Niko","Bungert","de",26,"DF","../static/images/players/bundesliga/__nikobungert.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robin","Zentner","de",27,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pablo","de Blasis","ar",32,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bote","Baku","de",34,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gerrit","Holtmann","de",38,"MF","../static/images/players/bundesliga/__gerritholtmann.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Hack","de",42,"DF","../static/images/players/bundesliga/__alexanderhack.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ralf","Fahrmann","de",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Weston","McKennie","us",2,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pablo","Insua","es",3,"DF","../static/images/players/bundesliga/__pabloinsua.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matija","Nastasic","rs",5,"DF","../static/images/players/bundesliga/__matijanastasic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Max","Meyer","de",7,"MF","../static/images/players/bundesliga/__maxmeyer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Leon","Goretzka","de",8,"MF","../static/images/players/bundesliga/__leongoretzka.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Franco","Di Santo","ar",9,"FW","../static/images/players/bundesliga/__francodisanto.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nabil","Bentaleb","dz",10,"MF","../static/images/players/bundesliga/__nabilbentaleb.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yevhen","Konoplyanka","ua",11,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Baba","Rahman","gh",14,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Benjamin","Stambouli","fr",17,"MF","../static/images/players/bundesliga/__benjaminstambouli.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Caligiuri","de",18,"MF","../static/images/players/bundesliga/__danielcaligiuri.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Guido","Burgstaller","at",19,"FW","../static/images/players/bundesliga/__guidoburgstaller.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thilo","Kehrer","de",20,"DF","../static/images/players/bundesliga/__thilokehrer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sascha","Riether","de",21,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marko","Pjaca","hr",22,"FW","../static/images/players/bundesliga/__markopjaca.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cedric","Teuchert","de",23,"FW","../static/images/players/bundesliga/__cedricteuchert.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bastian","Oczipka","de",24,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Amine","Harit","ma",25,"MF","../static/images/players/bundesliga/__amineharit.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alessandro","Schopf","at",28,"MF","../static/images/players/bundesliga/__alessandroschopf.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Naldo",NULL,"br",29,"DF","../static/images/players/bundesliga/__naldo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bernard","Tekpetey","gh",32,"FW","../static/images/players/bundesliga/__bernardtekpetey.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Langer","at",34,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Nubel","de",35,"GK","../static/images/players/bundesliga/__alexandernubel.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Breel","Embolo","ch",36,"FW","../static/images/players/bundesliga/__breelembolo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jiri","Pavlenka","cz",1,"GK","../static/images/players/bundesliga/__jiripavlenka.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luca","Caldirola","it",3,"DF","../static/images/players/bundesliga/__lucacaldirola.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robert","Bauer","de",4,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ludwig","Augustinsson","se",5,"DF","../static/images/players/bundesliga/__ludwigaugustinsson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Delaney","dk",6,"MF","../static/images/players/bundesliga/__thomasdelaney.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florian","Kainz","at",7,"MF","../static/images/players/bundesliga/__floriankainz.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jerome","Gondorf","de",8,"MF","../static/images/players/bundesliga/__jeromegondorf.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aron","Johannsson","us",9,"FW","../static/images/players/bundesliga/__aronjohannsson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Max","Kruse","de",10,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Milot","Rashica","rs",11,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Milos","Veljkovic","rs",13,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ole","Kauper","de",14,"MF","../static/images/players/bundesliga/__olekauper.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sebastian","Langkamp","de",15,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Zlatko","Junuzovic","at",16,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Justin","Eilers","de",17,"FW","../static/images/players/bundesliga/__justineilers.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Niklas","Moisander","fi",18,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Zhang","Yuning","cn",19,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fin","Bartels","de",22,"MF","../static/images/players/bundesliga/__finbartels.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Theodor","Gebre Selassie","cz",23,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Johannes","Eggestein","de",24,"FW","../static/images/players/bundesliga/__johanneseggestein.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jesper","Verlaat","nl",28,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ishak","Belfodil","dz",29,"FW","../static/images/players/bundesliga/__ishakbelfodil.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Zetterer","de",30,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marco","Friedl","at",32,"DF","../static/images/players/bundesliga/__marcofriedl.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jaroslav","Drobny","cz",33,"GK","../static/images/players/bundesliga/__jaroslavdrobny.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Maximilian","Eggestein","de",35,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Niklas","Schmidt","de",38,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luca","Plogmann","de",40,"GK","../static/images/players/bundesliga/__lucaplogmann.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Philipp","Bargfrede","de",44,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ousman","Manneh","gm",47,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Koen","Casteels","be",1,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("William",NULL,"br",2,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Paul","Verhaegh","nl",3,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ignacio","Camacho","es",4,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jeffrey","Bruma","nl",5,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Riechedly","Bazoer","nl",6,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Renato","Steffen","ch",8,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Landry","Dimata","be",9,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yunus","Mall","tr",10,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Didavi","de",11,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yannick","Gerhardt","de",13,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Divock","Origi","be",14,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jakub","Blaszczykowski","pl",16,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ohis","Felix Uduokhai","de",17,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Victor","Osimhen","ng",18,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Max","Grun","de",20,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Josip","Brekalo","hr",21,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Admir","Mehmedi","ch",22,"FW","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Josuha","Guilavogui","fr",23,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sebastian","Jung","de",24,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("John","Brooks","us",25,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Justin","Mobius","de",26,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Maximilian","Arnold","de",27,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcel","Tisserand","cd",29,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robin","Knoche","de",31,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gian-Luca","Itter","de",35,"DF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Phillip","Menzel","de",36,"GK","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Elvis","Rexhbecaj","de",37,"MF","../static/images/players/bundesliga/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Paul","Jaeckel","de",39,"DF","../static/images/players/bundesliga/unknown_portrait.png");
/* Premier */
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Artur","Boruc","pl",1,"GK","../static/images/players/premier/arturboruc.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Simon","Francis","gb",2,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Steve","Cook","gb",3,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Gosling","gb",4,"MF","../static/images/players/premier/danielgosling.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nathan","Ake","ne",5,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andrew","Surman","gb",6,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marc","Pugh","gb",7,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Harry","Arter","ir",8,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Charlie","Daniels","gb",11,"DF","../static/images/players/premier/charliedaniels.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Callum","Wilson","gb",13,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bradley","Smith","au",14,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adam","Smith","gb",15,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joshua","King","no",17,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jermain","Defoe","gb",18,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Felix","Stanislas","gb",19,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ryan","Allsop","gb",22,"GK","../static/images/players/premier/ryanallsop.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ryan","Fraser","gb",24,"MF","../static/images/players/premier/ryanfraser.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tyrone","Mings","gb",26,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Asmir","Begovic","bo",27,"GK","../static/images/players/premier/asmirbegovic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adam","Federici","au",32,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordon","Ibe","gb",33,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Per","Mertesacker","de",4,"DF","../static/images/players/premier/permertesacker.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Laurent","Koscielny","fr",6,"DF","../static/images/players/premier/laurentkoscielny.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Henrikh","Mkhitaryan","am",7,"MF","../static/images/players/premier/henrikhmkhitaryan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aaron","Ramsey","gb",8,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexandre","Lacazette","fr",9,"FW","../static/images/players/premier/alexandrelacazette.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jack","Wilshere","gb",10,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mesut","Ozil","de",11,"MF","../static/images/players/premier/mesutozil.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Ospina","co",13,"GK","../static/images/players/premier/davidospina.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pierre-Emerick","Aubameyang","ga",14,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robert","Holding","gb",16,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ignacio","Monreal","es",18,"DF","../static/images/players/premier/ignaciomonreal.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Santiago","Cazorla","es",19,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Shkodran","Mustafi","de",20,"DF","../static/images/players/premier/shkodranmustafi.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Calum","Chambers","gb",21,"DF","../static/images/players/premier/calumchambers.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Petr","Cech","cz",22,"GK","../static/images/players/premier/petrcech.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Welbeck","gb",23,"FW","../static/images/players/premier/danielwelbeck.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Hector","Bellerin","gb",24,"DF","../static/images/players/premier/hectorbellerin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Granit","Xhaka","ch",29,"MF","../static/images/players/premier/granitxhaka.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sead","Kolasinac","bo",31,"DF","../static/images/players/premier/seadkolasinac.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mohamed","Elneny","eg",35,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Deyan","Iliev","ma",50,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matthew","Macey","gb",54,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matthew","Ryan","au",1,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bruno","Saltor Grau","br",2,"DF","../static/images/players/premier/brunosaltorgrau.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Bong","cm",3,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Uwe","Hunemeier","de",4,"DF","../static/images/players/premier/uwehunemeier.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lewis","Dunk","gb",5,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dale","Stephens","gb",6,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Beram","Kayal","il",7,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jiri","Skalak","cz",8,"MF","../static/images/players/premier/jiriskalak.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Samuel","Baldock","gb",9,"FW","../static/images/players/premier/samuelbaldock.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tomer","Hemed","il",10,"FW","../static/images/players/premier/tomerhemed.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Anthony","Knockaert","fr",11,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Niki","Maenpaa","fi",12,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pascal","Gross","de",13,"MF","../static/images/players/premier/pascalgross.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jurgen","Locadia","ne",15,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jose","Ulloa Fernandez","ar",16,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Glenn","Murray","gb",17,"FW","../static/images/players/premier/glennmurray.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Connor","Goldson","gb",18,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jose","Izquierdo Mena","co",19,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("SolomanGlenn","March","gb",20,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ezequiel","Schelotto","ar",21,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Shane","Duffy","gb",22,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Liam","Rosenior","gb",23,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Propper","ne",24,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Timothy","Krul","ne",26,"GK","../static/images/players/premier/timothykrul.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Markus","Suttner","au",29,"DF","../static/images/players/premier/markussuttner.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Heaton","gb",1,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matthew","Lowton","gb",2,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Charles","Taylor","gb",3,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jack Frank","Cork","gb",4,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","Tarkowski","gb",5,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Benjamin","Mee","gb",6,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Georges-Kevin","Nkoudou Mbida","fr",7,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dean","Marney","gb",8,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Samuel","Vokes","gb",9,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ashley","Barnes","gb",10,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Wood","nz",11,"FW","../static/images/players/premier/chriswood.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jeffrey","Hendrick","gb",13,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Johann","Gudmundsson","is",17,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ashley","Westwood","gb",18,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","Walters","gb",19,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nahki","Wells","br",21,"FW","../static/images/players/premier/nahkiwells.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Anders","Lindegaard","ne",22,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stephen","Ward","ir",23,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fredrik","Ulvestad","no",24,"MF","../static/images/players/premier/fredrikulvestad.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aaron","Lennon","gb",25,"MF","../static/images/players/premier/aaronlennon.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Phillip","Bardsley","gb",26,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Long","gb",28,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nicholas","Pope","gb",29,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adam","Legzdins","gb",30,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Scott","Arfield","gb",37,"MF","../static/images/players/premier/scottarfield.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wilfredo","Caballero Lazcano","ar",1,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Antonio","Rudiger","de",2,"DF","../static/images/players/premier/antoniorudiger.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marcos","Alonso Mendoza","es",3,"DF","../static/images/players/premier/marcosalonsomendoza.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Francesc","Fabregas Soler","es",4,"MF","../static/images/players/premier/francescfabregassoler.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Drinkwater","gb",6,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ngolo","Kante","fr",7,"MF","../static/images/players/premier/ngolokante.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ross","Barkley","gb",8,"MF","../static/images/players/premier/rossbarkley.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alvaro Borja","Morata Martin","es",9,"FW","../static/images/players/premier/alvaroborjamoratamartin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eden","Hazard","be",10,"MF","../static/images/players/premier/edenhazard.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pedro Eliezer","Rodriguez Ledesma","es",11,"FW","../static/images/players/premier/pedroeliezerrodriguezledesma.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thibaut","Courtois","be",12,"GK","../static/images/players/premier/thibautcourtois.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Tiemoue","Bakayoko","fr",14,"MF","../static/images/players/premier/tiemouebakayoko.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Victor","Moses","gb",15,"MF","../static/images/players/premier/victormoses.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Olivier","Giroud","fr",18,"FW","../static/images/players/premier/oliviergiroud.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Davide","Zappacosta","it",21,"DF","../static/images/players/premier/davidezappacosta.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Willian","Borges Da Silva","br",22,"MF","../static/images/players/premier/willianborgesdasilva.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gary","Cahill","gb",24,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cesar","Azpilicueta Tanco","es",28,"DF","../static/images/players/premier/cesarazpilicuetatanco.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Luiz Moreira Marinho","br",30,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Emerson","Palmieri Dos Santos","br",33,"DF","../static/images/players/premier/emersonpalmieridossantos.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eduardo","Dos Reis Carvalho","pt",37,"GK","../static/images/players/premier/eduardodosreiscarvalho.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Julian","Speroni","ar",1,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joel","Ward","gb",2,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Patrick","Van Aanholt","ne",3,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luka","Milivojevic","rs",4,"MF","../static/images/players/premier/lukamilivojevic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","Tomkins","gb",5,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Scott","Dann","gb",6,"DF","../static/images/players/premier/scottdann.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yohan","Cabaye","fr",7,"MF","../static/images/players/premier/yohancabaye.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Sorloth","no",9,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andros","Townsend","gb",10,"MF","../static/images/players/premier/androstownsend.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dazet","Zaha","gb",11,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mamadou","Sakho","fr",12,"DF","../static/images/players/premier/mamadousakho.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wayne","Hennessey","gb",13,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chung","Lee","sk",14,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jeffrey","Schlupp","de",15,"DF","../static/images/players/premier/jeffreyschlupp.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","McArthur","gb",18,"MF","../static/images/players/premier/jamesmcarthur.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Benteke","be",19,"FW","../static/images/players/premier/christianbenteke.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Connor","Wickham","gb",21,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pape","Souare","se",23,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bakary","Sako","fr",26,"MF","../static/images/players/premier/bakarysako.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Damien","Delaney","ir",27,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jaroslaw","Jach","pl",33,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Martin","Kelly","gb",34,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jason","Puncheon","gb",42,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordon","Mutch","gb",77,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordan","Pickford","gb",1,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Morgan","Schneiderlin","fr",2,"MF","../static/images/players/premier/morganschneiderlin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Leighton","Baines","gb",3,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Keane","gb",4,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Philip","Jagielka","gb",6,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ashley","Williams","gb",6,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yannick","Bolasie","gb",7,"FW","../static/images/players/premier/yannickbolasie.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wayne","Rooney","gb",10,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Theo","Walcott","gb",11,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eliaquim","Mangala","fr",13,"DF","../static/images/players/premier/eliaquimmangala.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cenk","Tosun","tr",14,"FW","../static/images/players/premier/cenktosun.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aurelio","Martina","ne",15,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","McCarthy","gb",16,"MF","../static/images/players/premier/jamesmccarthy.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Idrissa","Gueye","se",17,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gylfi","Sigurdsson","gb",18,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Baye","Niasse","se",19,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Davy","Klaassen","ne",20,"DF","../static/images/players/premier/davyklaassen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Maarten","Stekelenburg","ne",22,"GK","../static/images/players/premier/maartenstekelenburg.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Seamus","Coleman","gb",23,"DF","../static/images/players/premier/seamuscoleman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jose","Funes Mori","ar",25,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joel","Robles Blazquez","es",33,"GK","../static/images/players/premier/joelroblesblazquez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luke","Garbutt","gb",36,"DF","../static/images/players/premier/lukegarbutt.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonas","Lossl","ne",1,"GK","../static/images/players/premier/jonaslossl.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Smith","gb",2,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Scott","Malone","gb",3,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dean","Whitehead","gb",4,"MF","../static/images/players/premier/deanwhitehead.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Terence","Kongolo","nl",5,"DF","../static/images/players/premier/terencekongolo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","Hogg","gb",6,"MF","../static/images/players/premier/jonathanhogg.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sean","Scannell","gb",7,"MF","../static/images/players/premier/seanscannell.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Elias","Kachunga","de",9,"FW","../static/images/players/premier/eliaskachunga.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aaron","Mooy","gb",10,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joel","Coleman","gb",13,"GK","../static/images/players/premier/joelcoleman.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chris","Lowe","de",15,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rajiv","Van La Parra","ne",17,"MF","../static/images/players/premier/rajivvanlaparra.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Williams","de",19,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Laurent","Depoitre","be",20,"FW","../static/images/players/premier/laurentdepoitre.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alex","Pritchard","gb",21,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Ince","gb",22,"MF","../static/images/players/premier/thomasince.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Collin","Quaner","de",23,"FW","../static/images/players/premier/collinquaner.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Steve","Mounie","fr",24,"FW","../static/images/players/premier/stevemounie.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mathias","Jorgensen","ne",25,"DF","../static/images/players/premier/mathiasjorgensen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christopher","Schindler","de",26,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robert","Green","gb",28,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florent","Hadergjonaj","ch",33,"DF","../static/images/players/premier/florenthadergjonaj.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Hefele","de",44,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kasper","Schmeichel","gb",1,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Simpson","gb",2,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Westley","Morgan","gb",5,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robert","Huth","de",6,"DF","../static/images/players/premier/roberthuth.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jamie","Vardy","gb",9,"FW","../static/images/players/premier/jamievardy.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marc","Albrighton","gb",11,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Benjamin","Hamer","gb",12,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adrien","Silva","fr",14,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Harry","Maguire","gb",15,"DF","../static/images/players/premier/harrymaguire.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aleksandar","Dragovic","au",16,"DF","../static/images/players/premier/aleksandardragovic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eldin","Jakupovic","bo",17,"GK","../static/images/players/premier/eldinjakupovic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Amartey","gh",18,"DF","../static/images/players/premier/danielamartey.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Shinji","Okazaki","jp",20,"FW","../static/images/players/premier/shinjiokazaki.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vicente","Iborra","es",21,"MF","../static/images/players/premier/vicenteiborra.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matthew","James","gb",22,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Riyad","Mahrez","al",26,"MF","../static/images/players/premier/riyadmahrez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Fuchs","as",28,"DF","../static/images/players/premier/christianfuchs.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Yohan","Benalouane","fr",29,"DF","../static/images/players/premier/yohanbenalouane.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fousseni","Diabate","fr",33,"FW","../static/images/players/premier/foussenidiabate.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Loris","Karius","de",1,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nathaniel","Clyne","gb",2,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Virgil","Van Dijk","ne",4,"DF","../static/images/players/premier/virgilvandijk.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Georginio","Wijnaldum","ne",5,"MF","../static/images/players/premier/georginiowijnaldum.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dejan","Lovren","cr",6,"DF","../static/images/players/premier/dejanlovren.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","Milner","gb",7,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Roberto","Barbosa De Oliveira","br",9,"FW","../static/images/players/premier/robertobarbosadeoliveira.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mohamed","Salah","eg",11,"FW","../static/images/players/premier/mohamedsalah.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordan","Henderson","gb",14,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ragnar","Klavan","ee",17,"DF","../static/images/players/premier/ragnarklavan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alberto","Moreno Perez","es",18,"DF","../static/images/players/premier/albertomorenoperez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sadio","Mane","se",19,"FW","../static/images/players/premier/sadiomane.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adam","Lallana","gb",20,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexander","Oxlade-Chamberlain","gb",21,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Simon","Mignolet","be",22,"GK","../static/images/players/premier/simonmignolet.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Emre","Can","de",23,"MF","../static/images/players/premier/emrecan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andrew","Robertson","gb",26,"DF","../static/images/players/premier/andrewrobertson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Ings","gb",28,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Job Joel","Matip","de",32,"DF","../static/images/players/premier/jobjoelmatip.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adam","Bogdan","hu",34,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Ward","gb",52,"GK","../static/images/players/premier/danielward.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Claudio","Bravo Munoz","ch",1,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kyle","Walker","gb",2,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Danilo","Da Silva","br",3,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vincent","Kompany","be",4,"DF","../static/images/players/premier/vincentkompany.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("John","Stones","gb",5,"DF","../static/images/players/premier/johnstones.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Raheem","Sterling","gb",7,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ilkay","Gundogan","de",8,"MF","../static/images/players/premier/ilkaygundogan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sergio","Aguero Del Castillo","ar",10,"FW","../static/images/players/premier/sergioaguerodelcastillo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aymeric","Laporte","fr",14,"DF","../static/images/players/premier/aymericlaporte.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","De Bruyne","be",17,"MF","../static/images/players/premier/kevindebruyne.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fabian","Delph","gb",18,"MF","../static/images/players/premier/fabiandelph.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bernardo","Mota Veiga de Carvalho E Silva","pt",20,"MF","../static/images/players/premier/bernardomotaveigadecarvalhoesilva.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","Jimenez Silva","es",21,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Benjamin","Mendy","fr",22,"DF","../static/images/players/premier/benjaminmendy.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fernando","Luiz Roza","br",25,"MF","../static/images/players/premier/fernandoluizroza.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nicolas","Otamendi","ar",30,"DF","../static/images/players/premier/nicolasotamendi.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ederson","Santana de Moraes","br",31,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gnegneri","Toure","ci ",42,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("David","De Gea Quintana","es",1,"GK","../static/images/players/premier/daviddegeaquintana.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Samuel","Johnstone","gb",2,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Victor","Lindelof","ch",2,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eric","Bailly","ci ",3,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Philip","Jones","gb",4,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Faustino","Rojo","ar",5,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Paul","Pogba","gb",6,"MF","../static/images/players/premier/paulpogba.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alexis","Sanchez","ch",7,"FW","../static/images/players/premier/alexissanchez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Juan","Mata Garcia","es",8,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Romelu","Lukaku","be",9,"FW","../static/images/players/premier/romelulukaku.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Zlatan","Ibrahimovic","se",10,"FW","../static/images/players/premier/zlatanibrahimovic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Anthony","Martial","fr",11,"FW","../static/images/players/premier/anthonymartial.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christopher","Smalling","gb",12,"DF","../static/images/players/premier/christophersmalling.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jesse","Lingard","gb",14,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michael","Carrick","gb",16,"MF","../static/images/players/premier/michaelcarrick.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daley","Blind","ne",17,"DF","../static/images/players/premier/daleyblind.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ashley","Young","gb",18,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sergio","Romero","ar",20,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ander","Herrera Aguera","es",21,"MF","../static/images/players/premier/anderherreraaguera.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luke","Shaw","gb",23,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luis","Valencia Mosquera","ec",25,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marouane","Fellaini-Bakkioui","be",27,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nemanja","Matic","rs",31,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matteo","Darmian","it",36,"MF","../static/images/players/premier/matteodarmian.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Robert","Elliot","gb",1,"GK","../static/images/players/premier/robertelliot.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ciaran","Clark","gb",2,"DF","../static/images/players/premier/ciaranclark.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Paul","Dummett","gb",3,"DF","../static/images/players/premier/pauldummett.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Curtis","Good","au",5,"DF","../static/images/players/premier/curtisgood.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jamaal","Lascelles","gb",6,"DF","../static/images/players/premier/jamaallascelles.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jacob","Murphy","gb",7,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonjo","Shelvey","gb",8,"MF","../static/images/players/premier/jonjoshelvey.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dwight","Gayle","gb",9,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matthew","Ritchie","gb",11,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Martin","Dubravka","rs",12,"GK","../static/images/players/premier/martindubravka.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Macauley","Gillesphey","gb",12,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Islam","Slimani","al",13,"FW","../static/images/players/premier/islamslimani.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mohamed","Diame","es",14,"MF","../static/images/players/premier/mohameddiame.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Isaac","Hayden","gb",14,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ayoze","Gutierrez","es",17,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Chancel","Mbemba","co",18,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Javier","Manquillo Gaitan","es",19,"DF","../static/images/players/premier/javiermanquillogaitan.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florian","Lejeune","fr",20,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jose","Mato Sanmartin","es",21,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Deandre","Yedlin","us",22,"DF","../static/images/players/premier/deandreyedlin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Massadio","Haidara","fr",25,"DF","../static/images/players/premier/massadiohaidara.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Karl","Darlow","gb",26,"GK","../static/images/players/premier/karldarlow.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jesus","Gamez","es",27,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Twasam","gh",30,"MF","../static/images/players/premier/christiantwasam.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jack","Rose","gb",1,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cedric","Alves Soares","de",2,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Maya","Yoshida","jp",3,"DF","../static/images/players/premier/mayayoshida.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Florin","Gardos","ro",4,"DF","../static/images/players/premier/floringardos.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jack","Stephens","gb",5,"DF","../static/images/players/premier/jackstephens.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wesley","Hoedt","ne",6,"DF","../static/images/players/premier/wesleyhoedt.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Shane","Long","gb",7,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Steven","Davis","gb",8,"MF","../static/images/players/premier/stevendavis.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Guido","Carrillo","ar",9,"FW","../static/images/players/premier/guidocarrillo.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Charlie","Austin","gb",10,"FW","../static/images/players/premier/charlieaustin.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Dusan","Tadic","rs",11,"MF","../static/images/players/premier/dusantadic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alex","McCarthy","gb",13,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Oriol","Vidal","es",14,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","Ward-Prowse","gb",16,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mario","Lemina","ga",18,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sofiane","Boufal","mo",19,"MF","../static/images/players/premier/sofianeboufal.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Manolo","Gabbiadini","it",20,"FW","../static/images/players/premier/manologabbiadini.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ryan","Bertrand","gb",21,"DF","../static/images/players/premier/ryanbertrand.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nathan","Redmond","gb",22,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pierre","Hojbjerg","ne",23,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jeremy","Pied","fr",26,"MF","../static/images/players/premier/jeremypied.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stuart","Taylor","gb",28,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Samuel","McQueen","gb",38,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fraser","Forster","gb",44,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jack","Butland","gb",1,"GK","../static/images/players/premier/jackbutland.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Moritz","Bauer","au",2,"DF","../static/images/players/premier/moritzbauer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Erik","Pieters","ne",3,"DF","../static/images/players/premier/erikpieters.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joseph","Allen","gb",4,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kevin","Wimmer","au",5,"DF","../static/images/players/premier/kevinwimmer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kurt","Zouma","fr",6,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stephen","Ireland","gb",7,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Glen","Johnson","gb",8,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Saido","Berahino","gb",9,"FW","../static/images/players/premier/saidoberahino.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eric","Choupo-Moting","cm",10,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jese","Rodriguez Ruiz","es",11,"FW","../static/images/players/premier/jeserodriguezruiz.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ibrahim","Afellay","ne",14,"MF","../static/images/players/premier/ibrahimafellay.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Rolando","Martins Indi","ne",15,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Charles","Adam","gb",16,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ryan","Shawcross","gb",17,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mame","Diouf","se",18,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Geoff","Cameron","us",20,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Konstantinos","Stafylidis","gr",21,"DF","../static/images/players/premier/konstantinosstafylidis.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Xherdan","Shaqiri","al",23,"MF","../static/images/players/premier/xherdanshaqiri.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Darren","Fletcher","gb",24,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Peter","Crouch","gb",25,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Papa","Ndiaye","se",27,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jakob","Haugaard","ne",29,"GK","../static/images/players/premier/jakobhaugaard.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lee","Grant","gb",33,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lukasz","Fabianski","pl",1,"GK","../static/images/players/premier/lukaszfabianski.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wilfried","Bony","ci ",2,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sung","Ki","kr",4,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mike","Van Der Hoorn","ne",5,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Alfie","Mawson","gb",6,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Leon","Britton","gb",7,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Leroy","Fer","ne",8,"MF","../static/images/players/premier/leroyfer.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Luciano","Narsingh","ne",11,"MF","../static/images/players/premier/lucianonarsingh.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nathan","Dyer","gb",12,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Bo","Nordfeldt","se",13,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Carroll","gb",14,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Wayne","Routledge","gb",15,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Martin","Olsson","gb",16,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Samuel","Clucas","gb",17,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordan","Ayew","gh",18,"FW","../static/images/players/premier/jordanayew.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andre","Ayew","gh",19,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Angel","Zaragoza","es",22,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andrew","King","gb",24,"MF","../static/images/players/premier/andrewking.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Erwin","Mulder","ne",25,"GK","../static/images/players/premier/erwinmulder.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kyle","Naughton","gb",26,"DF","../static/images/players/premier/kylenaughton.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kyle","Bartley","gb",27,"DF","../static/images/players/premier/kylebartley.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Federico","Fernandez","ar",33,"DF","../static/images/players/premier/federicofernandez.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gregor","Zabret","gb",45,"GK","../static/images/players/premier/gregorzabret.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Connor","Roberts","gb",52,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Courtney","Baker-Richardson","gb",58,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Hugo","Lloris","fr",1,"GK","../static/images/players/premier/hugolloris.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kieran","Trippier","gb",2,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Rose","gb",3,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Toby","Alderweireld","be",4,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jan","Vertonghen","be",5,"DF","../static/images/players/premier/janvertonghen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Son","Heung-Min","sk",7,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Harry","Kane","gb",10,"FW","../static/images/players/premier/harrykane.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Erik","Lamela","ar",11,"MF","../static/images/players/premier/eriklamela.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Victor","Wanyama","ke",12,"MF","../static/images/players/premier/victorwanyama.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michel","Vorm","ne",13,"GK","../static/images/players/premier/michelvorm.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Georges-Kevin","Nkoudou Mbida","fr",14,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Eric","Dier","gb",15,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Moussa","Sissoko","fr",17,"MF","../static/images/players/premier/moussasissoko.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Fernando","Llorente Torres","es",18,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mousa","Dembele","be",19,"MF","../static/images/players/premier/mousadembele.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Paulo","Gazzaniga","ar",22,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Eriksen","ne",23,"MF","../static/images/players/premier/christianeriksen.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Serge","Aurier","fr",24,"DF","../static/images/players/premier/sergeaurier.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Vincent","Janssen","ne",24,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Lucas","Rodrigues Moura da Silva","br",27,"MF","../static/images/players/premier/lucasrodriguesmouradasilva.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Benjamin","Davies","gb",33,"DF","../static/images/players/premier/benjamindavies.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Heurelho","Gomes","br",1,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daryl","Janmaat","ne",2,"DF","../static/images/players/premier/daryljanmaat.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Miguel","Britos Cabrera","uy",3,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Younes","Kaboul","fr",4,"DF","../static/images/players/premier/youneskaboul.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Sebastian","Prodl","at",5,"DF","../static/images/players/premier/sebastianprodl.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adrian","Mariappa","gb",6,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gerard","Deulofeu","es",7,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Cleverley","gb",8,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Troy","Deeney","gb",9,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Didier","Ndong","ga",12,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nathaniel","Chalobah","gb",14,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Craig","Cathcart","gb",15,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Abdoulaye","Doucoure","fr",16,"MF","../static/images/players/premier/abdoulayedoucoure.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andre","Gray","gb",18,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("William","Hughes","gb",19,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Francisco","Femenia Far","es",21,"DF","../static/images/players/premier/franciscofemeniafar.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marvin","Zeegelaar","ne",22,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jose","Holebas","de",25,"DF","../static/images/players/premier/joseholebas.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christian","Kabasele","co",27,"DF","../static/images/players/premier/christiankabasele.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andre","Carrillo Diaz","pe",28,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Etienne","Capoue","fr",29,"MF","../static/images/players/premier/etiennecapoue.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Orestis-Spyridon","Karnezis","gr",30,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Stefano","Okaka","it",33,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Bachmann","gb",35,"GK","../static/images/players/premier/danielbachmann.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Roberto","Pereyra","ar",37,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ben","Foster","gb",1,"GK","../static/images/players/premier/benfoster.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Allan","Nyom","fr",2,"DF","../static/images/players/premier/allannyom.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Kieran","Gibbs","gb",3,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Thomas","Robson-Kanu","gb",4,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Claudio","Yacob","ar",5,"MF","../static/images/players/premier/claudioyacob.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jonathan","Evans","gb",6,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","Morrison","gb",7,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jake","Livermore","gb",8,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jose","Rondon","ve",9,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Matthew","Phillips","gb",10,"MF","../static/images/players/premier/matthewphillips.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Christopher","Brunt","gb",11,"MF","../static/images/players/premier/christopherbrunt.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Glyn","Myhill","gb",13,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","McClean","gb",14,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Daniel","Sturridge","gb",15,"FW","../static/images/players/premier/danielsturridge.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aly","Gabr","eg",16,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gareth","Barry","gb",18,"MF","../static/images/players/premier/garethbarry.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jay","Rodriguez","gb",19,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Grzegorz","Krychowiak","pl",20,"MF","../static/images/players/premier/grzegorzkrychowiak.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Nacer","Chadli","be",22,"MF","../static/images/players/premier/nacerchadli.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Gareth","McAuley","gb",23,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Craig","Dawson","gb",25,"DF","../static/images/players/premier/craigdawson.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Ahmed","Hegazy","eg",26,"DF","../static/images/players/premier/ahmedhegazy.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Winston","Reid","nz",2,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Aaron","Cresswell","gb",3,"DF","../static/images/players/premier/aaroncresswell.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jose","Fonte","pt",4,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pablo","Zabaleta Girod","ar",5,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Marko","Arnautovic","au",7,"MF","../static/images/players/premier/markoarnautovic.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Cheikhou","Kouyate","sn",8,"MF","../static/images/players/premier/cheikhoukouyate.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Andrew","Carroll","gb",9,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Manuel","Lanzini","ar",10,"MF","../static/images/players/premier/manuellanzini.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Jordan","Hugill","gb",12,"FW","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Adrian","San Miguel Del Castillo","es",13,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Pedro","Obiang Avomo","es",14,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Mark","Noble","gb",16,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Javier","Hernandez Balcazar","mx",17,"FW","../static/images/players/premier/javierhernandezbalcazar.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Joao","Mario","pt",18,"MF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("James","Collins","gb",19,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Angelo","Ogbonna","it",21,"DF","../static/images/players/premier/angeloogbonna.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Samuel","Byram","gb",22,"DF","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Charles","Hart","gb",25,"GK","../static/images/players/premier/unknown_portrait.png");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Arthur","Masuaku Kawela","fr",26,"DF","../static/images/players/premier/arthurmasuakukawela.jpg");
INSERT INTO players (firstName,lastName,nationality,number,position,photoPath)
VALUES("Michail","Antonio","gb",30,"MF","../static/images/players/premier/unknown_portrait.png");


/* Teams */
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Atlanta United FC",2014,1,1,"../static/images/teams/MLS/atlantaunitedfc.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Chicago Fire",1997,1,2,"../static/images/teams/MLS/chicagofire.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Columbus Crew SC",1994,1,3,"../static/images/teams/MLS/columbuscrewsc.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("DC United",1994,1,4,"../static/images/teams/MLS/dcunited.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Montreal Impact",2010,1,5,"../static/images/teams/MLS/montrealimpact.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("New England Revolution",1994,1,6,"../static/images/teams/MLS/newenglandrevolution.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("New York City FC",2013,1,7,"../static/images/teams/MLS/newyorkcityfc.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("New York Red Bulls",1994,1,8,"../static/images/teams/MLS/newyorkredbulls.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Orlando City SC",2013,1,9,"../static/images/teams/MLS/orlandocitysc.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Philadelphia Union",2008,1,10,"../static/images/teams/MLS/philadelphiaunion.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Toronto FC",2005,1,11,"../static/images/teams/MLS/torontofc.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Colorado Rapids",1995,1,12,"../static/images/teams/MLS/coloradorapids.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("FC Dallas",1995,1,13,"../static/images/teams/MLS/fcdallas.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Houston Dynamo",2005,1,14,"../static/images/teams/MLS/houstondynamo.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("LA Galaxy",1994,1,15,"../static/images/teams/MLS/lagalaxy.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Los Angeles FC",2014,1,16,"../static/images/teams/MLS/losangelesfc.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Minnesota United FC",2015,1,17,"../static/images/teams/MLS/minnesotaunitedfc.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Portland Timbers",2009,1,18,"../static/images/teams/MLS/portlandtimbers.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Real Salt Lake",2004,1,19,"../static/images/teams/MLS/realsaltlake.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("San Jose Earthquakes",1994,1,20,"../static/images/teams/MLS/sanjoseearthquakes.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Seattle Sounders FC",2007,1,21,"../static/images/teams/MLS/seattlesoundersfc.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Sporting Kansas City",1995,1,22,"../static/images/teams/MLS/sportingkansascity.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Vancouver Whitecaps FC",2009,1,23,"../static/images/teams/MLS/vancouverwhitecapsfc.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("FC Augsburg",1907,2,24,"../static/images/teams/bundesliga/fcaugsburg.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Bayer Leverkusen",1904,2,25,"../static/images/teams/bundesliga/bayerleverkusen.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Bayern Munich",1900,2,26,"../static/images/teams/bundesliga/bayernmunich.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Borussia Dortmund",1909,2,27,"../static/images/teams/bundesliga/borussiadortmund.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Borussia Monchengladbach",1900,2,28,"../static/images/teams/bundesliga/borussiamonchengladbach.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Darmstadt 98",1898,2,29,"No Photo Found");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Eintracht Frankfurt",1899,2,30,"../static/images/teams/bundesliga/eintrachtfrankfurt.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("SC Freiburg",1904,2,31,"../static/images/teams/bundesliga/scfreiburg.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Hamburger SV",1887,2,32,"../static/images/teams/bundesliga/hamburgersv.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Hertha BSC",1892,2,33,"../static/images/teams/bundesliga/herthabsc.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("1899 Hoffenheim",1899,2,34,"../static/images/teams/bundesliga/1899hoffenheim.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("FC Ingolstadt",2004,2,35,"No Photo Found");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("FC Koln",1948,2,36,"../static/images/teams/bundesliga/fckoln.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("RB Leipzig",2009,2,37,"../static/images/teams/bundesliga/rbleipzig.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Mainz 05",1905,2,38,"../static/images/teams/bundesliga/mainz05.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Schalke 04",1904,2,39,"../static/images/teams/bundesliga/schalke04.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Werder Bremen",1899,2,40,"../static/images/teams/bundesliga/werderbremen.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("VfL Wolfsburg",1945,2,41,"../static/images/teams/bundesliga/vflwolfsburg.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Arsenal",1886,3,42,"../static/images/teams/premier/arsenal.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Bournemouth",1899,3,43,"../static/images/teams/premier/bournemouth.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Brighton & Hove Albion",1901,3,44,"../static/images/teams/premier/brighton&hovealbion.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Burnley",1882,3,45,"../static/images/teams/premier/burnley.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Chelsea",1905,3,46,"../static/images/teams/premier/chelsea.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Crystal Palace",1905,3,47,"../static/images/teams/premier/crystalpalace.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Everton",1878,3,48,"../static/images/teams/premier/everton.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Huddersfield Town",1908,3,49,"../static/images/teams/premier/huddersfieldtown.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Leicester City",1884,3,50,"../static/images/teams/premier/leicestercity.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Liverpool",1892,3,51,"../static/images/teams/premier/liverpool.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Manchester City",1880,3,52,"../static/images/teams/premier/manchestercity.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Manchester United",1878,3,53,"../static/images/teams/premier/manchesterunited.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Newcastle United",1892,3,54,"../static/images/teams/premier/newcastleunited.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Southampton",1885,3,55,"../static/images/teams/premier/southampton.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Stoke City",1863,3,56,"../static/images/teams/premier/stokecity.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Swansea City",1912,3,57,"../static/images/teams/premier/swanseacity.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Tottenham Hotspur",1882,3,58,"../static/images/teams/premier/tottenhamhotspur.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("Watford",1881,3,59,"../static/images/teams/premier/watford.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("West Bromwich Albion",1878,3,60,"../static/images/teams/premier/westbromwichalbion.png");
INSERT INTO teams (name,yearFounded,playsInLeague,homeStadium,photoPath)
VALUES("West Ham United",1895,3,61,"../static/images/teams/premier/westhamunited.png");

/* contracts */
INSERT INTO contract (player_ID,value,teamID)
VALUES(1,1207600,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(2,603800,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(3,845320,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(4,966080,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(5,2717100,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(6,2113300,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(7,6038000,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(8,9660800,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(9,543420,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(10,9660800,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(11,150950,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(12,483040,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(13,724560,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(14,4226600,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(15,603800,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(16,483040,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(17,241520,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(18,181140,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(19,60380,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(20,211330,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(21,60380,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(22,966080,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(23,543420,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(24,60380,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(25,362280,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(26,90570,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(27,60380,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(28,241520,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(29,603800,1);
INSERT INTO contract (player_ID,value,teamID)
VALUES(30,966080,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(31,905700,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(32,905700,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(33,332090,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(34,2113300,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(35,1811400,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(36,966080,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(37,1207600,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(38,845320,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(39,150950,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(40,543420,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(41,60380,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(42,603800,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(43,60380,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(44,543420,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(45,60380,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(46,211330,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(47,181140,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(48,120760,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(49,5434200,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(50,301900,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(51,150950,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(52,241520,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(53,90570,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(54,90570,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(55,3622800,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(56,181140,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(57,241520,2);
INSERT INTO contract (player_ID,value,teamID)
VALUES(58,483040,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(59,784940,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(60,905700,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(61,1207600,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(62,966080,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(63,966080,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(64,3622800,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(65,905700,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(66,1811400,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(67,724560,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(68,603800,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(69,724560,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(70,301900,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(71,422660,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(72,1207600,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(73,362280,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(74,120760,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(75,815130,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(76,301900,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(77,845320,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(78,150950,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(79,483040,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(80,90570,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(81,120760,3);
INSERT INTO contract (player_ID,value,teamID)
VALUES(82,784940,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(83,724560,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(84,241520,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(85,603800,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(86,603800,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(87,694370,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(88,1449120,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(89,422660,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(90,1509500,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(91,966080,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(92,603800,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(93,905700,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(94,1509500,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(95,875510,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(96,784940,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(97,211330,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(98,120760,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(99,3019000,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(100,694370,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(101,603800,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(102,422660,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(103,271710,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(104,211330,4);
INSERT INTO contract (player_ID,value,teamID)
VALUES(105,724560,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(106,603800,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(107,603800,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(108,1086840,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(109,603800,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(110,543420,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(111,724560,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(112,4830400,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(113,2415200,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(114,3019000,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(115,905700,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(116,150950,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(117,483040,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(118,301900,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(119,1207600,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(120,181140,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(121,966080,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(122,905700,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(123,784940,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(124,603800,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(125,120760,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(126,241520,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(127,483040,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(128,NULL,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(129,181140,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(130,362280,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(131,60380,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(132,60380,5);
INSERT INTO contract (player_ID,value,teamID)
VALUES(133,784940,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(134,1026460,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(135,543420,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(136,784940,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(137,60380,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(138,905700,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(139,120760,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(140,905700,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(141,1207600,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(142,845320,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(143,1147220,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(144,60380,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(145,1207600,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(146,150950,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(147,NULL,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(148,1147220,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(149,483040,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(150,905700,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(151,181140,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(152,603800,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(153,1509500,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(154,150950,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(155,241520,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(156,1509500,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(157,241520,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(158,483040,6);
INSERT INTO contract (player_ID,value,teamID)
VALUES(159,1026460,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(160,724560,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(161,2113300,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(162,1207600,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(163,1026460,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(164,966080,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(165,2415200,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(166,966080,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(167,1690640,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(168,3622800,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(169,1207600,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(170,603800,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(171,181140,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(172,1026460,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(173,120760,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(174,241520,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(175,60380,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(176,301900,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(177,724560,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(178,1207600,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(179,120760,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(180,1207600,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(181,1086840,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(182,332090,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(183,181140,7);
INSERT INTO contract (player_ID,value,teamID)
VALUES(184,60380,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(185,966080,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(186,905700,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(187,181140,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(188,543420,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(189,4226600,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(190,966080,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(191,181140,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(192,241520,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(193,966080,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(194,603800,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(195,241520,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(196,301900,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(197,150950,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(198,211330,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(199,966080,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(200,845320,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(201,211330,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(202,1509500,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(203,905700,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(204,241520,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(205,603800,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(206,1811400,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(207,603800,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(208,362280,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(209,1207600,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(210,1509500,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(211,2113300,8);
INSERT INTO contract (player_ID,value,teamID)
VALUES(212,1026460,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(213,1086840,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(214,362280,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(215,905700,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(216,905700,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(217,301900,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(218,905700,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(219,3019000,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(220,301900,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(221,271710,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(222,483040,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(223,2113300,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(224,241520,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(225,2113300,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(226,211330,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(227,1086840,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(228,845320,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(229,784940,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(230,3320900,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(231,905700,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(232,603800,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(233,483040,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(234,724560,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(235,90570,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(236,301900,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(237,211330,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(238,301900,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(239,181140,9);
INSERT INTO contract (player_ID,value,teamID)
VALUES(240,362280,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(241,543420,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(242,784940,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(243,90570,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(244,NULL,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(245,1811400,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(246,3019000,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(247,483040,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(248,694370,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(249,1932160,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(250,2415200,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(251,905700,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(252,603800,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(253,362280,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(254,845320,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(255,2113300,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(256,966080,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(257,241520,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(258,543420,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(259,120760,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(260,301900,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(261,1509500,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(262,211330,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(263,603800,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(264,724560,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(265,211330,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(266,90570,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(267,120760,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(268,543420,10);
INSERT INTO contract (player_ID,value,teamID)
VALUES(269,603800,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(270,966080,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(271,513230,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(272,3622800,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(273,362280,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(274,724560,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(275,2415200,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(276,2415200,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(277,1207600,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(278,9660800,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(279,332090,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(280,543420,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(281,905700,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(282,4830400,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(283,905700,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(284,181140,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(285,60380,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(286,845320,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(287,362280,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(288,845320,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(289,966080,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(290,724560,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(291,211330,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(292,362280,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(293,301900,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(294,120760,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(295,241520,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(296,120760,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(297,724560,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(298,NULL,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(299,603800,11);
INSERT INTO contract (player_ID,value,teamID)
VALUES(300,1207600,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(301,1509500,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(302,905700,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(303,845320,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(304,1811400,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(305,1207600,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(306,966080,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(307,1449120,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(308,2415200,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(309,1811400,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(310,1026460,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(311,362280,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(312,815130,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(313,784940,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(314,845320,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(315,603800,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(316,150950,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(317,573610,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(318,241520,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(319,211330,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(320,905700,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(321,301900,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(322,422660,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(323,966080,12);
INSERT INTO contract (player_ID,value,teamID)
VALUES(324,966080,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(325,90570,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(326,1207600,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(327,966080,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(328,1811400,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(329,966080,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(330,603800,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(331,1207600,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(332,1086840,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(333,966080,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(334,1026460,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(335,301900,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(336,120760,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(337,60380,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(338,120760,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(339,1207600,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(340,1086840,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(341,2113300,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(342,2113300,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(343,90570,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(344,60380,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(345,60380,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(346,724560,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(347,90570,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(348,1509500,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(349,NULL,13);
INSERT INTO contract (player_ID,value,teamID)
VALUES(350,422660,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(351,543420,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(352,724560,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(353,845320,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(354,724560,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(355,422660,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(356,150950,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(357,1026460,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(358,1147220,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(359,845320,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(360,724560,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(361,483040,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(362,150950,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(363,422660,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(364,181140,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(365,996270,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(366,603800,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(367,60380,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(368,905700,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(369,90570,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(370,694370,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(371,483040,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(372,905700,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(373,241520,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(374,60380,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(375,362280,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(376,905700,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(377,724560,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(378,NULL,14);
INSERT INTO contract (player_ID,value,teamID)
VALUES(379,603800,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(380,603800,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(381,603800,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(382,724560,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(383,724560,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(384,603800,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(385,4830400,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(386,7245600,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(387,6038000,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(388,4528500,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(389,2415200,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(390,301900,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(391,724560,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(392,301900,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(393,845320,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(394,845320,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(395,1026460,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(396,90570,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(397,181140,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(398,241520,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(399,905700,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(400,483040,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(401,30190,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(402,543420,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(403,543420,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(404,120760,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(405,1811400,15);
INSERT INTO contract (player_ID,value,teamID)
VALUES(406,483040,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(407,724560,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(408,845320,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(409,905700,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(410,301900,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(411,603800,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(412,NULL,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(413,2415200,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(414,10264600,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(415,332090,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(416,211330,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(417,362280,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(418,60380,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(419,301900,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(420,845320,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(421,301900,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(422,1509500,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(423,241520,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(424,1147220,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(425,90570,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(426,60380,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(427,905700,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(428,181140,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(429,150950,16);
INSERT INTO contract (player_ID,value,teamID)
VALUES(430,90570,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(431,905700,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(432,362280,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(433,905700,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(434,905700,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(435,483040,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(436,543420,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(437,724560,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(438,724560,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(439,845320,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(440,1509500,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(441,694370,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(442,694370,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(443,150950,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(444,211330,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(445,1207600,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(446,60380,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(447,422660,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(448,1026460,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(449,NULL,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(450,120760,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(451,60380,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(452,3019000,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(453,664180,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(454,NULL,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(455,543420,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(456,181140,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(457,483040,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(458,784940,17);
INSERT INTO contract (player_ID,value,teamID)
VALUES(459,603800,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(460,905700,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(461,845320,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(462,483040,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(463,5434200,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(464,2415200,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(465,4830400,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(466,1207600,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(467,483040,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(468,332090,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(469,543420,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(470,483040,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(471,332090,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(472,211330,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(473,966080,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(474,845320,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(475,603800,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(476,543420,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(477,1207600,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(478,181140,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(479,241520,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(480,845320,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(481,60380,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(482,150950,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(483,211330,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(484,1811400,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(485,301900,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(486,NULL,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(487,845320,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(488,2415200,18);
INSERT INTO contract (player_ID,value,teamID)
VALUES(489,120760,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(490,724560,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(491,603800,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(492,543420,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(493,483040,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(494,1509500,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(495,1147220,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(496,724560,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(497,1509500,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(498,1811400,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(499,483040,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(500,301900,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(501,724560,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(502,1086840,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(503,362280,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(504,362280,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(505,966080,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(506,875510,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(507,241520,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(508,60380,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(509,543420,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(510,211330,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(511,543420,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(512,483040,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(513,60380,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(514,60380,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(515,211330,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(516,724560,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(517,60380,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(518,483040,19);
INSERT INTO contract (player_ID,value,teamID)
VALUES(519,301900,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(520,603800,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(521,603800,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(522,1449120,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(523,966080,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(524,966080,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(525,1811400,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(526,3019000,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(527,181140,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(528,483040,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(529,332090,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(530,483040,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(531,120760,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(532,905700,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(533,724560,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(534,1811400,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(535,784940,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(536,724560,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(537,241520,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(538,845320,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(539,452850,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(540,90570,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(541,301900,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(542,181140,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(543,90570,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(544,332090,20);
INSERT INTO contract (player_ID,value,teamID)
VALUES(545,2415200,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(546,905700,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(547,603800,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(548,845320,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(549,1207600,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(550,1509500,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(551,6641800,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(552,1026460,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(553,483040,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(554,422660,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(555,120760,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(556,1056650,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(557,1811400,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(558,875510,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(559,724560,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(560,241520,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(561,724560,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(562,271710,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(563,1207600,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(564,211330,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(565,905700,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(566,784940,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(567,211330,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(568,181140,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(569,211330,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(570,724560,21);
INSERT INTO contract (player_ID,value,teamID)
VALUES(571,181140,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(572,181140,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(573,1207600,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(574,362280,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(575,1207600,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(576,724560,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(577,1207600,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(578,845320,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(579,1449120,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(580,694370,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(581,2113300,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(582,150950,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(583,603800,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(584,724560,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(585,60380,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(586,1086840,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(587,60380,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(588,483040,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(589,603800,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(590,3019000,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(591,1509500,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(592,181140,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(593,120760,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(594,1207600,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(595,120760,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(596,60380,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(597,301900,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(598,1026460,22);
INSERT INTO contract (player_ID,value,teamID)
VALUES(599,332090,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(600,NULL,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(601,664180,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(602,1026460,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(603,966080,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(604,603800,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(605,1086840,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(606,1026460,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(607,845320,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(608,422660,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(609,905700,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(610,603800,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(611,543420,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(612,603800,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(613,905700,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(614,543420,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(615,966080,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(616,211330,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(617,60380,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(618,362280,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(619,1026460,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(620,603800,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(621,120760,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(622,181140,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(623,NULL,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(624,724560,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(625,845320,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(626,3019000,23);
INSERT INTO contract (player_ID,value,teamID)
VALUES(627,500000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(628,1000000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(629,6000000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(630,1250000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(631,2500000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(632,200000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(633,1500000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(634,13000000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(635,350000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(636,750000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(637,200000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(638,2500000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(639,3500000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(640,800000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(641,1000000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(642,200000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(643,100000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(644,200000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(645,8500000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(646,4000000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(647,15000000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(648,750000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(649,4000000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(650,9000000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(651,6000000,24);
INSERT INTO contract (player_ID,value,teamID)
VALUES(652,18000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(653,18000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(654,30000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(655,15000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(656,11000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(657,45000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(658,35000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(659,1000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(660,20000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(661,4000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(662,5000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(663,1500000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(664,18000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(665,10000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(666,4500000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(667,350000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(668,500000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(669,25000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(670,20000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(671,250000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(672,300000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(673,14000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(674,12000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(675,10000000,25);
INSERT INTO contract (player_ID,value,teamID)
VALUES(676,35000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(677,13000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(678,35000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(679,60000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(680,60000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(681,5000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(682,40000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(683,90000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(684,9000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(685,65000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(686,3500000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(687,12000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(688,45000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(689,15000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(690,200000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(691,100000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(692,35000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(693,40000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(694,55000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(695,5000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(696,50000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(697,600000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(698,50000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(699,200000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(700,55000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(701,150000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(702,250000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(703,750000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(704,5000000,26);
INSERT INTO contract (player_ID,value,teamID)
VALUES(705,8000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(706,5000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(707,25000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(708,20000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(709,35000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(710,20000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(711,6000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(712,6000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(713,20000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(714,3500000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(715,18000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(716,20000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(717,18000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(718,45000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(719,13000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(720,22000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(721,4000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(722,10000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(723,7000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(724,30000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(725,2000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(726,200000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(727,12000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(728,1500000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(729,8000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(730,40000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(731,8000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(732,5000000,27);
INSERT INTO contract (player_ID,value,teamID)
VALUES(733,14000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(734,2000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(735,14000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(736,5000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(737,20000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(738,20000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(739,4500000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(740,18000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(741,4000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(742,2500000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(743,2500000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(744,5000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(745,750000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(746,750000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(747,1500000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(748,3000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(749,4500000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(750,1750000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(751,7500000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(752,25000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(753,500000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(754,15000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(755,200000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(756,10000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(757,150000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(758,750000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(759,100000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(760,850000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(761,1000000,28);
INSERT INTO contract (player_ID,value,teamID)
VALUES(762,500000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(763,750000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(764,800000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(765,400000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(766,1000000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(767,400000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(768,900000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(769,300000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(770,500000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(771,650000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(772,300000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(773,900000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(774,750000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(775,700000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(776,400000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(777,450000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(778,150000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(779,450000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(780,100000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(781,150000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(782,900000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(783,500000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(784,100000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(785,700000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(786,400000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(787,100000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(788,100000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(789,8000000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(790,4000000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(791,8500000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(792,1500000,29);
INSERT INTO contract (player_ID,value,teamID)
VALUES(793,1750000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(794,1000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(795,5000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(796,12000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(797,4500000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(798,8000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(799,6000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(800,750000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(801,6500000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(802,6500000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(803,5000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(804,1000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(805,3000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(806,5000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(807,1000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(808,3000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(809,100000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(810,7000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(811,2000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(812,1750000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(813,100000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(814,1500000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(815,100000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(816,100000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(817,250000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(818,200000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(819,8000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(820,1000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(821,50000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(822,6000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(823,1000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(824,3000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(825,12000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(826,2000000,30);
INSERT INTO contract (player_ID,value,teamID)
VALUES(827,2000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(828,4500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(829,2000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(830,1500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(831,3000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(832,700000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(833,5000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(834,3750000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(835,1000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(836,7500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(837,5000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(838,4000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(839,200000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(840,1000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(841,500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(842,500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(843,4000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(844,1000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(845,3500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(846,500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(847,4500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(848,300000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(849,3000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(850,500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(851,1250000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(852,500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(853,100000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(854,600000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(855,1500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(856,2500000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(857,3000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(858,1000000,31);
INSERT INTO contract (player_ID,value,teamID)
VALUES(859,5000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(860,3000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(861,3000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(862,7000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(863,3000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(864,4500000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(865,2000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(866,1500000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(867,1500000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(868,750000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(869,8000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(870,500000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(871,500000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(872,3000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(873,250000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(874,500000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(875,2000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(876,100000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(877,3500000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(878,4000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(879,500000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(880,100000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(881,250000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(882,250000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(883,100000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(884,7500000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(885,1000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(886,200000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(887,200000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(888,1000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(889,1750000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(890,4000000,32);
INSERT INTO contract (player_ID,value,teamID)
VALUES(891,10000000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(892,15000000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(893,8000000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(894,2500000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(895,3500000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(896,3000000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(897,4000000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(898,1000000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(899,1500000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(900,200000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(901,2500000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(902,7500000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(903,12000000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(904,2500000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(905,12000000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(906,4000000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(907,7500000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(908,8000000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(909,2500000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(910,150000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(911,150000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(912,200000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(913,150000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(914,25000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(915,8000000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(916,8500000,33);
INSERT INTO contract (player_ID,value,teamID)
VALUES(917,2000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(918,5000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(919,4500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(920,1500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(921,12000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(922,7500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(923,4000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(924,6000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(925,15000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(926,15000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(927,1000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(928,6500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(929,8000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(930,1500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(931,5500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(932,15000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(933,2000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(934,18000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(935,2500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(936,5000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(937,100000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(938,200000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(939,500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(940,500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(941,2500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(942,800000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(943,500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(944,500000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(945,900000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(946,1000000,34);
INSERT INTO contract (player_ID,value,teamID)
VALUES(947,1000000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(948,1000000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(949,1250000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(950,500000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(951,1750000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(952,2500000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(953,600000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(954,550000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(955,400000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(956,200000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(957,800000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(958,1100000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(959,700000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(960,900000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(961,100000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(962,850000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(963,150000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(964,1500000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(965,1000000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(966,1250000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(967,12000000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(968,7500000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(969,6500000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(970,1750000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(971,2500000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(972,3000000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(973,2500000,35);
INSERT INTO contract (player_ID,value,teamID)
VALUES(974,3000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(975,2250000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(976,4500000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(977,18000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(978,7000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(979,1750000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(980,1750000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(981,500000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(982,3500000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(983,3500000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(984,6000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(985,8000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(986,4000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(987,3000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(988,1000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(989,150000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(990,125000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(991,500000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(992,750000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(993,200000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(994,100000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(995,300000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(996,1000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(997,250000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(998,7500000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(999,200000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1000,6000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1001,15000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1002,25000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1003,7000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1004,25000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1005,65000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1006,10000000,36);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1007,25000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1008,60000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1009,5500000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1010,12000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1011,12500000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1012,7000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1013,1250000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1014,100000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1015,8000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1016,2000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1017,7000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1018,3000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1019,20000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1020,9000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1021,8000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1022,18000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1023,1000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1024,3500000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1025,2000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1026,10000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1027,1000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1028,5000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1029,2000000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1030,6500000,37);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1031,4500000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1032,2500000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1033,1500000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1034,125000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1035,6000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1036,2500000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1037,3000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1038,1000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1039,1000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1040,3000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1041,15000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1042,1000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1043,600000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1044,3000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1045,125000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1046,1500000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1047,1500000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1048,12000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1049,4500000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1050,2500000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1051,17000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1052,20000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1053,40000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1054,2500000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1055,16000000,38);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1056,9000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1057,8000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1058,7000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1059,5000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1060,10000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1061,13000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1062,500000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1063,15000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1064,1500000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1065,7000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1066,25000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1067,5000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1068,1500000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1069,400000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1070,300000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1071,500000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1072,18000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1073,7000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1074,1000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1075,3000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1076,6500000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1077,7500000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1078,3000000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1079,1500000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1080,1750000,39);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1081,12000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1082,5000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1083,5000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1084,450000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1085,3000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1086,5500000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1087,400000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1088,2000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1089,1500000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1090,3000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1091,2500000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1092,500000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1093,350000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1094,4000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1095,350000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1096,750000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1097,200000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1098,7000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1099,250000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1100,100000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1101,1500000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1102,6000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1103,4000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1104,1000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1105,12500000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1106,7000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1107,4000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1108,3500000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1109,7000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1110,10000000,40);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1111,7000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1112,6500000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1113,10000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1114,1500000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1115,8000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1116,1000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1117,250000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1118,3500000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1119,5000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1120,7000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1121,500000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1122,12000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1123,200000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1124,12000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1125,7500000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1126,3500000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1127,2000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1128,150000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1129,200000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1130,50000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1131,7000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1132,10000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1133,7000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1134,6500000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1135,10000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1136,1500000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1137,8000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1138,7000000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1139,500000,41);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1140,1000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1141,2500000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1142,7000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1143,3000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1144,15000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1145,2500000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1146,2000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1147,7000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1148,3500000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1149,10000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1150,1500000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1151,5000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1152,8000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1153,3500000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1154,4500000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1155,NULL,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1156,5000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1157,400000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1158,8000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1159,1000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1160,8000000,43);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1161,2500000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1162,20000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1163,35000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1164,40000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1165,55000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1166,18000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1167,50000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1168,5000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1169,65000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1170,7000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1171,13000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1172,5000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1173,28000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1174,14000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1175,6000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1176,15000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1177,40000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1178,35000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1179,18000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1180,10000000,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1181,NULL,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1182,NULL,42);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1183,6000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1184,750000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1185,1500000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1186,1000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1187,7000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1188,6000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1189,1250000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1190,1500000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1191,3000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1192,2500000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1193,8000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1194,250000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1195,9000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1196,15000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1197,5000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1198,3000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1199,750000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1200,14000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1201,3500000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1202,4500000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1203,8000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1204,1000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1205,12000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1206,2500000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1207,3000000,44);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1208,4000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1209,5000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1210,5000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1211,9000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1212,6000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1213,8000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1214,7000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1215,1000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1216,6000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1217,4000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1218,12000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1219,8000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1220,4000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1221,4000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1222,2000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1223,5000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1224,500000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1225,3000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1226,NULL,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1227,5000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1228,1500000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1229,1000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1230,5000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1231,250000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1232,3000000,45);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1233,1000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1234,40000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1235,35000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1236,35000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1237,20000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1238,60000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1239,25000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1240,65000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1241,100000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1242,25000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1243,60000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1244,40000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1245,18000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1246,20000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1247,20000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1248,32000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1249,15000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1250,40000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1251,28000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1252,20000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1253,1000000,46);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1254,250000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1255,5000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1256,9000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1257,10000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1258,7000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1259,5000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1260,10000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1261,7000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1262,12000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1263,25000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1264,15000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1265,4000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1266,1500000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1267,9000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1268,6000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1269,22000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1270,5000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1271,4000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1272,5000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1273,1000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1274,2000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1275,3000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1276,5000000,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1277,NULL,47);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1278,20000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1279,20000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1280,10000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1281,20000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1282,2000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1283,7000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1284,20000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1285,15000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1286,20000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1287,15000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1288,23000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1289,2000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1290,12000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1291,18000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1292,30000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1293,8000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1294,18000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1295,1000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1296,15000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1297,12000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1298,5000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1299,1000000,48);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1300,2500000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1301,3000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1302,3000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1303,250000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1304,10000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1305,2000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1306,500000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1307,3500000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1308,9000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1309,250000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1310,1500000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1311,2500000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1312,2000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1313,4500000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1314,10000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1315,8000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1316,1000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1317,10000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1318,NULL,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1319,3000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1320,250000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1321,5000000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1322,1500000,49);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1323,10000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1324,5000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1325,3000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1326,5000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1327,18000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1328,8000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1329,500000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1330,25000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1331,15000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1332,10000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1333,1000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1334,5000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1335,7000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1336,10000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1337,1500000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1338,50000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1339,6000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1340,1000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1341,2000000,50);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1342,8000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1343,20000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1344,50000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1345,30000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1346,17000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1347,12000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1348,50000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1349,80000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1350,25000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1351,3500000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1352,12000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1353,60000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1354,25000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1355,30000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1356,12000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1357,28000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1358,10000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1359,8000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1360,25000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1361,1000000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1362,2500000,51);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1363,5000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1364,50000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1365,18000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1366,10000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1367,50000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1368,80000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1369,30000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1370,75000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1371,50000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1372,110000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1373,10000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1374,40000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1375,30000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1376,40000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1377,15000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1378,35000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1379,45000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1380,5000000,52);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1381,60000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1382,NULL,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1383,25000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1384,35000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1385,18000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1386,18000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1387,90000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1388,70000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1389,30000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1390,85000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1391,NULL,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1392,65000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1393,18000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1394,25000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1395,1000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1396,20000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1397,5000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1398,6000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1399,30000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1400,15000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1401,10000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1402,12000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1403,40000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1404,12000000,53);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1405,1500000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1406,6000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1407,3500000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1408,NULL,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1409,7000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1410,7000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1411,10000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1412,10000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1413,10000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1414,3000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1415,NULL,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1416,22000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1417,5000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1418,7000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1419,8000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1420,7000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1421,5000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1422,7000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1423,4000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1424,5000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1425,1500000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1426,4500000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1427,2000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1428,6000000,54);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1429,NULL,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1430,15000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1431,7000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1432,NULL,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1433,8000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1434,15000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1435,8000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1436,6000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1437,18000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1438,12000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1439,15000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1440,2500000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1441,12000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1442,15000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1443,15000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1444,15000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1445,15000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1446,20000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1447,18000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1448,8000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1449,2500000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1450,250000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1451,750000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1452,15000000,55);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1453,18000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1454,5000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1455,7000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1456,18000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1457,12000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1458,15000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1459,1000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1460,3500000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1461,10000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1462,8000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1463,7500000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1464,2500000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1465,11000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1466,3000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1467,10000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1468,7000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1469,3000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1470,3500000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1471,18000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1472,2000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1473,1500000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1474,15000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1475,500000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1476,1000000,56);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1477,5000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1478,12000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1479,7000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1480,2000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1481,12000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1482,1000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1483,8000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1484,5000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1485,2500000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1486,1500000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1487,7000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1488,2500000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1489,5000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1490,8000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1491,7000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1492,18000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1493,1000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1494,3000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1495,2500000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1496,5000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1497,3500000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1498,8000000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1499,NULL,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1500,250000,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1501,NULL,57);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1502,25000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1503,15000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1504,30000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1505,40000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1506,32000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1507,35000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1508,120000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1509,25000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1510,30000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1511,2500000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1512,NULL,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1513,40000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1514,20000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1515,8000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1516,18000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1517,1000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1518,NULL,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1519,20000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1520,NULL,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1521,28000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1522,18000000,58);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1523,1000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1524,6000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1525,3500000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1526,2500000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1527,4000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1528,1500000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1529,14000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1530,9000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1531,10000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1532,10000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1533,5000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1534,4000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1535,12000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1536,15000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1537,10000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1538,5000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1539,3500000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1540,2000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1541,7000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1542,6000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1543,8000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1544,3500000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1545,5000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1546,250000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1547,12000000,59);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1548,3500000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1549,4500000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1550,8000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1551,2500000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1552,4000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1553,15000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1554,5000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1555,9000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1556,13000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1557,9000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1558,3500000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1559,1000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1560,3000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1561,20000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1562,1500000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1563,1000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1564,10000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1565,20000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1566,12000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1567,1000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1568,6000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1569,5000000,60);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1570,8000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1571,12000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1572,NULL,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1573,5000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1574,18000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1575,12000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1576,10000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1577,18000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1578,8000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1579,5000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1580,9000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1581,7000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1582,18000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1583,26000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1584,1500000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1585,9000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1586,4500000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1587,12000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1588,7000000,61);
INSERT INTO contract (player_ID,value,teamID)
VALUES(1589,18000000,61);

