# CS157A-section1-team2
Project repository for CS157A-01 Team 2

File Structure of Repository:
1. eVendor-eclipse - This is an Eclipse Dynamic Web Project that contains the source code.
2. evendor-test-script.sql - MySQL scripts for generating a database to prototype this app.
3. eVendor.war - A WAR file that will be used to deploy this app on Tomcat.

Instructions on Deploying and Using Web Application:

Requirements:
Clone this repository to your local machine.

You MUST first run 'evendor-test-script.sql' in MySQL Workbench to create the tables and data
that this application uses. This application also assumes that the connection is on localhost
at port 3306 and the account used has username="root" and password="root".

Instructions on Deploying in Tomcat:
1. Start your Tomcat server and navigate to the homepage (localhost:8080).
2. Click on 'Manager App' on the right hand side to use Tomcat's Web Application Manager.
3. On this page, there should be a section titled 'Deploy' and under that, a subsection titled 'WAR file to deploy'.
4. Click on 'Choose File' and upload 'eVendor.war' from this repository on your local machine and click 'Deploy' to deploy.
5. At this point, you may have to restart your Tomcat or refresh the page, but under the section 'Applications' in the same page, there should be an entry for '/eVendor'.
6. Check that running is true and click on the path to use the application.


Instructions for Deploying through Eclipse:
1. In Eclipse, import ONLY the folder 'eVendor-eclipse'. Eclipse should configure the project
	accordingly.
2. Right click the project in Project Explorer -> Run As -> Run on Server
3. Follow the prompts and the web page should be displayed.