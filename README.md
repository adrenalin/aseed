# AngularJS ui-router seed project

This repository is for checking out a seed for any new AngularJS project.

Base name is `newApp` for this application. `sed -i 's/newApp/myApp/g' app/js-src/*.coffee` or `sed -i 's/newApp/myApp/g' app/js/*.js` to change, depending on the wished language.

There are two state templates:

1. `Mainpage`
  * template: `app/partials/mainpage.html`
  * controller: `app/js-src/controllers/mainpage.coffee`
2. `Navigation`
  * template: `app/partials/navigation.html`
  * controller: `app/js-src/controllers/navigation.coffee`
