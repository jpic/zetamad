<?php
if ( !isset( $errors ) ) return true;
?>
<p class="errorField">
<?php // make clear, comprehensible, positive, directive, constructive, precise, and really necessary message
foreach( $errors as $rule => $message ) {
    switch( $rule ) {
        case 'required':
            echo 'Ce champs est requis.';
            break;
    }

    echo ' Pour continuer, ';

    switch( $message ) {
        case 'no file':
            echo 'cliquez sur le bouton "Parcourir" et choisissez un fichier sur votre ordinnateur.';
            break;
        case 'empty value':
            echo 'saisissez une valeur dans le champs ci-dessous.';
            break;
    }
}
?>
</p>
