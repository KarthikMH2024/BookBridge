# BookBridge

Book Management System
This is a simple web-based book management system developed using JSP (JavaServer Pages), JDBC (Java Database Connectivity), and MySQL.

## Features
Book Entry Form: Allows users to input book details such as book ID, title, author, price, condition, publication year, and seller contact information.
User Authentication: Provides a login page for users to authenticate using their roll number and password.
Database Interaction: Utilizes MySQL database to store book and user information.
Password Validation: Ensures that passwords meet certain criteria such as minimum length, presence of uppercase and lowercase letters, numbers, and special characters.
## Files
The project consists of the following files:

homepage.html: HTML file containing the book entry form.
index.jsp: JSP file for the book entry form.
login.html: HTML file for user authentication.
login.jsp: JSP file for user authentication.
styles.css: CSS file for styling the web pages.
Setup
To set up the project locally, follow these steps:

Clone the repository to your local machine.
Import the project into your preferred Java IDE.
Set up a MySQL database named "Books" with appropriate tables for storing book and user information.
Update the database connection details in the JSP files (index.jsp and login.jsp) to match your local MySQL configuration.
Deploy the project to a Servlet container such as Apache Tomcat.
Usage
Access the homepage (homepage.html) to input book details and submit them to the database.
Use the login page (login.html) to authenticate as a user.
Upon successful authentication, users will be redirected to the book entry form (index.jsp).



## Contributing

Shounak Das HU21CSEN101182
Abhishek Das HU21CSEN101883
M.H.Karthik HU21CSEN101366

License
This project is licensed under the MIT License. See the LICENSE file for details.
