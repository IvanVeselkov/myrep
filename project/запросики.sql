--SERIAL_NUMBER_OF_THE_INVOICES ���������� ����� ����� �������
--��� �� ��� ������ ������������

--1
SELECT DATE_OF_INVOICING FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����';
--2
SELECT SECOND_NAME||' '||FIRST_NAME||' '||PATRONYMIC FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT VENDOR_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����');
--3
SELECT ADDRESS FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT VENDOR_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����');
--4
SELECT INN_OF_INDIV FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT VENDOR_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����');
--5
SELECT SECOND_NAME||' '||FIRST_NAME||' '||PATRONYMIC||' '||ADDRESS FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT SHIP_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����');
--6
SELECT SECOND_NAME||' '||FIRST_NAME||' '||PATRONYMIC||' '||ADDRESS FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT CONS_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����');
--7
SELECT NUMBER_OF_PAYMENT_DOCUMENT FROM XMLD_UTD_PAYMENT_DOCUMENTS WHERE HOLDER_ID=
    (SELECT UTD_ID FROM XMLD_UTD_HEADERS WHERE XMLD_UTD_HEADERS.SERIAL_NUMBER_OF_THE_INVOICES='����');
--8
SELECT DATE_OF_CREATING_PAYMENT_DOC FROM XMLD_UTD_PAYMENT_DOCUMENTS WHERE HOLDER_ID=
    (SELECT UTD_ID FROM XMLD_UTD_HEADERS WHERE XMLD_UTD_HEADERS.SERIAL_NUMBER_OF_THE_INVOICES='����');
--9
SELECT SECOND_NAME||' '||FIRST_NAME||' '||PATRONYMIC FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT XMLD_UTD_HEADERS.BUYER_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����');
--10
SELECT ADDRESS FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT XMLD_UTD_HEADERS.BUYER_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����');
--11
SELECT INN_OF_INDIV FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT BUYER_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����');
--12
SELECT NAME_OF_VALUTA||' '||CURS_OF_VALUTA FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����';
--13
--�������� ��������
select '�������� ������',
        '��� ������',
        '��� ������� ���������',
        '�������� ����������� ������� ���������',
        '����������',
        '���� ������',
        '��������� �������, ��� ������ - �����',
        '����� ������',
        '��������� ������',
        '����� ������, ������������� ����������',
        '��������� �������, � ������� - �����',
        '�������� ��� ������ ������������� ������',
        '������� ������������ ������ ������������� ������' from dual;
--���������� �������
select NAME_OF_PRODUCT as "�������� ������",
        CODE_OF_Product as "��� ������",
        UNIT_CODE as "��� ������� ���������",
        UNIT_NAME as "�������� ����������� ������� ���������",
        QUANTITY as "����������",
        PRICE_OF_UNIT as "���� ������",
        SUM_OF_PRODUCT_WITHOUT_TAX as "��������� �������, ��� ������ - �����",
        SUM_OF_EXCISE as "����� ������",
        TAX_RATE as "��������� ������",
        SUM_OF_TAX as "����� ������, ������������� ����������",
        SUM_OF_PRODUCT_WITH_TAX as "��������� �������, � ������� - �����",
        COUNTRY_CODE_OF_PRODUCT as "�������� ��� ������ ������������� ������",
        BRIEF_NAME_OF_COUNTRY_OF_PROD as "������� ������������ ������ ������������� ������" 
        from XMLD_UTD_LINES 
            where UTD_ID = (select UTD_ID from XMLD_UTD_HEADERS where  SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����' );

--14 I 16 I 18 �� ����� ���� �����

--15
SELECT SECOND_NAME||' '||FIRST_NAME||' '||PATRONYMIC FROM XMLD_PARTICIPANTS WHERE NAME_OF_ORG =(SELECT NAME_OF_ORG FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT XMLD_UTD_HEADERS.VENDOR_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����')) AND PARTICIPANT_TYPE='������������ ��� ������������� ����';
--17
SELECT SECOND_NAME||' '||FIRST_NAME||' '||PATRONYMIC FROM XMLD_PARTICIPANTS WHERE NAME_OF_ORG =(SELECT NAME_OF_ORG FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT XMLD_UTD_HEADERS.VENDOR_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����')) AND PARTICIPANT_TYPE='������� ��������� ��� ������������� ����';
--19
SELECT SECOND_NAME||' '||FIRST_NAME||' '||PATRONYMIC FROM XMLD_PARTICIPANTS WHERE NAME_OF_ORG =(SELECT NAME_OF_ORG FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT XMLD_UTD_HEADERS.VENDOR_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����')) AND PARTICIPANT_TYPE='�������������� ��������������� ��� ������������� ����';
--20
SELECT REQ_OF_THE_CERTIF FROM XMLD_PARTICIPANTS WHERE NAME_OF_ORG =(SELECT NAME_OF_ORG FROM XMLD_PARTICIPANTS WHERE PARTICIPANT_ID = 
    (SELECT XMLD_UTD_HEADERS.VENDOR_PARTICIPANT_ID FROM XMLD_UTD_HEADERS WHERE SERIAL_NUMBER_OF_THE_INVOICES = '�������� �����')) AND PARTICIPANT_TYPE='�������������� ��������������� ��� ������������� ����';