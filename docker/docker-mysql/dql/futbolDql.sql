USE futbol;
-- Muestra toda la estadística de aquellos goleadores que han marcado algún penalti.
SELECT * FROM golejadors
WHERE penals > 0;
-- De cada partido muestra la jornada, el equipo de casa y el de afuera, los goles de cada equipo, el total de goles, la posesión del equipo de casa y la del equipo de afuera. Pone nombres coherentes en las columnas.
SELECT  jornada, equipc as 'Anfitrion', equipf as 'Visitante', golsf as 'golesVisitante', golsc as 'golesCasa', golsf+golsc as 'TotalGoles', possessioc as 'posesiónCasa', 100-possessioc as 'PosesiónVisitante'
FROM partits
ORDER BY jornada;
-- Goles marcados por el pichichi (sólo los goles; el nombre del jugador no).
SELECT max(gols) from golejadors;
-- Media de goles por partido en toda la liga.
SELECT ROUND(AVG(golsc+golsf),2) from partits;
-- Muestra los siguientes sueldos: el más caro, el más barato y el promedio.
SELECT MAX(sou) as SalarioMax, Min(sou) as SalarioMin, round(AVG(sou),2) as SalarioMedio
FROM jugadors;
-- Total de goles marcados en toda la liga.
SELECT sum(golsc+golsf) AS TotalGoles from partits;
SELECT SUM(gols) as GolesGoleadors from golejadors;
-- Nota: esta información está en 2 tablas: en los resultados de los partidos y en los goles marcados por cada goleador. No cuadra porque hay goles que no les han marcado los goleadores (sino porteros, defensas, en propia puerta…).
-- Total de goles marcados en todos los partidos
-- Total de goles marcados por todos los goleadores.

-- Muestra cuántos partidos y hay, cuántos se han jugado y cuántos no se han jugado
SELECT count(*) as 'TotalPartidos', 
count(possessioc) as 'jugados',
count(*)- count(possessioc) as 'NoJugados'
from partits;
-- otra forma
SELECT 
    COUNT(*) AS 'TotalPartidos',
    COUNT(CASE WHEN possessioc IS NOT NULL THEN 1 END) AS 'Jugados',
    COUNT(CASE WHEN possessioc IS NULL THEN 1 END) AS 'NoJugados'
FROM partits;

-- Muestra la diferencia entre el mayor presupuesto y el menor
SELECT MAX(pressupost),MIN(pressupost), MAX(pressupost)-MIN(pressupost) as 'DiferenciaPresup' FROM equips
where pressupost>0;
-- Muestra la fecha más antigua y la más reciente de las jornadas
SELECT MAX(data) as FechaMasReciente, MIN(data) as FechaMasAntigua from jornades;

--EJERCICIOS. ORDER BY (BD liga1213)
--Muestra el nombre largo de cada equipo y su presupuesto, ordenado por el presupuesto, de menor a mayor.
SELECT nomllarg, pressupost
FROM equips
ORDER BY pressupost;
--De cada partido, muestra la jornada, el equipo de casa y sus goles, primero saldrán los que han marcado más goles.
SELECT jornada, equipc, golsc
FROM partits
ORDER BY golsc DESC;
--De cada partido, muestra la jornada, el equipo de casa y sus goles. Estará ordenado por equipo (de menor a mayor). Los partidos de cada equipo estarán ordenados de más goles a menos.
SELECT jornada, equipc, golsc
FROM partits
WHERE (golsc) -- WHERE golsc IS NOT NULL
ORDER BY equipc , golsc DESC;

--Muestra todos los datos de los partidos pero primero saldrán los partidos que se hayan marcado más goles. En caso de igualdad, saldrán primero los que se marcaran más goles en casa. En caso de igualdad saldrán ordenados por el código del equipo de casa (de menor a mayor). En caso de igualdad saldrán ordenados por la jornada.

SELECT *
FROM partits
ORDER BY golsc+golsf DESC, golsc desc, equipc asc, jornada


