DROP TRIGGER PARTICIPANTS_ID_BIR;
DROP TRIGGER SIGNERS_ID_BIR;
DROP TRIGGER SIGNERS_HOLDER_ID_BIR;
DROP TRIGGER UTD_ID_BIR; 
DROP TRIGGER UTD_LINES_ID_BIR;
DROP TRIGGER PAYMENT_DOCUMENT_ID_BIR;
DROP TRIGGER PAYMENT_DOC_HOLDER_ID_BIR;
DROP TRIGGER BUFFER_XML_FILES_ID_BIR;

DROP SEQUENCE XMLD_PARTICIPANTS_ID_SEQ;
DROP SEQUENCE XMLD_SIGNERS_ID_SEQ;
DROP SEQUENCE XMLD_SIGNERS_HOLDER_ID_SEQ;
DROP SEQUENCE XMLD_UTD_ID_SEQ;
DROP SEQUENCE XMLD_UTD_LINES_ID_SEQ;
DROP SEQUENCE XMLD_UTD_PAYMENT_DOC_ID_SEQ;
DROP SEQUENCE XMLD_UTD_PAY_DOC_HOLDER_ID_SEQ;
DROP SEQUENCE XMLD_BUFFER_XML_FILES_ID_SEQ;

DROP TABLE XMLD_SIGNERS CASCADE CONSTRAINTS;
DROP TABLE XMLD_PARTICIPANTS CASCADE CONSTRAINTS;
DROP TABLE XMLD_UTD_HEADERS CASCADE CONSTRAINTS;
DROP TABLE XMLD_UTD_LINES CASCADE CONSTRAINTS;
DROP TABLE XMLD_UTD_PAYMENT_DOCUMENTS CASCADE CONSTRAINTS;
DROP TABLE XMLD_BUFFER_XML_FILES CASCADE CONSTRAINTS;

---������� �����������
CREATE TABLE XMLD_SIGNERS 
(SIGNER_ID NUMBER NOT NULL, CONSTRAINT XMLD_SIGNERS_PK PRIMARY KEY (SIGNER_ID),
HOLDER_ID NUMBER NOT NULL,
SIGNER_TYPE VARCHAR2(2 CHAR) NOT NULL, CONSTRAINT SIGNER_TYPE_CHK CHECK (UPPER (SIGNER_TYPE) in ('��', '��', '��')),
SIGNER_AUT NUMBER NOT NULL, CONSTRAINT SIGNER_AUT CHECK (SIGNER_AUT IN (0, 1, 2, 3, 4, 5, 6)),
SIGNER_STAT VARCHAR2(1 CHAR) NOT NULL, CONSTRAINT SIGNER_STAT CHECK (SIGNER_STAT IN (1,2,3,4)),
SIGNER_AUT_BAS VARCHAR2(255 CHAR) NOT NULL, 
ORG_AUT_BAS VARCHAR2(255 CHAR), 
INN_OF_INDIV VARCHAR2(12 CHAR),--���������� ��� ���������� ��� ������� � ����������� ����� �������� ����������� �������. ������:([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})[0-9]{10}.-- 
OTHER_INF_ABOUT_INDIV VARCHAR2(255 CHAR), --���� ��������, ���������������� ���������� ����.--
INN_OF_ENTREPRENEUR VARCHAR2(10) NOT NULL, --������:([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})[0-9]{8}.--
NAME_OF_ORG VARCHAR2(1000 CHAR) NOT NULL,
POS VARCHAR2(129 CHAR) NOT NULL, 
REQ_OF_THE_CERTIF VARCHAR(100 CHAR),
SECOND_NAME VARCHAR2(60 CHAR) NOT NULL,
FIRST_NAME VARCHAR2(60 CHAR) NOT NULL,
PATRONYMIC VARCHAR2(60 CHAR) NOT NULL);

