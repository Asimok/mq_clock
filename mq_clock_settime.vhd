LIBRARY  IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
ENTITY  SETTIME  IS
PORT (CLK: IN  STD_LOGIC;
	           RST: IN  STD_LOGIC;
	           SETH: IN  STD_LOGIC;
	           SETM: IN  STD_LOGIC;
 HOUR2,HOUR1,MIN2,MIN1,SEC2,SEC1: BUFFER  STD_LOGIC_VECTOR(3 DOWNTO 0);
	            ZOUMA: OUT  STD_LOGIC);
END  ENTITY  SETTIME;
ARCHITECTURE  one  OF  SETTIME  IS
BEGIN
PROCESS(CLK,RST,SETH,SETM)  BEGIN		
           IF  RST='0'  THEN 										
	        	HOUR2<="0000";
	        	HOUR1<="0000";
	        	MIN2<="0000";
	        	MIN1<="0000";
	        	SEC2<="0000";
	        	SEC1<="0000";
ELSIF  (CLK'EVENT  AND  CLK='1')  THEN 
	           IF  SETH='1'  THEN 									
		        	IF  HOUR1="1001"  THEN 
			    	   HOUR1<="0000";HOUR2<=HOUR2+1;					
		        	 ELSIF  (HOUR2="0010"  AND  HOUR1="0011")  THEN 
			     	          HOUR1<="0000";HOUR2<="0000";
		        	  ELSE  HOUR1<=HOUR1+1;
		            END  IF; 
	           ELSIF  SETM='1'  THEN 								
		         		IF  MIN1="1001"  THEN 
			               MIN1<="0000";MIN2<=MIN2+1;
		            	ELSIF  (MIN2="0101"  AND  MIN1="1001")  THEN 
			                MIN1<="0000";MIN2<="0000";
		            	ELSE  MIN1<=MIN1+1;
		            	END  IF;
	                	ELSIF  SEC1="1001"   THEN						
		                    SEC1<="0000";
		               	IF  SEC2="0101"  THEN 
			               	SEC2<="0000";
			           	IF  MIN1="1001"  THEN 
				            	MIN1<="0000";
				        	IF  MIN2="0101"  THEN
					         MIN2<="0000";
					 		IF  HOUR1="1001"  THEN 
						      HOUR1<="0000";
						      HOUR2<=HOUR2+1;
					 		ELSIF  (HOUR2="0010"  AND  
HOUR1="0011")  THEN
						       HOUR1<="0000";
						       HOUR2<="0000";
					       ELSE  HOUR1<=HOUR1+1;
					       END  IF;
				          ELSE  MIN2<=MIN2+1;
				          END  IF;
			             ELSE  MIN1<=MIN1+1;
			             END  IF;
		                ELSE  SEC2<=SEC2+1;
		                END  IF;
	                    ELSE  SEC1<=SEC1+1;
	                   END  IF;
END  IF;
ZOUMA<='0';									
     IF  MIN2="0101"  AND  MIN1="1001"  THEN		
	                 IF  SEC2="0101"  AND  SEC1>"0000" THEN 	
		                 ZOUMA<='1';								 
	                 END  IF;
END  IF;
END  PROCESS;
END  ARCHITECTURE one;