-- EJERCICIOS. WHERE (BD liga1213)
-- Partidos que ha perdido al Barça (código ‘bar’) jugando en casa.
SELECT *
FROM partits
WHERE equipc = 'bar' and golsf>golsc;
-- Partidos que ha perdido al Barça jugando fuera.
SELECT *
FROM partits
WHERE equipf = 'bar' and golsc>golsf;
-- Cantidad de partidos que ha perdido el Barça.
SELECT *
FROM partits
WHERE (equipf = 'bar' and golsc>golsf) OR (equipf = 'bar' and golsc>golsf);
-- Partidos en los que se han marcado más de 5 goles.
SELECT *
FROM partits
WHERE (golsc+golsf)>5;
-- Qué jornadas se jugaron en febrero.
SELECT *
FROM jornades
WHERE data BETWEEN '2013-02-01' and '2013-02-28';
--
SELECT *
FROM jornades
WHERE data like '%-02-%';
-- 
SELECT *
FROM jornades
WHERE month(data)=2;

-- ¿Cuántos partidos todavía no ha jugado el Valencia (no ha jugado si no están puestos los goles).
SELECT *
FROM partits
WHERE (equipc='val' and golsc is null) or (equipf='val' and golsc is null) ;
-- MEJOR
SELECT *
FROM partits
WHERE (equipc='val' or equipf='val') AND golsc is null;
-- AUN MEJOR
SELECT COUNT(*)
FROM partits
WHERE 'val' in (equipc,equipf) AND golsc IS NULL;

-- Partidos donde el Madrid (código ‘rma’) ha recibido 3 o más goles.
SELECT *
FROM partits
WHERE (equipc='rma' and golsf>=3) OR (equipf='rma' and golsc>=3);

-- Partidos en los que el Madrid ha perdido por más de un gol de diferencia.
SELECT *
FROM partits
WHERE (equipc='rma' and (golsf-golsc)>1) OR (equipf='rma' and (golsc-golsf)>1);

-- Partidos en los que un equipo ha tenido más del 60% de posesión. ()
SELECT *
FROM partits
WHERE possessioc>60 or possessioc<40;
-- OTRA FORMA
SELECT *
FROM partits
WHERE possessioc NOT BETWEEN 40 and 60;

-- Partidos en los que un equipo ha tenido más del 60% de posesión y ha perdido el partido.
SELECT *
FROM partits
WHERE possessioc>60 and golsc<golsf OR possessioc<40 and golsf<golsc;

-- Muestra la quiniela de la primera jornada (equipo casa, equipo fuera, 1x2). Deberás utilizar la función “IF”.
-- la función if tiene tres parámetros (condición, SI, NO(else))
SELECT equipc as 'Equipo casa', equipf as 'Equipo fuera',
 IF(golsc > golsf, '1', 
        IF(golsf = golsc, 'X', '2')) AS 'Result'
FROM partits
WHERE jornada=1;
-- OTRA
SELECT equipc AS 'Equipo casa', 
       equipf AS 'Equipo fuera',       
       CASE 
           WHEN golsf > golsc THEN '1'
           WHEN golsf = golsc THEN 'X'
           WHEN golsf < golsc THEN '2'
       END AS 'Result'
FROM partits
WHERE jornada=1;

-- sacar una tabla con los puntos que lleva el valencia en casa
-- deben aparecer todos los partidos del valencia en casa y serán
-- 3 si gana, 1 si empata, 0 si pierde

SELECT equipc as 'Equipo casa', equipf as 'Equipo fuera', golsc, golsf,
 IF(golsc > golsf, '3', 
        IF(golsf = golsc, '1', '0')) AS 'Puntos'
FROM partits
WHERE equipc='val';

-- en casa y fuera
SELECT equipc as 'Equipo casa', equipf as 'Equipo fuera', golsc, golsf,
 IF((golsc > golsf and equipc='val') OR (golsf > golsc and equipf='val'),3, 
        IF(golsc = golsf,1,0)) 
    AS 'puntos'     
FROM partits
WHERE 'val' in (equipc, equipf);