COMMENT ON COLUMN XMLD_SIGNERS.SIGNER_ID IS '������������� ����������';
COMMENT ON COLUMN XMLD_SIGNERS.HOLDER_ID IS '������ �� ��������';
COMMENT ON COLUMN XMLD_SIGNERS.SIGNER_TYPE IS '��� ����������';
COMMENT ON COLUMN XMLD_SIGNERS.SIGNER_AUT IS '������� ���������� ����������';
COMMENT ON COLUMN XMLD_SIGNERS.SIGNER_STAT IS '������ ����������';
COMMENT ON COLUMN XMLD_SIGNERS.SIGNER_AUT_BAS IS '��������� ���������� (�������)';
COMMENT ON COLUMN XMLD_SIGNERS.ORG_AUT_BAS IS '��������� ���������� (�������) �����������';
COMMENT ON COLUMN XMLD_SIGNERS.INN_OF_INDIV IS '��� ����������� ����';
COMMENT ON COLUMN XMLD_SIGNERS.OTHER_INF_ABOUT_INDIV IS '������ �������� � ���������� ����';
COMMENT ON COLUMN XMLD_SIGNERS.INN_OF_ENTREPRENEUR IS '��� ������������ ����';
COMMENT ON COLUMN XMLD_SIGNERS.NAME_OF_ORG IS '�������� �����������';
COMMENT ON COLUMN XMLD_SIGNERS.POS IS '���������';
COMMENT ON COLUMN XMLD_SIGNERS.REQ_OF_THE_CERTIF IS '��������� ������������� � ��������������� �����������';
COMMENT ON COLUMN XMLD_SIGNERS.SECOND_NAME IS '�������';
COMMENT ON COLUMN XMLD_SIGNERS.FIRST_NAME IS '���';
COMMENT ON COLUMN XMLD_SIGNERS.PATRONYMIC IS '��������';

---������� ���������� 
CREATE TABLE XMLD_PARTICIPANTS
(PARTICIPANT_ID NUMBER NOT NULL, CONSTRAINT PARTICIPANT_ID_PK PRIMARY KEY (PARTICIPANT_ID),
PARTICIPANT_TYPE VARCHAR2(100 CHAR) NOT NULL,
INN_OF_INDIV VARCHAR2(12 CHAR), --������:([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})[0-9]{10}.--
REQ_OF_THE_CERTIF VARCHAR2(100 CHAR),
OTHER_INF_ABOUT_INDIV VARCHAR2(255 CHAR), --���� ��������, ���������������� ���������� ����.--
NAME_OF_ORG VARCHAR2(1000 CHAR) NOT NULL,
INN_OF_ORG VARCHAR2(10 CHAR) NOT NULL, --������:([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})[0-9]{8}.
REASON_OF_REG VARCHAR2(9 CHAR), --������:([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})([0-9]{2})([0-9A-Z]{2})([0-9]{3}).
IND VARCHAR2(6 CHAR), --������:[0-9]{6}.
REGION_CODE VARCHAR2(2 CHAR), --������:[0-9]{2}.
REGION VARCHAR2(50 CHAR),
CITY VARCHAR2(50 CHAR),
LOCALITY VARCHAR2(50 CHAR),
STREET VARCHAR2(50 CHAR),
HOUSE VARCHAR2(20 CHAR),
HOUSING VARCHAR2(20 CHAR),
FLAT VARCHAR2(20 CHAR),
COUNTRY_CODE VARCHAR2(3 CHAR), --������:[0-9]{3}.
ADDRESS VARCHAR2(255 CHAR),
PHONE VARCHAR2(255 CHAR),
EMAIL_ADDRESS VARCHAR2(255 CHAR),
BANK_NAME VARCHAR2(1000 CHAR),
BANK_IDENTIFIC_CODE VARCHAR2(9 CHAR), --������:[0-9]{9}.
COR_ACC_OF_THE_BANK VARCHAR2(20 CHAR),  
BANK_ACC_NUMBER VARCHAR2(20 CHAR),
CODE_IN_CLASSIFIER VARCHAR2(10 CHAR),
STRUCTURAL_SUBDIVISION VARCHAR2(1000 CHAR),
INFO_FOR_PARTICIPANTS VARCHAR2(255 CHAR),
NUMBER_OF_THE_ADDRESS_OBJECT VARCHAR2(34) NOT NULL, 
COUNTRY VARCHAR2(100 CHAR),
SECOND_NAME VARCHAR2(60 CHAR) NOT NULL,
FIRST_NAME VARCHAR2(60 CHAR) NOT NULL,
PATRONYMIC VARCHAR2(60 CHAR) NOT NULL);

