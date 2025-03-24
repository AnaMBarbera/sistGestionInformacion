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