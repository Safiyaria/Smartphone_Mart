drop database link site_B;

create database link site_B
 connect to system identified by "12345"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
         (HOST = 172.20.10.3)
         (PORT = 1521))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;