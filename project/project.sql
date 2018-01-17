drop trigger participants_id_bir;
drop trigger signer_id_bir;
drop trigger utd_lines_id_bir;
drop trigger PAYMENT_DOCUMENT_ID_bir;

drop sequence xmld_participants_id_seq;
drop sequence xmld_signers_id_seq;
drop sequence xmld_signers_holder_id_seq;
drop sequence xmld_utd_id_seq;
drop sequence xmld_utd_lines_id_seq;
drop sequence xmld_utd_pay_doc_id_seq;

drop table xmld_signers CASCADE constraints;
drop table xmld_participants CASCADE constraints;
drop table xmld_utd_headers CASCADE constraints;
drop table xmld_utd_lines CASCADE constraints;
drop table xmld_utd_payment_documents CASCADE constraints;
drop table xmld_buffer_xml_files CASCADE constraints;


create table xmld_signers 
(signer_id number not null, constraint xmld_signers_pk primary key (signer_id),
HOLDER_ID number not null,
signer_type varchar2(2 char) not null, constraint signer_type_chk check (upper (signer_type) in ('ФЗ', 'ЮЛ', 'ИП')),
signer_aut number not null, constraint signer_aut check (signer_aut in (0, 1, 2, 3, 4, 5, 6)),
signer_stat varchar2(1 char) not null, constraint signer_stat check (signer_stat in (1,2,3,4)),
signer_aut_bas varchar2(255 char) not null, 
org_aut_bas varchar2(255 char), 
inn_of_indiv varchar2(12 char),--Обязателен для подписанта при наличии в сертификате ключа проверки электронной подписи. Шаблон: ([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})[0-9]{10}.-- 
other_inf_about_indiv varchar2(255 char), --Иные сведения, идентифицирующие физическое лицо.--
inn_of_entrepreneur varchar2(10) not null, --Шаблон: ([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})[0-9]{8}.--
name_of_org varchar2(1000 char) not null,
pos varchar2(129 char)  not null, 
req_of_the_certif varchar(100),
second_name varchar2(60 char) not null,
first_name varchar2(60 char) not null,
patronymic varchar2(60 char) not null
);
comment on column xmld_signers.signer_type is 'Типа подписанта';
comment on column xmld_signers.signer_aut is 'Область полномочий';
comment on column xmld_signers.signer_stat is 'Статус подписанта';
comment on column xmld_signers.signer_aut_bas is 'Основание полномочий (доверия)';
comment on column xmld_signers.org_aut_bas is 'Основание полномочий (доверия) организации';
comment on column xmld_signers.inn_of_indiv is 'ИНН физического лица';
comment on column xmld_signers.other_inf_about_indiv is 'Другие сведения о физическом лице';
comment on column xmld_signers.inn_of_entrepreneur is 'ИНН юридического лица';
comment on column xmld_signers.name_of_org is 'Название организации';
comment on column xmld_signers.pos is 'Должность';
comment on column xmld_signers.req_of_the_certif is 'Реквизиты свидетельства о государственной регистрации';
comment on column xmld_signers.second_name is 'Фамилия';
comment on column xmld_signers.first_name is 'Имя';
comment on column xmld_signers.patronymic is 'Отчество';

