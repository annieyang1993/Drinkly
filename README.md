DrinklyDash
----------------------

DrinklyDash is a clone of the DoorDash app where customers can login/signup, search for nearby cafes, filter cafes by item selection, and place their orders. 

Link to live website: http://drinkly-dash.herokuapp.com/#/

Features
--------------------
1. Secure frontend to backend user authentication using BCrypt.
2. Users are able to search for cafes by location.
3. Users are able to see nearby cafes via Google Maps.
4. Users are able to filter cafes by items offered (i.e. coffee, tea, boba, etc).
5. Users are able to see menu items at restaurants, increase/decrease quantity, and add to cart. 
6. Users can make purchases and view their shopping cart. 

<img width="1258" alt="Screen Shot 2022-01-26 at 8 43 25 AM" src="https://user-images.githubusercontent.com/82074442/151173795-c5b1e28d-7282-4b68-927d-1df77facd911.png">

1. Sign-in/Sign-up
<img width="1214" alt="Screen Shot 2022-01-26 at 8 39 25 AM" src="https://user-images.githubusercontent.com/82074442/151173678-e7930dc4-ef6d-4b66-ac31-be6a2bdc2cf5.png">
2. Browse local cafes
<img width="1256" alt="Screen Shot 2022-01-26 at 8 39 55 AM" src="https://user-images.githubusercontent.com/82074442/151173667-94abcee5-4684-4155-b4fe-9b27c12a6846.png">

3. Add items to cart
<img width="1264" alt="Screen Shot 2022-01-26 at 8 40 43 AM" src="https://user-images.githubusercontent.com/82074442/151173651-b2c80507-e332-4483-aefc-31c3de8f9ccc.png">

Technologies
-----------------------
The technologies used were:
1. React and Redux on the frontend
2. Ruby on Rails backend, with BCrypt authentication.
3. Heroku to deploy the website.
4. Google Maps API to allow users to locate cafes via map. 
5. Separate reducers and actions were setup for each state of the application.  

Additional Resources
--------------------------
1. Backend Routes: https://github.com/annieyang1993/DoorDashClone/wiki/Backend-Routes
2. Database Schema: https://github.com/annieyang1993/DoorDashClone/wiki/Database-Schema
3. Frontend Routes and Components: https://github.com/annieyang1993/DoorDashClone/wiki/Frontend-Routes-and-Components
4. MVP List: https://github.com/annieyang1993/DoorDashClone/wiki/MVP-List
5. Sample State: https://github.com/annieyang1993/DoorDashClone/wiki/Sample-State
