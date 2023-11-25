library ieee;
use ieee.std_logic_1164.all;

-- Mostrar un binario de 4 bits en su forma hexadecimal o convertido a BCD por medio de un Display de cátodo común.

entity DATOS is port
(
    -- 4 bits para la entrada
    BINARIO: in std_logic_vector(3 downto 0);
    -- 1 bit para el control de hexadecimal o bcd
    CTRL: in std_logic;
    -- 7 bits para la salida
    SEGMENTO: out std_logic_vector(6 downto 0)
);
end DATOS;

architecture DISPLAY of DATOS is
begin
    process (BINARIO, CTRL)
    begin
        case CTRL is
            -- Cuando es hexadecimal
            when '0' =>
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
            -- Cuando es BCD
            when others =>
                case BINARIO is
                    -- Cuando se muestra el 0
                    when "0000" =>
                        SEGMENTO <= "1111110";
                    -- Cuando se muestra el 1
                    when "0001" =>
                        SEGMENTO <= "0110000";
                    -- Cuando se muestra el 2
                    when "0010" =>
                        SEGMENTO <= "1101101";
                    -- Cuando se muestra el 3
                    when "0011" =>
                        SEGMENTO <= "1111001";
                    -- Cuando se muestra el 4
                    when "0100" =>
                        SEGMENTO <= "0110011";
                    -- Cuando se muestra el 5
                    when "0101" =>
                        SEGMENTO <= "1011011";
                    -- Cuando se muestra el 6
                    when "0110" =>
                        SEGMENTO <= "1011111";
                    -- Cuando se muestra el 7
                    when "0111" =>
                        SEGMENTO <= "1110000";
                    -- Cuando se muestra el 8
                    when "1000" =>
                        SEGMENTO <= "1111111";
                    -- Cuando se muestra el 9
                    when "1001" =>
                        SEGMENTO <= "1110011";
                    -- Cuando se muestra un -
                    when others =>
                        SEGMENTO <= "0000001";
                end case;
        end case;
    end process;
end DISPLAY;
