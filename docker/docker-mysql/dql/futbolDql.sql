USE futbol;
-- Muestra toda la estadística de aquellos goleadores que han marcado algún penalti.
SELECT * FROM golejadors
WHERE penals > 0;
-- De cada partido muestra la jornada, el equipo de casa y el de afuera, los goles de cada equipo, el total de goles, la posesión del equipo de casa y la del equipo de afuera. Pone nombres coherentes en las columnas.
SELECT  jornada, equipc as Anfitrion, equipf as Visitante, golsf as , golsc, possessioc, 90-possessioc as 'PosesiónVisitante'
FROM partits


-- Goles marcados por el pichichi (sólo los goles; el nombre del jugador no).

-- Media de goles por partido en toda la liga.

-- Muestra los siguientes sueldos: el más caro, el más barato y el promedio.


-- Total de goles marcados en toda la liga.


-- Nota: esta información está en 2 tablas: en los resultados de los partidos y en los goles marcados por cada goleador. No cuadra porque hay goles que no les han marcado los goleadores (sino porteros, defensas, en propia puerta…).
-- Total de goles marcados en todos los partidos
-- Total de goles marcados por todos los goleadores.


-- Muestra cuántos partidos y hay, cuántos se han jugado y cuántos no se han jugado


-- Muestra la diferencia entre el mayor presupuesto y el menor


-- Muestra la fecha más antigua y la más reciente de las jornadas

