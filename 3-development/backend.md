Backend
=======

The application backend is accessible via `/backend` or by clicking on the **gear** icon, after you are logged in.

Only users with permission `backend_default` can access the backend dashboard.

### Access restricitions

By default all controllers of the application are only accessible to the `admin` user.

:bangbang: You can make a page or controller publicly available, when you add the corresponding permission to the `Public` role.

### Language Selection

You can switch the application language by choosing another language under the flag icon on the top right menu bar.


Settings
--------

The `settings` module provides an easy to use key/value-storage.


Pages
-----

The `pages` module is a manager for sitemap trees.

### Create a new page

- login and go to `pages` in the left sidebar in application backend
- create a root node, if there is none already
- select root-node and add a new page by clicking on the :heavy_plus_sign:
 - add a unique `Name ID` and set the `Menu name` which will be displayed in the navigation
 - select a route to define which action should be executed, eg. `site/index`
 - save new page
- visit page in application frontend

### Add a route

- login and go to `settings` in the left sidebar in application backend
- create or edit `pages`, key `availableRoutes`
- add one route per line, eg. `/docs`, which should render the default action of the default controller of the module
  registered as `docs`.
- save

