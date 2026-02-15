PROMPT CREATE OR REPLACE FUNCTION salotex.numero_a_texto
CREATE OR REPLACE FUNCTION salotex.numero_a_texto(p_numero IN NUMBER)
  RETURN VARCHAR2
IS
  v_numero_entero NUMBER := TRUNC(p_numero);
  v_texto_final VARCHAR2(4000);

  FUNCTION get_unidad(p_num IN NUMBER) RETURN VARCHAR2 IS
  BEGIN
    CASE p_num
      WHEN 1 THEN RETURN 'uno';
      WHEN 2 THEN RETURN 'dos';
      WHEN 3 THEN RETURN 'tres';
      WHEN 4 THEN RETURN 'cuatro';
      WHEN 5 THEN RETURN 'cinco';
      WHEN 6 THEN RETURN 'seis';
      WHEN 7 THEN RETURN 'siete';
      WHEN 8 THEN RETURN 'ocho';
      WHEN 9 THEN RETURN 'nueve';
      ELSE RETURN '';
    END CASE;
  END get_unidad;

  FUNCTION get_decena(p_num IN NUMBER) RETURN VARCHAR2 IS
  BEGIN
    CASE p_num
      WHEN 10 THEN RETURN 'diez';
      WHEN 11 THEN RETURN 'once';
      WHEN 12 THEN RETURN 'doce';
      WHEN 13 THEN RETURN 'trece';
      WHEN 14 THEN RETURN 'catorce';
      WHEN 15 THEN RETURN 'quince';
      WHEN 16 THEN RETURN 'dieciséis';
      WHEN 17 THEN RETURN 'diecisiete';
      WHEN 18 THEN RETURN 'dieciocho';
      WHEN 19 THEN RETURN 'diecinueve';
      WHEN 20 THEN RETURN 'veinte';
      WHEN 30 THEN RETURN 'treinta';
      WHEN 40 THEN RETURN 'cuarenta';
      WHEN 50 THEN RETURN 'cincuenta';
      WHEN 60 THEN RETURN 'sesenta';
      WHEN 70 THEN RETURN 'setenta';
      WHEN 80 THEN RETURN 'ochenta';
      WHEN 90 THEN RETURN 'noventa';
      ELSE RETURN get_unidad(p_num);
    END CASE;
  END get_decena;

  FUNCTION get_centena(p_num IN NUMBER) RETURN VARCHAR2 IS
  BEGIN
    CASE p_num
      WHEN 1 THEN RETURN 'cien';
      WHEN 2 THEN RETURN 'doscientos';
      WHEN 3 THEN RETURN 'trescientos';
      WHEN 4 THEN RETURN 'cuatrocientos';
      WHEN 5 THEN RETURN 'quinientos';
      WHEN 6 THEN RETURN 'seiscientos';
      WHEN 7 THEN RETURN 'setecientos';
      WHEN 8 THEN RETURN 'ochocientos';
      WHEN 9 THEN RETURN 'novecientos';
      ELSE RETURN '';
    END CASE;
  END get_centena;

  FUNCTION convertir_bloque(p_num IN NUMBER) RETURN VARCHAR2 IS
    v_n NUMBER := p_num;
    v_t VARCHAR2(1000) := '';
  BEGIN
    -- Centenas
    IF v_n >= 100 THEN
      IF v_n = 100 THEN
        v_t := 'cien';
        v_n := 0;
      ELSE
        -- get_centena(1) devuelve 'cien', se ajusta a 'ciento' si no es 100 exacto
        IF TRUNC(v_n / 100) = 1 THEN
          v_t := 'ciento';
        ELSE
          v_t := get_centena(TRUNC(v_n / 100));
        END IF;
        v_n := MOD(v_n, 100);
        IF v_n > 0 THEN
          v_t := v_t || ' ';
        END IF;
      END IF;
    END IF;

    -- Decenas y Unidades
    IF v_n > 0 THEN
      IF v_n < 20 THEN
        v_t := v_t || get_decena(v_n);
      ELSE
        v_t := v_t || get_decena(TRUNC(v_n / 10) * 10);
        IF MOD(v_n, 10) > 0 THEN
          v_t := v_t || ' y ' || get_unidad(MOD(v_n, 10));
        END IF;
      END IF;
    END IF;
    RETURN v_t;
  END convertir_bloque;

BEGIN
  IF v_numero_entero IS NULL OR v_numero_entero > 999999999999 THEN
    RETURN 'Número fuera de rango';
  END IF;

  IF v_numero_entero = 0 THEN
    RETURN 'cero';
  END IF;

  -- Miles de Millones y Millones
  IF v_numero_entero >= 1000000 THEN
    DECLARE
      v_parte_millon NUMBER := TRUNC(v_numero_entero / 1000000);
      v_texto_millon VARCHAR2(2000);
    BEGIN
      -- Caso especial para "un millón"
      IF v_parte_millon = 1 THEN
        v_texto_millon := 'un millón ';
      ELSE
        -- Construir el texto para la parte de los millones (que puede incluir miles de millones)
        DECLARE
          v_miles_de_millon NUMBER := TRUNC(v_parte_millon / 1000);
          v_resto_millon NUMBER := MOD(v_parte_millon, 1000);
          v_texto_parte_millon VARCHAR2(2000);
        BEGIN
            IF v_miles_de_millon > 0 THEN
                IF v_miles_de_millon = 1 THEN
                    v_texto_parte_millon := 'mil ';
                ELSE
                    v_texto_parte_millon := RTRIM(convertir_bloque(v_miles_de_millon)) || ' mil ';
                END IF;
            END IF;

            IF v_resto_millon > 0 THEN
                v_texto_parte_millon := v_texto_parte_millon || convertir_bloque(v_resto_millon);
            END IF;
            
            -- Asegurar un espacio antes de 'millones' si hay texto
            IF LENGTH(v_texto_parte_millon) > 0 THEN
                v_texto_millon := RTRIM(v_texto_parte_millon) || ' millones ';
            END IF;
        END;
      END IF;

      v_texto_final := v_texto_final || v_texto_millon;
      v_numero_entero := MOD(v_numero_entero, 1000000);
    END;
  END IF;

  -- Miles
  IF v_numero_entero >= 1000 THEN
    DECLARE
      v_miles NUMBER := TRUNC(v_numero_entero / 1000);
    BEGIN
      IF v_miles > 1 THEN
        v_texto_final := v_texto_final || convertir_bloque(v_miles) || ' mil ';
      ELSE -- v_miles = 1, no se dice 'un mil'
        v_texto_final := v_texto_final || 'mil ';
      END IF;
      v_numero_entero := MOD(v_numero_entero, 1000);
    END;
  END IF;

  -- Resto (0-999)
  IF v_numero_entero > 0 THEN
    v_texto_final := v_texto_final || convertir_bloque(v_numero_entero);
  END IF;

  RETURN RTRIM(v_texto_final);
END numero_a_texto;
/

