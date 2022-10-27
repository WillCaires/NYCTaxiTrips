# NYCTaxiTrips
A partir dos dados da base NYC Taxi Trips foram aplicadas tecnicas de ingestão, processamento, transformação e análise dos dados.


# Ferramentas utilizadas:
 •	Microsoft Azure
 •	SQL Server Management Studio
 •	Microsoft Power BI
 •	Microsoft Power Automate
 • Azure Management Store
 
# Recursos utilizados no Azure:
 •  Data Factory - Para ingestão dos dados\
 •	Blob Storage GEN2 (DataLake) - Para armazenamento\
 •  DataBricks - Para processamento e transformação

Ao todo fora 6 arquivos, 4 no formato json e 2 em CSV, extraídos de fonte HTTP do site S3.AmazonAWS.com   

# Resumo
Dentro do Data Factory foi criado um Linked Service para conectar na fonte de dados HTTP e extrair os arquivos em datasets separados.\
Após as extrações de cada arquivo, direcionei o armazenamento para o meu dataLake no Azure e conectar com o cluster no DataBricks e efetuar algumas transformações nos dados.

Com os dados processados, inseri eles em um BD no SQL Server a fim de realizar consultas e criar uma view para facilitar o acesso no momento de conectar no Power Bi.\
Já no Power BI foram efetuados algumas modificações a fim de visualizar as métricas.

Também foi criado uma conexão de StreamingData com o Power Automate da Microsoft para simular a visualização de uma métrica em tempo real.



   
