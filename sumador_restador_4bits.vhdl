library ieee;
use ieee.std_logic_1164.all;

entity DATOS_SUMADOR_O_RESTADOR is port
(
    -- 4 bits para el primer número
    A: in std_logic_vector(3 downto 0);
    -- 4 bits para el segundo número
    B: in std_logic_vector(3 downto 0);
    -- 1 bit para el acarreo en suma o préstamo en resta
    CIN_PIN: in std_logic;
    -- 4 bits para la suma o resta
    SUMA_RESTA: out std_logic_vector(3 downto 0);
    -- 1 bit para el acarreo o préstamo de salida
    COUT_POUT: out std_logic
);
end DATOS_SUMADOR_O_RESTADOR;

architecture SUMADOR_4BITS of DATOS_SUMADOR_O_RESTADOR is
    signal Z: std_logic_vector(2 downto 0);
    component DATOS_SUMADOR port
    (
        A_COMPLETO: in std_logic;
        B_COMPLETO: in std_logic;
        CIN: in std_logic;
        SUMA_COMPLETA: out std_logic;
        COUT_COMPLETO: out std_logic
    );
    end component;
    begin
        process (CIN_PIN) begin
            if CIN_PIN = '0' then
                BLOQUE_UNO: DATOS_SUMADOR port map (A_COMPLETO => A(0), B_COMPLETO => B(0), CIN => CIN_PIN, SUMA_COMPLETA => SUMA_RESTA(0), COUT_COMPLETO => Z(2));
                BLOQUE_DOS: DATOS_SUMADOR port map (A_COMPLETO => A(1), B_COMPLETO => B(1), CIN => Z(2), SUMA_COMPLETA => SUMA_RESTA(1), COUT_COMPLETO => Z(1));
                BLOQUE_TRES: DATOS_SUMADOR port map (A_COMPLETO => A(2), B_COMPLETO => B(2), CIN => Z(1), SUMA_COMPLETA => SUMA_RESTA(2), COUT_COMPLETO => Z(0));
                BLOQUE_CUATRO: DATOS_SUMADOR port map (A_COMPLETO => A(3), B_COMPLETO => B(3), CIN => Z(0), SUMA_COMPLETA => SUMA_RESTA(3), COUT_COMPLETO => COUT_POUT);
            else
                BLOQUE_UNO: DATOS_SUMADOR port map (A_COMPLETO => A(0), B_COMPLETO => not B(0), CIN => CIN_PIN, SUMA_COMPLETA => SUMA_RESTA(0), COUT_COMPLETO => Z(2));
                BLOQUE_DOS: DATOS_SUMADOR port map (A_COMPLETO => A(1), B_COMPLETO => not B(1), CIN => Z(2), SUMA_COMPLETA => SUMA_RESTA(1), COUT_COMPLETO => Z(1));
                BLOQUE_TRES: DATOS_SUMADOR port map (A_COMPLETO => A(2), B_COMPLETO => not B(2), CIN => Z(1), SUMA_COMPLETA => SUMA_RESTA(2), COUT_COMPLETO => Z(0));
                BLOQUE_CUATRO: DATOS_SUMADOR port map (A_COMPLETO => A(3), B_COMPLETO => not B(3), CIN => Z(0), SUMA_COMPLETA => SUMA_RESTA(3), COUT_COMPLETO => COUT_POUT);
            end if;
        end process;
end SUMADOR_4BITS;
