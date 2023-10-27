library ieee;
use ieee.std_logic_1164.all;

-- Mostrar un binario de 4 bits en hexadecimal por medio de un Display de cátodo común.

entity DATOS is port
(
    -- 4 bits para la entrada
    BINARIO: in std_logic_vector(3 downto 0);
    -- 7 bits para la salida
    SEGMENTO: out std_logic_vector(6 downto 0)
);
end DATOS;

architecture DISPLAY of DATOS is
begin
    -- Cuando 'a' se enciende
    SEGMENTO(6) <= (not BINARIO(2) and not BINARIO(0)) or
            (BINARIO(2) and BINARIO(1)) or
            (not BINARIO(3) and BINARIO(1)) or
            (not BINARIO(3) and BINARIO(2) and BINARIO(0)) or
            (BINARIO(3) and not BINARIO(2) and not BINARIO(1)) or
            (BINARIO(3) and not BINARIO(1) and not BINARIO(0));
    -- Cuando 'b' se enciende
    SEGMENTO(5) <= (not BINARIO(2) and not BINARIO(1)) or
            (not BINARIO(3) and not BINARIO(2)) or
            (not BINARIO(2) and not BINARIO(0)) or
            (not BINARIO(3) and BINARIO(1) and BINARIO(0)) or
            (BINARIO(3) and not BINARIO(1) and BINARIO(0)) or
            (not BINARIO(3) and not BINARIO(1) and not BINARIO(0));
    -- Cuando 'c' se enciende
    SEGMENTO(4) <= (not BINARIO(3) and BINARIO(2)) or
            (not BINARIO(1) and BINARIO(0)) or
            (BINARIO(3) and not BINARIO(2)) or
            (not BINARIO(3) and not BINARIO(1)) or
            (not BINARIO(3) and BINARIO(0));
    -- Cuando 'd' se enciende
    SEGMENTO(3) <= (BINARIO(2) and not BINARIO(1) and BINARIO(0)) or
            (not BINARIO(2) and not BINARIO(1) and not BINARIO(0)) or
            (not BINARIO(3) and not BINARIO(2) and BINARIO(1)) or
            (BINARIO(2) and BINARIO(1) and not BINARIO(0)) or
            (not BINARIO(2) and BINARIO(1) and BINARIO(0)) or
            (BINARIO(3) and BINARIO(2) and not BINARIO(1));
    -- Cuando 'e' se enciende
    SEGMENTO(2) <= (BINARIO(3) and BINARIO(2)) or
            (BINARIO(1) and not BINARIO(0)) or
            (not BINARIO(2) and not BINARIO(0)) or
            (BINARIO(3) and BINARIO(1));
    -- Cuando 'f' se enciende
    SEGMENTO(1) <= (not BINARIO(1) and not BINARIO(0)) or
            (BINARIO(3) and not BINARIO(2)) or
            (BINARIO(3) and BINARIO(1)) or
            (not BINARIO(3) and BINARIO(2) and not BINARIO(1)) or
            (BINARIO(2) and BINARIO(1) and not BINARIO(0));
    -- Cuando 'g' se enciende
    SEGMENTO(0) <= (BINARIO(3) and not BINARIO(2)) or
            (BINARIO(1) and not BINARIO(0)) or
            (BINARIO(3) and BINARIO(0)) or
            (not BINARIO(3) and BINARIO(2) and not BINARIO(1)) or
            (not BINARIO(3) and not BINARIO(2) and BINARIO(1));
end DISPLAY;