COMMENT ON COLUMN XMLD_PARTICIPANTS.PARTICIPANT_ID IS '������������� ���������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.PARTICIPANT_TYPE IS '��� ���������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.INN_OF_INDIV IS '��� ���������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.REQ_OF_THE_CERTIF IS '��������� ������������� � ��������������� �����������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.OTHER_INF_ABOUT_INDIV IS '������ �������� � ���������� ����';
COMMENT ON COLUMN XMLD_PARTICIPANTS.NAME_OF_ORG IS '�������� �����������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.INN_OF_ORG IS '��� �����������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.REASON_OF_REG IS '��� ������� ���������� �� ����';
COMMENT ON COLUMN XMLD_PARTICIPANTS.IND IS '������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.REGION_CODE IS '��� �������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.REGION IS '������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.CITY IS '�����';
COMMENT ON COLUMN XMLD_PARTICIPANTS.LOCALITY IS '���������� �����';
COMMENT ON COLUMN XMLD_PARTICIPANTS.STREET IS '�����';
COMMENT ON COLUMN XMLD_PARTICIPANTS.HOUSE IS '���';
COMMENT ON COLUMN XMLD_PARTICIPANTS.HOUSING IS '������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.FLAT IS '��������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.COUNTRY_CODE IS '��� ������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.ADDRESS IS '�����';
COMMENT ON COLUMN XMLD_PARTICIPANTS.PHONE IS '�������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.EMAIL_ADDRESS IS '����������� �����';
COMMENT ON COLUMN XMLD_PARTICIPANTS.BANK_NAME IS '�������� �����';
COMMENT ON COLUMN XMLD_PARTICIPANTS.BANK_IDENTIFIC_CODE IS '���������� ����������������� ���';
COMMENT ON COLUMN XMLD_PARTICIPANTS.COR_ACC_OF_THE_BANK IS '����������������� ���� �����';
COMMENT ON COLUMN XMLD_PARTICIPANTS.BANK_ACC_NUMBER IS '����� ����������� �����';
COMMENT ON COLUMN XMLD_PARTICIPANTS.CODE_IN_CLASSIFIER IS '��� � �������������� �������������� ����������� � �����������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.STRUCTURAL_SUBDIVISION IS '����������� �������������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.INFO_FOR_PARTICIPANTS IS '���������� ��� ��������� ����������������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.NUMBER_OF_THE_ADDRESS_OBJECT IS '���������� ����� ������ ������� ��������� � ��������������� �������� �������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.COUNTRY IS '������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.SECOND_NAME IS '�������';
COMMENT ON COLUMN XMLD_PARTICIPANTS.FIRST_NAME IS '���';
COMMENT ON COLUMN XMLD_PARTICIPANTS.PATRONYMIC IS '��������';

