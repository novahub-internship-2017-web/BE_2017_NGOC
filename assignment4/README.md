# Book Management
This project is written by Bui Lam Quang Ngoc, using Java programming language and Spring Boot (reply on MVC architecture)
This project provide for user a website to manage books.
The website have two type of users (admin, user, guest). The website has one and only one admin
* admin role :
  > Login  
  > Manage all of users (lock and unlock user, change profile of user)  
  > Manage all of books
  > change admin's password.  
  > change admin's profile  
  > logout  
* user role :
  > Login  
  > List and search their books.  
  > Create new book  
  > Edit their books  
  > Change password  
  > Change profile  
  > Logout    
* guest :  
  > search all books which are enabled
## Guide start project  
Clone this repository using:  
```
git clone https://github.com/novahub-internship-2017-web/BE_2017_NGOC
```  
Open folder assignment4 or run command line :  
```
cd assignment4  
```
Run file script db.sql  
Run project by command line :
```
mvn install clean && mvn spring-boot:run
```
### Note   
Users:
* role admin
  > User: admin@gmail.com  
  > Password: password
* role user:  
  > User: ngoc@gmail.com  
  > Password: password  
  <-------------------------->  
  > User: hai@gmail.com  
  > Password: password  
  <-------------------------->  
  > User: huong@gmail.com  
  > Password: password  
  <-------------------------->  
  > User: hung@gmail.com  
  > Password: password

