-------------------------------------------------------------------------------
-- Generic multiplexer
-- Authors: Javier Falcó Díez 797613 y Jorge Hernando Zueco 841766
-- Last modified: 13/02/2025
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux2_1 is
    Generic(DATA_LENGTH: natural);-- number of bits of the inputs
    port(Ctrl: in std_logic_vector(1 downto 0);
         Din0:  in std_logic_vector(DATA_LENGTH - 1 downto 0);
         Din1:  in std_logic_vector(DATA_LENGTH - 1 downto 0);
         Dout: out std_logic_vector(DATA_LENGTH - 1 downto 0));
end mux2_1;

architecture Behavioral of mux2_1 is
begin
Dout <= Din0 when (Ctrl ="00") else Din1;

end Behavioral;