-- GROUP BY
USE futbol;
-- Muestra de cada equipo: el código, sueldo máximo, mínimo, la suma de todos los sueldos, cuántos jugadores hay, de cuántos jugadores se conoce el sueldo, la media de sueldos entre los que sabemos el sueldo y la media de sueldos entre todos los jugadores.
SELECT equip, max(sou), min(sou), sum(sou), avg(sou), sum(sou)/count(*)
FROM jugadors
GROUP BY equip;
-- Muestra cuántos jugadores tiene cada equipo en cada posición.
SELECT equip, lloc, count(*)
FROM jugadors
GROUP BY equip, lloc
ORDER BY equip, lloc;
-- Goles marcados en total en cada jornada.
SELECT jornada, sum(golsc+golsf)
FROM partits
GROUP BY jornada;
-- Media de goles por partido en cada jornada.
SELECT jornada, avg(golsc+golsf)
FROM partits
GROUP BY jornada;
-- Goles marcados por el pichichi de cada equipo. Es decir: es necesario mostrar el código del equipo y los goles marcados por su máximo goleador.
SELECT equip, max(gols)
FROM golejadors
GROUP BY equip;
-- Goles marcados en total por cada equipo en casa.
SELECT equipc, SUM(golsc)
FROM partits
GROUP BY equipc;
-- Goles que ha recibido en total a cada equipo como visitante.
SELECT equipf, SUM(golsc)
FROM partits
GROUP BY equipf;
-- ¿Cuántos partidos ha ganado cada equipo jugando en casa
SELECT equipc, count(*)
FROM partits
WHERE (golsc-golsf)>0 
GROUP BY equipc;
-- o where golsc > golsf

-- lo mismo anterior + de 6 partidos en casa
SELECT equipc, count(*)
FROM partits
WHERE (golsc-golsf)>0 
GROUP BY equipc
HAVING count(*) > 6;

-- Comprueba si hay algún nombre de jugador repetido. Es decir: es necesario mostrar el nombre del jugador y cuántas vueltas aparece pero sólo para aquellos jugadores que tengan el nombre repetido.
SELECT nom, count(*)
FROM jugadors
GROUP BY nom
HAVING count(*) > 1

-- Jornadas en las que se han marcado más de 35 goles. Debe aparecer el número de la jornada y la cantidad total de goles correspondiente.
SELECT jornada, SUM(golsc+golsf)
FROM partits
GROUP BY jornada
HAVING SUM(golsc+golsf) > 35
;
-- Queremos saber la media de posesión del balón de cada equipo jugando en casa de aquellos equipos en los que su mínima posesión jugando en casa es mayor de 40. Ordenado de mayor a menor posesión. La media de la posesión debe salir sin decimales.

SELECT equipc, round(avg(possessioc), 0)
FROM partits
GROUP BY equipc
HAVING MIN(possessioc) > 40
ORDER BY AVG(possessioc) DESC
;

-- Muestra la quiniela de la primera jornada (equipo casa, equipo fuera, 1x2). Este ejercicio ya se hizo con la función IF. Ahora hazlo sin usar esa función. Y ordenado por el código del equipo que juega en casa.
SELECT 
    equipc AS 'Equipo casa', 
    equipf AS 'Equipo fuera', 
    '1' AS resultado  -- Victoria del equipo casa
FROM 
    partits
WHERE 
   jornada=1 and golsc > golsf

UNION

SELECT 
    equipc AS 'Equipo casa', 
    equipf AS 'Equipo fuera', 
    'X' AS resultado  -- Empate
FROM 
    partits
WHERE 
    jornada=1 and golsc = golsf

UNION

SELECT 
    equipc AS 'Equipo casa', 
    equipf AS 'Equipo fuera', 
    '2' AS resultado  -- Victoria del equipo fuera
FROM 
    partits
WHERE 
    jornada=1 and golsc < golsf

ORDER BY 
    1;  -- Ordena por el equipo de casa


-- Cuántos unos, cuántas x y cuántos 2 en la primera jornada.
SELECT 
    '1' AS resultado, 
    COUNT(*) AS cantidad
FROM 
    partits
WHERE 
    jornada = 1 AND golsc > golsf  -- Equipo de casa gana

UNION

SELECT 
    'X' AS resultado, 
    COUNT(*) AS cantidad
FROM 
    partits
WHERE 
    jornada = 1 AND golsc = golsf  -- Empate

UNION

SELECT 
    '2' AS resultado, 
    COUNT(*) AS cantidad
FROM 
    partits
WHERE 
    jornada = 1 AND golsc < golsf  -- Equipo fuera gana


-- Cuántos unos, cuantas x y cuántos 2 en cada jornada (ordenado por la jornada).

SELECT jornada,
    '1' AS resultado, 
    COUNT(*) AS cantidad
FROM 
    partits
WHERE 
    golsc > golsf  -- Equipo de casa gana
GROUP BY jornada
UNION

SELECT jornada,
    'X' AS resultado, 
    COUNT(*) AS cantidad
FROM 
    partits
WHERE 
    golsc = golsf  -- Empate
GROUP BY jornada
UNION

SELECT jornada,
    '2' AS resultado, 
    COUNT(*) AS cantidad
