<?php
return array (
  'settings' => 
  array (
    'recipe.recipe' => 
    array (
      'label' => 'enregistrement de recette',
      'fields' => 
      array (
        'namespace' => 
        array (
          'value' => 'recipe',
        ),
        'slug' => 
        array (
          'slugify' => 'title',
        ),
        'title' => 
        array (
          'label' => 'titre de la recette',
          'required' => true,
        ),
        'source' => 
        array (
          'label' => 'source',
        ),
        'picture' => 
        array (
          'label' => 'photo de la recette',
          'widget' => 
          array (
            'class' => 'file',
          ),
        ),
        'summary' => 
        array (
          'label' => 'résumé',
          'widget' => 
          array (
            'class' => 'textarea',
          ),
        ),
        'comment' => 
        array (
          'label' => 'commentaire personnel',
          'widget' => 
          array (
            'class' => 'textarea',
          ),
        ),
        'preparation' => 
        array (
          'label' => 'préparation',
          'help' => 'décrivez les étapes de préparation',
          'widget' => 
          array (
            'class' => 'textarea',
          ),
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
      'multipleFields' => 
      array (
        'ingredientProducts' => 
        array (
          'label' => 'ingrédients du catalogue',
          'help' => 'saisissez des numéros de produit du catalogue',
          'widget' => 
          array (
            'class' => 'multiple values',
          ),
        ),
        'toolProducts' => 
        array (
          'label' => 'matériel du catalogue',
          'help' => 'saisissez des numéros de produit du catalogue',
          'widget' => 
          array (
            'class' => 'multiple values',
          ),
        ),
        'tools' => 
        array (
          'label' => 'matériel',
          'help' => 'saisissez des noms d\'outils nécessaires à la préparation de la recette',
          'widget' => 
          array (
            'class' => 'multiple values',
          ),
        ),
      ),
      'formsets' => 
      array (
        'ingredientQuantities' => 
        array (
          'label' => 'ingrédients et quantités',
          'fields' => 
          array (
            'namespace' => 
            array (
              'value' => 'ingredientQuantity',
            ),
            'ingredient' => 
            array (
              'label' => 'nom de l\'ingrédient',
            ),
            'quantity' => 
            array (
              'label' => 'quantité',
            ),
          ),
        ),
      ),
    ),
  ),
  'comments' => 
  array (
  ),
);
?>
