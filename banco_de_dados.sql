
create table ambulatorio (
	numeroA int NOT NULL,
	andar int,
	capacidade int,
	PRIMARY KEY(numeroA)
);

create table medico (
	crm int NOT NULL,
	nome varchar(100),
	idade numeric(3),
	cidade varchar(100),
	especialidade varchar(100),
	numeroA int,
	PRIMARY KEY(crm),
    FOREIGN KEY(numeroA) REFERENCES ambulatorio(numeroA) on delete restrict on update restrict
);

create table paciente (
	rg int not null,
	nome varchar(100),
	idade numeric(3),
	cidade varchar(255),
	doenca varchar(255),
	PRIMARY KEY(rg)
);

create table consulta (
	crm int not null,
	rg int not null,
	hora varchar(4),
	data date,
  CHECK (data>current_date)
	PRIMARY KEY(crm,rg,data),
	FOREIGN KEY(rg) REFERENCES paciente(rg),
  FOREIGN KEY(crm) REFERENCES medico(crm)
);

create table funcionario (
	rg int not null,
	nome varchar(100),
	idade numeric(3) DEFAULT 0,
	cidade varchar(255),
	salario int,
	PRIMARY KEY(rg),
	CHECK (salario>500)
);



insert into funcionario (rg, nome, idade, cidade, salario) values (86739849, "Paulo", 21, "Fpolis", 500);
insert into amabulatorio values (1, 4, 50);


create table rua (
	codigoRua int NOT NULL, 
	nome varchar(255),
	PRIMARY KEY(codigoRua)
);

create table cliente (
	cpf int NOT NULL, 
	nome varchar(255), 
	fone numeric(11), 
	codigoRua int NOT NULL, 
	numero int, 
	complemento varchar(255),
	PRIMARY KEY(cpf),
	FOREIGN KEY(codigoRua) REFERENCES rua(codigoRua) on delete restrict on update restrict
);

create table nota (
	numeroNota int NOT NULL, 
	data_emissao date NOT NULL, 
	data_vencimento date NOT NULL, 
	valor int NOT NULL,
	PRIMARY KEY(numeroNota),
	CHECK (data_vencimento>data_emissao)
);

create table itensnota ( 
	codItem int NOT NULL, 
	tamanho int, 
	peso int,
	PRIMARY KEY(codItem)
);

create table coleta (
	numeroColeta int NOT NULL, 
	data date NOT NULL,
	pagadorFrete char, 
	cpfRem int NOT NULL, 
	cpfDes int NOT NULL,
	PRIMARY KEY(numeroColeta),
	FOREIGN KEY(cpfRem) REFERENCES cliente(cpf) on delete restrict on update restrict,
	FOREIGN KEY(cpfDes) REFERENCES cliente(cpf) on delete restrict on update restrict,
	CHECK (pagadorFrete='D' or pagadorFrete = 'R'),
	CHECK (data<=current_date)
);

create table itenscoleta (
	numeroColeta int NOT NULL, 
	codItem int NOT NULL, 
	tamanho int, 
	peso int, 
	valor int,
	PRIMARY KEY(codItem),
	FOREIGN KEY(numeroColeta) REFERENCES coleta(numeroColeta) on delete restrict on update restrict
);


1)      Cadastre a rua Jornalista Rubens de Arruda Ramos

insert into rua (codigoRua, nome) values (86739849, 'Jornalista Rubens de Arruda Ramos');

2)      Cadastre 2 clientes, de cpf 111 e 222, ambos como moradores da rua Jornalista Rubens de Arruda Ramos

insert into cliente (cpf, nome, codigoRua) values (111, 'João Manoel', 86739849);
insert into cliente (cpf, nome, codigoRua) values (222, 'Maria das Dores', 86739849);

3)      Cadastre 2 coletas, 20 e 30

insert into coleta (numeroColeta, data, cpfrem, cpfdes ) values (20, '3/12/2017', 111, 222);
insert into coleta (numeroColeta, data, cpfrem, cpfdes ) values (30, '3/12/2017', 111, 222);

4)      Cadastre os itens da coleta: coleta 20 com os itens 1, 2 e 3, e a coleta 30 com o item 4

insert into itenscoleta(codItem,numeroColeta) values (1,20);
insert into itenscoleta(codItem,numeroColeta) values (2,20);
insert into itenscoleta(codItem,numeroColeta) values (3,20);
insert into itenscoleta(codItem,numeroColeta) values (4,30);

5)      Cadastre uma nota fiscal de numero 444 com data de emissão '10/10/2016' e data de vencimento igual a 10/09/2016

insert into nota (numeroNota, data_emissao, data_vencimento, valor) values (444, '10/10/2016', '09/10/2016', 1000 );

Não é permitido inserir notas com data de vencimento menor que a data de emissão;

6)      Cadastre uma coleta com pagador de frete diferente de D e R e veja o que SGBD faz

insert into coleta(numeroColeta, data, cpfrem, cpfdes, pagadorFrete) values (83745937, '10/10/1985', 111,222, 'G');

OK

7)      Modifique o telefone do cliente 111 para 3721 4728

update cliente set fone = 37214728 where cpf = 111; 

8)      Modifique o valor dos Itens da Coleta aumenta o valor de todos os produtos em 100 reais

update itenscoleta set valor = valor + 100; 

mas notei que coloquei o valor como null e ele deveria ser not null

9)     Um trigger é usado sempre que uma ação sobre uma tabela requer a ação em outra tabela. Suponha um exemplo onde queremos que, ao incluir uma nova nota fiscal, o SGBD automaticamente traga os registros da coleta e os insira na tabela itens_nota. Para fazer isso, crie o trigger abaixo e em seguida

ok

10)   Consulte a tabela ItensNota (ela deve estar vazia)

select * from itensnota;

11)   Cadastre a nota fiscal de numero 555, e em seguida consulte a tabela de itensNota, ela deve conter os dados dos itens da coleta

insert into nota(numeroNota, data_emissao, data_vencimento, valor) values (555, '10/10/1985', '12/10/1985', 1000);

12)   Remova o cliente de cpf 111

delete from cliente where cpf=111;

	O sistema emnite um erro violates foreign key constraint "coleta_cpfrem_fkey" on table "coleta"

13)   Consulte todas as notas

select * from nota;

sistema apresenta uma nota

14)   Remova a nota fiscal de numero 555

delete from nota where numeroNota = 555;

15)   Consulte novamente todas as notas e verifique se a 555 foi removida

select * from nota;

Ok o sistema removeu a nota

16)   Remova todas as notas e consulte a tabela para verificar se esta vazia

delete from nota;
select * from nota;

O sistema não possui mais nenhuma nota;

17)   Destrua a tabela coleta

drop table coleta;

ERROR:  cannot drop table coleta because other objects depend on it


CREATE FUNCTION p_notas() RETURNS trigger AS $p_notas$

BEGIN
EXECUTE 'INSERT INTO itensnota (select codItem,tamanho,peso from itenscoleta) ';
RETURN NEW;
END;
$p_notas$ LANGUAGE plpgsql;

CREATE TRIGGER insere_itens AFTER INSERT

ON nota FOR EACH ROW EXECUTE procedure p_notas();


tive que alterar de notas para nota




