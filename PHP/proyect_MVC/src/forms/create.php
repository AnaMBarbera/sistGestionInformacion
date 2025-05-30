<?php
    $errores = [];
    $datos = [
        'first_name'   => '',
        'last_name'    => '',
        'username'     => '',
        'city'         => '',
        'community'    => '',
        'postal_code'  => '',
        'terms'        => ''
    ];

    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        // Sanitización
        $datos['first_name'] = filter_input(INPUT_POST, 'first_name', FILTER_SANITIZE_SPECIAL_CHARS);
        $datos['last_name'] = filter_input(INPUT_POST, 'last_name', FILTER_SANITIZE_SPECIAL_CHARS);
        $datos['username'] = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_EMAIL);
        $datos['city'] = filter_input(INPUT_POST, 'city', FILTER_SANITIZE_SPECIAL_CHARS);
        $datos['community'] = filter_input(INPUT_POST, 'community', FILTER_SANITIZE_SPECIAL_CHARS);
        $datos['postal_code'] = filter_input(INPUT_POST, 'postal_code', FILTER_SANITIZE_NUMBER_INT);
        $datos['terms'] = isset($_POST['terms']) ? '1' : '';

        // Validaciones
        if (strlen($datos['first_name']) < 2 || strlen($datos['first_name']) > 40) {
            $errores['first_name'] = "El nombre debe tener entre 2 y 40 caracteres.";
        }

        if (strlen($datos['last_name']) < 2 || strlen($datos['last_name']) > 40) {
            $errores['last_name'] = "El apellido debe tener entre 2 y 40 caracteres.";
        }

        if (!filter_var($datos['username'], FILTER_VALIDATE_EMAIL)) {
            $errores['username'] = "El email no es válido.";
        }

        if (strlen($datos['city']) < 2 || strlen($datos['city']) > 50) {
            $errores['city'] = "La ciudad debe tener entre 2 y 50 caracteres.";
        }

        if (!in_array($datos['community'], ['valencia', 'andalucia'])) {
            $errores['community'] = "Debes seleccionar una comunidad válida.";
        }

        if (!preg_match('/^\d{5}$/', $datos['postal_code'])) {
            $errores['postal_code'] = "El código postal debe tener exactamente 5 dígitos.";
        }

        if (empty($datos['terms'])) {
            $errores['terms'] = "Debes aceptar los términos y condiciones.";
        }

        $exito = empty($errores);
    }
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Formulario con Validación PHP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

    <div class="container mt-5">
        <h1>Formulario</h1>
        <!-- para mostrar todos los errores arriba del formulario -->
        <div id="errores">
            <ul>
            <?php
                foreach($errores as $campo =>$error){
                    echo "<li> [$campo] $error </li>";
                }
            ?>
            </ul>
        </div>

        <?php if (isset($exito) && $exito): ?>
            <div class="alert alert-success">Formulario enviado correctamente.</div>
        <?php elseif (!empty($errores)): ?>
            <div class="alert alert-danger">Hay errores en el formulario. Por favor, revísalo.</div>
        <?php endif; ?>

        <!-- ponemos novalidate para que no haga caso del required -->
        <form class="row g-3" method="POST" novalidate>
            <!-- First Name -->
            <div class="col-md-4">
                <label for="first_name" class="form-label">First name</label>

                <input type="text" 
                    class="form-control <?= isset($errores['first_name']) ? 'is-invalid' : ($datos['first_name'] ? 'is-valid' : '') ?>"
                    id="first_name" name="first_name" value="<?= htmlspecialchars($datos['first_name']) ?>" required>

                    <?php if (isset($errores['first_name'])): ?>
                        <div class="invalid-feedback"><?= $errores['first_name'] ?></div>
                    <?php elseif ($datos['first_name']): ?>
                        <div class="valid-feedback">Looks good!</div>
                    <?php endif; ?>

            </div>

            <!-- Last Name -->
            <div class="col-md-4">
                <label for="last_name" class="form-label">Last name</label>
                <input type="text" class="form-control <?= isset($errores['last_name']) ? 'is-invalid' : ($datos['last_name'] ? 'is-valid' : '') ?>"
                    id="last_name" name="last_name" value="<?= htmlspecialchars($datos['last_name']) ?>" required>
                <?php if (isset($errores['last_name'])): ?>
                    <div class="invalid-feedback"><?= $errores['last_name'] ?></div>
                <?php elseif ($datos['last_name']): ?>
                    <div class="valid-feedback">Looks good!</div>
                <?php endif; ?>
            </div>

            <!-- Email -->
            <div class="col-md-4">
                <label for="username" class="form-label">Email</label>
                <input type="email" class="form-control <?= isset($errores['username']) ? 'is-invalid' : ($datos['username'] ? 'is-valid' : '') ?>"
                    id="username" name="username" value="<?= htmlspecialchars($datos['username']) ?>" required>
                <?php if (isset($errores['username'])): ?>
                    <div class="invalid-feedback"><?= $errores['username'] ?></div>
                <?php elseif ($datos['username']): ?>
                    <div class="valid-feedback">Email válido</div>
                <?php endif; ?>
            </div>

            <!-- City -->
            <div class="col-md-6">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control <?= isset($errores['city']) ? 'is-invalid' : ($datos['city'] ? 'is-valid' : '') ?>"
                    id="city" name="city" value="<?= htmlspecialchars($datos['city']) ?>" required>
                <?php if (isset($errores['city'])): ?>
                    <div class="invalid-feedback"><?= $errores['city'] ?></div>
                <?php elseif ($datos['city']): ?>
                    <div class="valid-feedback">Looks good!</div>
                <?php endif; ?>
            </div>

            <!-- Community -->
            <div class="col-md-3">
                <label for="community" class="form-label">Community</label>
                <select class="form-select <?= isset($errores['community']) ? 'is-invalid' : ($datos['community'] ? 'is-valid' : '') ?>"
                    id="community" name="community" required>
                    <option value="" disabled <?= $datos['community'] == '' ? 'selected' : '' ?>>Choose...</option>
                    <option value="valencia" <?= $datos['community'] == 'valencia' ? 'selected' : '' ?>>Valencia</option>
                    <option value="andalucia" <?= $datos['community'] == 'andalucia' ? 'selected' : '' ?>>Andalucía</option>
                </select>
                <?php if (isset($errores['community'])): ?>
                    <div class="invalid-feedback"><?= $errores['community'] ?></div>
                <?php elseif ($datos['community']): ?>
                    <div class="valid-feedback">Perfecto</div>
                <?php endif; ?>
            </div>

            <!-- Postal Code -->
            <div class="col-md-3">
                <label for="postal_code" class="form-label">Postal Code</label>
                <input type="text" class="form-control <?= isset($errores['postal_code']) ? 'is-invalid' : ($datos['postal_code'] ? 'is-valid' : '') ?>"
                    id="postal_code" name="postal_code" value="<?= htmlspecialchars($datos['postal_code']) ?>" required pattern="\d{5}">
                <?php if (isset($errores['postal_code'])): ?>
                    <div class="invalid-feedback"><?= $errores['postal_code'] ?></div>
                <?php elseif ($datos['postal_code']): ?>
                    <div class="valid-feedback">Looks good!</div>
                <?php endif; ?>
            </div>

            <!-- Terms -->
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input <?= isset($errores['terms']) ? 'is-invalid' : ($datos['terms'] ? 'is-valid' : '') ?>"
                        type="checkbox" id="terms" name="terms" value="1" <?= $datos['terms'] ? 'checked' : '' ?> required>
                    <label class="form-check-label" for="terms">Agree to terms and conditions</label>
                    <?php if (isset($errores['terms'])): ?>
                        <div class="invalid-feedback"><?= $errores['terms'] ?></div>
                    <?php elseif ($datos['terms']): ?>
                        <div class="valid-feedback">Gracias por aceptar los términos</div>
                    <?php endif; ?>
                </div>
            </div>

            <!-- Submit -->
            <div class="col-12">
                <button class="btn btn-primary" type="submit">Submit form</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>