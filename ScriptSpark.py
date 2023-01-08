# Databricks notebook source
# MAGIC %md
# MAGIC <h4>CONFIGURAR ADLS</h4>

# COMMAND ----------

configs = {
"fs.azure.account.auth.type": "OAuth",
"fs.azure.account.oauth.provider.type": "org.apache.hadoop.fs.azurebfs.oauth2.ClientCredsTokenProvider",
"fs.azure.account.oauth2.client.id": "12fde3d8-aeea-4b9a-9617-d80aff505c4a",
"fs.azure.account.oauth2.client.secret": dbutils.secrets.get(scope="VAULT",key="dbk-secret"),
"fs.azure.account.oauth2.client.endpoint": "https://login.microsoftonline.com/7a42e884-43d6-44ab-bf56-d12a115d22f0/oauth2/token"
} 

dbutils.fs.mount(
  source = "abfss://dataeng@williamcaires.dfs.core.windows.net/",
  mount_point = "/mnt/",
  extra_configs = configs) 

# COMMAND ----------

# MAGIC %md
# MAGIC <h4>Conexão para o SQL Server</h4>

# COMMAND ----------

jdbcUrl = 'jdbc:sqlserver://testeatento.database.windows.net:1433;database=dbtesteatento;user=admwill@testeatento;password={***********};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;'

# Ler dados do SQL para um dataframe
# dataframe = spark.read
#   .format("jdbc")
#   .option("url", jdbcUrl)
#   .option("dbtable", "schema.Nome da tabela")
#   .load()

# Salvar um dataframe no SQL server
# tripsunion.write
#   .format("jdbc")
#   .option("url", jdbcUrl)
#   .option("dbtable", "schema.tripsunion"
#   .mode("append")
#   .save()


# COMMAND ----------

# MAGIC %md
# MAGIC <h4>Leitura dos arquivos JSON<\H4>

# COMMAND ----------

spark.read.json("/mnt/teste/trips1.json").createOrReplaceTempView("trips1")
spark.read.json("/mnt/teste/trips2.json").createOrReplaceTempView("trips2")
spark.read.json("/mnt/teste/trips3.json").createOrReplaceTempView("trips3")
spark.read.json("/mnt/teste/trips4.json").createOrReplaceTempView("trips4")
spark.read.csv("/mnt/teste/vendorlookup.csv").createOrReplaceTempView("vendor")
spark.read.csv("/mnt/teste/paymentlookup.csv").createOrReplaceTempView("payment")

# COMMAND ----------

trips1 = spark.read.json("/mnt/teste/trips1.json")
trips2 = spark.read.json("/mnt/teste/trips2.json")
trips3 = spark.read.json("/mnt/teste/trips3.json")
trips4 = spark.read.json("/mnt/teste/trips4.json")

# COMMAND ----------

# MAGIC %md
# MAGIC <h4>COnfiguração do cabeçalho dos dois arquivos csv<\h4>

# COMMAND ----------

vendor = spark.read.option("header","true").csv("/mnt/teste/vendorlookup.csv")
payment = spark.read.option("header","true").csv("/mnt/teste/paymentlookup.csv")
payment = payment.where("A <> 'payment_type' AND B <> 'payment_lookup'").withColumnRenamed("A", "payment_type").withColumnRenamed("B", "payment_lookup")


# COMMAND ----------

# MAGIC %md
# MAGIC <h4>Junção dos JSON<\h4>

# COMMAND ----------

tripsunion = trips1.union(trips2).union(trips3).union(trips4)

# COMMAND ----------

#Salvar um dataframe no SQL server 
tripsunion.write\
   .format("jdbc")\
   .option("url", jdbcUrl)\
   .option("dbtable", "dbo.taxitrips")\
   .mode("overwrite")\
   .save()
     

vendor.write\
  .format("jdbc")\
  .option("url", jdbcUrl)\
  .option("dbtable", "dbo.vendors")\
  .mode("overwrite")\
  .save()    
    
payment.write\
  .format("jdbc")\
  .option("url", jdbcUrl)\
  .option("dbtable", "dbo.payment")\
  .mode("overwrite")\
  .save()  


    

# COMMAND ----------


