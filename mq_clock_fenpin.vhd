LIBRARY  IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY  FENPIN  IS
PORT (CLK50: IN  STD_LOGIC;
	             CLK1HZ: OUT  STD_LOGIC;
	             CLKZOU: OUT  STD_LOGIC_VECTOR(1 DOWNTO 0));
END  ENTITY  FENPIN;
ARCHITECTURE  one  OF  FENPIN IS
SIGNAL  Q:  INTEGER RANGE 0 TO 49999999;
SIGNAL  Q1:  INTEGER RANGE 0 TO 49999999;		
SIGNAL  DATA: STD_LOGIC;						 
SIGNAL  P: STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
PROCESS(CLK50)											  
BEGIN        
IF  CLK50='1'  AND  CLK50' event  THEN          
 		IF  Q=49999999  THEN  Q<=0;            
                		ELSE         
               		IF  Q<25000000  THEN DATA<='1';                
	             			 ELSE  DATA<='0';             
	             			END  IF;             
	             			Q<=Q+1;          
END  IF;      
END  IF;
CLK1HZ<=DATA;     
END  PROCESS;
PROCESS(CLK50)									
BEGIN
IF  CLK50='1'  AND  CLK50'event  THEN          
 				IF  Q1=49999999  THEN  Q1<=0;            
 				ELSIF  Q1<12500000  THEN  P<="00";                
 				ELSIF  Q1>12500000  AND  Q1<25000000  THEN P<="01";
ELSIF  Q1>25000000  AND  Q1<37500000  THEN P<="10";
 				ELSIF  Q1>37500000  AND  Q1<49999999  THEN P<="11";           
 				END  IF;             
 		Q1<=Q1+1;          
END  IF;      
CLKZOU<=P;     
END  PROCESS;
END  ARCHITECTURE  one;
