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
        data_vaida := FALSE;
    END IF;
    CASE
        WHEN data_valida THEN
            RAISE NOTICE 'Data válida';
        ELSE
            RAISE NOTICE 'Data inválida';
    END CASE
END;
$$