---������� ���������� ����������
CREATE TABLE XMLD_UTD_HEADERS 
(UTD_ID NUMBER NOT NULL, CONSTRAINT UTD_ID_PK PRIMARY KEY (UTD_ID),
SERIAL_NUMBER_OF_THE_INVOICES VARCHAR2(1000 CHAR) NOT NULL,
DATE_OF_INVOICING DATE NOT NULL,
CODE_OF_FORM VARCHAR2(7 CHAR) NOT NULL, CONSTRAINT CODE_OF_FORM_CHK CHECK (CODE_OF_FORM = '1115125'),
DATE_OF_CR_OF_THE_INVOICE DATE NOT NULL,
TIME_OF_CR_OF_THE_INVOICE DATE NOT NULL,
CODE_OF_CURRENCY CHAR(3 CHAR) NOT NULL, --constraint code_of_currency_chk check (�������, ������� �������� � ����������� �����������),
NUMBER_OF_CORRECTION NUMBER(3,0) NOT NULL,
DATE_OF_CORRECTION DATE NOT NULL,
COST_OF_GOODS_WITHOUT_TAX NUMBER(17,2) NOT NULL,
SUM_OF_TAX NUMBER(17,2) NOT NULL,
COST_OF_GOODS_WITH_TAX NUMBER(17,2) NOT NULL, -- ����� � ������
DATE_OF_NOTE DATE NOT NULL, --sysdate
FILE_ID VARCHAR2(200 CHAR) NOT NULL,
FILE_SENDER_ID VARCHAR2(46 CHAR) NOT NULL, CONSTRAINT FILE_SENDER_ID_CHK CHECK (LENGTH(FILE_SENDER_ID)>=4),
FILE_RECIPIENT_ID VARCHAR2(46 CHAR) NOT NULL, CONSTRAINT FILE_RECIPIENT_ID_CHK CHECK (LENGTH(FILE_RECIPIENT_ID)>=4),
DATE_OF_FILE_UPDATE DATE,
SUM_OF_GOODS_WH_TAX NUMBER(17,2) NOT NULL,
TYPE_OF_DOC VARCHAR2(6 CHAR) NOT NULL, CONSTRAINT TYPE_OF_DOC_CHK CHECK (UPPER(TYPE_OF_DOC) IN ('���', '������', '���')),
NAME_OF_DOC_OF_ORGANIZATION VARCHAR2(255 CHAR),
NAME_OF_THE_DOC_OF_ECON VARCHAR2(255 CHAR) NOT NULL,
NAME_OF_THE_ECON_SUB VARCHAR2(1000 CHAR) NOT NULL,
FOUND_OF_THE_CREATOR_FILE VARCHAR2(120 CHAR) NOT NULL,
VENDOR_PARTICIPANT_ID NUMBER NOT NULL, CONSTRAINT VENDOR_PARTICIPANT_ID_FK FOREIGN KEY (VENDOR_PARTICIPANT_ID) REFERENCES XMLD_PARTICIPANTS,
SHIP_PARTICIPANT_ID NUMBER NOT NULL, CONSTRAINT SHIP_PARTICIPANT_ID_FK FOREIGN KEY (SHIP_PARTICIPANT_ID) REFERENCES XMLD_PARTICIPANTS,
CONS_PARTICIPANT_ID NUMBER NOT NULL, CONSTRAINT CONS_PARTICIPANT_ID_FK FOREIGN KEY (CONS_PARTICIPANT_ID) REFERENCES XMLD_PARTICIPANTS,
BUYER_PARTICIPANT_ID NUMBER NOT NULL, CONSTRAINT BUYER_PARTICIPANT_ID_FK FOREIGN KEY (BUYER_PARTICIPANT_ID) REFERENCES XMLD_PARTICIPANTS,
GOS_CONTR_ID VARCHAR2(255 CHAR),
NAME_OF_VALUTA VARCHAR2(100 CHAR),
CURS_OF_VALUTA NUMBER(6,4),
ID_OF_SIGNER_SELLER NUMBER,-- constraint id_of_signer_seller_fk foreign key id_of_signer_seller references xmld_signers,
WEIGHT NUMBER(15,11)); 
--ID ������ �� ������������ ��������� (������ �� ������� XXLD_WAYBILLS)
--ID ������ �� �������� � ��������-��������� ���������� (������ �� ������� XXLD_UTD_PAYMENT_DOCUMENTS) (����� �����)
--ID �� ����������� ���������� (������ �� ������� XXLD_SIGNERS));

