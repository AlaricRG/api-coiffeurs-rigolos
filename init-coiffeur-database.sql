CREATE TABLE coiffeurs(
  nom TEXT,
  lat REAL,
  lng REAL,
  num INTEGER, 
  voie TEXT,
  ville TEXT,
  codepostal INTEGER,
  adresse TEXT 
);

INSERT INTO coiffeurs SELECT
  json_extract(value, '$.properties.nom'),
  json_extract(value, '$.properties.lat'),
  json_extract(value, '$.properties.lng'),
  json_extract(value, '$.properties.num'),
  json_extract(value, '$.properties.voie'),
  json_extract(value, '$.properties.ville'),
  json_extract(value, '$.properties.codepostal'),
  json_extract(value, '$.properties.adresse')
FROM json_each(readfile('coiffeurs.json'));