FROM 
    partits
WHERE 
    golsc < golsf
GROUP BY jornada

ORDER BY 1;

-- ¿Cuántos partidos le queda por jugar a cada equipo en casa y cuántos fuera? Muestra la información ordenada por equipo. Dentro de cada equipo, primero los de casa.
SELECT 
    e.nomcurt,
    SUM(IF(p.equipc = e.codi AND p.golsc IS NULL, 1, 0)) AS partidos_por_jugar_casa,
    SUM(IF(p.equipf = e.codi AND p.golsf IS NULL, 1, 0)) AS partidos_por_jugar_fuera
FROM 
    equips e
LEFT JOIN 
    partits p ON p.equipc = e.codi OR p.equipf = e.codi
GROUP BY 
    e.nomcurt
ORDER BY 
    e.nomcurt, partidos_por_jugar_casa DESC;


-- Cuántos partidos ha ganado/empatado/perdido cada equipo jugando en casa/fuera. Ordenado por equipo. Así (da igual si aparecen primero los ganados o empatados o perdidos):

SELECT 
    e.nomcurt,  
    SUM(IF(p.equipc = e.codi AND p.golsc > p.golsf, 1, 0)) AS ganaCasa,   
    SUM(IF(p.equipf = e.codi AND p.golsf > p.golsc, 1, 0)) AS ganaFuera,   
    SUM(IF(p.equipc = e.codi AND p.golsc = p.golsf, 1, 0)) AS empataCasa,
    SUM(IF(p.equipf = e.codi AND p.golsf = p.golsc, 1, 0)) AS empataFuera,
    SUM(IF(p.equipc = e.codi AND p.golsc < p.golsf, 1, 0)) AS perdidosCasa,
    SUM(IF(p.equipf = e.codi AND p.golsf < p.golsc, 1, 0)) AS perdidosFuera
FROM 
    equips e
LEFT JOIN 
    partits p ON p.equipc = e.codi OR p.equipf = e.codi
GROUP BY 
    e.nomcurt
ORDER BY 
    e.nomcurt;


--EJERCICIOS MULTITAULA (BD liga1213)
USE futbol;
-- De cada partido queremos mostrar los códigos de los equipos y el nombre de la ciudad en la que juegan.
SELECT partits.equipc, partits.equipf, ciutats.nom
FROM partits, equips, ciutats
WHERE partits.equipc = equips.codi
and equips.ciutat = ciutats.codi;

-- De cada partido que falta por jugar queremos mostrar en qué fecha se disputará, los nombres cortos de los equipos, los nombres de las respectivas ciudades y el total de habitantes de las dos ciudades.
SELECT j.data, ec.nomcurt, ef.nomcurt, cc.nom, cf.nom, cc.habitants+cf.habitants as habitantes
FROM jornades j, partits p, equips ec,equips ef, ciutats as cc, ciutats as cf
WHERE golsc is null
and p.jornada = j.num
and p.equipc = ec.codi
and p.equipf = ef.codi
and ec.ciutat = cc.codi
and ef.ciutat = cf.codi
;
-- De cada equipo: el presupuesto, lo que se gasta con los jugadores y el porcentaje que representa.
SELECT e.nomcurt, e.pressupost * 1000000 as PRESUPUESTO, sum(j.sou) AS SALARIOS, ROUND((sum(j.sou)/(e.pressupost * 1000000) * 100),2) as '%'
FROM equips e, jugadors j
WHERE e.codi = j.equip
GROUP BY e.codi;
-- Lista de jugadores donde conste: nombre del jugador y nombre de la ciudad en la que juega.
SELECT j.nom, c.nom
FROM jugadors j, equips e, ciutats c
WHERE e.codi = j.equip
    and e.ciutat = c.codi;

-- Cantidad total de goles de penalti marcados por equipos de ciudades de menos de 200.000 habitantes.
SELECT sum(g.penals)
FROM golejadors g, equips e, ciutats c
WHERE g.equip = e.codi
    and e.ciutat = c.codi
    and c.habitants < 200000;

SELECT nomcurt, sum(g.penals)
FROM golejadors g, equips, ciutats c
WHERE g.equip = equips.codi
    and equips.ciutat = c.codi
    and c.habitants < 200000
    GROUP BY equip;

-- En qué fechas se han enfrentado Valencia y Barça (sabiendo que los códigos son “vale” y “bar”). Muestra cuál jugaba en casa y quién fuera y el resultado de goles.

