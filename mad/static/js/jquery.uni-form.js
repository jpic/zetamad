/**
 * Uniform module
 */
UniForm = function() {
  
  /**
   * Counter used for form ID generation
   *
   * @var integer
   */
  var form_counter = 0;
  
  /**
   * Forms that are initialized
   *
   * @var Object
   */
  var forms = {};
  
  /**
   * Supported validators
   *
   * @var Object
   */
  var validators = {
    
    /**
     * Check if value of specific field is present
     *
     * @param jQuery field
     * @param string caption
     */
    required : function(field, caption) {
      if(field.val() == ''  && !field.hasClass('hasValue')) {
        return 'Veuillez saisir une valeur dans le champs ' + caption;
      } else {
        return true;
      }
    },
    
    /**
     * Validate is value of given field is shorter than supported
     *
     * @param jQuery field
     * @param sting caption
     */
    validate_minlength : function(field, caption) {
      var min_length = 0;
      var classes = field.attr('class').split(' ');
      
      for(var i = 0; i < classes.length; i++) {
        if(classes[i] == 'validate_minlength') {
          if((classes[i + 1] != 'undefined') && !isNaN(classes[i + 1])) {
            min_length = parseInt(classes[i + 1]);
            break;
          } // if
        } // if
      } // for
      
      if((min_length > 0) && (field.val().length < min_length)) {
        return 'Veuillez saisir au moins ' + min_length + ' caractères dans le champs ' + caption;
      } else {
        return true;
      } // if
    },
    
    /**
     * Validate if field value is longer than allowed
     *
     * @param jQuery field
     * @param string caption
     */
    validate_maxlength : function(field, caption) {
      var max_length = 0;
      var classes = field.attr('class').split(' ');
      
      for(var i = 0; i < classes.length; i++) {
        if(classes[i] == 'validate_maxlength') {
          if((classes[i + 1] != 'undefined') && !isNaN(classes[i + 1])) {
            max_length = parseInt(classes[i + 1]);
            break;
          } // if
        } // if
      } // for
      
      if((max_length > 0) && (field.val().length > max_length)) {
          return 'Veuillez saisir moins de ' + max_length + ' caractères dans le champs ' + caption;
      } else {
        return true;
      } // if
    },
    
    /**
     * Make sure that field has same value as the value of target field
     *
     * @param jQuery field
     * @param string caption
     */
    validate_same_as : function(field, caption) {
      var classes = field.attr('class').split(' ');
      var target_field_name = '';
      
      for(var i = 0; i < classes.length; i++) {
        if(classes[i] == 'validate_same_as') {
          if(classes[i + 1] != 'undefined') {
            target_field_name = classes[i + 1];
            break;
          } // if
        } // if
      } // for
      
      if(target_field_name) {
        var target_field = jQuery('#' + target_field_name);
        if(target_field.length > 0) {
          var target_field_caption = field_caption(field);
          
          if(target_field.val() != field.val()) {
            return caption + ' value is expected to be same as value of ' + target_field_caption + ' field';
          } // if
        } // if
      } // if
      
      return true;
    },
    
    /**
     * Validate if provided value is valid email address
     *
     * @param jQuery field
     * @param string caption
     */
    validate_email : function(field, caption) {
      if ( field.hasClass('required') == false && field.val() == '' ) {
          return true;
      }
      
      if(field.val().match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/)) {
        return true;
      } else {
        return 'Veuillez saisir une addresse email valide pour le champs ' + caption;
      }
    },
    
    /**
     * Validate if provided value is valid URL
     *
     * @param jQuery field
     * @param string caption
     */
    validate_url : function(field, caption) {
      if ( field.hasClass('required') == false && field.val() == '' ) {
          return true;
      }

      if(field.val().match(/^(http|https|ftp):\/\/(([A-Z0-9][A-Z0-9_-]*)(\.[A-Z0-9][A-Z0-9_-]*)+)(:(\d+))?\/?/i)) {
        return true;
      } else {
        return 'Veuillez saisir une url valide pour le champs ' + caption;
      }
    }, 
    
    /**
     * Number is only valid value (integers and floats)
     *
     * @param jQuery field
     * @param string caption
     */
    validate_number : function(field, caption) {
      if ( field.hasClass('required') == false && field.val() == '' ) {
          return true;
      }

      if(field.val().match(/(^-?\d\d*\.\d*$)|(^-?\d\d*$)|(^-?\.\d\d*$)/)) {
        return true;
      } else {
        return 'Veuillez saisir un nombre valide dans le champs ' + caption;
      }
    },
    
    /**
     * Whole numbers are allowed
     *
     * @param jQuery field
     * @param string caption
     */
    validate_integer : function(field, caption) {
      if ( field.hasClass('required') == false && field.val() == '' ) {
          return true;
      }

      if(field.val().match(/(^-?\d\d*$)/)) {
        return true;
      } else {
        return 'Veuillez saisir un nombre entier valide dans le champs ' + caption;
      }
    },
    
    /**
     * Letters only
     *
     * @param jQuery field
     * @param string caption
     */
    validate_alpha : function(field, caption) {
      if ( field.hasClass('required') == false && field.val() == '' ) {
          return true;
      }

      if(field.val().match(/^[a-zA-Z]+$/)) {
        return true;
      } else {
        return 'Veuillez ne saisir que des lettres dans le champs ' + caption;
      }
    },
    
    /**
     * Letters and numbers
     *
     * @param jQuery field
     * @param string caption
     */
    validate_alphanum : function(field, caption) {
      if ( field.hasClass('required') == false && field.val() == '' ) {
          return true;
      }

      if(field.val().match(/\W/)) {
        return caption + ' value should contain only numbers and letters (without special characters)';
      } else {
        return true;
      }
    },
    
    /**
     * Callback validator
     *
     * Lets you define your own validators. Usage:
     *
     * <input name="myinput" class="validate_callback my_callback" />
     *
     * This will result in UniForm searching for window.my_callback funciton and 
     * executing it with field and caption arguments. Sample implementation:
     *
     * window.my_callback = function(field, caption) {
     *   if(field.val() == 'A51') {
     *     return true;
     *   } else {
     *     return caption + ' value should be "A51"!';
     *   }
     * }
     *
     * @param jQuery field
     * @param caption
     */
    validate_callback : function(field, caption) {
      var classes = field.attr('class').split(' ');
      var callback_function = '';
      
      for(var i = 0; i < classes.length; i++) {
        if(classes[i] == 'validate_callback') {
          if(classes[i + 1] != 'undefined') {
            callback_function = classes[i + 1];
            break;
          } // if
        } // if
      } // for
      
      //tiny_value_present
      
      if(window[callback_function] != 'undefined' && (typeof window[callback_function] == 'function')) {
        return window[callback_function](field, caption);
      } // if
      
      return 'Failed to validate ' + caption + ' field. Validator function (' + callback_function + ') is not defined!';
    }
    
  };
  
  /**
   * Go through form fields and validate their values
   *
   * @param jQuery for_form
   * @param boolean all_fields If true all fields will be validated. If not only 
   *   fields user focused will be validated
   * @param boolean
   */
  var validate_form = function(for_form, all_fields) {
    var result = true;
    
    if(typeof(forms[for_form.attr('id')]['validation']) == 'object') {
      for(var field_name in forms[for_form.attr('id')]['validation']) {
      
        if(all_fields || forms[for_form.attr('id')]['focused_fields'][field_name]) {
          var field = forms[for_form.attr('id')]['validation'][field_name]['field'];
          var field_caption = forms[for_form.attr('id')]['validation'][field_name]['caption'];
          var field_validators = forms[for_form.attr('id')]['validation'][field_name]['validators'];
          
          for(var validator in field_validators) {
            var validation_result = validators[validator](field, field_caption, for_form);
        
            if(typeof(validation_result) == 'string') {
              set_field_error(field, validation_result);
              result = false;
              break;
            } else {
              remove_field_error(field);
            } // if
          } // for
        } // if
        
      }  // if
    } // if
    
    return result;
  };
  
  /**
   * Set field error
   *
   * @param jQuery for_field
   * @param string error_message
   * @return void
   */
  var set_field_error = function(for_field, error_message) {
    var holder = find_field_holder(for_field);
    if(holder === false) {
      return;
    } // if
    
    holder.removeClass('error').find('p.errorField').remove();
    holder.addClass('error').prepend('<p class="errorField"><strong>' + error_message + '</strong></p>');
  };

  /**
   * Remove error div for a given field
   *
   * @param jQuery for_field
   * @return void
   */
  var remove_field_error = function(for_field) {
    var holder = find_field_holder(for_field);
    if(holder === false) {
      return;
    } // if
    holder.removeClass('error').find('p.errorField').remove();
  };
  
  /**
   * Return holder DIV for a given field
   *
   * @param jQuery for_field
   * @return jQuery or false if holder is not found
   */
  var find_field_holder = function(for_field) {
    var parent = for_field.parent();
      
    while(typeof(parent) == 'object') {
      if(parent[0].nodeName == 'FORM') {
        return;
      } // if
      if(parent[0].className.indexOf('ctrlHolder') >= 0) {
        return parent;
      } // if
      parent = jQuery(parent.parent());
    } // while
    
    return false;
  };
  
  /**
   * Mark a specific field as forcused
   *
   * @param jQuery for_form
   * @param jQuery for_field
   * @return void
   */
  var mark_as_focused = function(for_form, for_field) {
    if(typeof(forms[for_form.attr('id')]['focused_fields'][for_field.attr('name')]) == 'undefined') {
      forms[for_form.attr('id')]['focused_fields'][for_field.attr('name')] = true;
    } // if
    
    var holder = find_field_holder(for_field);
    if(typeof(holder) == 'object') {
      if(holder.attr('class').indexOf('focused') == -1) {
        for_form.find('.' + 'focused').removeClass('focused'); // everything else should lose focus
        holder.addClass('focused'); // and we should focus this element
      } // if
    } // if
  };
  
  /**
   * Get caption for a given field (extract it from label)
   *
   * @param jQuery for_field
   * @return string
   */
  var field_caption = function(for_field) {
    var field_id = for_field.attr('id');
    if(field_id) {
      var label = jQuery('label[@for=' + field_id + ']');
      if(typeof(label) == 'object') {
        var text = label.text();
        if(text.substr(0, 1) == '*') {
          return text.substring(2);
        } else {
          return text;
        } // if
      } // if
    } // if
    return 'Field';
  };
  
  /**
   * Prepare form ID for a given form if it is not already set by the user
   *
   * @param jQuery for_form
   * @return string
   */
  var get_form_id = function(for_form) {
    var form_id = for_form.attr('id');
      
    if(!form_id) {
      form_counter++;
      form_id = 'uniform_form_' + form_counter;
      for_form.attr('id', form_id);
    } // if
    
    return form_id;
  };
  
  /**
   * Attach onunload event that will show confirmation dialog if something is 
   * changed in the form
   *
   * @param jQuery for_form
   * @return void
   */
  var ask_on_leave = function(for_form) {
    var func = function() {
      if(!forms[for_form.attr('id')]['ok_to_submit']) {
        if(for_form.formSerialize() != forms[for_form.attr('id')]['initial_data']) {
          return 'All changes you have made to this page will be lost!';
        } // if
      } // if
    };
    
    var oldOnBeforeUnload = window.onbeforeunload;
    if(typeof(window.onbeforeunload) != 'function') {
      window.onbeforeunload = func;
    } else {
      window.onbeforeunload = function() {
        oldOnBeforeUnload();
        func();
      } // function
    } // if
  };
  
  /**
   * Public interface
   */
  return {
    
    /**
     * Initialize form
     *
     * @param jQuery form
     * @return void
     */
    init : function(form, settings) {
      var fields = form.find(settings.field_selector);
      var form_id = get_form_id(form);
      
      // Register form
      forms[form_id] = {
        'form'           : form,
        'fields'         : fields,
        'settings'       : settings,
        'initial_data'   : form.formSerialize(),
        'validation'     : {},
        'focused_fields' : {},
        'ok_to_submit'   : false
      };
      
      // Attach on unload behavior
      if(form.attr('class').indexOf('askOnLeave') != -1) {
        ask_on_leave(form);
      } // if
      
      // Walk through defined validators and maku sure that they do their trick
      for(validator in validators) {
        form.find('.' + validator).each(function() {
          var field = $(this);
          var field_name = field.attr('name');
          
          if(typeof forms[form_id]['validation'][field_name] != 'object') {
            forms[form_id]['validation'][field_name] = {
              'field'      : field,
              'caption'    : field_caption(field),
              'validators' : {}
            };
          } // if
          
          forms[form_id]['validation'][field_name]['validators'][validator] = validators[validator];
        });
      } // for
      
      fields.focus(function() {
        mark_as_focused(form, $(this));
      }).blur(function() {
        validate_form(form, false);
      });
      
      // Form submission handler
      form.submit(function() {
        var is_valid = validate_form(form, true);
        if(is_valid) {
          forms[form.attr('id')]['ok_to_submit'] = true;
          return true;
        } else {
          return false;
        } // if
      });
      
    } // init
    
  };
  
}();

/**
 * Register jQuery plugin
 */
jQuery.fn.uniform = function(settings) {
  settings = jQuery.extend({
    valid_class    : 'valid',
    invalid_class  : 'invalid',
    focused_class  : 'focused',
    holder_class   : 'ctrlHolder',
    field_selector : 'input, select, textarea'
  }, settings);
  
  return this.each(function() {
    UniForm.init($(this), settings);
  });
  
} // uniform
