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
SELECT AVG(golsc+golsf) from partits;
-- Muestra los siguientes sueldos: el más caro, el más barato y el promedio.
SELECT MAX(sou) as SalarioMax, Min(sou) as SalarioMin, round(AVG(sou),2) as SalarioMedio
FROM jugadors;
-- Total de goles marcados en toda la liga.
SELECT sum(golsc+golsf) AS TotalGoles from partits;
SELECT SUM(gols) as GolesGoleadors from Golejadors;
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

