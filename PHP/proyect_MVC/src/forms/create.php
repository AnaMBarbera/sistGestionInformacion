<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Recoge y limpia datos
    $first = trim($_POST['first_name'] ?? '');
    $last = trim($_POST['last_name'] ?? '');
    $user = trim($_POST['user_name'] ?? '');
    $community = trim($_POST['community'] ?? '');
    $city = trim($_POST['city'] ?? '');
    $postal = trim($_POST['postal_code'] ?? '');
    $conditionsb = isset($_POST['conditions'])? true : false;

    // Validaciones
    $firstb = strlen($first) > 2 and strlen($first) <50;
    $lastb = strlen($last) > 2 and strlen($last) <50;
    $userb = stripos("@", $user) > 0;
    $cityb = true;
    $communityb = true;
    $postalb = is_numeric($postal);
    

    

    
}

?> 




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de BootStrap</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet" />
</head>
<body>
    <h1>Formulario de Usuarios</h1>
    <div class="container">
        <form class="row g-3" method="POST">
            <div class="col-md-4">
                <label for="validationServer01" class="form-label">First name</label>
                <input type="text"  id="validationServer01" name="first_name" required
                class="form-control <? $firstb ? "is_valid" : "is_invalid" ?>" value="<? $first ?? "" ?>">
                <div class="valid-feedback">
                    Looks good!
                </div>
                <div id="validationServerUsernameFeedback" class="invalid-feedback">
                        Name need 3 o more characters.
                    </div>
            </div>
            <div class="col-md-4">
                <label for="validationServer02" class="form-label">Last name</label>
                <input type="text"  id="validationServer02" value="<? $last ?? ''?>" name="last_name" requiredclass="form-control <? $lastb ? "is_valid" : "is_invalid" ?>" > 
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="col-md-4">
                <label for="validationServerUsername" class="form-label">Username</label>
                <div class="input-group has-validation">
                    <span class="input-group-text" id="inputGroupPrepend3">@</span>
                    <input type="text" name="user_name" id="validationServerUsername" aria-describedby="inputGroupPrepend3 validationServerUsernameFeedback"class="form-control <? $userb ? "is_valid" : "is_invalid" ?>" value="<?=$userb ?? ""?>"> 
                    <div id="validationServerUsernameFeedback" class="invalid-feedback">
                        Please choose a username.
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <label for="validationServer03" class="form-label">City</label>
                <input type="text" name="city" id="validationServer03" aria-describedby="validationServer03Feedback" required>
                <div id="validationServer03Feedback" class="invalid-feedback" class="form-control <? $cityb ? "is_valid" : "is_invalid" ?>" > 
                    Please provide a valid city.
                </div>
            </div>
            <div class="col-md-3">
                <label for="validationServer04" class="form-label">Comunidad</label>
                <select name="community" id="validationServer04" aria-describedby="validationServer04Feedback" required class="form-control <? $communityb ? "is_valid" : "is_invalid" ?>" > 
                    <option selected disabled value="">Choose...</option>
                    <option value="v">Valenciana</option>
                    <option value="a">Andaluza</option>
                    
                </select>
                <div id="validationServer04Feedback" class="invalid-feedback">
                    Please select a valid state.
                </div>
            </div>
            <div class="col-md-3">
                <label for="validationServer05" class="form-label">Zip</label>
                <input type="text" name="postal_code" id="validationServer05" aria-describedby="validationServer05Feedback" required class="form-control <? $postalb ? "is_valid" : "is_invalid" ?>" > 
                <div id="validationServer05Feedback" class="invalid-feedback">
                    Please provide a valid cp.
                </div>
            </div>
            <div class="col-12">
                <div class="form-check">
                    <input type="checkbox" name="conditions" value="<? $conditions ?? ''?>" id="invalidCheck3" aria-describedby="invalidCheck3Feedback" required class="form-check-input <? $conditionsb ? "is_valid" : "is_invalid" ?>" > 
                    <label class="form-check-label" for="invalidCheck3">
                        Agree to terms and conditions
                    </label>
                    <div id="invalidCheck3Feedback" class="invalid-feedback">
                        You must agree before submitting.
                    </div>
                </div>
            </div>
            <div class="col-12">
                <button class="btn btn-primary" type="submit">Submit form</button>
            </div>
        </form>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>