USE Universidad;
#01 Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
#02 Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
#03 Retorna el llistat dels/les alumnes que van néixer en 1999.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE '%1999%';
#04 Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT nombre, apellido1, apellido2, tipo, nif FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE "%k";
#05 Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7
SELECT nombre, cuatrimestre, curso, id_grado FROM asignatura WHERE cuatrimestre = '2' AND curso ="3" AND id_grado='7';
#06 Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats/des. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM profesor JOIN persona ON id_profesor JOIN departamento ON  departamento.id = id_departamento ORDER BY apellido1, apellido2, persona.nombre; 
#07 Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT asignatura.nombre , curso_escolar.anyo_inicio, curso_escolar.anyo_fin, persona.nif FROM alumno_se_matricula_asignatura JOIN curso_escolar ON curso_escolar.id JOIN persona ON persona.id = id_alumno JOIN asignatura ON persona.id = id_asignatura WHERE persona.nif ='26902806M';
#08. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT departamento.nombre FROM universidad.persona INNER JOIN universidad.profesor ON profesor.id_profesor = persona.id INNER JOIN universidad.departamento ON departamento.id = profesor.id_departamento INNER JOIN universidad.asignatura ON asignatura.id_profesor = persona.id INNER JOIN universidad.grado ON grado.id = asignatura.id_grado WHERE grado.nombre LIKE "%Grado en Ingeniería Informática (Plan 2015)%" GROUP BY departamento.nombre
###6 consultes LEFT JOIN i RIGHT JOIN.
#01 Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats/des. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom. 
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM universidad.persona INNER JOIN universidad.profesor ON profesor.id_profesor = persona.id LEFT JOIN universidad.departamento ON departamento.id = profesor.id_departamento ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
SELECT dp.nombre 'Departament', pe.apellido1 'Cognom1', pe.apellido2 'Cogonom2', pe.nombre 'Nom' FROM profesor pf LEFT JOIN departamento dp ON pf.id_profesor = dp.id JOIN persona pe ON pf.id_profesor = pe.id ORDER BY dp.nombre , pe.apellido1 , pe.apellido2, pe.nombre;
#02 Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT pe.nombre 'Nom profe', pe.apellido1 'Cognom' FROM persona pe LEFT JOIN profesor pf ON pe.id =pf.id_profesor WHERE pe.tipo = 'profesor' AND pf.id_profesor IS NULL;
#03 Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
#04 Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT persona.nombre 'Nom', persona.apellido1 'Cognom', asignatura.nombre 'Asignatura (para comprobar)' FROM persona LEFT JOIN asignatura ON persona.id = id_profesor WHERE asignatura.id IS NULL;
#05Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT distinct asignatura.nombre 'Assignatura', persona.nombre 'Nom (para comprobar)' FROM asignatura LEFT JOIN persona ON persona.id = id_profesor WHERE  asignatura.id_profesor IS NULL;
#### Consultes resum:
#01 Retorna el nombre total d'alumnes que hi ha.
SELECT DISTINCT COUNT(id) FROM persona WHERE tipo ='alumno';
#02 Calcula quants/es alumnes van néixer en 1999.
SELECT DISTINCT COUNT(ID) FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE '%1999%'; 
#03 Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT departamento.nombre 'Departament', count(profesor.id_departamento) 'Nº professors' FROM departamento JOIN profesor ON id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_departamento) DESC;
#04 Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d'aparèixer en el llistat.
SELECT departamento.nombre 'Departament', count(profesor.id_departamento) 'Nº professors' FROM departamento LEFT JOIN profesor ON id_departamento = departamento.id GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_departamento) DESC;
#05 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Té en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT grado.nombre 'Grau', count(asignatura.id) 'Nº assignatures' FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY count(asignatura.id)DESC;
#06 Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT grado.nombre 'Grau', count(asignatura.id) 'Nº assignatures' FROM grado JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING count(*)>40;
#07 Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT gr.nombre 'Grau', asi.tipo 'Tipus', SUM(asi.creditos) 'Crédits' FROM grado gr LEFT JOIN asignatura asi ON gr.id = asi.id_grado GROUP BY gr.nombre, asi.tipo;
#10 Retorna dades alumne mes jove
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
