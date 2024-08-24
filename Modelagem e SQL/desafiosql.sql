create database desafiosql;

use desafiosql;

create table Jogador (
    jogador_id varchar(20) primary key,
    Nome character,
    Idade numeric,
    CPF varchar(14),
    Endereco nchar
);

create table Jogo (
    login varchar(20),
    senha varchar(20),
    compra_ingame real,
    interacao integer,
    games integer primary key
);

create table Gerente_Geral (
    gerente_geral_id varchar(20) primary key,
    Nome character,
    Idade numeric,
    CPF varchar(14),
    Sexo char,
    Endereco nchar,
    Disponibilidade time
);

create table CEO (
    ceo_id varchar(20) primary key,
    Nome character,
    Idade numeric,
    CPF varchar(14),
    Sexo char,
    Endereco nchar,
    Investimento real
);

create table Comissao_Tecnica (
    staff_id varchar(20) primary key,
    Nome character,
    Idade numeric,
    Sexo char,
    CPF varchar(14),
    Endereco nchar
);

create table Marketing (
    marketing_id varchar(20) primary key,
    Investimento real,
    Encaminhar integer,
    Horario time,
    Lugar nchar,
    Data_Mkt date
);

alter table Jogador
add column Sexo char;

create table Estuda (
    fk_Comissao_Tecnica_staff_id varchar(20),
    fk_Jogo_jogo_id integer,
    primary key (fk_Comissao_Tecnica_staff_id, fk_Jogo_jogo_id)
);

create table Treina (
    fk_Comissao_Tecnica_staff_id varchar(20),
    fk_Jogador_jogador_id varchar(20),
    primary key (fk_Comissao_Tecnica_staff_id, fk_Jogador_jogador_id)
);

create table Auxilia (
    fk_Gerente_Geral_gerente_geral_id varchar(20),
    fk_Jogador_jogador_id varchar(20),
    primary key (fk_Gerente_Geral_gerente_geral_id, fk_Jogador_jogador_id)
);

create table Coordena (
    fk_Gerente_Geral_gerente_geral_id varchar(20),
    fk_CEO_ceo_id varchar(20),
    primary key (fk_Gerente_Geral_gerente_geral_id, fk_CEO_ceo_id)
);

create table Repassa (
    fk_Gerente_Geral_gerente_geral_id varchar(20),
    fk_Comissao_Tecnica_staff_id varchar(20),
    primary key (fk_Gerente_Geral_gerente_geral_id, fk_Comissao_Tecnica_staff_id)
);

create table Exige (
    fk_CEO_ceo_id varchar(20),
    fk_Comissao_Tecnica_staff_id varchar(20),
    primary key (fk_CEO_ceo_id, fk_Comissao_Tecnica_staff_id)
);

create table Contrata (
    fk_CEO_ceo_id varchar(20),
    fk_Jogador_jogador_id varchar(20),
    primary key (fk_CEO_ceo_id, fk_Jogador_jogador_id)
);

create table Divulga (
    fk_Marketing_marketing_id varchar(20),
    fk_Jogador_jogador_id varchar(20),
    primary key (fk_Marketing_marketing_id, fk_Jogador_jogador_id)
);

create table Rende (
    fk_Marketing_marketing_id varchar(20),
    fk_Jogo_jogo_id integer,
    primary key (fk_Marketing_marketing_id, fk_Jogo_jogo_id)
);

alter table Estuda add constraint FK_Estuda_1
    foreign key (fk_Comissao_Tecnica_staff_id)
    references Comissao_Tecnica (staff_id)
    on delete restrict;

alter table Estuda add constraint FK_Estuda_2
    foreign key (fk_Jogo_jogo_id)
    references Jogo (jogo_id)
    on delete restrict;

alter table Treina add constraint FK_Treina_1
    foreign key (fk_Comissao_Tecnica_staff_id)
    references Comissao_Tecnica (staff_id)
    on delete restrict;

alter table Treina add constraint FK_Treina_2
    foreign key (fk_Jogador_jogador_id)
    references Jogador (jogador_id)
    on delete restrict;

alter table Auxilia add constraint FK_Auxilia_1
    foreign key (fk_Gerente_Geral_gerente_geral_id)
    references Gerente_Geral (gerente_geral_id)
    on delete restrict;

alter table Auxilia add constraint FK_Auxilia_2
    foreign key (fk_Jogador_jogador_id)
    references Jogador (jogador_id)
    on delete restrict;

alter table Coordena add constraint FK_Coordena_1
    foreign key (fk_Gerente_Geral_gerente_geral_id)
    references Gerente_Geral (gerente_geral_id)
    on delete restrict;

alter table Coordena add constraint FK_Coordena_2
    foreign key (fk_CEO_ceo_id)
    references CEO (ceo_id)
    on delete restrict;

alter table Repassa add constraint FK_Repassa_1
    foreign key (fk_Gerente_Geral_gerente_geral_id)
    references Gerente_Geral (gerente_geral_id)
    on delete restrict;

alter table Repassa add constraint FK_Repassa_2
    foreign key (fk_Comissao_Tecnica_staff_id)
    references Comissao_Tecnica (staff_id)
    on delete restrict;

alter table Exige add constraint FK_Exige_1
    foreign key (fk_CEO_ceo_id)
    references CEO (ceo_id)
    on delete restrict;

alter table Exige add constraint FK_Exige_2
    foreign key (fk_Comissao_Tecnica_staff_id)
    references Comissao_Tecnica (staff_id)
    on delete restrict;

alter table Contrata add constraint FK_Contrata_1
    foreign key (fk_CEO_ceo_id)
    references CEO (ceo_id)
    on delete restrict;

alter table Contrata add constraint FK_Contrata_2
    foreign key (fk_Jogador_jogador_id)
    references Jogador (jogador_id)
    on delete restrict;

alter table Divulga add constraint FK_Divulga_1
    foreign key (fk_Marketing_marketing_id)
    references Marketing (marketing_id)
    on delete restrict;

alter table Divulga add constraint FK_Divulga_2
    foreign key (fk_Jogador_jogador_id)
    references Jogador (jogador_id)
    on delete restrict;

alter table Rende add constraint FK_Rende_1
    foreign key (fk_Marketing_marketing_id)
    references Marketing (marketing_id)
    on delete restrict;

alter table Rende add constraint FK_Rende_2
    foreign key (fk_Jogo_jogo_id)
    references Jogo (jogo_id)
    on delete restrict;