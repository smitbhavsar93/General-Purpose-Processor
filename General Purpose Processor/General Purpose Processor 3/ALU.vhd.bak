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

signal Reg1, Reg2, Result : unsigned(7 downto 0):=(others =>'0');
signal Reg4 : unsigned(0 to 7);

begin
	Reg1 <= A;
	Reg2 <= B;
	
process(Clock, OP)
	begin
		if(rising_edge(Clock)) THEN
			case OP is

				WHEN "0000000000000001" =>
					Result <= (Reg1 + Reg2);
					Neg <= '0';

				WHEN "0000000000000010" =>
					IF (Reg1 > Reg2) THEN
						Result <= (Reg1 - Reg2);
						Neg <= '0';

					ELSIF (Reg1 < Reg2) THEN
						Result <= (NOT (Reg1 - Reg2) + 1);
						Neg <= '1';
					END IF;

				WHEN "0000000000000100" =>
					Result <= (NOT Reg1);
					Neg <= '0';


				WHEN "0000000000001000" =>
					Result <= (Reg1 NAND Reg2);
					Neg <= '0';


				WHEN "0000000000010000" =>
					Result <= (Reg1 NOR Reg2);
					Neg <= '0';


				WHEN "0000000000100000" =>
					Result <= (Reg1 AND Reg2);
					Neg <= '0';

				WHEN "0000000001000000" =>
					Result <= (Reg1 OR Reg2);
					Neg <= '0';


				WHEN "0000000010000000" =>
					Result <= (Reg1 XOR Reg2);
					Neg <= '0';


				WHEN "0000000100000000" =>
					Result <= (Reg1 XNOR Reg2);
					Neg <= '0';


				WHEN OTHERS =>
					Result <= "00000000";
			end case;
		end if;
end process;

R <= Result (7 downto 0);

end calculation;