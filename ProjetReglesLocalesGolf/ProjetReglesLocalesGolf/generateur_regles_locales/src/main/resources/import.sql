insert into PUBLIC.CATEGORIE (ID, CODE, TITLE) VALUES ( 1, 'A', 'Hors limites et limites du parcours' );
insert into PUBLIC.CATEGORIE (ID, CODE, TITLE) VALUES ( 2, 'B', 'Zones à pénalité' );
insert into PUBLIC.CATEGORIE (ID, CODE, TITLE) VALUES ( 3, 'C', 'Bunkers' );

insert into PUBLIC.SOUS_CATEGORIE (ID, TITLE,NUMORDRE, CATEGORIE_ID) VALUES ( 1, 'Définir les limites',1, 1);
insert into PUBLIC.SOUS_CATEGORIE (ID, TITLE,NUMORDRE, CATEGORIE_ID) VALUES ( 2, 'Préciser les limites quand on utilise un mur ou une route',2, 1);
insert into PUBLIC.SOUS_CATEGORIE (ID, TITLE,NUMORDRE, CATEGORIE_ID) VALUES ( 3, 'Hors limites quand une route publique traverse le parcours',3, 1);
insert into PUBLIC.SOUS_CATEGORIE (ID, TITLE,NUMORDRE, CATEGORIE_ID) VALUES ( 4, 'Définir les limites',4,1);
insert into PUBLIC.SOUS_CATEGORIE (ID, TITLE,NUMORDRE, CATEGORIE_ID) VALUES ( 5, 'Piquets identifiant un hors limites',5,1);

insert into PUBLIC.SOUS_CATEGORIE (ID, TITLE,NUMORDRE, CATEGORIE_ID) VALUES ( 6, 'Définition des zones à pénalité',1,2);
insert into PUBLIC.SOUS_CATEGORIE (ID, TITLE,NUMORDRE, CATEGORIE_ID) VALUES ( 7, 'Dégagement sur le côté opposé d’une zone à pénalité rouge',2,2);
insert into PUBLIC.SOUS_CATEGORIE (ID, TITLE,NUMORDRE, CATEGORIE_ID) VALUES ( 8, 'Balle provisoire pour une balle dans une zone à pénalité',3,2);
insert into PUBLIC.SOUS_CATEGORIE (ID, TITLE,NUMORDRE, CATEGORIE_ID) VALUES ( 9, 'Définir un cours d’eau à l’air libre comme partie de la zone générale',4,2);
insert into PUBLIC.SOUS_CATEGORIE (ID, TITLE,NUMORDRE, CATEGORIE_ID) VALUES ( 10, 'Dégagement spécifique quand une zone à pénalité est proche d’un bunker',5,2);

insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 1, 1, '',1,'Le hors limites est défini par la ligne entre les points au niveau du sol côté parcours des piquets blancs ou des poteaux de clôture. Le hors limites est aussi défini par [insérer la description d’autres méthodes pour définir un hors limites]' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 2, 2, '',1,'Les limites du [spécifier le numéro du trou] sont définies par [insérer la description de l’élément].' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 3, 3, '',1,'La limite à gauche du [spécifier le numéro du trou] est définie par le bord, côté parcours, des points peints en blanc sur [spécifier la localisation, comme la chaussée].' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 4, 4, '',1,'La limite à droite du [spécifier le numéro du trou] est définie par le bord, côté parcours, de la ligne blanche peinte sur [nom de la route].' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 5, 5, '',1,'L’aire de maintenance entre [spécifier les numéros des trous] est hors limites. La limite est définie par le bord interne des poteaux de clôture entourant la zone.' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 6, 1, 'Règle locale type ',2,'« La bordure côté parcours de tout mur [bordure côté parcours d’une route] définit la limite du parcours. »' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 7, 2, 'Règle locale type ',2,'« Une balle est hors limites quand elle est au-delà de tout mur définissant les limites du parcours. »' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 8, 1, 'Règle locale type ',3,'« Une balle venant au repos sur ou au-delà de la route [identifier la route ou les trous où elle intervient dans le jeu] est hors limites, même si elle vient au repos sur une autre partie du parcours qui est en jeu pour les autres trous. »' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 9, 1, 'Règle locale type ',4,' ' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 10, 1, 'Règle locale type ',5,' ' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 11, 1, 'Règle locale type ',6,'Toutes les zones de désert sont des zones à pénalité rouges et la lisière de la zone à pénalité est la jonction entre le gazon et le désert.' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 12, 2, 'Règle locale type ',6,'Toutes les zones de lave sont des zones à pénalité rouges' );
insert into PUBLIC.REGLE (ID,NUMORDRE, TITLE, SOUSCATEGORIE_ID,CORPUS) VALUES ( 13, 3, 'Règle locale type ',6,'Quand un mur artificiel entoure le bord d’un lac ou une autre étendue d’eau, la zone à pénalité est définie par le bord externe du mur.' );