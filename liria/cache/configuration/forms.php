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
        'profile' => 
        array (
          'label' => 'chef',
          'widget' => 
          array (
            'class' => 'autocomplete',
            'route' => 'profile.autocomplete',
            'displayAttribute' => 'name',
            'actualAttribute' => 'id',
          ),
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
            'class' => 'wysiwyg',
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
      'formsets' => 
      array (
        'ingredients' => 
        array (
          'label' => 'ingrédients',
          'fields' => 
          array (
            'namespace' => 
            array (
              'value' => 'ingredient',
            ),
            'name' => 
            array (
              'label' => 'nom',
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
        'introduction' => 
        array (
          'label' => 'texte d\'introduction',
          'widget' => 
          array (
            'class' => 'textarea',
          ),
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
        ),
        'email' => 
        array (
          'label' => 'email',
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
    'recipe.recipe' => 
    array (
      'fields' => 
      array (
        'origin' => 
        array (
          'label' => ' default:
 fields[origin][widget][class]=input
 fields[origin][widget][type]=text',
        ),
      ),
    ),
  ),
);
?>
