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
					Result <= "00000000";
					Neg <= '0';

				WHEN "0000000000000010" =>
					Result <= "00000001";
					Neg <= '0';

				WHEN "0000000000000100" =>
					Result <= "00000001";
					Neg <= '0';


				WHEN "0000000000001000" =>
					Result <= "00000000";
					Neg <= '0';


				WHEN "0000000000010000" =>
					Result <= "00000000";
					Neg <= '0';


				WHEN "0000000000100000" =>
					Result <= "00000000";
					Neg <= '0';

				WHEN "0000000001000000" =>
					Result <= "00000000";
					Neg <= '0';


				WHEN "0000000010000000" =>
					Result <= "00000001";
					Neg <= '0';


				WHEN "0000000100000000" =>
					Result <= "00000000";
					Neg <= '0';


				WHEN OTHERS =>

			end case;
		end if;
end process;

R <= Result (7 downto 0);

end calculation;