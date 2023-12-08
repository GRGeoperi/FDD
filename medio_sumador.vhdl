library ieee;
use ieee.std_logic_1164.all;

entity DATOS_MEDIO_SUMADOR is port
(
    A_MITAD_SUMA: in std_logic;
    B_MITAD_SUMA: in std_logic;
    SUMA: out std_logic;
    COUT: out std_logic
);
end DATOS_MEDIO_SUMADOR;

architecture MEDIO_SUMADOR of DATOS_MEDIO_SUMADOR is begin
    SUMA <= A_MITAD_SUMA xor B_MITAD_SUMA;
    COUT <= A_MITAD_SUMA and B_MITAD_SUMA;
end MEDIO_SUMADOR;
