CREATE TABLE cliente (
idcli SERIAL NOT NULL PRIMARY KEY, 
nome VARCHAR(80) NOT NULL
);

CREATE TABLE pfisica (
idcli INT NOT NULL PRIMARY KEY REFERENCES cliente (idcli),
rg VARCHAR(15) NOT NULL,
cpf CHAR(11) NOT NULL,
conjuge int references pfisica (idcli),
unique (conjuge)
);

CREATE TABLE pjuridica (
idcli INT NOT NULL PRIMARY KEY REFERENCES cliente (idcli),
cnpj CHAR(15) NOT NULL,
incest varchar(12) not null
);

create table venda (
idven serial not null primary key,
dataven date not null,
idcli int not null references cliente (idcli)
);

create table produto (
idprod serial not null primary key,
nome varchar(80) not null,
qtde_estoque int not null,
preco numeric (6,2) not null
);

create table itens_venda(
idven int not null references venda (idven),
idprod int not null references produto (idprod),
qtde int not null,
preco numeric (6,2) not null,
primary key(idven,idprod)
);
--inserindo nos clientes 
insert into cliente (nome) values
('Valdiscléia'),('Josiscleiton'),('Marilove');
--inserindo em pessoa fisica
insert into pfisica (idcli,cpf,rg,conjuge) values 
(1,12345678,'he454412458',2),(2,87654321,'124536kale1',1),(3,15935745,'kale1234569', null);
--inserindo em pessoa juridica
insert into pjuridica (idcli, cnpj,incest) values 
(1,12345678901234,'hdkj123487'),(2,43210987654321,'jdla12345');
--inserindo em venda date ordem (ano,mes,dia)
insert into venda (idven, dataven, idcli) values 
(1,'2009-05-16',1),(2,'2017-03-29', 3),(3,'2018-02-27',2);
--inserindo em produto
insert into produto (nome,qtde_estoque,preco) values 
('Alvejante', 9, 6.25), ('Arroz', 20, 8.00), ('Feijão', 35, 5.00);
--inserindo em itens_venda
