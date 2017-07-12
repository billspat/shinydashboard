/* global Shiny */

// controlMenuOutputBinding
// ------------------------------------------------------------------
// Based on Shiny.htmlOutputBinding, but instead of putting the result in a
// wrapper div, it replaces the origin DOM element with the new DOM elements,
// copying over the ID and class.
var controlMenuOutputBinding = new Shiny.OutputBinding();
$.extend(controlMenuOutputBinding, {
  find: function(scope) {
    return $(scope).find('.shinydashboard-controlmenu-output');
  },
  onValueError: function(el, err) {
    Shiny.unbindAll(el);
    this.renderError(el, err);
  },
  renderValue: function(el, data) {
    Shiny.unbindAll(el);

    var html;
    var dependencies = [];
    if (data === null) {
      return;
    } else if (typeof(data) === 'string') {
      html = data;
    } else if (typeof(data) === 'object') {
      html = data.html;
      dependencies = data.deps;
    }

    var $html = $($.parseHTML(html));

    // Convert the inner contents to HTML, and pass to renderHtml
    Shiny.renderHtml($html.html(), el, dependencies);

    // Extract class of wrapper, and add them to the wrapper element
    el.className = 'shinydashboard-controlmenu-output shiny-bound-output ' +
                   $html.attr('class');

    Shiny.initializeInputs(el);
    Shiny.bindAll(el);
   //  ensureActivatedTab(); // eslint-disable-line
  }
});
Shiny.outputBindings.register(controlMenuOutputBinding,
                              "shinydashboard.controlMenuOutputBinding");
