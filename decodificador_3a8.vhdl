library ieee;
use ieee.std_logic_1164.all;

-- Decodificador 3 a 8 con enable negada y salida activa en alto

entity DATOS is port
(
    -- 3 bits para la entrada
    ENTRADA: in std_logic_vector(2 downto 0);
    -- 1 bit para la entrada de habilitación
    ENABLE: in std_logic;
    -- 8 bits para la salida
    SALIDA: out std_logic_vector(7 downto 0)
);
end DATOS;

architecture DECODIFICADOR of DATOS is begin
    process (ENTRADA, ENABLE) begin
        case ENABLE is
            when '0' =>
                case ENTRADA is
                    when "000" => SALIDA <= "10000000";
                    when "001" => SALIDA <= "01000000";
                    when "010" => SALIDA <= "00100000";
                    when "011" => SALIDA <= "00010000";
                    when "100" => SALIDA <= "00001000";
                    when "101" => SALIDA <= "00000100";
                    when "110" => SALIDA <= "00000010";
                    when others => SALIDA <= "00000001";
                end case;
            when others =>
                case ENTRADA is
                    when others => SALIDA <= "00000000";
                end case;
        end case;
    end process;
end DECODIFICADOR;
