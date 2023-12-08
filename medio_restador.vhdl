library ieee;
use ieee.std_logic_1164.all;

entity DATOS_MEDIO_RESTADOR is port
(
    A_MITAD_RESTA: in std_logic;
    B_MITAD_RESTA: in std_logic;
    RESTA: out std_logic;
    POUT: out std_logic
);
end DATOS_MEDIO_RESTADOR;

architecture MEDIO_RESTADOR of DATOS_MEDIO_RESTADOR is begin
    RESTA <= A_MITAD_RESTA xor B_MITAD_RESTA;
    POUT <= (not A_MITAD_RESTA) and B_MITAD_RESTA;
end MEDIO_RESTADOR;
