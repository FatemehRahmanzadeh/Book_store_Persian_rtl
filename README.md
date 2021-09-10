# Online book store using django
### features:
* User athentication using django-allauth
* 3 kind of user with different access level and permissions using django groups: Admin, Staff and customer.
* 5 apps are defined:
  * pages: Static pages like homepage, about and contact
  * orders: For discounts, orders, order details and price calculations
  * session_basket: manage customer orders before login and before submit.
  * accounts: For user managements and their addresses
  * books: All data about books category model
  * And maybe some other apps in the future
* Customer orders save in session before login or sign up.


 If users log in for the first time, an unique basket object will create automaticly for them to organize every user orders.
users can add item to basket, remove from it or update quantity of their order items Whether they are authenticated or not, based on ajax requests.
every user has a dashboard to manage addresses and personal informations. They can add or remove their addresses except address is related to an order or it is their default address. 

### if you like to run the project install requirements
```
pip install -r requirements.txt
```

### This code is not complete yet....
