
create database db_biblioteca;
show databases;
use db_biblioteca;

create table TB_LIVRO (
	cd_livro int not null,
    nm_nome varchar(100),
    ng_autor varchar(100),
    nm_genero varchar(50),
    dt_ano_lancamento date not null,
    cd_edicao int not null,
    primary key(cd_livro)
);
Show table status;
show columns from TB_LIVRO;

create table TB_EMPRESTIMO(
	cd_emprestimo int not null,
    dt_retirada date not null,
    dt_devolucao_prevista date not null,
    dt_devolucao date,
    cd_livro int not null,
    cd_cliente int not null,
    primary key (cd_emprestimo),
    constraint FK_TB_EMPRESTIMO_CD_LIVRO foreign key (cd_livro) references TB_LIVRO (cd_livro)
);
show table status;

create table TB_CLIENTE(
	cd_cliente int not null,
    nm_nome varchar(50) not null,
    cd_cpf bigint not null,
    dt_nascimento date not null,
    nm_email varchar(100) not null,
    cd_telefone varchar(16) not null,
    primary key (cd_cliente)
);
show table status;

create table TB_LIVRO_EMPRESTADO(
	cd_emprestimo int not null,
    cd_cliente int not null,
    constraint FK_TB_LIVRO_EMPRESTADO_CD_EMPRESTIMO foreign key (cd_emprestimo) references TB_EMPRESTIMO (cd_emprestimo),
    constraint FK_TB_LIVRO_EMPRESTADO_CD_CLIENTE foreign key (cd_cliente) references TB_CLIENTE (cd_cliente)