SELECT j.data, p.equipc, p.equipf, p.golsc, p.golsf
FROM partits p, jornades j
WHERE p.jornada = j.num
and (p.equipc = 'val' or p.equipc = 'bar') and (p.equipf = 'val' or p.equipf = 'bar');
-- equipc in ('val', 'bar') and equipf in ('val', 'bar')

-- En qué fechas se han enfrentado Valencia y Barça (sabiendo que los nombres cortos son “Valencia” y “Barça”). Muestra cuál jugaba en casa y quién fuera (nombre largos) y el resultado de goles.
SELECT j.data, ec.nomcurt, ef.nomcurt, p.golsc+p.golsf as totalgoles
FROM partits p, jornades j, equips ec,equips ef
WHERE p.jornada = j.num
and p.equipc = ec.codi
and p.equipf = ef.codi
and (p.equipc = 'val' or p.equipc = 'bar') and (p.equipf = 'val' or p.equipf = 'bar');

;
SELECT j.data, ec.nomllarg Anfitrion, ef.nomllarg as Visitante, p.golsc , p.golsf as Resultado
FROM partits p, jornades j, equips ec,equips ef
WHERE p.jornada = j.num
and p.equipc = ec.codi
and p.equipf = ef.codi
and (ec.nomcurt = 'Valencia' or ec.nomcurt = 'Barça') and (ef.nomcurt = 'Valencia' or ef.nomcurt = 'Barça');
-- ec.nomcurt in ('Valencia', 'Barça') and ef.nomcurt in ('Valencia', 'Barça')

-- Muestra parejas de jugadores en los que uno de ellos cobra más de 10 vueltas que el otro. Muestra también sus sueldos. 
SELECT j1.nom, j1.sou, j2.nom, j2.sou
FROM jugadors j1, jugadors j2
WHERE j1.sou > j2.sou*10;
-- Modifica el ejercicio anterior para que también aparezcan los respectivos nombres (largos) de los equipos.
SELECT j1.nom, j1.equip, e1.nomllarg, j1.sou, j2.nom, j2.equip, e2.nomllarg, j2.sou
FROM jugadors j1, jugadors j2, equips e1, equips e2
WHERE j1.sou > j2.sou*10
    and j1.equip = e1.codi
    and j2.equip = e2.codi;
-- Centrocampistas que cobran más que algún delantero de su equipo. Es necesario mostrar los 2 nombres y los 2 sueldos.
SELECT j1.nom, j1.sou, j2.nom, j2.sou
FROM jugadors j1, jugadors j2
WHERE j1.lloc = 'mig' and j2.lloc = 'davanter'
and j1.sou > j2.sou
and j1.equip = j2.equip;


-- Parejas de portero y goleador de un mismo equipo en el que el goleador haya marcado más goles que los goles que ha encajado el portero. Hay que mostrar el equipo y los nombres del portero y goleador con sus respectivos goles. Ordenado por el equipo y el nombre del portero.

SELECT p.equip, j.nom, p.gols, jg.nom, g.gols
FROM porters p, golejadors g, jugadors j, jugadors jg
WHERE p.equip = g.equip
and g.gols > p.gols
and p.equip = j.equip and p.dorsal = j.dorsal
and g.equip = jg.equip and g.dorsal = jg.dorsal
;
-- por la clave primaria compuesta equip + dorsal


-- Queremos comparar los goles de Messi y Ronaldo (no sabemos el nombre completo de ellos). Muestra el nombre del jugador y toda la estadística de los goles como jugadores pero sólo de ambos.
SELECT j.nom, g.gols
FROM jugadors j, golejadors g
WHERE (j.nom like "%Messi%" OR j.nom like "%Ronaldo%")
and j.equip = g.equip and j.dorsal = g.dorsal;
-- por la clave primaria compuesta equip + dorsal

-- Media de goles marcados en cada jornada y fecha de la jornada (un decimal).
SELECT j.num, j.`data`, round(avg(p.golsc+p.golsf), 1)
from jornades j, partits p 
WHERE p.jornada = j.num
GROUP BY j.num
ORDER BY j.num;

