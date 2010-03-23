<?php
return array (
  'settings' => 
  array (
    'recipe.recipe' => 
    array (
      'fields' => 
      array (
        'namespace' => 
        array (
          'value' => 'recipe',
        ),
        'title' => 
        array (
          'label' => 'titre de la recette',
          'required' => true,
        ),
        'origin' => 
        array (
          'label' => 'origine',
          'help' => 'le pays ou la culture d\'origine de votre recette (latine, france)',
          'widget' => 'autocomplete',
          'widget.strict' => false,
        ),
        'summary' => 
        array (
          'label' => 'résumé',
          'widget' => 'textarea',
        ),
        'comment' => 
        array (
          'label' => 'commentaire personnel',
          'widget' => 'textarea',
        ),
        'preparation' => 
        array (
          'label' => 'préparation',
          'help' => 'décrivez les étapes de préparation',
          'widget' => 'textarea',
        ),
        'restTime' => 
        array (
          'label' => 'temps de repos',
          'help' => 'inscrivez le temps de repos en minutes',
        ),
        'cookTime' => 
        array (
          'label' => 'temps de cuisson',
          'help' => 'inscrivez le temps de cuisson en minutes',
        ),
        'preparationTime' => 
        array (
          'label' => 'temps de préparation',
          'help' => 'inscrivez le temps de préparation en minutes',
        ),
        'numberOfPeople' => 
        array (
          'label' => 'nombre de personnes',
          'help' => 'pour combien de personnes va cette recette?',
        ),
      ),
    ),
  ),
  'comments' => 
  array (
    'recipe.recipe' => 
    array (
      'fields' => 
      array (
        'origin' => 
        array (
          'label' => ' default:
 fields[origin][widget]=input
 fields[origin][widget.type]=text',
        ),
        'restTime' => 
        array (
          'label' => ' ingredients? M2M? multival?',
        ),
      ),
    ),
  ),
);
?>
