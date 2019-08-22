mysql> show tables;
+-------------------------------+
| Tables_in_velocidadeportas_db |
+-------------------------------+
| admstate_tb                   |
| linkactive_tb                 |
| mgw_tb                        |
| mgwportas_tb                  |
+-------------------------------+
10 rows in set (0.00 sec)

mysql> desc admstate_tb;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| STATUS | varchar(30) | NO   |     |         |       |
| VALUE  | int(11)     | NO   |     |         |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> desc linkactive_tb;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| STATUS | varchar(30) | NO   |     |         |       |
| VALUE  | int(11)     | NO   |     |         |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> desc mgw_tb
    -> ;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| MGW   | varchar(20) | NO   |     |         |       |
| IP    | varchar(20) | NO   |     |         |       |
| UF    | varchar(2)  | NO   |     |         |       |
| USER  | varchar(20) | NO   |     |         |       |
| PWD   | varchar(20) | NO   |     |         |       |
+-------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc mgwportas_tb;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| mgw             | varchar(20) | NO   |     |         |       |
| data            | date        | NO   |     |         |       |
| subrack         | varchar(10) | NO   |     |         |       |
| slot            | int(11)     | NO   |     |         |       |
| gbEth           | varchar(20) | NO   |     |         |       |
| speedAtual      | int(11)     | NO   |     |         |       |
| admState        | int(11)     | NO   |     |         |       |
| autoNeg         | varchar(7)  | NO   |     |         |       |
| speedConf       | int(11)     | NO   |     |         |       |
| errorsLinkIn    | int(11)     | NO   |     |         |       |
| errorsLinkOut   | int(11)     | NO   |     |         |       |
| discardsLinkIn  | int(11)     | NO   |     |         |       |
| discardsLinkOut | int(11)     | NO   |     |         |       |
| macaddr         | varchar(30) | NO   |     |         |       |
+-----------------+-------------+------+-----+---------+-------+