-- ¿Cuántos partidos ha ganado/empatado/perdido cada equipo, pero sin diferenciar si está en casa o fuera (sólo los totales).
USE futbol;
SELECT 
    e.nomcurt,
    SUM(IF(p.golsc > p.golsf AND p.equipc = e.codi, 1, 0)) +
    SUM(IF(p.golsf > p.golsc AND p.equipf = e.codi, 1, 0)) AS partidos_ganados,
    
    SUM(IF(p.golsc = p.golsf, 1, 0)) AS partidos_empatados,
    
    SUM(IF(p.golsc < p.golsf AND p.equipc = e.codi, 1, 0)) +
    SUM(IF(p.golsf < p.golsc AND p.equipf = e.codi, 1, 0)) AS partidos_perdidos
    
FROM 
    equips e
LEFT JOIN 
    partits p
ON 
    p.equipc = e.codi OR p.equipf = e.codi

GROUP BY 
    e.nomcurt;
-- Si usamos FROM equips e, partits p WHERE p.equipc = e.codi OR p.equipf = e.codi se realiza un producto cartesiano de las dos tablas y luego filtra los resultados según la condición en WHERE. Básicamente, combina todas las filas posibles de ambas tablas y luego reduce el conjunto a aquellas que cumplen la condición. No garantiza que todos los equipos aparezcan en el resultado. Si un equipo no tiene partidos asociados en la tabla partits, no aparecerá en el conjunto de resultados.

SELECT 
    e.nomcurt as equipo,
    SUM(IF(p.golsc > p.golsf AND p.equipc = e.codi, 1, 0)) +
    SUM(IF(p.golsf > p.golsc AND p.equipf = e.codi, 1, 0)) AS partidos_ganados,
    
    SUM(IF(p.golsc = p.golsf, 1, 0)) AS partidos_empatados,
    
    SUM(IF(p.golsc < p.golsf AND p.equipc = e.codi, 1, 0)) +
    SUM(IF(p.golsf < p.golsc AND p.equipf = e.codi, 1, 0)) AS partidos_perdidos
FROM equips e, partits p 
WHERE p.equipc = e.codi OR p.equipf = e.codi
GROUP BY 
    e.nomcurt; 

-- JOIN --
use futbol;
-- Sacar el nombre de los equipos y el nombre de la ciudad
-- multitabla (solo aparecen los equipos que tienen ciudad)
select e.nomcurt, c.nom
from equips e, ciutats c
WHERE e.ciutat = c.codi;

-- inner join
select e.nomcurt, c.nom
from equips e inner join ciutats c on e.ciutat = c.codi;
-- podemos quitar inner
select e.nomcurt, c.nom
from equips e join ciutats c on e.ciutat = c.codi;

-- LEFT JOIN Todos los A (con los B relacionados) aparecen todos los registros de A (aunque B sea null)
-- Aquí A es equips (después del from y antes del left join)
select e.nomcurt, c.nom
from equips e left join ciutats c on e.ciutat = c.codi;
-- aquí A es ciutats
select c.nom, e.nomcurt
from ciutats c left join equips e on e.ciutat = c.codi;

-- para evitar el valor null en el resultado
select c.nom, ifnull(e.nomcurt,"Sin equipo")
from ciutats c left join equips e on e.ciutat = c.codi;

-- 	RIGHT JOIN	Todos los B (con los A relacionados).
select c.nom, ifnull(e.nomcurt,"Sin equipo")
from ciutats c right join equips e on e.ciutat = c.codi;

-- SUBCONSULTAS
-- Dorsal, equipo y goles del pichichi (el que ha marcado más goles).
SELECT dorsal, equip, gols
FROM golejadors
WHERE gols = (SELECT max(gols) FROM golejadors);

-- Nombre del pichichi
SELECT j.nom, g.dorsal, g.equip, g.gols
FROM golejadors g, jugadors j
WHERE g.gols = (SELECT max(g.gols) FROM golejadors g)
 and j.dorsal = g.dorsal and j.equip = g.equip;

-- Muestra el nombre y sueldo del jugador mejor pagado de toda la liga.
SELECT j.nom, j.sou
FROM jugadors j
WHERE j.sou = (SELECT max(j.sou) FROM jugadors j);

-- Muestra el nombre y sueldo del jugador mejor pagado de cada equipo.
SELECT j.equip, j.nom, j.sou
FROM jugadors j
WHERE j.sou = (SELECT max(j2.sou) FROM jugadors j2 WHERE j2.equip = j.equip);


