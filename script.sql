-- Dada uma data no formato ddmmaaaa verificar se ela é válida 
--TESTAR:
-- 22/10/2022: válida 
-- 29/02/2020: 2020 é bissexto, válida 
-- 29/02/2021: inválida
-- 28/02/201: válida 
-- 31/06/2021: inválida

DO $$
DECLARE
	 data INT:= 31062021;
	 -- quero exibir a data assim 31/06/2021
	 dia INT;
	 mes INT;
	 ano INT;
	 data_valida BOOL := TRUE;
BEGIN
	dia := data / 1000000;
	mes := data % 1000000 / 10000;
	ano := data % 10000;
	RAISE NOTICE 'a data é %/%/%', dia, mes, ano;
	IF ano < 1 THEN
		RAISE NOTICE 'Data inválida';
	ELSE
		CASE
			WHEN mes > 12 OR mes < 1 OR dia < 1 OR dia > 31 THEN
				data_valida := FALSE;
			ELSE
				IF((mes = 4 OR mes = 6 OR mes = 9 OR mes = 11) AND dia > 30) THEN
					data_valida:= FALSE;
				ELSE 
					-- fevereiro
					IF mes = 2 THEN
						CASE
							--ano bissexto 
							WHEN (ano % 4 = 0 AND ano % 100 <> 0) THEN
								IF dia > 29 THEN
									data_valida := FALSE;
								END IF;
							ELSE 
								-- estamos em fev e o ano não é bissexto
								IF dia > 28 THEN
									data_valida := FALSE;
								END IF;
						END CASE;
					END IF;
				END IF;
		END CASE;
	END IF;
	CASE 
		WHEN data_valida THEN
			RAISE NOTICE 'A data é válida';
		ELSE
			RAISE NOTICE 'A data é inválida';
	END CASE;
END
$$

--Outra maneira de usar o CASE
-- DO 
-- $$
-- DECLARE 
-- 	valor INT := fn_valor_aleatorio_entre(1, 12);
-- 	mensagem VARCHAR(200);
-- BEGIN
-- 	RAISE NOTICE'O valor é: %', valor;
-- 	CASE valor 
-- 		WHEN 1, 3, 5, 7, 9 THEN
-- 			RAISE NOTICE 'Ímpar';
-- 		WHEN 2, 4, 6, 8 THEN
-- 			RAISE NOTICE 'Par';
-- 		ELSE
-- 			RAISE NOTICE 'Fora do Intervalo de tratamento';
-- 	END CASE;
-- END
-- $$

--CASE
-- DO 
-- $$
-- DECLARE 
-- 	valor INT := fn_valor_aleatorio_entre(1, 12);
-- 	mensagem VARCHAR(200);
-- BEGIN
-- 	RAISE NOTICE'O valor é: %', valor;
-- 	CASE valor 
-- 		WHEN 1 THEN
-- 			RAISE NOTICE 'Ímpar';
-- 		WHEN 3 THEN
-- 			RAISE NOTICE 'Ímpar';
-- 		WHEN 2 THEN
-- 			RAISE NOTICE 'Par';
-- 		WHEN 4 THEN
-- 			RAISE NOTICE 'Par';
-- 		ELSE
-- 			RAISE NOTICE 'Fora do Intervalo';
-- 	END CASE;
-- END
-- $$

-- DO 
-- $$
-- DECLARE 
-- 	a INT := fn_valor_aleatorio_entre(0, 20);
-- 	b INT := fn_valor_aleatorio_entre(0, 20);
-- 	c INT := fn_valor_aleatorio_entre(0, 20);
-- 	delta NUMERIC(10,2);
-- 	raizUm NUMERIC(10, 2);
-- 	raizDois NUMERIC(10, 2);
-- BEGIN
-- 	RAISE NOTICE'Equação: %x% + %x + % = 0', a, U&'\00B2', b, c;
-- 	IF a = 0 THEN
-- 		RAISE NOTICE 'Não é uma equação de segundo grau';
-- 	ELSE
-- 		--calcular delta 
-- 		delta := b ^ 2 - 4 * a * c;
-- 		--aninhado 
-- 		--encadeado
-- 		IF delta < 0 THEN
-- 			RAISE NOTICE 'Sem raiz';
-- 		ELSEIF delta = 0 THEN
-- 			raizUm := (-b + |/delta) / 2 * a;
-- 			RAISE NOTICE 'Tem uma raiz: %', raizUm;
-- 		ELSE
-- 			raizUm := (-b + |/delta) / 2 * a;
-- 			raizDois := (-b - |/delta) / 2 * a;
-- 			RAISE NOTICE 'Duas raizes: % e %', raizUm, raizDois;
-- 		END IF;
-- 	END IF;
-- END
-- $$

-- DO 
-- $$
-- DECLARE 
-- 	 valor INT := fn_valor_aleatorio_entre(1, 100);
-- BEGIN
-- 	IF valor % 2 = 0 THEN
-- 		RAISE NOTICE '% é par', valor;
		
-- 	ELSE
-- 		RAISE NOTICE '% é impar', valor;
-- 	END IF;
-- END
-- $$

-- DO 
-- $$
-- DECLARE 
-- 	 valor INT
-- BEGIN
-- 	valor := fn_valor_aleatorio_entre(1, 10);
-- 	RAISE NOTICE 'O valor gerado foi %', valor;
	
-- 	IF valor <= 20 THEN
-- 		RAISE NOTICE 'Sim, % é o menor ou igual a 20', valor;
-- 	END IF;
-- END
-- $$



--SELECT fn_valor_aleatorio_entre(2, 5);


-- CREATE OR REPLACE FUNCTION fn_valor_aleatorio_entre 
-- (lim_inferior INT, lim_superior INT) RETURNS INT AS
-- $$
-- BEGIN
-- 	RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- END;
-- $$ LANGUAGE plpgsql;