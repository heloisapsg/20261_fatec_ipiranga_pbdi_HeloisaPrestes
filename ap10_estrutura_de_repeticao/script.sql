-- INDO DE 1 a 10 usando o LOOP FOR
-- INDO DE 10 a 1 e dando certo. Usamos o REVERSE
DO $$


BEGIN
    RAISE NOTICE 'de 1 a 10 , de um em um';
    FOR i IN 1..10 LOOP
        RAISE NOTICE '%', i;
    END LOOP
    
    RAISE NOTICE 'De 1 a 50, de dois em dois';
    FOR i IN C1..50 BY 2 LOOP
        RAISE NOTICE '%', i; 
    END LOOP;
END;

$$

-- -- INDO DE 1 a 10 usando o LOOP FOR
-- -- INDO DE 10 a 1 e dando certo. Usamos o REVERSE
-- DO $$

-- BEGIN
--     RAISE NOTICE 'de 1 a 10 , de um em um';
--     FOR i IN 1..10 LOOP
--         RAISE NOTICE '%', i;
--     END LOOP
--     --Contando de trás para frente
--     FOR i IN REVERSE 10..1 LOOP
--         RAISE NOTICE '%', i;
--     END LOOP;
-- END;

-- $$
-- DO $$

-- BEGIN
--     RAISE NOTICE 'de 1 a 10 , de um em um';
--     FOR i IN 1..10 LOOP
--         RAISE NOTICE '%', i;
--     END LOOP
--     --Contando de trás para frente
--     FOR i IN REVERSE 10..1 LOOP
--         RAISE NOTICE '%', i;
--     END LOOP;
-- END;

$$

-- -- Indo de 1 a 10 usando LOOP FOR
-- -- Ao tentar ir de 10 a 1 não dá
-- DO $$

-- BEGIN
--     RAISE NOTICE 'De 1 a 10, de um em um'; 
--     FOR i IN 1..10 LOOP
--         RAISE NOTICE '%', i;
--     END LOOP;
--     RAISE NOTICE 'E agora...?';
--     FOR i IN 10..1 LOOP --não funciona pois de 10 a 1 é esquerda maior para direita menor, intervalo vazio!!!
--         RAISE NOTICE '%', i;
--     END LOOP;
-- END;

-- $$

-- -- Calculo da média usando loop WHILE
-- DO $$

-- DECLARE
--     nota INT;
--     media NUMERIC(10, 2) := 0;
--     contador INT := 0;
-- BEGIN
--     SELECT fn_valor_aleatorio_entre(0, 11) - 1 INTO nota; --criano um valor aleatorio e inserindo na nota

--     WHILE nota >= 0 LOOP
--         RAISE NOTICE 'Nota desse aluno: %', nota;

--         media:= media + nota;
--         contador := contador + 1;
--         --precisamos gerar uma nova nota, caso contrário não sairemos do loop pois sempre será o mesmo valor
--         --para isso chamamos noavmente a função
--         SELECT fn_valor_aleatrio_entre(0, 11) - 1 INTO nota;
--     END LOOP;
--     IF contador > 0 THEN
--         RAISE NOTICE 'Média: %', media/contador;
--     ELSE
--         RAIDE NOTICE 'Nenhuma nota gerada';
--     END IF;
-- END;

-- $$


-- -- LOOP ANINHADO (loop dentro de loop)
-- -- Usando o CONTINUE inves do EXIT
-- $$
-- DECLARE
--     i INT; --Contador de iterações do loop externo
--     j INT; --Contador de iterações do loop interno

-- BEGIN
--     i := 0;

--     <<externo>> 
--     LOOP
--         i:= i +1;
--         EXIT WHEN i > 10;
--         j := 1;
--         <<interno>>
--         LOOP 
--             RAISE NOTICE 'i = %, j = %', i, j;
--             j := j+1;
--             EXIT WHEN j > 10;
--             CONTINUE externo WHEN j > 5; -- quando o loop interno der 6, PARA O INTERNO!
--             -- O externo continua, só que o interno só vai até 5
--         END LOOP;
--     END LOOP;
-- END
-- $$


-- -- LOOP ANINHADO (loop dentro de loop)
-- -- Parando o loop externo, quando eu estou dentro do interno
-- DO $$
-- DECLARE
--     i INT; --Contador de iterações do loop externo
--     j INT; --Contador de iterações do loop interno

-- BEGIN
--     i := 0;

--     <<externo>> 
--     LOOP
--         i:= i +1;
--         EXIT WHEN i > 10;
--         j := 1;
--         <<interno>>
--         LOOP 
--             RAISE NOTICE 'i = %, j = %', i, j;
--             j := j+1;
--             EXIT WHEN j > 10;
--             EXIT externo WHEN j > 5; -- quando o loop interno der 6, para tudo! Até o externo
--         END LOOP;
--     END LOOP;
-- END
-- $$

-- -- LOOP ANINHADO (loop dentro de loop)
-- -- E dando nomes para o meu loop
-- DO $$
-- DECLARE
--     i INT; --Contador de iterações do loop externo
--     j INT; --Contador de iterações do loop interno

-- BEGIN
--     i := 0;

--     <<externo>> --rótulo que impacta a criatura abaixo dele, nesse caso o loop
--     LOOP
--         i:= i +1;
--         EXIT WHEN i > 10;
--         j := 1;
--         <<interno>>
--         LOOP 
--             RAISE NOTICE 'i = %, j = %', i, j;
--             j := j+1;
--             EXIT WHEN j > 10;
--         END LOOP;
--     END LOOP;
-- END
-- $$


--Usando o continue  v

-- DO $$
-- DECLARE
--     contador INT := 0;
-- BEGIN
--     LOOP
--         contador := contador + 1;
--         EXIT WHEN contador > 100;

--         --O continue encerra e passa para apróxima iteração 
--         IF contador % 7 = 0 THEN
--             CONTINUE  --pulando as iterações dos múltiplos de 7
--         END IF;

--         CONTINUE WHEN contador % 11 = 0; --pulando as iterações dos múltiplos de 11

--         RAISE NOTICE '%', contador; --Não mostro as iterações dos múltiplos de 7 nem de 11
--     END LOOP;
-- END;
-- $$


-- DO $$
-- DECLARE
--     contador INT := 1;
-- BEGIN
--     LOOP
--         RAISE NOTICE '%', contador;
--         contador := comtador + 1; --não existe contador++
--         EXIT WHEN contador >10; 
--     END LOOP;
-- END;
-- $$


--OUTRO JEITO DE ESCREVER O CÓDIGO DEBAIXO ^

-- DO $$
-- DECLARE
--     contador INT := 1;
-- BEGIN
--     LOOP
--         RAISE NOTICE '%', contador;
--         contador := comtador + 1; --não existe contador++
--         IF notador > 10 THEN
--             EXIT; 
--         END IF;
--     END LOOP;
-- END;
-- $$



--não executar! É um loop infinito.
-- Modelo:
-- DO $$
-- DECLARE
-- BEGIN
--     LOOP
--         RAISE NOTICE 'Teste loop simples';
--     END LOOP;
-- END;

-- $$