COMMENT ON COLUMN XMLD_UTD_HEADERS.UTD_ID IS '������������� �������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.SERIAL_NUMBER_OF_THE_INVOICES IS '���������� ����� �����-�������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.DATE_OF_INVOICING IS '���� ����������� �����-�������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.CODE_OF_FORM IS '��� ����� �� �������������� ��������� ������������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.DATE_OF_CR_OF_THE_INVOICE IS '���� ������������ ����� ������ �����-�������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.TIME_OF_CR_OF_THE_INVOICE IS '����� ������������ ����� ������ �����-�������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.CODE_OF_CURRENCY IS '��� ������ �� ��������������� �������������� �����';
COMMENT ON COLUMN XMLD_UTD_HEADERS.NUMBER_OF_CORRECTION IS '����� �����������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.DATE_OF_CORRECTION IS '���� �����������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.COST_OF_GOODS_WITHOUT_TAX IS '��������� �������,� ������� - ����� ';
COMMENT ON COLUMN XMLD_UTD_HEADERS.SUM_OF_TAX IS '��������� �������, ��� ������ - ����� ';
COMMENT ON COLUMN XMLD_UTD_HEADERS.COST_OF_GOODS_WITH_TAX IS '����� ������, ������������� ����������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.FILE_ID IS '������������� �����';
COMMENT ON COLUMN XMLD_UTD_HEADERS.FILE_SENDER_ID IS '������������� � ����������� ����� ������ �����-�������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.FILE_RECIPIENT_ID IS '������������� � ���������� ����� ������ �����-�������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.SUM_OF_GOODS_WH_TAX IS '������ ���';
COMMENT ON COLUMN XMLD_UTD_HEADERS.TYPE_OF_DOC IS '��� ���������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.NAME_OF_DOC_OF_ORGANIZATION IS '������������ ���������� ���������, ������������ ������������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.NAME_OF_THE_DOC_OF_ECON IS '������������ ��������� �� ����� ������������� �����';
COMMENT ON COLUMN XMLD_UTD_HEADERS.NAME_OF_THE_ECON_SUB IS '������������ �������������� �������� - ����������� ����� ������ �����-�������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.FOUND_OF_THE_CREATOR_FILE IS '���������, �� �������� ������������� ������� �������� ������������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.VENDOR_PARTICIPANT_ID IS '������������� ��������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.SHIP_PARTICIPANT_ID IS '������������� ����������������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.CONS_PARTICIPANT_ID IS '������������� ���������������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.BUYER_PARTICIPANT_ID IS '������������� ����������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.GOS_CONTR_ID IS '������������� ���������������� ���������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.NAME_OF_VALUTA IS '������������ ������ �������� (���)';
COMMENT ON COLUMN XMLD_UTD_HEADERS.CURS_OF_VALUTA IS '���� ������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.ID_OF_SIGNER_SELLER IS 'ID �� ����������� ��������';
COMMENT ON COLUMN XMLD_UTD_HEADERS.WEIGHT IS '����������(����� �����)';

---������� ����� ���������
CREATE TABLE XMLD_UTD_LINES
(UTD_ID NUMBER NOT NULL,CONSTRAINT UTD_ID_FK FOREIGN KEY (UTD_ID) REFERENCES XMLD_UTD_HEADERS,
UTD_LINE_ID NUMBER NOT NULL,CONSTRAINT UTD_LINE_ID_PK PRIMARY KEY (UTD_LINE_ID),
NUMBER_OF_ROW NUMBER(6),
NAME_OF_PRODUCT VARCHAR2(1000 CHAR),
QUANTITY NUMBER(15,11),
UNIT_CODE VARCHAR2(4 CHAR),
PRICE_OF_UNIT NUMBER(15,11),
SUM_OF_PRODUCT_WITHOUT_TAX NUMBER(17,2),
SUM_OF_TAX NUMBER(17,2),
SUM_OF_PRODUCT_WITH_TAX NUMBER(17,2),
SUM_OF_EXCISE NUMBER(17,2),
DATE_OF_RECORDING DATE,
COUNTRY_CODE_OF_PRODUCT VARCHAR2(3 CHAR),CONSTRAINT COUNTRY_CODE_OF_PRODUCT_CH CHECK (LENGTH(COUNTRY_CODE_OF_PRODUCT)=3),
DATE_OF_LAST_UPDATE DATE,
ATTRIBUTE_OF_PRODUCT VARCHAR2(1 CHAR),CONSTRAINT ATTRIBUTE_OF_PRODUCT_CK CHECK (ATTRIBUTE_OF_PRODUCT IN ('1','2','3','4','5')),
OTHER_INFO_ABOUT_PRODUCT VARCHAR2(4 CHAR),
CODE_OF_PRODUCT VARCHAR2(255 CHAR),
UNIT_NAME VARCHAR2(255 CHAR),
BRIEF_NAME_OF_COUNTRY_OF_PROD VARCHAR2(255 CHAR),
QUANTITY_OF_LETTING_GO NUMBER(15,11),
COR_ACC_DEBIT VARCHAR2(9 CHAR),CONSTRAINT COR_ACC_DEBIT_CK CHECK (LENGTH(COR_ACC_DEBIT)=9),
COR_ACC_CREDIT VARCHAR2(9 CHAR),CONSTRAINT COR_ACC_CREDIT_CK CHECK (LENGTH(COR_ACC_CREDIT)=9),
TAX_RATE VARCHAR2(7 CHAR),CONSTRAINT TAX_RATE_CK CHECK (TAX_RATE IN ('0%', '10%', '18%', '10/110', '18/118', '��� ���')));

