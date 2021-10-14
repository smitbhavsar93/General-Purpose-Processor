library ieee;
use ieee.std_logic_1164.all;
entity fsm is 
    port 
     ( 
         clk              :in std_logic;
         data_in       :in std_logic;
         reset          :in std_logic;
         student_id    :out std_logic_vector(3 DOWNTO 0);
         current_state :out std_logic_vector(3 DOWNTO 0));
    end entity;
    
    architecture fsm of fsm is
        type state_type is(s0,s1,s2,s3,s4,s5,s6,s7,s8);
        
        signal yfsm: state_type;
    begin 
        process (clk, reset)
        begin 
            if reset = '1' then 
                yfsm <= s0;
            elsif (clk'EVENT AND clk = '1') then
            
                case yfsm is
                    when s0=> 
                        IF data_in = '0' THEN
                            yfsm <=s0;
                        ELSE
                            yfsm <=s1;
                        END IF;
                    when s8=> 
                        IF data_in = '0' THEN
                            yfsm <=s8;
                        ELSE
                            yfsm <=s0;
                        END IF;
                    when s6=> 
                        IF data_in = '0' THEN
                            yfsm <=s6;
                        ELSE
                            yfsm <=s7;
                        END IF;
                    when s4=> 
                        IF data_in = '0' THEN
                            yfsm <=s4;
                        ELSE
                            yfsm <=s5;
                        END IF;
                    when s2=> 
                        IF data_in = '0' THEN
                            yfsm <=s2;
                        ELSE
                            yfsm <=s3;
                        END IF;
                    when s7=> 
                        IF data_in = '0' THEN
                            yfsm <=s7;
                        ELSE
                            yfsm <=s8;
                        END IF;
                    when s5=> 
                        IF data_in = '0' THEN
                            yfsm <=s5;
                        ELSE
                            yfsm <=s6;
                        END IF;
                    when s3=> 
                        IF data_in = '0' THEN
                            yfsm <=s3;
                        ELSE
                            yfsm <=s4;
                        END IF;
                    when s1=> 
                        IF data_in = '0' THEN
                            yfsm <=s1;
                        ELSE
                            yfsm <=s2;
                        END IF;
                end case;
            end if;
        end process;
        
        process (yfsm, data_in)
        begin
            case yfsm is
                when s0=> 
                    student_id    <= "0101";
                    current_state <= "0000";
                when s1=> 
                    student_id    <= "0000";
                    current_state <= "0001";
                when s2=> 
                    student_id    <= "0000";
                    current_state <= "0010";
                when s3=> 
                    student_id    <= "1001";
                    current_state <= "0011";
                when s4=> 
                    student_id    <= "0101";
                    current_state <= "0100";
                when s5=> 
                    student_id    <= "0111";
                    current_state <= "0101";
                when s6=> 
                    student_id    <= "0111";
                    current_state <= "0110";
                when s7=> 
                    student_id    <= "0010";
                    current_state <= "0111";
                when s8=> 
                    student_id    <= "0001";
                    current_state <= "1000";
            end case;
        end process;
        end fsm;


