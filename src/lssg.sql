/*
默认值为0：代表显示/可用/已登入     代表是
默认值为1：代表不显示/不可用/未登入 代表否
*/



/*数据库lssg*/
create database lssg;

/*用户登入信息表lssg_user_login*/
CREATE TABLE lssg_user_login
(
  user_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  user_name varchar(50) NOT NULL,       /*用户登入名称独一无二 uinque*/
  user_pwd varchar(50) NOT NULL,
  login_is_active int(2) DEFAULT 1,
  regist_time timestamp,
  last_time timestamp,
  user_state int(2) DEFAULT 0
);
CREATE UNIQUE INDEX lssg_user_login_user_name_uindex ON lssg_user_login (user_name);

/*用户信息表lssg_user_info*/
CREATE TABLE lssg_user_info
(
    user_info_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int,
    user_realname varchar(50),
    user_sex char(4),
    user_tel varchar(11),
    user_email varchar(20),
    user_img varchar(60),
    user_addr varchar(2000)
);

/*管理员信息表lssg_admin*/
CREATE TABLE lssg_admin
(
    admin_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    admin_name varchar(50),       /*用户登入名称独一无二 uinque*/
    admin_pwd varchar(50),
    admin_email varchar(30),
    admin_regist_time timestamp,
    admin_last_login_time timestamp,
    admin_state int(2) DEFAULT 0
);
CREATE UNIQUE INDEX lssg_admin_admin_name_uindex ON lssg_admin (admin_name);

/*商品分类信息表lssg_product_class*/
CREATE TABLE lssg_product_class
(
    product_class_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    product_class_name varchar(50),
    product_is_show int(2) DEFAULT 0,
    product_description varchar(50)
);
/*商品信息表lssg_product*/
CREATE TABLE lssg_product
(
    product_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    product_class_id int,
    product_name varchar(50),
    product_up_time date,
    product_down_time timestamp,
    product_photo varchar(200),
    small_photo varchar(200),
    big_photo varchar(200),
    product_market_price decimal(10,2),
    product_mall_price decimal(10,2),
    product_num int,
    sold_num int,
    product_weight decimal(10,2),
    promote_price decimal(10,2),
    promote_start_date timestamp,
    promote_end_date timestamp,
    fregiht decimal(10,2),
    is_best int(2) DEFAULT 1,
    is_new int(2) DEFAULT 1,
    is_hot int(2) DEFAULT 1,
    is_special int(2) DEFAULT 1,
    is_state int(2) DEFAULT 0,
    product_addr varchar(300),
    product_notes varchar(600)
);

/*购物车信息表lssg_cart*/
/*CREATE TABLE lssg_cart
(
    cart_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int,
    product_id int,
    session_id varchar(40),
    cart_product_num int,
    add_cart_time timestamp,
    update_cart_time timestamp,
    cart_state varchar(20)   /*用于记录购物车商品状态（缺货，失效，删除等）*/
);*/

/*收藏夹信息表lssg_collect_products*/
CREATE TABLE lssg_collect_products
(
    collect_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int,
    product_id int,
    collect_product_num int,
    add_collect_time timestamp,
    collect_state varchar(20)   /*用于记录收藏夹商品状态（缺货，失效，删除等）*/
);

/*收货人地址信息表lssg_address*/
CREATE TABLE lssg_address
(
    address_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int,
    order_id varchar(40),
    address_name varchar(50),
    address_addr varchar(400),
    address_state int(2),
    address_tel int(11),
    address_payment varchar(20),
    address_content varchar(500)
);

/*支付方式表lssg_payment*/
CREATE TABLE lssg_payment
(
    payment_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    payment_name varchar(20),
    payment_state int(2)
);

/*订单信息表lssg_order*/
CREATE TABLE lssg_orders
(
    order_id varchar(40) PRIMARY KEY NOT NULL,
    user_id int,
    order_action_id int,
    address_id int,
    payment_id int,
    order_total_price decimal(10,2),
    do_order_time timestamp
);

/*订单动作信息表lssg_order_action*/
CREATE TABLE lssg_order_action
(
    order_action_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    order_id varchar(40),
    order_pay_status varchar(20),
    shopping_status varchar(20),
    last_pay_time timestamp
);



/*订单商品信息表lssg_order_products*/
/*CREATE TABLE lssg_order_products
(
    order_product_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    order_id varchar(40),
    product_id int,
    orde_product_name varchar(50),
    order_product_price decimal(10,2),
    order_product_num int,
    order_product_weight decimal(10,2)
);*/



/*订单项*/
CREATE TABLE lssg_order_item
(
    order_item_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    order_id varchar(40),
    product_id int,
    order_product_num int,
    subtotal_price decimal(10,2),
    order_product_weight decimal(10,2)
);




/*公告信息表lssg_public_info*/
CREATE TABLE lssg_public_info
(
    public_info_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    public_info_title varchar(30),
    public_info_content varchar(2000),
    public_info_img varchar(50),
    public_info_time timestamp,
    public_info_state int(2) DEFAULT 0
);

/*留言评论表lssg_message*/
CREATE TABLE lssg_message
(
    message_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int,
    product_id int,
    message_name varchar(30),
    message_email varchar(20),
    product_stars int(8),
    message_content varchar(2000),
    message_time timestamp,
    is_show int(2) DEFAULT 0
);

/*回复信息表lssg_reply*/
CREATE TABLE lssg_reply
(
    reply_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int,
    product_id int,
    reply_name varchar(30),
    reply_email varchar(20),
    reply_time timestamp,
    reply_conten varchar(2000),
    reply_is_show int(2) DEFAULT 0
);