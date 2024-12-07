# Vector Bike

Running on
* Web (Heroku) https://vectorbike-ecfe326f48ab.herokuapp.com/

Run Locally

* Navigate to the repository directory, and install necessary gems with bundle install.
* Then, run rails db:reset to reconfigure the database. Run rails db:migrate to ensure the schema is fully set up (db:reset does not always ensure this).
* Run rake initial_import to load in the CSV data and generate pseudo-random data for bike charge, bike status, and station capacity.
* Then, launch the web server by running rails s, and navigate to http://localhost:3000/ in a browser.

Developed By
* Molly Neu
* Molly Daniel
* Skye Worster
* Emma Ruckle
* Sydney Weisberg