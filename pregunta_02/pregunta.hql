/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

DROP TABLE IF EXISTS db;
DROP TABLE IF EXISTS db_counts;
CREATE TABLE db (
  letter string,
  date2 date,
  value int
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
;

LOAD DATA LOCAL INPATH "data.tsv" INTO TABLE db;
CREATE TABLE db_counts AS
    SELECT letter, date2, value
    FROM db ORDER BY letter, value, date2;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM db_counts;
