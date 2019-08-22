import os
import MySQLdb

con = MySQLdb.connect(host='x.x.x.x', user='root', passwd='',db='velocidadePortas_db')
c = con.cursor();

arquivo = open('C:\\Users\\xxxx\\Desktop\\relatorioEthToll\\mgwRelatorio\\mgwsCsv.txt','r')
linhas  = arquivo.readlines()
#print linhas
c.execute("delete from mgwPortas_tb")
con.commit()

for linha in linhas:
	mgw,data,subrack,slot,gbEth,speedAtual,admState,autoNeg,speedConf,errorsLink2In,errorsLink2Out,discardsLink2In,discardsLink2Out,macaddr = linha.split(",")
	insert = ("insert into mgwPortas_tb VALUES ('%s','%s','%s','%d','%s','%d','%d','%s','%d','%d','%d','%d','%d','%s')" % (mgw,data,subrack,int(float(slot)),gbEth,int(float(speedAtual)),int(float(admState)),autoNeg,int(float(speedConf)),int(float(errorsLink2In)),int(float(errorsLink2Out)),int(float(discardsLink2In)),int(float(discardsLink2Out)),macaddr))
	c.execute(insert)

con.commit()

