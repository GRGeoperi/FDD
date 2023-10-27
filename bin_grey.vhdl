library ieee;
use ieee.std_logic_1164.all;

-- Convertir un binario de 4 bits a codigo grey.

entity DATOS is port
(
    -- 4 bits para la entrada
    BINARIO: in std_logic_vector(3 downto 0);
    -- 4 bits para la salida
    GREY: out std_logic_vector(3 downto 0)
);
end DATOS;

architecture CONVERSOR of DATOS is
begin
    -- 2³ se enciende
    GREY(3) <= BINARIO(3);
    -- 2² se enciende
    GREY(2) <= BINARIO(3) xor BINARIO(2);
    -- 2¹ se enciende
    GREY(1) <= BINARIO(2) xor BINARIO(1);
    -- 2⁰ se enciende
    GREY(0) <= BINARIO(1) xor BINARIO(0);
end CONVERSOR;
