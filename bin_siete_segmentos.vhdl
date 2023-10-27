library ieee;
use ieee.std_logic_1164.all;

-- Mostrar un binario de 4 bits en hexadecimal por medio de un Display de cátodo común.

entity DATOS is port
(
    -- 4 bits para la entrada
    B: in std_logic_vector(3 downto 0);
    -- 7 bits para la salida
    F: out std_logic_vector(6 downto 0)
);
end DATOS;

architecture DISPLAY of DATOS is
begin
    -- Cuando el segmento 'a' se enciende
    F(6) <= (not B(2) and not B(0)) or
            (B(2) and B(1)) or
            (not B(3) and B(1)) or
            (not B(3) and B(2) and B(0)) or
            (B(3) and not B(2) and not B(1)) or
            (B(3) and not B(1) and not B(0));
    -- Cuando el segmento 'b' se enciende
    F(5) <= (not B(2) and not B(1)) or
            (not B(3) and not B(2)) or
            (not B(2) and not B(0)) or
            (not B(3) and B(1) and B(0)) or
            (B(3) and not B(1) and B(0)) or
            (not B(3) and not B(1) and not B(0));
    -- Cuando el segmento 'c' se enciende
    F(4) <= (not B(3) and B(2)) or
            (not B(1) and B(0)) or
            (B(3) and not B(2)) or
            (not B(3) and not B(1)) or
            (not B(3) and B(0));
    -- Cuando el segmento 'd' se enciende
    F(3) <= (B(2) and not B(1) and B(0)) or
            (not B(2) and not B(1) and not B(0)) or
            (not B(3) and not B(2) and B(1)) or
            (B(2) and B(1) and not B(0)) or
            (not B(2) and B(1) and B(0)) or
            (B(3) and B(2) and not B(1));
    -- Cuando el segmento 'e' se enciende
    F(2) <= (B(3) and B(2)) or
            (B(1) and not B(0)) or
            (not B(2) and not B(0)) or
            (B(3) and B(1));
    -- Cuando el segmento 'f' se enciende
    F(1) <= (not B(1) and not B(0)) or
            (B(3) and not B(2)) or
            (B(3) and B(1)) or
            (not B(3) and B(2) and not B(1)) or
            (B(2) and B(1) and not B(0));
    -- Cuando el segmento 'g' se enciende
    F(0) <= (B(3) and not B(2)) or
            (B(1) and not B(0)) or
            (B(3) and B(0)) or
            (not B(3) and B(2) and not B(1)) or
            (not B(3) and not B(2) and B(1));
end DISPLAY;
