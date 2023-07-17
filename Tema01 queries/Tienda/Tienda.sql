USE tienda;
SHOW TABLES;
#01 Llista el nom de tots els productes que hi ha en la taula "producto".
SELECT nombre FROM producto;
#02 Llista els noms i els preus de tots els productes de la taula "producto".
SELECT nombre, precio FROM PRODUCTO;
#03 Llista totes les columnes de la taula "producto".
SHOW columns FROM producto;
#04 Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans (USD).
SELECT nombre, precio "Precio en €", precio *0.91 "en $"FROM producto;
#05 Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de "producto", euros, dòlars nord-americans.
SELECT nombre AS "nom producte", precio AS "€ euros", precio *0.91 AS  "$ nord-americans" FROM producto;
#06 Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a majúscula.
UPDATE producto SET nombre =UPPER(nombre);
SELECT nombre, precio "Precio en €"FROM producto;
#07 Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a minúscula.
UPDATE producto SET nombre =LOWER(nombre);
SELECT nombre, precio "Precio en €"FROM producto;
#08 Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, UPPER(MID(nombre,1,2)) AS "Inicials en majúscula"  FROM fabricante;
# 09 Llista els noms i els preus de tots els productes de la taula "producto", arrodonint el valor del preu.
SELECT nombre, ROUND(precio) AS "Preu arrodinit"FROM producto;
#10 Llista els noms i els preus de tots els productes de la taula "producto", truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, TRUNCATE(precio,0) AS "Preu truncat" FROM producto;
#11 Llista el codi dels fabricants que tenen productes en la taula "producto".
SELECT producto.codigo AS "Código fabricante" FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
#12 Llista el codi dels fabricants que tenen productes en la taula "producto", eliminant els codis que apareixen repetits.
SELECT distinct producto.codigo AS "Código fabricante" FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
#13 Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre AS "Nom fabricant" FROM fabricante ORDER BY nombre ASC;
#14 Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre AS "Nom fabricant" FROM fabricante ORDER BY nombre DESC;
#15 Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre FROM  producto ORDER BY nombre ASC, precio DESC;
#16 Retorna una llista amb les 5 primeres files de la taula "fabricante".
SELECT * FROM fabricante LIMIT 5;
#17 Retorna una llista amb 2 files a partir de la quarta fila de la taula "fabricante". La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 3,2;
#18 Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MIN(preu), necessitaries GROUP BY
SELECT nombre, precio AS "el mes barat" FROM producto ORDER BY precio ASC LIMIT 1;
#19 Llista el nom i el preu del producte més car. (Fes servir solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MAX(preu), necessitaries GROUP BY
SELECT nombre, precio AS "el mes car" FROM producto ORDER BY precio DESC LIMIT 1;
#20 Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = "2";
#21 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
#22 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;
#23 Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
#24 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT producto.nombre, precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio LIMIT 1;
#25 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT producto.nombre, precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;
#26 Retorna una llista de tots els productes del fabricant Lenovo.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Lenovo";
#27 Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre ="Crucial" AND precio > 200;
#28 Retorna una llista amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Asus" OR fabricante.nombre = "Hewlett-Packard " OR fabricante.nombre = "Seagate";
#29 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Usant l'operador IN.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ("Asus","Hewlett-Packard ","Seagate");
#30 Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';
#31 Retorna un llistat amb el nom i el preu de tots els productes dels fabricants dels quals contingui el caràcter w en el seu nom.
SELECT producto.nombre, precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
#32 Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE precio >= 180 ORDER BY precio DESC, producto.nombre;
#34 Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT fabricante.nombre AS "Fabricant", producto.nombre AS "Producte" FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
#35 Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT fabricante.nombre FROM fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE producto.nombre IS NULL;
#36 Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
SELECT producto.nombre FROM producto WHERE codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = "Lenovo");
#37 Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense fer servir INNER JOIN).
SELECT * FROM producto WHERE precio = (SELECT  MAX(precio) FROM producto WHERE producto.codigo_fabricante = (SELECT  fabricante.codigo   FROM   fabricante  WHERE  fabricante.nombre = 'Lenovo'));
#38 Llista el nom del producte més car del fabricant Lenovo.
SELECT producto.nombre FROM fabricante JOIN  producto ON producto.codigo_fabricante = fabricante.codigo  WHERE fabricante.nombre = "Lenovo" ORDER BY precio DESC LIMIT 1;
# 39 Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT producto.nombre FROM fabricante JOIN  producto ON producto.codigo_fabricante = fabricante.codigo  WHERE fabricante.nombre = "Hewlett-Packard" ORDER BY precio ASC LIMIT 1;
# 40 Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.

#41 Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.