SET SERVEROUTPUT ON;
SET VERIFY OFF;

Delete from difference_table@site_B;

CREATE OR REPLACE FUNCTION absolute_value(A IN NUMBER, B IN NUMBER)
RETURN NUMBER
IS 
distance NUMBER;

BEGIN
distance:=ABS(A - B);   
RETURN distance;
END absolute_value;
/

CREATE OR REPLACE TRIGGER DifferenceTab 
BEFORE INSERT 
ON difference_table
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Inserted 1 row in Difference Table');
END;
/

CREATE OR REPLACE PACKAGE predict_phone AS 
PROCEDURE nearestNeighbours(A IN NUMBER,B IN NUMBER,C IN NUMBER,D IN NUMBER,E IN NUMBER,
                             F IN NUMBER,G IN NUMBER,H IN NUMBER);
					 
PROCEDURE print_camera;
PROCEDURE print_ram;
PROCEDURE print_battery;
PROCEDURE print_price;

END predict_phone;
/

CREATE OR REPLACE PACKAGE Body predict_phone AS

PROCEDURE nearestNeighbours(A IN NUMBER,B IN NUMBER,C IN NUMBER,D IN NUMBER,E IN NUMBER,
                            F IN NUMBER,G IN NUMBER,H IN NUMBER)
IS	
BEGIN

For R in (select pid,absolute_value(ram , A) as df_ram, absolute_value(rom , B) as df_rom,
          absolute_value(primary_cam , C) as df_primary_cam, absolute_value(selfie_cam , D) as df_selfie_cam,
		  absolute_value(display_size , E) as df_display_size, absolute_value(battery , F) as df_battery,
		  absolute_value(charging_speed , G)as df_charging_speed, absolute_value(cpu_speed , H)as df_cpu_speed 
		  from specification@site_B) LOOP
 
insert into difference_table@site_B values(R.pid, R.df_ram, R.df_rom, R.df_primary_cam, R.df_display_size,
										   R.df_selfie_cam, R.df_battery,
										   R.df_charging_speed, R.df_cpu_speed);


End Loop;	

END nearestNeighbours;

--For camera
PROCEDURE print_camera
IS	
loopCount int :=0 ;
BEGIN 
For R in (select * from difference_table@site_B natural join 
				smartphone natural join specification@site_B order by df_primary_cam) LOOP

loopCount:= loopCount+1;
DBMS_OUTPUT.PUT_LINE('Smart Phone: '||R.brand||''||R.model||' Primary Camera: '||R.primary_cam||'     Price: '||R.Price||'   '||R.shop);

IF loopCount = 5 THEN
EXIT;
END IF;

End Loop; 
END print_camera;

--For ram
PROCEDURE print_ram
IS	

loopCount int :=0 ;
BEGIN 
For R in (select * from difference_table@site_B natural join 
				smartphone natural join specification@site_B order by df_ram) LOOP

loopCount:= loopCount+1;
DBMS_OUTPUT.PUT_LINE('Smart Phone: '||R.brand||''||R.model||'   RAM: '||R.ram||'      Price: '||R.Price||'   '||R.shop);

IF loopCount = 5 THEN
EXIT;
END IF;

End Loop; 
END print_ram;

--For battery
PROCEDURE print_battery
IS	

loopCount int :=0 ;
BEGIN 
For R in (select * from difference_table@site_B natural join 
				smartphone natural join specification@site_B order by df_battery) LOOP

loopCount:= loopCount+1;
DBMS_OUTPUT.PUT_LINE('Smart Phone: '||R.brand||''||R.model||' Battery: '||R.battery||'     Price: '||R.Price||'   '||R.shop);

IF loopCount = 5 THEN
EXIT;
END IF;

End Loop; 
END print_battery;

--for price
PROCEDURE print_price
IS	

loopCount int :=0 ;
BEGIN 
For R in (select * from difference_table@site_B natural join 
				smartphone natural join specification@site_B order by price) LOOP

loopCount:= loopCount+1;
DBMS_OUTPUT.PUT_LINE('Smart Phone:   '||R.brand||''||R.model||'     '||R.Price||'   '||R.shop);

IF loopCount = 5 THEN
EXIT;
END IF;

