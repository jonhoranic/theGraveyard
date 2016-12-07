function init() {
    var fieldset = document.getElementsByTagName('input');
    for (var i = 0; i < fieldset.length; i++) {
        fieldset[i].addEventListener('click', toggle, false);
    }
}

function toggle() {
    var id = this.id;
    switch (id) {
        case "persontoggle": {
            var person = document.getElementsByClassName("person");
            for (var i = 0; i < person.length; i++) {
                person[i].classList.toggle("on")
            }
        };
        break;
    }
  }

window.onload = init;
/* 2016-11-26 ebb: This is configured properly, but is just a start and can't work because the HTML file is missing the checkboxes that you
 * need for this to activate! There are no elements in your HTML file with a tag named <input>, and that <input> element is part of a set of
 * checkboxes. If you DID have an <input type="checkbox" id="persontoggle">, you'd need to check your spelling here, because you've got a 
 * typo for "perosntoggle" instead of "persontoggle". Typically you'd set MULTIPLE checkboxes to toggle different kinds of things, but if you only
 * have ONE, you don't really need to alternate cases. I suspect you didn't finish this one, because your CSS defines a toggle case for 
 * <span class="place"> but not <span class="person">. 
 * We'd really like to see you configure this properly, so we'd like you to REVISE and RESUBMIT this assignment for a higher score. 
 * Score: 5/10 because unfinished.
 *   */