# Smartphone_Mart

Introduction: 
It is a system which will help the user by providing necessary information for selecting a 
smartphone. In this project various questions about smartphone hardware specifications 
will be set from the server, and users can answer those questions on the site. Users will 
be given recommendations for phones based on their responses also they can find 
shops which have those phones. 

Software: 
Oracle Database 10g Express Edition

Language: 
Oracle PL/SQL Procedure Language

Functionality of the Code:
Procedures: 
nearestNeighbours(): This procedure is for inserting values in the difference table at site
print_camera(): This procedure is for selecting the desired mobile phones according 
their camera.
print_ram(): This procedure is for selecting the desired mobile phones according their 
ram.
print_battery():This procedure is for selecting the desired mobile phones according their 
battery.
print_price(): This procedure is for selecting the desired mobile phones according their 
price.
Function: 
absolute_value(): we used absolute value because distance cannot be negative.
Trigger: 
DifferenceTab(): This will trigger when a row is added in the difference table

Conclusion: 
In this project questionnaires and the algorithm will be set on the server and from site 
user can’t change this part. Distributed database will allow us to achieve this goal. Here 
the site will take the input and the server will process the input to find the output