create table xmld_participants
(participant_id number not null, constraint participant_id_pk primary key (participant_id),
participant_type varchar2(100 char) not null,
inn_of_indiv varchar2(12 char), --Шаблон: ([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})[0-9]{10}.--
req_of_the_certif varchar2(100 char),
other_inf_about_indiv varchar2(255 char), --Иные сведения, идентифицирующие физическое лицо.--
name_of_org varchar2(1000 char) not null,
inn_of_org varchar2(10 char) not null, --Шаблон: ([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})[0-9]{8}.
reason_of_reg varchar2(9 char), --Шаблон: ([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})([0-9]{2})([0-9A-Z]{2})([0-9]{3}).
ind varchar2(6 char), --Шаблон: [0-9]{6}.
region_code varchar2(2 char), --Шаблон: [0-9]{2}.
region varchar2(50 char),
city varchar2(50 char),
locality varchar2(50 char),
street varchar2(50 char),
house varchar2(20 char),
housing varchar2(20 char),
flat varchar2(20 char),
country_code varchar2(3 char), --Шаблон: [0-9]{3}.
address varchar2(255 char),
phone varchar2(255 char),
email_address varchar2(255 char),
bank_name varchar2(1000 char),
bank_identific_code varchar2(9 char), --Шаблон: [0-9]{9}.
cor_ac_of_the_bank varchar2(20 char),  
bank_ac_number varchar2(20 char),
code_in_classifier varchar2(10 char),
structural_subdivision varchar2(1000 char),
info_for_participants varchar2(255 char),
number_of_the_addres_object varchar2(34) not null, 
country varchar2(100),
second_name varchar(60) not null,
first_name varchar(60) not null,
patronymic varchar(60) not null
);
comment on column xmld_participants.participant_id is 'Идентификатор участника';
comment on column xmld_participants.participant_type is 'Тип участника';
comment on column xmld_participants.inn_of_indiv is 'Тип участника';
comment on column xmld_participants.req_of_the_certif is 'Реквизиты свидетельства о государственной регистрации';
comment on column xmld_participants.other_inf_about_indiv is 'Другие сведения о физическом лице';
comment on column xmld_participants.name_of_org is 'Название организации';
comment on column xmld_participants.inn_of_org is 'ИНН организации';
comment on column xmld_participants.reason_of_reg is 'Код причины постановки на учет';
comment on column xmld_participants.ind is 'Индекс';
comment on column xmld_participants.region_code is 'Код региона';
comment on column xmld_participants.region is 'Регион';
comment on column xmld_participants.city is 'Город';
comment on column xmld_participants.locality is 'Населенный пункт';
comment on column xmld_participants.street is 'Улица';
comment on column xmld_participants.house is 'Дом';
comment on column xmld_participants.flat is 'Квартира';
comment on column xmld_participants.country_code is 'Код страны';
comment on column xmld_participants.address is 'Адрес';
comment on column xmld_participants.phone is 'Телефон';
comment on column xmld_participants.email_address is 'Электронная почта';
comment on column xmld_participants.bank_name is 'Название банка';
comment on column xmld_participants.bank_identific_code is 'Банковский идентификационный код';
comment on column xmld_participants.cor_ac_of_the_bank is 'Корреспондентский счет банка';
comment on column xmld_participants.bank_ac_number is 'Номер банковского счета';
comment on column xmld_participants.code_in_classifier is 'Код в общероссийском классификаторе предприятий и организаций';
comment on column xmld_participants.structural_subdivision is 'Структурное подразделение';
comment on column xmld_participants.info_for_participants is 'Информация для участника документооборота';
comment on column xmld_participants.number_of_the_addres_object is 'Уникальный номер адреса объекта адресации в государственном адресном реестре';
comment on column xmld_participants.country is 'Страна';
comment on column xmld_participants.second_name  is 'Фамилия';
comment on column xmld_participants.first_name is 'Имя';
comment on column xmld_participants.patronymic is 'Отчество';


create table xmld_utd_headers 
(UTD_ID number not null, constraint  utd_id_pk primary key (UTD_ID),
serial_number_of_the_invoice varchar2(1000 char) not null,
date_of_invoicing date not null,
code_of_form varchar2(7 char) not null, constraint code_of_form_chk check (code_of_form = '1115125'),
date_of_cr_of_the_invoice  date not null,
time_of_cr_of_the_invoice  date not null,
code_of_currency char(3 char) not null, --constraint code_of_currency_chk check (функция, которая работает с регулярными выражениями),
number_of_correction number(3,0) not null,
date_of_correction date not null,
cost_of_goods_without_tax number(17,2) not null,
sum_of_tax  number(17,2) not null,
cost_of_goods_with_tax number(17,2) not null, -- всего к оплате
cost1_of_goods_with_tax number(17,2) not null, --???
date_of_note date not null, --sysdade
file_id varchar2(200 char) not null,
file_sender_id varchar2(46 char) not null, constraint file_sender_id_chk check (length(file_sender_id)>=4),
file_recipient_id varchar2(46 char) not null, constraint file_recipient_id_chk check (length(file_sender_id)>=4),
date_of_file_update date,
sum_of_goods_wh_tax  number(17,2) not null,
type_of_doc varchar2(6 char) not null, constraint type_of_doc_chk check (upper (type_of_doc) in ('СЧФ', 'СЧФДОП', 'ДОП')),
name_of_doc_of_organization varchar2(255 char),
name_of_the_doc_of_econ varchar2(255 char)  not null,
name_of_the_econ_sub varchar2(1000 char) not null,
found_of_the_creator_file varchar2(120 char) not null,
VENDOR_PARTICIPANT_ID number not null, constraint VENDOR_PARTICIPANT_ID_fk foreign key (VENDOR_PARTICIPANT_ID) references  xmld_participants,
SHIP_PARTICIPANT_ID number, constraint SHIP_PARTICIPANT_ID_fk foreign key (SHIP_PARTICIPANT_ID) references  xmld_participants,
CONS_PARTICIPANT_ID number not null, constraint CONS_PARTICIPANT_ID_fk foreign key (CONS_PARTICIPANT_ID) references  xmld_participants,
BUYER_PARTICIPANT_ID number not null, constraint BUYER_PARTICIPANT_ID_fk foreign key (BUYER_PARTICIPANT_ID) references  xmld_participants,
gos_contr_id varchar2(255 char),
name_of_valuta varchar2(100 char),
curs_of_valuta number(6,4),
id_of_signer_seller number,-- constraint id_of_signer_seller_fk foreign key id_of_signer_seller references xmld_signers,
weight number(15,11 )
-- ID ссылка на транспортные накладные (ссылка на таблицу XXLD_WAYBILLS)
--ID ссылка на сведения о платежно-расчетных документах (ссылка на таблицу XXLD_UTD_PAYMENT_DOCUMENTS) (Ветка СвПРД)
--ID на подписантов покупателя ( ссылка на таблицу XXLD_SIGNERS)
);


