#comando windows:

#C:\Users\xxxxxx\AppData\Local\Programs\Python\Python36-32\python coletaMgwInfo.py MGWNAME xxxxxxx KF@17fra get ipinterface address

import time
import os
import telnetlib
import sys


oss = "x.xx.x.xxx"
mgw = sys.argv[1]
usuario = sys.argv[2]
senha = sys.argv[3]

print(sys.argv)

comando = ""
if(len(sys.argv) >=4):
	for i in range(4,len(sys.argv)):
		comando = comando + " " + sys.argv[i]   

try:		
	tn = telnetlib.Telnet(oss)
	tn.read_until(b"login:")
	tn.write(usuario.encode('utf-8') + b"\n")
	tn.read_until(b"Password: ")
	tn.write(senha.encode('utf-8') + b"\n")			
	saida = tn.read_until(b">")
	print (saida)
		
	#conectar no mgw
	try:
		tn.write(b"amos " + mgw.encode('ascii') + b"\n")
		saida = tn.read_until(mgw.encode('ascii') + b">",5)
		print(saida)
		tn.write(b"lt all" + b"\n")
		saida = tn.read_until(mgw.encode('ascii') + b">",5)
		print(saida)
		tn.write(comando.encode('ascii') + b"\n")
		saida = tn.read_until(mgw.encode('ascii') + b">",5)
		print(saida,"\r","\n")
		arquivo = open("logs.txt", "w")
		arquivo.write(str(saida))
		arquivo.close()
	except:
		
		print("Nao foi possivel acessar o Media Gateway solicitado")
		
	
except:
	print("\nNao foi possivel conectar no OSS\n")
tn.close()

con = MySQLdb.connect(host="10.29.169.61", user="root", passwd="",db="velocidadePortas_db")
c = con.cursor()

c.execute("select * from mgw_tb")
for row in c:
	 try:
		 print "Coletando informacoes do mgw : " + row[0] + "...\n"
		
		 filename = 'coleta' + row[0]

		 arquivo = open('C:/Users/A0027924/Desktop/relatorioEthToll/mgwRelatorio/sctp/'+ filename +'.txt', 'w')
		 HOST = row[1]
		 user = row[3]
		 password = row[4]
		 tn = telnetlib.Telnet(HOST)
		 tn.read_until("username: ")
		 tn.write(user + "\n")
		 tn.read_until("password: ")
		 tn.write(password + "\n")
		 tn.read_until("$")
		 tn.write("ncli \n")
		 tn.read_until(">")
		 tn.write("search . Sctp  \n")
		 arquivo.write(tn.read_until(">"))
		 arquivo.close()
		 arquivo = open('C:/Users/A0027924/Desktop/relatorioEthToll/mgwRelatorio/sctp/'+ filename +'.txt', 'r')
		 arquivo2 = open('C:/Users/A0027924/Desktop/relatorioEthToll/mgwRelatorio/sctp/dados/dados'+ filename +'.txt', 'w')
		 conteudo = arquivo.readlines()
		 texto = []
		 for i in range(2,(len(conteudo)-3)):
			 if(len(conteudo[i]) > 70):
				 tn.write("get " + conteudo[i] + "\n")
				 texto.append(tn.read_until(">"))

		 arquivo2.writelines(texto)	

		 arquivo.close()
		 arquivo2.close()

		 tn.close()
	 except:
		 print "Falha ao conectar na mgw: " + row[0]
		 arquivo = open('C:/Users/A0027924/Desktop/relatorioEthToll/mgwRelatorio/sctp/falhasColeta.txt', 'r')
		 conteudo = arquivo.readlines()
		 conteudo.append(row[0]+ "---" + time.strftime('%d-%m-%Y %H:%M') + "\n")	
		 arquivo = open('C:/Users/A0027924/Desktop/relatorioEthToll/mgwRelatorio/sctp/falhasColeta.txt', 'w')
		 arquivo.writelines(conteudo)
		 time.sleep(1)
		 arquivo.close()
