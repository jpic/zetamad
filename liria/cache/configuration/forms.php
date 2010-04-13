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
          'required' => true,
        ),
        'origin' => 
        array (
          'label' => 'origine',
          'help' => 'le pays ou la culture d\'origine de votre recette (latine, france)',
          'widget' => 
          array (
            'class' => 'autocomplete',
            'route' => 'recipe.originAutocomplete',
            'attribute' => 'origin',
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
          'help' => 'saisissez des noms d\'outls libres',
          'widget' => 
          array (
            'class' => 'multiple values',
          ),
        ),
      ),
      'formsets' => 
      array (
        'ingredients' => 
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
              'label' => 'nom',
              'required' => true,
              'widget' => 
              array (
                'class' => 'autocomplete',
                'route' => 'recipe.ingredientAutocomplete',
                'displayAttribute' => 'name',
                'actualAttribute' => 'name',
              ),
            ),
            'quantity' => 
            array (
              'label' => 'quantité',
            ),
          ),
        ),
      ),
    ),
    'recipe.ingredient' => 
    array (
      'label' => 'enregistrement d\'ingrédient',
      'fields' => 
      array (
        'namespace' => 
        array (
          'value' => 'ingredient',
        ),
        'name' => 
        array (
          'label' => 'nom',
          'required' => true,
        ),
      ),
    ),
    'profile.profile' => 
    array (
      'label' => 'enregistrement de profil',
      'fields' => 
      array (
        'namespace' => 
        array (
          'value' => 'profile',
        ),
        'name' => 
        array (
          'label' => 'nom du profil',
          'required' => true,
        ),
        'slug' => 
        array (
          'slugify' => 'name',
        ),
        'introduction' => 
        array (
          'label' => 'texte d\'introduction',
          'widget' => 
          array (
            'class' => 'textarea',
          ),
          'required' => true,
        ),
        'presentation' => 
        array (
          'label' => 'texte de presentation',
          'widget' => 
          array (
            'class' => 'textarea',
          ),
        ),
        'picture' => 
        array (
          'label' => 'photo',
          'widget' => 
          array (
            'class' => 'file',
          ),
          'required' => true,
        ),
        'email' => 
        array (
          'label' => 'email',
          'required' => true,
        ),
      ),
      'multipleFields' => 
      array (
        'sites' => 
        array (
          'label' => 'sites internets',
          'widget' => 
          array (
            'class' => 'multiple values',
          ),
        ),
        'products' => 
        array (
          'label' => 'produits favoris',
          'widget' => 
          array (
            'class' => 'multiple values',
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
