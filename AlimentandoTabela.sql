--INSERT INTO [dbo].[funcionario] 

--(id_func, nome, data_de_nascimento, data_de_admissao, endereco, bairro, cidade, estado, cep, telefone, email, id_cargo, id_departamento) 
--VALUES
--(00001, 'Lucas', '10-04-1999', '11-01-2021', 'Avenida Joao', 'Algum', 'São Paulo', 'SP', 00000-000, 1111111111, 'lucas@gmail.com', 0001, 01),
--(00002, 'Mauro', '05-02-1987', '01-02-2013', 'Rua Alameda', 'Outro', 'São Bernardo', 'SP', 00000-001, 2222222222, 'Mauro@gmail.com', 0004, 02),
--(00003, 'Lucia', '05-03-1994', '03-05-2020', 'Avenida Santos', 'Aquele', 'Feira de Santana', 'BA', 00001-123, 3333333333, 'Lucia@gmail.com', 0003, 02)
-------------------------------------------
--INSERT INTO [dbo].[estado]

--(id_estado, estado)
--VALUES 
--(01, 'AC'), (02, 'AL'), (03, 'AP'), (04, 'AM'), (05, 'BA'), (06, 'CE'), (07, 'DF'), (08, 'ES'), (09, 'GO'), (10, 'MA'), (11, 'MT'),
--(12, 'MS'), (13, 'MG'), (14, 'PA'), (15, 'PB'), (16, 'PR'), (17, 'PE'), (18, 'PI'), (19, 'RJ'), (20, 'RN'), (21, 'RS'), (22, 'RO'),
--(23, 'RR'), (24, 'SC'), (25, 'SP'), (26, 'SE'), (27, 'TO')
-------------------------------------------
--INSERT INTO [dbo].[escolaridade]

--(id_escolaridade, nivel, descricao)
--VALUES
--(01, 'Ensino Fundamental',''), (02, 'Ensino Médio', ''), (03, 'Ensino Superior', '')
-------------------------------------------
--INSERT INTO [dbo].[departamento]

--(id_departamento, nome, descricao)
--VALUES
--(01, 'Seg. da Informação', ''), (02, 'Vendas', ''), (03, 'Seg. do Trabalho', '')
-------------------------------------------
--INSERT INTO [dbo].[cargo]

--(id_cargo, nome, salario, id_escolaridade)
--VALUES
--(0001, 'Analista', 1800.00, 03),
--(0002, 'Atendente', 1300.00, 02),
--(0003, 'Diretor(a)', 15000.00, 03)
-------------------------------------------
