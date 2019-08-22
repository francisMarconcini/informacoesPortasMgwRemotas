#tratamento awk velocidade mgws
BEGIN{
subrack=""
slot=""
gigaBitEthernet=""
speedAtual=""
admState=""
autoNegotiation=""
speedConfigured=""
errrorsLink2entrada=""
errrorsLink1entrada=""
errrorsLink2saida=""
errrorsLink1saida=""
discardsLink2entrada=""
discardsLink1entrada=""
discardsLink2saida=""
discardsLink1saida=""
macaddr1=""
macaddr2=""
DuplexMode=""
linkSpeed=""

}

{
	if($1 ~ /^LDN/){
	
		getline
		elementInfo = $0
		split(elementInfo,vetorInfo,",")
		split(vetorInfo[3],subr,"=")
		subrack = subr[2]
		split(vetorInfo[4],sl,"=")
		slot = sl[2]
		split(vetorInfo[7],gb,"=")
		gigaBitEthernet = gb[2]
	}
	
	if($1 ~ /actualSpeedDuplex/)
		{
			split($1,spd,"=")
			speedAtual = substr(spd[2],6,1)
			#print "actualSpeedDuplex ok"
		}
	
	if($1 ~ /administrativeState/)
		{
			split($1,admst,"=")
			admState = substr(admst[2],6,1)
			#print "administrativeState ok"
		}
		
	if($1 ~ /autoNegotiation/)
		{
			split($1,autNeg,"=")
			autoNegotiation = substr(autNeg[2],10,4)
			#print "autoNegotiation ok"
		}
		
	if($1 ~ /configuredSpeedDuplex/)
		{
			split($1,confSpeed,"=")
			speedConfigured = substr(confSpeed[2],6,4)
			#print "configuredSpeedDuplex ok"
		}
	
	if($1 ~ /pmIfInErrorsLink2/)
		{
			split($1,Erros2,"=")
			sub(/"/, "", Erros2[2])
			errorsLink2entrada = Erros2[2]
			#print "pmIfInErrorsLink2 ok"	
		}
	
	if($1 ~ /pmIfInErrorsLink1/)
		{
			split($1,Erros1,"=")
			sub(/"/, "", Erros1[2])
			errorsLink1entrada = Erros1[2]
			#print "pmIfInErrorsLink1 ok:"errorsLink1entrada
		}
	
	if($1 ~ /pmIfOutErrorsLink2/)
		{
			split($1,Erros2saida,"=")
			sub(/"/, "", Erros2saida[2])
			errorsLink2saida = Erros2saida[2]
			#print "pmIfOutErrorsLink2 ok"
		}
		
	
	if($1 ~ /pmIfOutErrorsLink1/)
		{
			split($1,Erros1saida,"=")
			sub(/"/, "", Erros1saida[2])
			errorsLink1saida = Erros1saida[2]
			#print "pmIfOutErrorsLink1 ok"
		}
	
	if($1 ~ /pmIfInDiscardsLink2/)
		{
			split($1,discard2,"=")
			sub(/"/, "", discard2[2])
			discardsLink2entrada = discard2[2]
			#print "pmIfInDiscardsLink2 ok"
		}
	
	if($1 ~ /pmIfInDiscardsLink1/)
		{
			split($1,discard1,"=")
			sub(/"/, "", discard1[2])
			discardsLink1entrada = discard1[2]
			#print "pmIfInDiscardsLink1 ok"
		}
	
	if($1 ~ /pmIfOutDiscardsLink2/)
		{
			split($1,discard2saida,"=")
			sub(/"/, "", discard2saida[2])
			discardsLink2saida = discard2saida[2]
			#print "pmIfOutDiscardsLink2 ok"
		}
	
	if($1 ~ /pmIfOutDiscardsLink1/)
		{
			split($1,discard1saida,"=")
			sub(/"/, "", discard1saida[2])
			discardsLink1saida = discard1saida[2]
			#print "pmIfOutDiscardsLink1 ok"
		}
	
	if($1 ~ /macAddressLink1/)
		{
			split($1,mac1,"=")
			sub(/"/,"",mac1[2])
			sub(/\(String\)/,"",mac1[2])
			sub(/"/,"",mac1[2])
			macaddr1 = mac1[2]
			#print "macAddressLink1 ok"
		}
	
	if($1 ~ /macAddressLink2/)
		{
			split($1,mac2,"=")
			sub(/"/,"",mac2[2])
			sub(/\(String\)/,"",mac2[2])
			sub(/"/,"",mac2[2])
			macaddr2 = mac2[2]
			#print "macAddressLink2 ok"
		}
	
	if(macaddr1 != "")
      {
	  print ARGV[2]","strftime("%Y-%m-%d")","subrack","slot","gigaBitEthernet","speedAtual","admState","autoNegotiation","speedConfigured","errorsLink1entrada","errorsLink1saida","discardsLink1entrada","discardsLink1saida","macaddr1 >> "mgwsCsv.txt"
	  errorsLink1entrada=""
	  errorsLink1saida=""
	  discardsLink1entrada=""
	  discardsLink1saida=""
	  macaddr1=""
	  }
	if(macaddr2 != "")
      {
	  print ARGV[2]","strftime("%Y-%m-%d")","subrack","slot","gigaBitEthernet","speedAtual","admState","autoNegotiation","speedConfigured","errorsLink2entrada","errorsLink2saida","discardsLink2entrada","discardsLink2saida","macaddr2 >> "mgwsCsv.txt"
	  errorsLink2entrada=""
	  errorsLink2saida=""
	  discardsLink2entrada=""
	  discardsLink2saida=""
	  macaddr2=""	
	  subrack=""
	  slot=""
	  gigaBitEthernet=""
	  speedAtual=""
	  admState=""
	  autoNegotiation=""
	  speedConfigured=""
	  }
	  
	  if($1 ~ /duplexMode/)
	{
			split($1,dupMod,"=")
			duplexMode = substr(dupMod[2],6,1)
	}
	
	if($1 ~ /linkSpeed/)
	{
			split($1,lnkSpd,"=")
			linkSpeed = substr(lnkSpd[2],6,4)
	}
	  
	 if(linkSpeed != "")
	 	{
	  print ARGV[2]","strftime("%Y-%m-%d")","subrack","slot",MediumAccessUnit-"gigaBitEthernet","duplexMode""linkSpeed",1000,X,"duplexMode""linkSpeed",0,0,0,0,xxx" >> "mgwsCsv.txt"	
	  duplexMode = ""
	  linkSpeed = ""
	  errorsLink2entrada=""
	  errorsLink2saida=""
	  discardsLink2entrada=""
	  discardsLink2saida=""
	  macaddr2=""	
	  subrack=""
	  slot=""
	  gigaBitEthernet=""
	  speedAtual=""
	  admState=""
	  autoNegotiation=""
	  speedConfigured=""
	 	}
	  }	