-- Jugador que más cobra en cada equipo dentro de su categoría (lugar). Se debe mostrar el nombre del equipo, el nombre del jugador, el lugar y el sueldo (expresado en millones de euros, con 1 decimal). Ordenado por equipo y puesto.
SELECT j.equip, j.nom, j.lloc, j.sou
FROM jugadors j
WHERE j.sou = (SELECT max(j2.sou) FROM jugadors j2 WHERE j2.lloc = j.lloc and j2.equip = j.equip
)
 ;
-- Muestra todos los datos de los partidos donde más goles se marcaron de todo el campeonato.
SELECT *
FROM partits
WHERE golsc+golsf = (SELECT max(golsc+golsf) FROM partits);

-- Muestra todos los datos de los partidos donde más goles se marcaron de cada jornada. Ordenado por la jornada.
SELECT jornades.`data`, partits.*
FROM partits, jornades
WHERE golsc+golsf = (SELECT max(golsc+golsf) FROM partits)
and partits.jornada = jornades.num
ORDER BY jornades.num;

-- Nombres de los jugadores de los equipos del partido donde más goles se marcaron. Muestra también el código de sus equipos. Ordenado por equipo y nombre de jugador.
-- aquí saldría el producto cartesiano
SELECT jc.nom, jc.equip, jf.nom, jf.equip
FROM partits, jugadors jc, jugadors jf
WHERE golsc+golsf = (SELECT max(golsc+golsf) FROM partits)
and partits.equipc = jc.equip and partits.equipf = jf.equip
;
-- debemos hacer un UNION
SELECT jc.nom, jc.equip 
FROM partits p
JOIN jugadors jc ON p.equipc = jc.equip
JOIN jugadors jf ON p.equipf = jf.equip
WHERE (p.golsc + p.golsf) = (
    SELECT MAX(p2.golsc + p2.golsf)
    FROM partits p2
)
UNION
SELECT jf.nom, jf.equip 
FROM partits p
JOIN jugadors jc ON p.equipc = jc.equip
JOIN jugadors jf ON p.equipf = jf.equip
WHERE (p.golsc + p.golsf) = (
    SELECT MAX(p2.golsc + p2.golsf)
    FROM partits p2
);

-- Jornadas en las que se marcaron más goles que la jornada anterior.
USE futbol;

SELECT j2.data, j2.num, SUM(p2.golsc + p2.golsf) AS goles_jornada
FROM jornades j1
JOIN jornades j2 ON j2.num = j1.num + 1
JOIN partits p1 ON p1.jornada = j1.num
JOIN partits p2 ON p2.jornada = j2.num
GROUP BY j2.data, j2.num
HAVING SUM(p2.golsc + p2.golsf) > SUM(p1.golsc + p1.golsf);
;
-- con subconsultas
SELECT j2.data, j2.num, (SELECT SUM(p2.golsc + p2.golsf) 
                          FROM partits p2 
                          WHERE p2.jornada = j2.num) AS goles_jornada
FROM jornades j2
WHERE (SELECT SUM(p2.golsc + p2.golsf) 
       FROM partits p2 
       WHERE p2.jornada = j2.num) > 
      (SELECT SUM(p1.golsc + p1.golsf) 
       FROM partits p1 
       WHERE p1.jornada = j2.num - 1)

-- Nombre largo de equipos que tienen más de 2 porteros, más de 2 defensas, más de 2 medios y más de 2 delanteros.-- 

SELECT e.nomllarg
FROM jugadors j
JOIN equips e ON j.equip = e.cod 
GROUP BY  e.nomllarg
HAVING 
    SUM(IF(j.lloc = 'porter', 1, 0)) > 2 AND
    SUM(IF(j.lloc = 'defensa', 1, 0)) > 2 AND
    SUM(IF(j.lloc = 'mig', 1, 0)) > 2 AND
    SUM(IF(j.lloc = 'davanter', 1, 0)) > 2;
-- con subconsultas
SELECT e.nomllarg
FROM equips e
WHERE 
    (SELECT COUNT(*) 
     FROM jugadors j 
     WHERE j.equip = e.codi AND j.lloc = 'porter') > 2
    AND
    (SELECT COUNT(*) 
     FROM jugadors j 
     WHERE j.equip = e.codi AND j.lloc = 'defensa') > 2
    AND
    (SELECT COUNT(*) 
     FROM jugadors j 
     WHERE j.equip = e.codi AND j.lloc = 'mig') > 2
    AND
    (SELECT COUNT(*) 
     FROM jugadors j 
     WHERE j.equip = e.codi AND j.lloc = 'davanter') > 2;