create table xmld_utd_lines
(UTD_ID number not null, constraint utd_id_fk foreign key (utd_id) references xmld_utd_headers,
UTD_LINE_ID number not null, constraint  utd_line_id_pk primary key (UTD_line_id),
number_of_row number(6),
name_of_product varchar2(1000 char),
quantity number(15,11),
unit_code varchar2(4 char),
price_of_unit number(15,11),
sum_of_product_without_tax number(17,2),
sum_of_tax number(17,2),
sum_of_product_with_tax number(17,2),
sum_of_excise number(17,2),
date_of_recording date,
country_code_of_product  varchar2(3 char), constraint country_code_of_product_ch check (length(country_code_of_product)=3),
date_of_last_update date,
attribute_of_product varchar2(1 char), constraint attribute_of_product_ck check (attribute_of_product in ('1','2','3','4','5')),
other_info_about_product varchar2(4 char),
code_of_product varchar2(255 char),
unit_name varchar2(255 char),
brief_name_of_country_of_prod varchar2(255 char),
quantity_of_letting_go number(15,11),
cor_acc_debit varchar2(9 char), constraint cor_acc_debit_ck check (length(cor_acc_debit)=9),
cor_acc_cr varchar2(9 char),constraint cor_acc_cr_ck check (length(cor_acc_cr)=9),
tax_rate varchar2(7 char), constraint tax_rate_ck check (tax_rate  in ('0%', '10%', '18%', '10/110', '18/118', 'без НДС'))
);


create table xmld_utd_payment_documents
(PAYMENT_DOCUMENT_ID number not null, constraint payment_document_pk primary key (PAYMENT_DOCUMENT_ID),
HOLDER_ID  number not null,	
number_of_payment_document varchar2(30 char),
date_of_creating_payment_doc date
);

create table xmld_buffer_xml_files(
XML_ID number not null, constraint XML_ID_pk primary key(XML_ID),
XML_CONTENT clob,
XML_RESOURCE varchar2(20 char), constraint XML_RESOURCE_ck check (XML_RESOURCE in ('WEB-SERVICE', 'MANUAL', 'FILESYSTEM')),
RECORD_DATE date
);


CREATE SEQUENCE xmld_participants_id_seq
start with 1 
increment by 1
cache 50;

create trigger participants_id_bir before insert on xmld_participants for each row 
begin
:new.participant_id:=xmld_participant_id_seq.nextval;
end;
/

create sequence xmld_signers_id_seq	
start with 1 
increment by 1
cache 50;

create trigger signer_id_bir before insert on xmld_signers for each row 
begin 
:new.signer_id:=xmld_signer_id_seq.nextval;
end;
/

create sequence xmld_signers_holder_id_seq	
start with 1 
increment by 1
cache 50;

/

create sequence xmld_utd_id_seq	
start with 1 
increment by 1
cache 50;
/

create sequence xmld_utd_lines_id_seq	
start with 1 
increment by 1
cache 50;

/

create trigger utd_lines_id_bir  before insert on  xmld_utd_lines  for each row 
begin 
:new.utd_line_id:=xmld_utd_lines_id_seq.nextval;
end;

/

create sequence xmld_utd_pay_doc_id_seq	
start with 1 
increment by 1
cache 50;

/

create trigger PAYMENT_DOCUMENT_ID_bir  before insert on  xmld_utd_payment_document for each row 
begin 
:new.PAYMENT_DOCUMENT_ID:=xmld_utd_pay_doc_id_seq.nextval;
end;

/