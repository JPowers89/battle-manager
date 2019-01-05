$( "#combatants-list" )
  .sortable( { handle: ".handle" } )
  .selectable( { handle: ".combatants-list-item", cancel: ".handle" } )
  .find( "li" )
      .addClass( "ui-corner-all" )
      .prepend( "<div class='handle'><span class='ui-icon ui-icon-carat-2-n-s'></span></div>")
      .bind( "mousedown", function( e ) {
        e.metaKey = true;
      });
