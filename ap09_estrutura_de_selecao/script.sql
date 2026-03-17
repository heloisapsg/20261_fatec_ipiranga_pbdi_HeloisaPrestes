DO $$
DECLARE 
    data INT := 06232323;
    dia INT;
    mes INT;
    ano INT;
    data_valida BOOL := TRUE;
BEGIN
    dia := data/100000;
    mes := (data % 1000000) / 10000;
    ano := data % 10000;
    RAISE NOTICE 'A data é %/%/%', dia, mes, ano;
    IF ano >= 1 THEN
        CASE 
            WHEN mes > 12 OR mes < 1 OR dia < 1 OR dia > 31 THEN 
                data_valida := FALSE;

        ELSE
            IF ((mes = 4 OR mes = 6 OR mes = 9 OR mes = 11) AND dia> 30) THEN
                data_valida := FALSE;
            ELSE
                IF mes = 2 THEN
                    CASE
                        WHEN ((ano % 4 = 0) AND (ano % 400 != 0)) THEN
                            IF dia > 29 THEN
                                data_valida := FALSE;
                            END IF;
                        ELSE
                            IF dia > 28 THEN
                                data_valida := FALSE
                            END IF;
                    END CASE;
                END IF;
            END IF;
        END CASE;
    ELSE 
        data_valida := FALSE;
    END IF;
    CASE
        WHEN data_valida THEN
            RAISE NOTICE 'A data % é válida', data_valida;
        ELSE
            RAISE NOTICE 'A data % é inválida', data_valida;
    END CASE
END;
$$

--daqui para cima é 17/03/26

-- DO $$
-- DECLARE
--     valor INT := fn_valor_aleatorio_entre(1,12);
--     mensagem VARCHAR(200);
-- BEGIN
--     RAISE NOTICE 'Valor gerado: %', valor;
--     CASE valor
--         WHEN  1, 3, 5, 7, 9 THEN
--             mensagem := 'ímpar';
--         WHEN 2, 4, 6, 8, 10 THEN
--             mensagem := 'par';
--         ELSE 
--             mensagem := 'fora do intervalo';
--     END CASE;
--     RAISE NOTICE '%', mensagem;
-- END;
-- $$

-- DO $$
-- DECLARE
--     valor INT;
--     mensagem VARCHAR(200);
-- BEGIN
--     valor:= fn_valor_aleatorio_entre(1,12);
--     RAISE NOTICE 'O valor gerado é %', valor;
--     CASE valor
--         WHEN 1 THEN
--             mensagem := 'ímpar';
--         WHEN 3 THEN
--             mensagem := 'ímpar';
--         WHEN 5 THEN
--             mensagem := 'ímpar';
--         WHEN 2 THEN
--             mensagem := 'par';
--         WHEN 4 THEN
--             mensagem := 'par';
--         WHEN 6 THEN
--             mensagem := 'par';
--         -- se houver algum valor que não está sendo tratado (ou seja, não está dentro de um WHEN) dará erro.
--         --então eu coloco um ELSE para tratar 
--         ELSE
--             mensagem := 'Valor fora do intervalo';
--     END CASE;
--     RAISE NOTICE '%', mensagem;
-- END;
-- $$

-- DO $$
-- DECLARE
--     a INT := fn_valor_aleatorio_entre(0, 10);
--     b INT := fn_valor_aleatorio_entre(0, 10);
--     c INT := fn_valor_aleatorio_entre(0, 10);
--     delta NUMERIC(10, 2);
--     raizUm NUMERIC (10, 2);
--     raizDois NUMERIC(10,2);
-- BEGIN
--     RAISE NOTICE 'Equação %x% + %x + % = 0', a, U&'\00B2', b, c;
--     IF a = 0 THEN
--         RAISE NOTICE 'Não é uma equação do segundo grau (porque a é = 0)';
--     ELSE
--         RAISE NOTICE 'delta = % % - 4*%*%', b, U&'\00B2', a, c;
--         -- calcular delta

--         delta := (b^2) + (4 * a * c);
--         RAISE NOTICE 'delta = %', delta;

--         --se delta for negativo, dizer que não tem raiz
--         IF delta < 0 THEN
--             RAISE NOTICE 'A função não tem raíz (delta negativo)';

--         --se delta for igual a zero, dizer que tem uma raiz e mostrar
--         ELSEIF delta = 0 THEN
--             raizUm := (-b) / (2*a);
--             RAISE NOTICE 'a função só tem uma raíz, e a raíz é %', raizUm;

--         --se delta for maior que zero, dizer que tem duas raízes e mostrar ambas
--         ELSE --delta > 0
--             raizUm := ((-b) + (delta^0.5)) / (2*a);
--             raizDois := ((-b) - (delta^0.5)) / (2*a);
--             RAISE NOTICE 'A função tem duas raízes, raíz um é % e raíz dois é %', raizUm, raizDois;
--         END IF;
--     END IF;
-- END;
-- $$

-- DO $$
-- DECLARE
--     valor INT := fn_valor_aleatorio_entre(1,100);
-- BEGIN
--     RAISE NOTICE 'Valor gerado: %', valor;
--     IF valor % 2 = 0 THEN
--         RAISE NOTICE '% é par', valor;
--     ELSE
--         RAISE NOTICE '% é ímpar', valor;
--     END IF;
-- END;
-- $$


-- DO $$
-- DECLARE
--     valor INT;
-- BEGIN
--     SELECT fn_valor_aleatorio_entre(1,30) INTO valor;
--     RAISE NOTICE 'Valor gerado: %', valor;
--     IF valor BETWEEN 1 AND 20 THEN
--         RAISE NOTICE 'A metade do valor % é %', valor, valor/2;
--     END IF;
-- END;
-- $$

-- -- DO $$
-- -- DECLARE
-- --     valor INT;
-- -- BEGIN
-- --     valor := fn_valor_aleatorio_entre(1,30);
-- --     IF valor <= 20 THEN
-- --         RAISE NOTICE 'O valor % é menor do que 20', valor;
-- --     END IF;
-- -- END
-- -- $$


-- --SELECT fn_valor_aleatorio_entre(5,17);

-- -- CREATE OR REPLACE FUNCTION fn_valor_aleatorio_entre
-- -- (lim_inferior INT, lim_superior INT)
-- -- RETURNS INT AS $$
-- -- BEGIN
-- --   RETURN FLOOR(RANDOM () * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- -- END
-- -- $$ LANGUAGE plpgsql

-- --RETURNS = faz (indicativo)
-- --RETURN = faça (imperativo)