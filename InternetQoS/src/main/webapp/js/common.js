$(document).ready(function() {
    $birthdateField = $('#birthdate');
    if ($birthdateField && $birthdateField.val()) {
        $parts = $birthdateField.val().split("/");
        $birthdateField.val($parts[1] + "/" + $parts[0] + "/" + $parts[2]);
    }
});