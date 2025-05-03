<h1>Sintaxis alternativas para bucles</h1>

<h2>if / elseif / else</h2>
<?php
    $edad = 20;
    if ($edad >= 18): ?>
        <p>Es mayor de edad</p>
    <?php else: ?>
        <p>Es menor de edad</p>
    <?php endif; 
?>

<h2>while / endwhile</h2>
<?php
    $i = 0;
    while ($i < 3): ?>
        <p>Iteración <?= $i ?></p>
        <?php $i++; ?>
    <?php endwhile; 
?>

<h2>for / endfor</h2>
<?php
    for ($i = 1; $i <= 3; $i++): ?>
        <p>Número: <?= $i ?></p>
    <?php endfor;
?>

<h2>foreach / endforeach</h2>
<?php
    $colores = ['Rojo', 'Verde', 'Azul'];
    foreach ($colores as $color): ?>
        <p>Color: <?= $color ?></p>
    <?php endforeach; 
?>

<h2>switch / endswitch</h2>
<?php
    $dia = 'lunes';
    switch ($dia): 
        case 'lunes': ?>
            <p>Inicio de semana</p>
            <?php break;
        case 'viernes': ?>
            <p>¡Por fin viernes!</p>
            <?php break;
        default: ?>
            <p>Día común</p>
    <?php endswitch; 
?>