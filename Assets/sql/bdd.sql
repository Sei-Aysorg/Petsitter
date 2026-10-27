Create table Utilisateur (
id_utilisateur int,
nom_utilisateur varchar(25),
prenom_utilisateur varchar(25),
mail varchar(30),
tel int,
adresse varchar(30),
description varchar(30),
nombre_avis int,
est_administrateur boolean,
constraint pk_utilisateur primary key(id_utilisateur)
);

create table Gardien (
id_gardien int,
id_utilisateur_gardien int,
note_moyenne int,
nom_gardien varchar(25),
prenom_gardien varchar(25),
mail_gardien varchar(25),
tel_gardien int,
adresse_gardien varchar(25),
description_gardien varchar(25),
nombre_avis_gardien int,
est_administrateur_gardien boolean,
constraint pk_gardien primary key(id_gardien),
constraint fk_id_utilisateur_gardien foreign key(id_utilisateur_gardien)
references utilisateur(id_utilisateur)
);

create table Avis (
id_avis int,
id_annonce_avis int,
id_proprietaire_avis int,
id_gardien_avis int,
commentaire varchar(30),
nombre_etoiles int,
nombre_upvote int,
date_poste timestamp,
constraint pk_avis primary key(id_avis),
constraint fk_id_annonce_avis foreign key(id_annonce_avis)
references annonce(id_annonce),
constraint fk_id_proprietaire_avis foreign key(id_proprietaire_avis)
references proprietaire(id_proprietaire),
constraint fk_id_gardien_avis foreign key(id_gardien_avis)
references gardien(id_gardien)
);

create table Proprietaire (
id_proprietaire int,
id_utilisateur_proprietaire int,
nom_utilisateur_proprietaire varchar(25),
prenom_utilisateur_proprietaire varchar(25),
mail_proprietaire varchar(30),
tel_proprietaire int,
adresse_proprietaire varchar(30),
description_proprietaire varchar(30),
nombre_avis_proprietaire int,
est_administrateur_proprietaire boolean,
constraint pk_proprietaire primary key(id_proprietaire),
constraint fk_id_utilisateur_proprietaire foreign key(id_utilisateur_proprietaire)
references utilisateur(id_utilisateur)
);

create table Animal (
id_animal int,
id_proprietaire_animal int,
nom_animal varchar(25),
espece varchar(25),
race varchar(25),
age int
poids int,
besoin_particulier varchar(30),
constraint pk_animal primary key(id_animal),
constraint fk_id_proprietaire foreign key(id_proprietaire_animal)
references proprietaire(id_proprietaire)
);

create table Annonce (
id_annonce int,
id_gardien_annonce int,
id_proprietaire_annonce int,
nom_annonce varchar(25),
date_debut timestamp,
date_fin timestamp,
nombre_animaux int,
date_publication timestamp,
statut varchar(30),
constraint pk_annonce primary key(id_annonce),
constraint fk_id_gardien_annonce foreign key(id_gardien_annonce)
references gardien(id_gardien),
constraint fk_id_propietaire_annonce foreign key(id_proprietaire_annonce)
references proprietaire(id_proprietaire) 
);

create table Est_Inscrit(
id_animal_est_inscrit int,
id_annonce_est_inscrit int,
constraint pk_est_inscrit primary key(id_animal_est_inscrit, id_annonce_est_inscrit),
constraint fk_id_animal_est_inscrit foreign key(id_animal_est_inscrit)
references animal(id_animal),
constraint fk_id_annonce_est_inscrit foreign key(id_annonce_est_inscrit)
references annonce(id_annonce)
)
