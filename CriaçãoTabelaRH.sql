CREATE TABLE [dbo].[funcionario]

(	
	id_func int primary key NOT NULL,
	nome varchar(50) NOT NULL,
	data_de_nascimento date NULL,
	data_de_admissao date NULL,
	endereco varchar(50) NULL,
	bairro varchar(50) NULL,
	cidade varchar(50) NULL,
	estado varchar(2),
	cep varchar(50) NULL,
	telefone varchar(50) NULL,
	email varchar(50) NULL,
	id_cargo int NULL,
	id_departamento int NULL
)

CREATE UNIQUE INDEX ix_dbofuncionario on dbo.funcionario (id_func)

----------------------------------------------------------
CREATE TABLE [dbo].[cargo]

(
	id_cargo int primary key NOT NULL,
	nome varchar(50) NULL,
	salario numeric(10,2) NULL,
	id_escolaridade int NULL
)

CREATE UNIQUE INDEX ix_dbocargo on dbo.cargo (id_cargo)
----------------------------------------------------------
CREATE TABLE [dbo].[departamento]

(
	id_departamento int primary key NOT NULL,
	nome varchar(20) NULL,
	descricao varchar(100) NULL
)

CREATE UNIQUE INDEX ix_departamento on dbo.departamento (id_departamento)
----------------------------------------------------------
CREATE TABLE [dbo].[alocacao]

(
	id_alocacao int primary key NOT NULL,
	data_saida date NOT NULL,
	data_inicio date NOT NULL,
	id_departamento int NOT NULL,
	id_funcionario int NOT NULL
)

CREATE UNIQUE INDEX ix_alocacao on dbo.alocacao (id_alocacao)
-----------------------------------------------------------
CREATE TABLE [dbo].[escolaridade]

(
	id_escolaridade int primary key NOT NULL,
	nivel varchar(10) NOT NULL,
	descricao varchar(100) NULL
)

CREATE UNIQUE INDEX ix_escolaridade on dbo.escolaridade (id_escolaridade)
-----------------------------------------------------------
CREATE TABLE [dbo].[estado]

(
	id_estado int primary key NOT NULL,
	estado varchar(2) NULL
)

CREATE UNIQUE INDEX ix_estado on dbo.estado (estado)
;