DO 
$$
DECLARE 
	a INT := fn_valor_aleatorio_entre(0, 20);
	b INT := fn_valor_aleatorio_entre(0, 20);
	c INT := fn_valor_aleatorio_entre(0, 20);
	delta NUMERIC(10,2);
	raizUm NUMERIC(10, 2);
	raizDois NUMERIC(10, 2);
BEGIN
	RAISE NOTICE'Equação: %x% + %x + % = 0', a, U&'\00B2', b, c;
	IF a = 0 THEN
		RAISE NOTICE 'Não é uma equação de segundo grau';
	ELSE
		--calcular delta 
		delta := b ^ 2 - 4 * a * c;
		--aninhado 
		--encadeado
		IF delta < 0 THEN
			RAISE NOTICE 'Sem raiz';
		ELSEIF delta = 0 THEN
			raizUm := (-b + |/delta) / 2 * a;
			RAISE NOTICE 'Tem uma raiz: %', raizUm;
		ELSE
			raizUm := (-b + |/delta) / 2 * a;
			raizDois := (-b - |/delta) / 2 * a;
			RAISE NOTICE 'Duas raizes: % e %', raizUm, raizDois;
		END IF;
	END IF;
END
$$

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