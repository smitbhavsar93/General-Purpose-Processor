library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity ALU is
	port( Clock : in std_logic;
			A,B : in unsigned(7 downto 0);
			OP : in unsigned(15 downto 0);
			Neg : out std_logic;
			R : out unsigned(7 downto 0));
	end ALU;

architecture calculation of ALU is 

signal Reg1, Reg2, temp, Result : unsigned(7 downto 0):=(others =>'0');
signal Reg4 : unsigned(0 to 7);

begin
	Reg1 <= A;
	Reg2 <= B;
	temp <= "00001001";
	
process(Clock, OP)
	begin
		if(rising_edge(Clock)) THEN
			case OP is
				
				WHEN "0000000000000000" => 
					Result <= null;
					Neg <= '0';
				
				-- Decrement B by 9
				WHEN "0000000000000001" => 	-- works (12)
					Result <= (Reg2 - temp);
					Neg <= '0';
				
				-- Swap lower and upper bits of B
				WHEN "0000000000000010" =>		-- works (81)
						Result <= (Reg2(3 downto 0) & Reg2 (7 downto 4));
						Neg <= '0';
				
				-- Shift A left by 2 bits, input bit = 0
				WHEN "0000000000000100" =>		-- works (52)
						Result <= (Reg1(5 downto 0) & "00");
						Neg <= '0';
				
				-- Produce output of A NAND B
				WHEN "0000000000001000" => 	-- works (250)
					Result <= (Reg1 NAND Reg2);
					Neg <= '0';
				
				-- Find the Max(A, B)
				WHEN "0000000000010000" =>		-- works (77)
					IF (Reg1 > Reg2) THEN
						Result <= (Reg1);
						Neg <= '0';
						
					ELSIF (Reg2 > Reg1) THEN
						Result <= (Reg2);
						Neg <= '0';
						
					ELSE
						Result <= (Reg1);
						Neg <= '0';
					END IF;
				
				-- Invert even bits of B
				WHEN "0000000000100000" => 	-- works (64)
					Result <= (Reg2(7) & (NOT Reg2(6)) & Reg2(5) & (NOT Reg2(4)) & Reg2(3) & (NOT Reg2(2)) & Reg2(1) & (NOT Reg2(0)));
					Neg <= '0';
				
				-- Produce null output
				WHEN "0000000001000000" => 	-- works (no output)
					Result <= null;
					Neg <= '0';

				-- Replace upper 4 bits of B by upper 4 of A
				WHEN "0000000010000000" => 	--works (69)
					Result <= (Reg1(7 downto 4) & Reg2 (3 downto 0));
					Neg <= '0';
				
				-- Display A on output
				WHEN "0000000100000000" => 	--works (77)
					Result <= (Reg1);
					Neg <= '0';
				
				WHEN OTHERS =>
					
			end case;
		end if;
end process;

R <= Result (7 downto 0);

end calculation;