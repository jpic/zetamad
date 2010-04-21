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
        'updated' => 
        array (
          'date' => 'now',
        ),
        'title' => 
        array (
          'label' => 'titre de la recette',
          'required' => true,
          'minLength' => 3,
          'maxLength' => 100,
        ),
        'profile' => 
        array (
          'label' => 'chef',
          'widget' => 'autocomplete',
          'route' => 'profile.autocomplete',
          'createRoute' => 'profile.create',
          'strict' => true,
          'required' => true,
        ),
        'category' => 
        array (
          'label' => 'catégorie',
          'help' => 'par exemple: apéritif, entrée, dessert... (utilisé par google)',
          'required' => true,
          'widget' => 'autocomplete',
          'route' => 'recipe.categoryAutocomplete',
        ),
        'picture' => 
        array (
          'label' => 'photo de la recette',
          'help' => 'affiché par google',
          'widget' => 'file',
          'required' => true,
        ),
        'summary' => 
        array (
          'label' => 'résumé',
          'widget' => 'textarea',
          'help' => 'Le début du résumé sera affiché dans les résultats google',
          'required' => true,
        ),
        'restTime' => 
        array (
          'label' => 'temps de repos',
          'help' => 'inscrivez le temps de repos en minutes (utilisé par google)',
        ),
        'cookTime' => 
        array (
          'label' => 'temps de cuisson',
          'help' => 'inscrivez le temps de cuisson en minutes (utilisé par google)',
        ),
        'prepTime' => 
        array (
          'label' => 'temps de préparation',
          'help' => 'inscrivez le temps de préparation en minutes (utilisé par google)',
        ),
        'yield' => 
        array (
          'label' => 'quantité produite',
          'help' => 'la quantité produite avec ces quantités, par exemple: nombre de personnes, nombre de parts .... (utilisé par google)',
        ),
      ),
      'multipleFields' => 
      array (
        'ingredientProducts' => 
        array (
          'label' => 'ingrédients du catalogue',
          'help' => 'saisissez des numéros de produit du catalogue',
          'widget' => 'multiple values',
        ),
        'toolProducts' => 
        array (
          'label' => 'matériel du catalogue',
          'help' => 'saisissez des numéros de produit du catalogue',
          'widget' => 'multiple values',
        ),
        'tools' => 
        array (
          'label' => 'matériel nécessaire',
          'help' => 'saisissez des noms d\'outils nécessaires à la préparation de la recette',
          'widget' => 'multiple values',
        ),
      ),
      'formsets' => 
      array (
        'recipeSteps' => 
        array (
          'label' => 'étapes de préparation',
          'help' => 'utilisé par google',
          'fields' => 
          array (
            'namespace' => 
            array (
              'value' => 'recipeStep',
            ),
            'title' => 
            array (
              'label' => 'titre de l\'étape',
            ),
            'description' => 
            array (
              'label' => 'description de l\'étape',
              'widget' => 'textarea',
            ),
          ),
        ),
        'ingredientQuantities' => 
        array (
          'label' => 'ingrédients et quantités',
          'help' => 'utilisé par google',
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
    'recipe.recipe' => 
    array (
      'fields' => 
      array (
        'namespace' => 
        array (
          'value' => ' automatic',
        ),
      ),
    ),
  ),
);
?>
