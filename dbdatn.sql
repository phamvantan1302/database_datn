CREATE DATABASE DATN_QLBG
GO
USE DATN_QLBG
GO

CREATE TABLE product(
	id int identity(1,1) not null,
	code varchar(50),
	"name" nvarchar(100),
	"status" nvarchar(100)
	constraint PK_idproduct primary key (id),
)
insert into  product(code,"name") values('1302abc',N'Giày Thể Thao Thông Dụng Nam Bitis Basic BSM000600'),
										('1302abcd',N'Giày Thể Thao Thông Dụng Nam Bitis BSM000700'),
										('1302abce',N'Giày Thể Thao Nam Bitis DSM074500'),
										('1302abcf',N'Giày Thể Thao Nam Bitis BSM001100'),
										('1302abcg',N'Giày Thể Thao Nam Bitis BSM000900')
CREATE TABLE brand(
	id int identity(1,1) not null,
	code varchar(50),
	"name" nvarchar(100),
	"status" nvarchar(100)
	constraint PK_idbrand primary key(id)
)
insert into  brand(code,"name") values('1303abc',N'Hunter'),
										('1305abc',N'Sandai'),
										('1301abc',N'Adidas'),
										('137abc',N'Puma')
CREATE TABLE color(
	id int identity(1,1) not null,
	code varchar(50),
	"name" nvarchar(100),
	"status" nvarchar(100)
	constraint PK_idcolor primary key(id)
)
insert into  color(code,"name") values('color1',N'Đen'),
										('color11',N'Xám'),
										('color12',N'Trắng'),
										('color13',N'Đỏ')
CREATE TABLE category(
	id int identity(1,1) not null,
	code varchar(50),
	"name" nvarchar(100),
	"status" nvarchar(100)
	constraint PK_idcategory primary key(id)
)
insert into  category(code,"name") values('category1',N'Giày Bóng đá'),
										('category11',N'Giày Chạy bộ'),
										('category12',N'Giày Bóng rổ'),
										('category13',N'Giày Đạp xe')
CREATE TABLE size(
	id int identity(1,1) not null,
	code varchar(50),
	"name" nvarchar(100),
	"status" nvarchar(100)
	constraint PK_idsize primary key(id)
)
insert into  size(code,"name") values('size1',N'35'),
										('size2',N'36'),
										('size3',N'37'),
										('size4',N'38'),
										('size5',N'39'),
										('size6',N'40'),
										('size7',N'41'),
										('size8',N'42'),
										('size9',N'43'),
										('size10',N'44'),
										('size11','45')
CREATE TABLE material(
	id int identity(1,1) not null,
	code varchar(50),
	"name" nvarchar(100),
	"status" nvarchar(100)
	constraint PK_idmaterial primary key(id)
)
insert into  material(code,"name") values('chatlieu1',N'Vải'),
										('chatlieu2',N'Da')
CREATE TABLE sole(
	id int identity(1,1) not null,
	code varchar(50),
	"name" nvarchar(100),
	material nvarchar(100),
	"status" nvarchar(100)
	constraint PK_idsole primary key(id)
)
insert into  sole(code,"name",material) values('de1',N'Nhựa',N'Nhựa'),
											('de2',N'Cao su',N'Cao su'),
											('de3',N'Gỗ',N'Gỗ')
CREATE TABLE sockliner(
	id int identity(1,1) not null,
	code varchar(50),
	"name" nvarchar(100),
	color nvarchar(100),
	material nvarchar(100)
	constraint PK_idsockliner primary key(id)
)
insert into  sockliner(code,"name",material) values('lot1',N'Lót vải',N'Vải'),
											('lot2',N'Lót cao su non',N'Cao su non'),
											('lot3',N'Lót xốp',N'Xốp')
CREATE TABLE lace(
	id int identity(1,1) not null,
	code varchar(50),
	"name" nvarchar(100),
	lenght float,
	"status" nvarchar(100)
	constraint PK_idlace primary key(id)
)
insert into  lace(code,"name",lenght) values('day1',N'2 lỗ',50),
										('day2',N'3 lỗ',70),
										('day3',N'4 lỗ',80),
										('day4',N'5 lỗ',100),
										('day5',N'6 lỗ',120),
										('day6',N'7 lỗ',140),
										('day7',N'8 lỗ',160),
										('day8',N'9 lỗ',180),
										('day9',N'10 lỗ',200)