End Loop; 
END print_price;
END predict_phone;
/	



ACCEPT P NUMBER PROMPT "Enter your preferable RAM: "
ACCEPT Q NUMBER PROMPT "Enter your preferable ROM: "
ACCEPT R NUMBER PROMPT "Enter your preferable Primary Camera: "
ACCEPT S NUMBER PROMPT "Enter your preferable Selfie Camera: "
ACCEPT T NUMBER PROMPT "Enter your preferable Display Size in Inches: "
ACCEPT U NUMBER PROMPT "Enter your preferable Battery: "
ACCEPT V NUMBER PROMPT "Enter your preferable Charging Speed: "
ACCEPT W NUMBER PROMPT "Enter your preferable CPU Speed:"

ACCEPT X NUMBER PROMPT "Enter Your Choice for Sorting 1.Primary Camera 2.RAM 3.Battery 4.Price: "

DECLARE

A number:=&P;
B number:=&Q;
C number:=&R;
D number:=&S;
E number:=&T;
F number:=&U;
G number:=&V;
H number:=&W;
I number:=&X;

invalid_RAM EXCEPTION;
invalid_ROM EXCEPTION;
invalid_PCam EXCEPTION;
invalid_SCam EXCEPTION;
invalid_Display EXCEPTION;
invalid_Battery EXCEPTION;
invalid_ChargingSpeed EXCEPTION;
invalid_CPUSpeed EXCEPTION;

BEGIN

IF A>16 OR A<0 THEN
RAISE invalid_RAM;
ELSIF B>256 OR B<0  THEN
RAISE invalid_ROM;
ELSIF C>80 OR C<2  THEN
RAISE invalid_PCam;
ELSIF D>20 OR D<2  THEN
RAISE invalid_SCam;
ELSIF E>8.00 OR E<3.00  THEN
RAISE invalid_Display;
ELSIF F>6000 OR F<0   THEN
RAISE invalid_Battery;
ELSIF G>65 OR G<0  THEN
RAISE invalid_ChargingSpeed;
ELSIF H>4.00 OR H<0.00  THEN
RAISE invalid_CPUSpeed;
END IF; 

DBMS_OUTPUT.PUT_LINE('The Phones are: ');	
predict_phone.nearestNeighbours(A,B,C,D,E,F,G,H);

CASE (I)
	WHEN 1 THEN
		DBMS_OUTPUT.PUT_LINE('Suggested Phone according to Primary Camera: ');	
        predict_phone.print_camera;
	WHEN 2 THEN
		DBMS_OUTPUT.PUT_LINE('Suggested Phone according to RAM: ');	
        predict_phone.print_ram;
	WHEN 3 THEN
		DBMS_OUTPUT.PUT_LINE('Suggested Phone according to Battery Power: ');	
        predict_phone.print_battery;
	WHEN 4 THEN
		DBMS_OUTPUT.PUT_LINE('Suggested Phone according to Price: ');	
        predict_phone.print_price;
	ELSE
		DBMS_OUTPUT.PUT_LINE('YOU DONT HAVE A CHOICE');
	
END CASE;
	

EXCEPTION
	WHEN invalid_RAM THEN
		DBMS_OUTPUT.PUT_LINE('Invalid RAM');
	WHEN invalid_ROM THEN
		DBMS_OUTPUT.PUT_LINE('Invalid ROM');
	WHEN invalid_PCam THEN
		DBMS_OUTPUT.PUT_LINE('Invalid Primary Camera Resulation');	
	WHEN invalid_SCam THEN
		DBMS_OUTPUT.PUT_LINE('Invalid Selfie Camera Resulation');	
	WHEN invalid_Display THEN
		DBMS_OUTPUT.PUT_LINE('Invalid Display Size');
	WHEN invalid_Battery THEN
		DBMS_OUTPUT.PUT_LINE('Invalid Battery Power');
	WHEN invalid_ChargingSpeed THEN
		DBMS_OUTPUT.PUT_LINE('Invalid Charging Speed');
	WHEN invalid_CPUSpeed THEN
		DBMS_OUTPUT.PUT_LINE('Invalid CPU Clock Speed');
END;
/


commit;


