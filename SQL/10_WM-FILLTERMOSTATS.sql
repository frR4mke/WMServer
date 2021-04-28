SET IDENTITY_INSERT  Products ON;

insert into Products (product_id,product_title,quantity,manufacturer_id,description,sort_order,full_product_title, productType_id,subProductType_id,country) values
(25,N'IN-THERM RTC 70',1,3,N'',1,N'IN-THERM RTC 70',2,null,N'�����'),
(26,N'IN-THERM E 51',1,3,N'',1,N'IN-THERM E 51',2,null,N'�����'),
(27,N'IN-THERM PWT 002',1,3,N'',1,N'IN-THERM RTC 72',2,null,N'�����'),
(28,N'IN-THERM E 91',1,3,N'',1,N'IN-THERM RTC 73',2,null,N'�����'),
(29,N'WARM LIFE',1,5,N'',1,N'IN-THERM RTC 74',2,null,N'�����')

SET IDENTITY_INSERT  Products OFF;

insert into Images values
(25,'../../../assets/images/TERMOSTATS/INTHERMRTC70.JPG',1),
(26,'../../../assets/images/TERMOSTATS/INTHERME51.JPG',1),
(27,'../../../assets/images/TERMOSTATS/INTHERMPWT002.png',1),
(28,'../../../assets/images/TERMOSTATS/INTHERME91.JPG',1),
(29,'../../../assets/images/TERMOSTATS/WARMLIFE.jpg',1)

insert into ProductOptions(product_id,power,layingArea,wireLength,price) values
(26,null,null,null,1830),
(27,null,null,null,3784),
(28,null,null,null,2253),
(29,null,null,null,3718)
--IN-THERM RTC 70
insert into ProductAttributes values(25,N'����������� ��������������',N'���',N'����������'),
(25,N'����������� ��������������',N'���������� �������',N'���'),
(25,N'����������� ��������������',N'��������� ����������',N'���'),
(25,N'����������� ��������������',N'������ �������',N'���'),
(25,N'����������� ��������������',N'������ ����',N'��'),
(25,N'����������� ��������������',N'�������� ����������',N'5 - 40 �'),
(25,N'����������� ��������������',N'��������, �',N'16 �'),
(25,N'����������� ��������������',N'������� ������',N'IP 20'),
(25,N'����������� ��������������',N'������ �������',N'� �����������'),
(25,N'����������� ��������������',N'��������',N'2 ����')
--IN-THERM E 51
insert into ProductAttributes values(26,N'����������� ��������������',N'���',N'���������������'),
(26,N'����������� ��������������',N'���������� �������',N'��'),
(26,N'����������� ��������������',N'��������� ����������',N'���'),
(26,N'����������� ��������������',N'������ �������',N'��'),
(26,N'����������� ��������������',N'������ ����',N'��'),
(26,N'����������� ��������������',N'�������� ����������',N'5 - 95 �'),
(26,N'����������� ��������������',N'��������, �',N'16 �'),
(26,N'����������� ��������������',N'������� ������',N'IP 20'),
(26,N'����������� ��������������',N'������ �������',N'� �����������'),
(26,N'����������� ��������������',N'��������',N'2 ����')
--IN-THERM PWT 002
insert into ProductAttributes values(27,N'����������� ��������������',N'���',N'���������������'),
(27,N'����������� ��������������',N'���������� �������',N'��'),
(27,N'����������� ��������������',N'��������� ����������',N'WIFI'),
(27,N'����������� ��������������',N'������ �������',N'��'),
(27,N'����������� ��������������',N'������ ����',N'��'),
(27,N'����������� ��������������',N'�������� ����������',N'5 - 95 �'),
(27,N'����������� ��������������',N'��������, �',N'16 �'),
(27,N'����������� ��������������',N'������� ������',N'IP 20'),
(27,N'����������� ��������������',N'������ �������',N'� �����������'),
(27,N'����������� ��������������',N'��������',N'2 ����')
--IN-THERM E 91
insert into ProductAttributes values(28,N'����������� ��������������',N'���',N'���������������'),
(28,N'����������� ��������������',N'�������',N'���������'),
(28,N'����������� ��������������',N'���������� �������',N'��'),
(28,N'����������� ��������������',N'��������� ����������',N'���'),
(28,N'����������� ��������������',N'������ �������',N'��'),
(28,N'����������� ��������������',N'������ ����',N'��'),
(28,N'����������� ��������������',N'�������� ����������',N'5 - 95 �'),
(28,N'����������� ��������������',N'��������, �',N'16 �'),
(28,N'����������� ��������������',N'������� ������',N'IP 20'),
(28,N'����������� ��������������',N'������ �������',N'� �����������'),
(28,N'����������� ��������������',N'��������',N'2 ����')
--WARM LIFE
insert into ProductAttributes values(29,N'����������� ��������������',N'���',N'���������������'),
(29,N'����������� ��������������',N'�������',N'���������'),
(29,N'����������� ��������������',N'���������� �������',N'��'),
(29,N'����������� ��������������',N'��������� ����������',N'���'),
(29,N'����������� ��������������',N'������ �������',N'��'),
(29,N'����������� ��������������',N'������ ����',N'��'),
(29,N'����������� ��������������',N'�������� ����������',N'5 - 40 �'),
(29,N'����������� ��������������',N'��������, �',N'16 �'),
(29,N'����������� ��������������',N'������� ������',N'IP 20'),
(29,N'����������� ��������������',N'������ �������',N'� �����������'),
(29,N'����������� ��������������',N'��������',N'2 ����')