CREATE TABLE product_detail(
	id int identity(1,1) primary key not null,
	id_category int,
	id_size int,
	id_product int,
	id_material int,
	id_brand int,
	id_color int,
	id_sole int,
	id_lace int,
	id_sockliner int,
	quantity int,
	describe nvarchar(max), 
	gender bit,
	price money,
	"status" nvarchar(100)
	CONSTRAINT FK_product_productdetail FOREIGN KEY (id_product) REFERENCES product(id),
	CONSTRAINT FK_brand_productdetail FOREIGN KEY (id_brand) REFERENCES brand(id),
	CONSTRAINT FK_color_productdetail FOREIGN KEY (id_color) REFERENCES color(id),
	CONSTRAINT FK_category_productdetail FOREIGN KEY (id_category) REFERENCES category(id),
	CONSTRAINT FK_size_productdetail FOREIGN KEY (id_size) REFERENCES size(id),
	CONSTRAINT FK_material_productdetail FOREIGN KEY (id_material) REFERENCES material(id),
	CONSTRAINT FK_sole_productdetail FOREIGN KEY (id_sole) REFERENCES sole(id),
	CONSTRAINT FK_sockliner_productdetail FOREIGN KEY (id_sockliner) REFERENCES sockliner(id),
	CONSTRAINT FK_lace_productdetail FOREIGN KEY (id_lace) REFERENCES lace(id),
)
insert into  product_detail(id_category,id_size,id_product,id_material,id_brand,id_color,id_sole,id_lace,id_sockliner,quantity,gender,price) 
values(1,1,1,1,1,2,1,1,1,1,0,300000),
	(1,2,1,1,1,1,1,1,1,2,1,400000),
	(1,2,1,1,1,1,1,1,1,1,0,500000),
	(1,1,1,1,1,1,2,1,1,1,1,300000),
	(2,1,2,1,1,1,1,1,1,1,1,700000),
	(1,1,1,1,1,1,1,1,1,2,0,300000),
	(1,1,1,1,2,1,1,1,1,1,1,650000),
	(2,1,1,2,1,1,2,1,1,1,0,450000),
	(1,1,1,1,1,1,1,1,1,1,1,550000)
											
CREATE TABLE "image"(
	id int identity(1,1) primary key not null,
	id_productdetail int,
	code varchar(50),
	"name" nvarchar(100),
	"status" nvarchar(100)
	CONSTRAINT FK_image_productdetail FOREIGN KEY (id_productdetail) REFERENCES product_detail(id)
)
insert into  "image"(id_productdetail,code,"name") values(1,'image1',N'iamge1.png'),
														(2,'image2',N'iamge2.png'),
														(3,'image3',N'iamge3.png'),
														(4,'image4',N'iamge4.png'),
														(2,'image5',N'iamge5.png'),
														(4,'image6',N'iamge6.png'),
														(3,'image7',N'iamge7.png'),
														(1,'image8',N'iamge8.png')
										
CREATE TABLE discount_period(
	id int identity(1,1) primary key not null,
	code varchar(50),
	"start_date" date,
	"end_date" date,
	"value" float,
	min_purchase_amount money,
	"description" nvarchar(max)
)
insert into discount_period(code,"start_date","end_date","value",min_purchase_amount) values ('discount1','2024/1/28','2024/02/28',20,400000),
																								('discount2','2024/1/1','2024/02/1',20,400000),
																								('discount3','2024/1/15','2024/02/15',20,400000)
CREATE TABLE discount_detail_product(
	id int identity(1,1) primary key not null,
	id_product_detail int,
	id_discount_period int
	CONSTRAINT FK_discount_detail_product_productdetail FOREIGN KEY (id_product_detail) REFERENCES product_detail(id),
	CONSTRAINT FK_discount_detail_product_discount_period FOREIGN KEY (id_discount_period) REFERENCES discount_period(id)
)
insert into discount_detail_product(id_discount_period,id_product_detail) values (1,2),
																					(2,4),
																					(3,3)
CREATE TABLE payment_method(
	id int identity(1,1) primary key not null,
	code varchar(50),
	method varchar(100),
	total_money money,
	"description" nvarchar(max),
	"status" nvarchar(100)
)

CREATE TABLE discount_detail(
	id int identity(1,1) primary key not null,
	id_product_detail int,
	id_discount_period int,
	discount_amount money,
	before_reduction money,
	after_reduction money
	CONSTRAINT FK_discount_detail_id_product_productdetail FOREIGN KEY (id_product_detail) REFERENCES product_detail(id),
	CONSTRAINT FK_discount_detail_product_id_discount_period FOREIGN KEY (id_discount_period) REFERENCES discount_period(id)
)
CREATE TABLE client(
	id int identity(1,1) primary key not null,
	code varchar(50),
	full_name nvarchar(100),
	name_account varchar(50),
	"password" varchar(50),
	date_of_birth date,
	phone_number varchar(20),
	email varchar(50),
	line nvarchar(200),
	city nvarchar(200),
	country nvarchar(200),
	province nvarchar(200),
	create_date date,
	roles nvarchar(50),
	gender bit,
)
insert into client(code,"full_name",name_account,"password",date_of_birth,phone_number,email,line,city,country,province,create_date,roles,gender) 
values('nv1',N'Phạm Văn Tân','tanpv','abc@123','2003/02/13','0354051027','phamvantan1302@gmail.com',N'Đường Cầu Diễn',N'Hà Nội',N'Việt Nam',N'Hà Nội','2024/1/27','admin',0)
CREATE TABLE product_favourte(
	id int identity(1,1) primary key not null,
	id_client int,
	id_product_detail int
	CONSTRAINT FK_client_product_favourte FOREIGN KEY (id_client) REFERENCES client(id),	
	CONSTRAINT FK_productdetail_product_favourte FOREIGN KEY (id_product_detail) REFERENCES product_detail(id),
)
insert into product_favourte(id_client,id_product_detail) values(1,1),
																(1,3)
