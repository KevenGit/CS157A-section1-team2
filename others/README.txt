There are two directories (tomcat-lib and java-lib) and a property file containing database connection information (e_vendor_data_test.properties).

1. tomcat-lib:
These are libraries that are used in the JSP files for file upload, password encryptions. It also includes cs157a.jar which is a utility to access the database. The source code of this can be found in java-lib folder. 
These jars should be copied and pasted under your tomcat/lib/ directory for sharing by all webapps. Make sure restart tomcat for the jars to take effect. 

2. java-lib:
This is the java library I implemented as utilities to access the database. We can continue to expand this to our needs. If you happen to make changes here, make sure to export the java project as a jar and copy it to tomcat/lib/ directory. 

3. e_vendor_data_test.properties:
This file contains information for accessing your database. See sample usages in the JSP (e.g. register.jsp).
Please update the db_name to your database's name and url to include your db_name. Please also update db_user and db_password as well.