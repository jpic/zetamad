$(document).ready( function(  ) {
    $( 'form.uniForm input:first' ).focus(  );
    $( 'button.formset_add' ).click( function( e ) {
        e.preventDefault(  );
        var table = $(this).prev(  );
        var count = table.children('tbody').children('tr').length;
        var next = count;
        var tr = table.children('tbody').children('tr:first').clone();

        tr.find('input[type=checkbox]').attr('disabled', '');
        tr.find('input[type=button]').attr('disabled', '');
        tr.find('input[type=hidden]').val('');

        tr.find('textarea').each(function() {
            $(this).val('');
            $(this).attr('name', $(this).attr('name').replace(/\[0\]/, '['+next+']'));
            if ( $(this).attr( 'id' ) !== undefined ) {
                $(this).attr('id', $(this).attr('id').replace(/\[0\]/, '['+next+']'));
            }
        });

        tr.find('input').each(function() {
            if ( $(this).attr( 'name' ) !== undefined ) {
                $(this).attr('name', $(this).attr('name').replace(/\[0\]/, '['+next+']'));
            }

            if ( $(this).attr( 'id' ) !== undefined ) {
                $(this).attr('id', $(this).attr('id').replace(/\[0\]/, '['+next+']'));
            }
            
            if ( $(this).attr( 'type' ) != 'button' ) {
                $(this).val('');
            } else if ( $(this).hasClass( 'deleteRow' ) ) {
                $(this).click( function(  ) {
                    $(this).parents( 'tr' ).remove(  ); 
                })
            }
        });

        tr.appendTo(table)
    });


    $( 'input.deleteRow' ).click( function(  ) {
        $( this ).parents( 'tr' ).remove(  );
    })

    $( '.add-another' ).click(function(e) {
        e.preventDefault(  );
        showAddAnotherPopup( $( this ) );
    });
    
    // enable buttons
    $( 'button.formset_add' ).attr( 'disabled', '' );
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