# README

This demo cab booking app is built using RAILS 6 and postgresql as the DB.

Steps to run:

1. clone the application and cd into the app.

2. bundle

3. make sure you have the database.yml creds according your local machine.

4. rake db:create
   rake db:migrate
   rake db:seed

5. Once the above steps are successful, you can start testing in Postman, since this a api only app.

6. To get the list of all Cabs.

   GET localhost/cabs

7. To book a nearest Pink Cab

   POST /cabs/book-nearest

   params:

   {
     "lat" : 1,
     "long" : 1
     "customer_id" : 1
     "color" : "pink"
   }

 8. To start a trip.

    POST /trips/1/start

    {
      "lat":1,
      "long": 1
    }

 9. TO END A TRIP.

    POST /trips/1/end    

    {
      "lat":1,
      "long": 1
    }            