CREATE TABLE employees(
	id int identity(1,1) primary key not null,
	code varchar(50),
	full_name nvarchar(100),
	name_account varchar(50),
	"password" varchar(50),
	line nvarchar(200),
	city nvarchar(200),
	country nvarchar(200),
	province nvarchar(200),
	date_of_birth date,
	phone_number varchar(20),
	email varchar(50),
	roles nvarchar(50),
	create_date date,
	gender bit
)
insert into employees(code,full_name,name_account,"password",line,city,country,province,date_of_birth,phone_number,email,roles,create_date,gender)
values ('nv1',N'Phạm Văn Tân','tanpv','abc@123',N'Đường Cầu Diễn',N'Hà Nội',N'Việt Nam',N'Hà Nội','2003/02/13','0354051027','phamvantan1302@gmail.com',N'Khách hàng','2024/01/25',0)
CREATE TABLE voucher(
	id int identity(1,1) primary key not null,
	code varchar(50),
	"value" float,
	"start_date" date,
	"end_date" date,
	quantity int,
	"status" nvarchar(100)
)
CREATE TABLE acount_voucher(
	id int identity(1,1) primary key not null,
	id_client int,
	id_voucher int,
	usage_date date,
	"status" nvarchar(100)
	CONSTRAINT FK_client_acount_voucher FOREIGN KEY (id_client) REFERENCES client(id),
	CONSTRAINT FK_voucher_acount_voucher FOREIGN KEY (id_voucher) REFERENCES voucher(id),
)
CREATE TABLE "order"(
	id int identity(1,1) primary key not null,
	id_employees int,
	id_client int,
	id_payment_method int,
	code varchar(50),
	phone_number varchar(20),
	"address" nvarchar(500),
	use_name nvarchar(200),
	email varchar(50),
	item_discount varchar(50),
	total_money money,
	confirmed_date date,
	ship_date date,
	completion_date date,
	note nvarchar(max),
	money_ship money,
	create_date date,
	date_of_payment date,
	last_moddified_date date,
	created_by nvarchar(max),
	"update" nvarchar(max),
	"status" nvarchar(100)
	CONSTRAINT FK_order_employees FOREIGN KEY (id_employees) REFERENCES employees(id),
	CONSTRAINT FK_order_client FOREIGN KEY (id_client) REFERENCES client(id),
	CONSTRAINT FK_order_payment_method FOREIGN KEY (id_payment_method) REFERENCES payment_method(id)
)
CREATE TABLE order_detail(
	id int identity(1,1) primary key not null,
	id_product_detail int,
	id_order int,
	quantity int,
	price money,
	"status" nvarchar(100)
	CONSTRAINT FK_order_detail_product_detail FOREIGN KEY (id_product_detail) REFERENCES product_detail(id),
	CONSTRAINT FK_order_detail_order FOREIGN KEY (id_order) REFERENCES "order"(id),
)
CREATE TABLE voucher_detail(
	id int identity(1,1) primary key not null,
	id_voucher int,
	id_order int,
	befor_price money,
	after_price money,
	create_date date
	CONSTRAINT FK_order_detail_voucher FOREIGN KEY (id_voucher) REFERENCES voucher(id),
	CONSTRAINT FK_id_order_detail_order FOREIGN KEY (id_order) REFERENCES "order"(id),
)

CREATE TABLE activity_log(
	id int identity(1,1) primary key not null,
	id_staff int,
	"action" nvarchar(100),
	"timestamp" datetime,
	details nvarchar(max)
	CONSTRAINT FK_staff_activity_log FOREIGN KEY (id_staff) REFERENCES employees(id),
)
CREATE TABLE cart(
	id int identity(1,1) primary key not null,
	id_client int,
	create_date date,
	date_of_payment date,
	"status" nvarchar(100)
	CONSTRAINT FK_client_cart FOREIGN KEY (id_client) REFERENCES client(id),
)
CREATE TABLE cart_detail(
	id int identity(1,1) primary key not null,
	id_cart int,
	id_product_detail int,
	quantity int,
	price money,
	subtotal float
	CONSTRAINT FK_cart_cart_detail FOREIGN KEY (id_cart) REFERENCES cart(id),
	CONSTRAINT FK_product_detail_cart_detail FOREIGN KEY (id_product_detail) REFERENCES product_detail(id),
)