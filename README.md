# README

An Image Gallery Website - Curate-A-Gallery.

* **Ruby version** = 3.3.4

* **Database** = PostgreSQL version 14

* **Rails version** = 8.0.2
---  
* **System dependencies**
  * **Gems (ontop of defaults)**  
  Annotaterb - Adds comments to models with description of database columns  
  Rspec - Testing suite  
  CanCanCan - for handling authorisation  
  Devise - for handling authentication  
  Shakapacker - for Handling of javascript and css  
  
  * **npm Libraries (that I have specifically installed)**  
  ImageMagik - for image processing  
  rails/ujs - for javascript loading without a full page refresh

* **Database creation**
  The website runs on postgreSQL (v14).
  ```sudo service postgresql start```
  Start the postgres server

* **Database initialization**
  ```bundle exec rails db:setup```
  Initalises and seeds the database.

* **How to run the test suite**
  ```bundle exec rspec spec```  
  This will run all tests.  
  To run a specific file, add the file path, starting with spec. E.g. ```bundle exec rspec spec/models/photo_spec.rb```

* **Setup Instructions**
  1. git clone the repo.
  2. Ensure you are located in the cloned repo directory (i.e. /WHERE_YOU_PLACED_THE_GIT_CLONE/ImageGallery)
  3. ```bundle install```
  4. ```npm install```
  5. ```bundle exec rails db:setup```
  6. ```bundle exec rails s```
  7. In a seperate terminal instance ```bin/shakapacker-dev-server```
  8. Go to localhost:3000 in the web browser of your choice
 
  Explanation:
  1. Obtains a local copy of the code
  2. Ensures commands run whilst being able to see all relevant files
  3. Installs all RubyGems
  4. Installs all npm packages
  5. Intialises and seeds the database
  6. Starts the puma server
  7. Starts the shakapacker server, for handling javascript. This MUST be done in a second terminal window, in the same root directory as point 6.
  8. The website is ran locally on localhost, on port 3000. If this is different, see the link point 6 generates and follow that link instead.
  Once set up, to run the website locally, execute points 6 and 7.
  
