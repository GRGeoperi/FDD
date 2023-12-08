library ieee;
use ieee.std_logic_1164.all;

entity DATOS_SUMADOR is port
(
    -- 1 bit para el primer número
    A_COMPLETO: in std_logic;
    -- 1 bit para el segundo número
    B_COMPLETO: in std_logic;
    -- 1 bit para el acarreo en suma
    CIN: in std_logic;
    -- 1 bit para la suma
    SUMA_COMPLETA: out std_logic;
    -- 1 bit para el acarreo de salida
    COUT_COMPLETO: out std_logic;
);
end DATOS_SUMADOR;

architecture SUMADOR_COMPLETO of DATOS_SUMADOR is
    signal X: std_logic_vector(2 downto 0);
    component DATOS_MEDIO_SUMADOR port
    (
        A_MITAD_SUMA: in std_logic;
        B_MITAD_SUMA: in std_logic;
        SUMA: out std_logic;
        COUT: out std_logic
    );
    end component;
    begin
        BLOQUE_UNO_SUMADOR: DATOS_MEDIO_SUMADOR port map (A_MITAD_SUMA => A_COMPLETO, B_MITAD_SUMA => B_COMPLETO, SUMA => X(2), COUT => X(1));
        BLOQUE_DOS_SUMADOR: DATOS_MEDIO_SUMADOR port map (A_MITAD_SUMA => x(2), B_MITAD_SUMA => CIN, SUMA => SUMA_COMPLETA, COUT => X(0));
        COUT_COMPLETO <= X(1) or X(0);
end SUMADOR_COMPLETO;