COMMENT ON COLUMN XMLD_UTD_LINES.UTD_ID IS '������ �� ��������';
COMMENT ON COLUMN XMLD_UTD_LINES.UTD_LINE_ID IS '������������� ������';
COMMENT ON COLUMN XMLD_UTD_LINES.NUMBER_OF_ROW IS '����� ������ �������';
COMMENT ON COLUMN XMLD_UTD_LINES.NAME_OF_PRODUCT IS '������������ ������';
COMMENT ON COLUMN XMLD_UTD_LINES.QUANTITY IS '���������� ������';
COMMENT ON COLUMN XMLD_UTD_LINES.UNIT_CODE IS '����_������';
COMMENT ON COLUMN XMLD_UTD_LINES.PRICE_OF_UNIT IS '���� ������';
COMMENT ON COLUMN XMLD_UTD_LINES.SUM_OF_PRODUCT_WITHOUT_TAX IS '��������� �������, ��� ������ - �����';
COMMENT ON COLUMN XMLD_UTD_LINES.SUM_OF_TAX IS '����� ������, ������������� ����������';
COMMENT ON COLUMN XMLD_UTD_LINES.SUM_OF_PRODUCT_WITH_TAX IS '��������� �������, � ������� - �����';
COMMENT ON COLUMN XMLD_UTD_LINES.SUM_OF_EXCISE IS '����� ������';
COMMENT ON COLUMN XMLD_UTD_LINES.COUNTRY_CODE_OF_PRODUCT IS '�������� ��� ������ ������������� ������';
COMMENT ON COLUMN XMLD_UTD_LINES.ATTRIBUTE_OF_PRODUCT IS '�������';
COMMENT ON COLUMN XMLD_UTD_LINES.OTHER_INFO_ABOUT_PRODUCT IS '�������������� ���������� � ��������';
COMMENT ON COLUMN XMLD_UTD_LINES.CODE_OF_PRODUCT IS '��������������/���/�������/���� ������';
COMMENT ON COLUMN XMLD_UTD_LINES.UNIT_NAME IS '������������ ������� ���������';
COMMENT ON COLUMN XMLD_UTD_LINES.BRIEF_NAME_OF_COUNTRY_OF_PROD IS '������� ������������ ������ ������������� ������';
COMMENT ON COLUMN XMLD_UTD_LINES.QUANTITY_OF_LETTING_GO IS '���������� �������� ���������';
COMMENT ON COLUMN XMLD_UTD_LINES.COR_ACC_DEBIT IS '����������������� �����: �����';
COMMENT ON COLUMN XMLD_UTD_LINES.COR_ACC_CREDIT IS '����������������� �����: ������';
COMMENT ON COLUMN XMLD_UTD_LINES.TAX_RATE IS '��������� ������';

---������� ��������� ����������
CREATE TABLE XMLD_UTD_PAYMENT_DOCUMENTS
(PAYMENT_DOCUMENT_ID NUMBER NOT NULL, CONSTRAINT PAYMENT_DOCUMENT_PK PRIMARY KEY (PAYMENT_DOCUMENT_ID),
HOLDER_ID NUMBER NOT NULL,	
NUMBER_OF_PAYMENT_DOCUMENT VARCHAR2(30 CHAR),
DATE_OF_CREATING_PAYMENT_DOC DATE);

COMMENT ON COLUMN XMLD_UTD_PAYMENT_DOCUMENTS.PAYMENT_DOCUMENT_ID IS '������������� ��������-���������� ���������';
COMMENT ON COLUMN XMLD_UTD_PAYMENT_DOCUMENTS.HOLDER_ID IS '������ ���������';
COMMENT ON COLUMN XMLD_UTD_PAYMENT_DOCUMENTS.NUMBER_OF_PAYMENT_DOCUMENT IS '����� ��������-���������� ���������';
COMMENT ON COLUMN XMLD_UTD_PAYMENT_DOCUMENTS.DATE_OF_CREATING_PAYMENT_DOC IS '���� ����������� ��������-���������� ���������';

