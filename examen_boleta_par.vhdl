library ieee;
use ieee.std_logic_1164.all;

-- Escribir el código VHDL a partir de una tabla de verdad.
-- Sentencias tipo secuenciales por ser boleta par.

entity DATOS is port
(
    -- 4 bits para la entrada
    BINARIO: in std_logic_vector(3 downto 0);
    -- 2 bits para la salida
    F: out std_logic_vector(1 downto 0)
);
end DATOS;

architecture EXAMEN of DATOS is
begin
    F <= "00" when (BINARIO = "1000" or BINARIO = "1011" or BINARIO = "1110") else
        "01" when (BINARIO = "0010" or BINARIO = "0100" or BINARIO = "0110" or BINARIO = "1001" or BINARIO = "1111") else
        "10" when (BINARIO = "0001" or BINARIO = "0011" or BINARIO = "0101" or BINARIO = "0111" or BINARIO = "1010" or BINARIO = "1101") else
        "11" when (BINARIO = "0000" or BINARIO = "1100") else
        null;
end EXAMEN;
