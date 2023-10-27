library ieee;
use ieee.std_logic_1164.all;

-- Comparar la magnitud de dos binarios de 2 bits.

entity DATOS is port
(
    -- 2 bits para la primer entrada
    A: in std_logic_vector(1 downto 0);
    -- 2 bits para la segunda entrada
    B: in std_logic_vector(1 downto 0);
    -- 3 bits para la salida
    COMPARACION: out std_logic_vector(2 downto 0)
);
end DATOS;

architecture COMPARADOR of DATOS is
begin
    -- Cuando son iguales ambas entradas
    COMPARACION(2) <= ((A(0) and B(0)) or (not A(0) and not B(0))) and ((not A(1) and not B(1)) or (A(1) and B(1)));
    -- Cuando la primer entrada es menor a la segunda entrada
    COMPARACION(1) <= (not A(1) and B(1)) or (not A(1) and not A(0) and B(0)) or (not A(0) and B(1) and B(0));
    -- Cuando la primer entrada es mayor a la segunda entrada
    COMPARACION(0) <= (A(1) and not B(1)) or (A(1) and A(0) and not B(0)) or (A(0) and not B(1) and not B(0));
end COMPARADOR;