---������� ��� �������� XML-���������� �� ������ ���������� 
CREATE TABLE XMLD_BUFFER_XML_FILES
(XML_ID NUMBER NOT NULL, CONSTRAINT XML_ID_PK PRIMARY KEY(XML_ID),
XML_CONTENT CLOB,
XML_RESOURCE VARCHAR2(20 CHAR), CONSTRAINT XML_RESOURCE_CK CHECK (XML_RESOURCE IN ('WEB-SERVICE', 'MANUAL', 'FILESYSTEM')),
RECORD_DATE DATE);

COMMENT ON COLUMN XMLD_BUFFER_XML_FILES.XML_ID IS '������������� ������ ������';
COMMENT ON COLUMN XMLD_BUFFER_XML_FILES.XML_CONTENT IS '���������� XML-�����';
COMMENT ON COLUMN XMLD_BUFFER_XML_FILES.XML_RESOURCE IS '��������';
COMMENT ON COLUMN XMLD_BUFFER_XML_FILES.RECORD_DATE IS '���� ������';

CREATE SEQUENCE XMLD_PARTICIPANTS_ID_SEQ
START WITH 1 
INCREMENT BY 1
CACHE 50;

CREATE TRIGGER PARTICIPANTS_ID_BIR BEFORE INSERT ON XMLD_PARTICIPANTS FOR EACH ROW 
BEGIN
:NEW.PARTICIPANT_ID:=XMLD_PARTICIPANTS_ID_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE XMLD_SIGNERS_ID_SEQ	
START WITH 1 
INCREMENT BY 1
CACHE 50;

CREATE TRIGGER SIGNERS_ID_BIR BEFORE INSERT ON XMLD_SIGNERS FOR EACH ROW 
BEGIN 
:NEW.SIGNER_ID:=XMLD_SIGNERS_ID_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE XMLD_SIGNERS_HOLDER_ID_SEQ	
START WITH 1 
INCREMENT BY 1
CACHE 50;


CREATE TRIGGER SIGNERS_HOLDER_ID_BIR BEFORE INSERT ON XMLD_SIGNERS FOR EACH ROW --���������� ����� �� ������ ����������� �� ������ ���������
BEGIN 
END;
/

CREATE SEQUENCE XMLD_UTD_ID_SEQ
START WITH 1 
INCREMENT BY 1
CACHE 50;

CREATE TRIGGER UTD_ID_BIR BEFORE INSERT ON XMLD_UTD_HEADERS FOR EACH ROW 
BEGIN 
:NEW.UTD_ID:= XMLD_UTD_ID_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE XMLD_UTD_LINES_ID_SEQ	
START WITH 1 
INCREMENT BY 1
CACHE 50;

CREATE TRIGGER UTD_LINES_ID_BIR BEFORE INSERT ON XMLD_UTD_LINES FOR EACH ROW
BEGIN
:NEW.UTD_ID:=XMLD_UTD_LINES_ID_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE XMLD_UTD_PAYMENT_DOC_ID_SEQ	
START WITH 1 
INCREMENT BY 1
CACHE 50;

CREATE TRIGGER PAYMENT_DOCUMENT_ID_BIR BEFORE INSERT ON XMLD_UTD_PAYMENT_DOCUMENTS FOR EACH ROW 
BEGIN 
:NEW.PAYMENT_DOCUMENT_ID:=XMLD_UTD_PAYMENT_DOC_ID_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE XMLD_UTD_PAY_DOC_HOLDER_ID_SEQ	
START WITH 1 
INCREMENT BY 1
CACHE 50;

CREATE TRIGGER PAYMENT_DOC_HOLDER_ID_BIR BEFORE INSERT ON XMLD_UTD_PAYMENT_DOCUMENTS FOR EACH ROW --���������� ����� �� ������ ����������� �� ������ ���������
BEGIN 
END;
/

CREATE SEQUENCE XMLD_BUFFER_XML_FILES_ID_SEQ	
START WITH 1 
INCREMENT BY 1
CACHE 50;

CREATE TRIGGER BUFFER_XML_FILES_ID_BIR BEFORE INSERT ON XMLD_BUFFER_XML_FILES FOR EACH ROW 
BEGIN 
:NEW.XML_ID:=XMLD_BUFFER_XML_FILES_ID_SEQ.NEXTVAL;
END;
/