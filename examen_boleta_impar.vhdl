library ieee;
use ieee.std_logic_1164.all;

-- Escribir el código VHDL a partir de una tabla de verdad.
-- Sentencias tipo secuenciales por ser boleta impar.

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
    process (BINARIO)
    begin
        case BINARIO is
            when "0000" => F <= "11";
            when "0001" => F <= "10";
            when "0010" => F <= "01";
            when "0011" => F <= "10";
            when "0100" => F <= "01";
            when "0101" => F <= "10";
            when "0110" => F <= "01";
            when "0111" => F <= "10";
            when "1000" => F <= "00";
            when "1001" => F <= "01";
            when "1010" => F <= "10";
            when "1011" => F <= "00";
            when "1100" => F <= "11";
            when "1101" => F <= "10";
            when "1110" => F <= "00";
            when "1111" => F <= "01";
            -- Valor predeterminado
            when others => null;
        end case;
    end process;
end EXAMEN;
