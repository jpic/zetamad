$(document).ready( function(  ) {
    $( 'form.uniForm input:first' ).focus(  );

    var next = 1000;

    $( 'button.formset_add' ).click( function( e ) {
        e.preventDefault(  );
        var table = $(this).prev(  );
        if ( table.get(0).tagName != 'TABLE' ) {
            table = table.prev();
        }

        var template;
        var templateDiv = $(this).next();
        if ( templateDiv.get(0).tagName != 'DIV' && !templateDiv.hasClass('formset_template') ) {
            templateDiv = templateDiv.next();
        }

        templateDiv.each(function() {
            template = $(this).html();
        })
        // strip comment tags
        template = template.substr( 6, template.indexOf( '-->' ) - 6 );

        table.find('input[type=button]').each(function() {
            var key = parseInt( $(this).attr('name') );
            if ( key >= next ) {
                next = key + 1;
            }
        });
        var tr = $(template);

        tr.find('input[type=checkbox]').attr('disabled', '');
        tr.find('input[type=button]').attr('disabled', '');
        tr.find('input[type=hidden]').val('');

        tr.find('textarea, input, button, select').each(function() {
            if ( $(this).attr( 'name' ) !== undefined ) {
                $(this).attr('name', $(this).attr('name').replace(/voidKey/, next));
            }

            if ( $(this).attr( 'id' ) !== undefined ) {
                $(this).attr('id', $(this).attr('id').replace(/voidKey/, next));
            }

            if ( $(this).attr( 'type' ) != 'button' ) {
                $(this).val('');
            } else if ( $(this).hasClass( 'deleteRow' ) ) {
                $(this).click( function(  ) {
                    $(this).parents( 'tr' ).remove(  );
                })
            }
        });

        tr.appendTo(table);
        table.tableDnD();
    });


    $( 'input.deleteRow' ).click( function(  ) {
        $( this ).parents( 'tr' ).remove(  );
    })

    $( 'input.deleteRow' ).attr( 'disabled', '' );

    $( '.add-another' ).click(function(e) {
        e.preventDefault(  );
        showAddAnotherPopup( $( this ) );
    });
    
    // enable buttons
    $( 'button.formset_add' ).attr( 'disabled', '' );

    $( 'table.multipleField' ).tableDnD();
    $( 'table.formset' ).tableDnD();

});

/* Credit: django.contrib.admin (BSD) */

function showAddAnotherPopup(triggeringLink) {
    var name = triggeringLink.attr( 'id' ).replace(/^add_/, '');
    name = id_to_windowname(name);
    href = triggeringLink.attr( 'href' );

    if (href.indexOf('?') == -1) {
        href += '?popup=1';
    } else {
        href += '&popup=1';
    }

    href += '&winName=' + name;
    
    var win = window.open(href, name, 'height=500,width=800,resizable=yes,scrollbars=yes');
    win.focus();
    
    return false;
}
   
function dismissAddAnotherPopup(win, newId, newRepr) {
    // newId and newRepr are expected to have previously been escaped by
    // django.utils.html.escape.
    newId = html_unescape(newId);
    newRepr = html_unescape(newRepr);
    var name = windowname_to_id(win.name);
    var elem = document.getElementById(name);

    if (elem) {
        if (elem.nodeName == 'SELECT') {
            var o = new Option(newRepr, newId);
            elem.options[elem.options.length] = o;
            o.selected = true;
        } else if (elem.nodeName == 'INPUT') {
            if (elem.className.indexOf('vManyToManyRawIdAdminField') != -1 && elem.value) {
                elem.value += ',' + newId;
            } else {
                elem.value = newId;
            }
        }
    } else {
        console.log("Could not get input id for win " + name);
    }
    
    win.close();
}

function html_unescape(text) {
 // Unescape a string that was escaped using django.utils.html.escape.
    text = text.replace(/&lt;/g, '<');
    text = text.replace(/&gt;/g, '>');
    text = text.replace(/&quot;/g, '"');
    text = text.replace(/&#39;/g, "'");
    text = text.replace(/&amp;/g, '&');
    return text;
}

// IE doesn't accept periods or dashes in the window name, but the element IDs
// we use to generate popup window names may contain them, therefore we map them
// to allowed characters in a reversible way so that we can locate the correct
// element when the popup window is dismissed.
function id_to_windowname(text) {
    text = text.replace(/\./g, '__dot__');
    text = text.replace(/\-/g, '__dash__');
    text = text.replace(/\[/g, '__braceleft__');
    text = text.replace(/\]/g, '__braceright__');
    return text;
} 


function windowname_to_id(text) {
    return text;
}