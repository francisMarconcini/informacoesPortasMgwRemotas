# informacoesPortasMgwRemotas
coleta de informações de mgws Ericsson Remotos

Primeiro deve-se executar o arquivo coletaMgwInfo, o qual coletará via uma plataforma de OSS as informações de todos os mgw's contidos na base de dados.
a base de dados possui seu modelo no arquivo database.sql

Após isso um parser awk é executado para formatação dos arquivos gerados na etapa anterior.
Por ultimo o arquivo inserirMgwBase insere as informações geradas na etapa anterior na base de dados mysql.

O frontend foi feito em php, com o framework CodeIgniter e também está neste repositório.
