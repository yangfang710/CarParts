/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : car

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-04-13 08:48:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `adminId` char(32) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `adminpwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('a1', 'liuBei', '123');
INSERT INTO `t_admin` VALUES ('a2', 'guanYu', '123');
INSERT INTO `t_admin` VALUES ('a3', 'zhangSanFei', '123');
INSERT INTO `t_admin` VALUES ('a4', 'admin', 'admin');

-- ----------------------------
-- Table structure for t_car
-- ----------------------------
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE `t_car` (
  `carId` varchar(50) NOT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `machine` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currPrice` double DEFAULT NULL,
  `discount` double(255,0) DEFAULT NULL,
  `paiLiang` varchar(255) DEFAULT NULL,
  `oil` varchar(255) DEFAULT NULL,
  `doorNum` int(11) DEFAULT NULL,
  `carType` varchar(255) DEFAULT NULL,
  `shaftDis` varchar(255) DEFAULT NULL,
  `volume` varchar(255) DEFAULT NULL,
  `keepPolicy` varchar(255) DEFAULT NULL,
  `maxWat` varchar(255) DEFAULT NULL,
  `image_w` varchar(255) DEFAULT NULL,
  `image_b` varchar(255) DEFAULT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `orderBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`carId`),
  KEY `cid` (`cid`),
  CONSTRAINT `t_car_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES ('113D0D1BB9174DD19A7DE7E2B37F677F', '哈弗 哈弗H6订金499元 2016款 升级版 1.5T 自动 两驱 精英型', 'L型/110kW', '150000', '130000', '9', '1.5L', '汽油93号', '5', '两厢', '2680mm', '58L', '三年或6万公里', '110kW', 'car_img/23268960-1_w.jpg', 'car_img/23268960-1_b.jpg', 'B92ED191DBE647BE8F75721FB231E207', null);
INSERT INTO `t_car` VALUES ('1286B13F0EA54E4CB75434762121486A', '上汽通用雪佛兰 赛欧3订金499元 2015款 1.3L 手动 温馨版', 'L型/76kW', '100000', '90000', '9', '1.3L', '汽油93号', '4', null, '2500mm', '35L', '三年或10万公里', '76kW', 'car_img/8868045-1_w.jpg', 'car_img/8868045-1_b.jpg', 'B92ED191DBE647BE8F75721FB231E207', null);
INSERT INTO `t_car` VALUES ('8CDD007CCC7048F68A7294BDFEEF1E8A', '一汽丰田 威驰订金499元 2016款 1.5L 自动 智臻星耀版', 'L型/79kW', '80000', '100000', '8', '1.5L', '汽油93号', '4', null, '2550mm', '42L', '三年或10万公里', '79kW', 'car_img/93EDF72D6C794D1DBF8280B479F09E23_4290918-1_w.jpg', 'car_img/78FE4045C1F54407B7FE05F58B678948_4290918-1_b.jpg', 'B92ED191DBE647BE8F75721FB231E207', null);

-- ----------------------------
-- Table structure for t_cartitem
-- ----------------------------
DROP TABLE IF EXISTS `t_cartitem`;
CREATE TABLE `t_cartitem` (
  `cartItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `carId` char(32) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cartItemId`),
  KEY `orderBy` (`orderBy`),
  KEY `FK_t_cartitem_t_user` (`uid`),
  KEY `carId` (`carId`),
  CONSTRAINT `t_cartitem_ibfk_1` FOREIGN KEY (`carId`) REFERENCES `t_car` (`carId`),
  CONSTRAINT `FK_t_cartitem_t_user` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cartitem
-- ----------------------------
INSERT INTO `t_cartitem` VALUES ('2BBB76449A9D436A8772ED87FBED2691', '5', null, '32DB3700D2564254982BC58B0E4D95BC', '18');
INSERT INTO `t_cartitem` VALUES ('501AB0C5BEE649C0B37D8EF981EA59C1', '1', null, '8F682A63A2D54DEB81895262CF6FDBAB', '13');
INSERT INTO `t_cartitem` VALUES ('524EBCB140464CDE8FB6C89C971DBACC', '3', null, '32DB3700D2564254982BC58B0E4D95BC', '17');
INSERT INTO `t_cartitem` VALUES ('A3F804CFDF6044E8888F32CAD0FDE0EE', '5', null, '531D8A16D524478D86F8A115FE95D93F', '12');
INSERT INTO `t_cartitem` VALUES ('B8939FC55131469CAB11E3924D40185B', '1', null, 'xxx', '11');
INSERT INTO `t_cartitem` VALUES ('DA956E661A374017AE5117EAB6CE87BA', '1', null, '32DB3700D2564254982BC58B0E4D95BC', '16');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `cid` char(32) NOT NULL,
  `catName` varchar(50) DEFAULT NULL,
  `pid` char(32) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cname` (`catName`),
  KEY `FK_t_category_t_category` (`pid`),
  KEY `orderBy` (`orderBy`),
  CONSTRAINT `FK_t_category_t_category` FOREIGN KEY (`pid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('2', '汽车配件大全', null, '汽车配件大全', '2');
INSERT INTO `t_category` VALUES ('3', '图形 图像 多媒体', null, '图形图像多媒体', '3');
INSERT INTO `t_category` VALUES ('4', '操作系统/系统开发', null, '操作系统/系统开发', '4');
INSERT INTO `t_category` VALUES ('458795C27E7346A8A5F1B942319297E0', '系统开发', '4', '系统开发分类', '29');
INSERT INTO `t_category` VALUES ('4D01FFF0CB94468EA907EF42780668AB', '汽车装饰', '2', '汽车装饰', '18');
INSERT INTO `t_category` VALUES ('56AD72718C524147A2485E5F4A95A062', '3DS MAX JAVA', '3', '3DS MAX分类', '21');
INSERT INTO `t_category` VALUES ('57DE3C2DDA784B81844029A28217698C', 'Dreamweaver', '3', 'Dreamweaver分类', '24');
INSERT INTO `t_category` VALUES ('65640549B80E40B1981CDEC269BFFCAD', 'Photoshop', '3', 'Photoshop分类', '20');
INSERT INTO `t_category` VALUES ('65830AB237EF428BAE9B7ADC78A8D1F6', 'Unix', '4', 'Unix分类', '28');
INSERT INTO `t_category` VALUES ('757BDAB506A445EC8DEDA4CE04303B9F', '网页设计', '3', '网页设计分类', '22');
INSERT INTO `t_category` VALUES ('B596ECE0F9BF40288F40A66B35551806', 'Flush', '3', 'Flush分类', '23');
INSERT INTO `t_category` VALUES ('B92ED191DBE647BE8F75721FB231E207', '汽车车型', '2', '汽车车型', '19');
INSERT INTO `t_category` VALUES ('C4DD8CA232864B31A367EE135D86382C', '车载电器', '2', '车载电器', '17');
INSERT INTO `t_category` VALUES ('F5C091B3967442A2B35EFEFC4EF8746F', '汽车品牌', '2', '汽车品牌', '16');
INSERT INTO `t_category` VALUES ('FAB7B7F7084F4D57A0808ADC61117683', 'Windows', '4', 'Windows分类', '26');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `oid` char(32) NOT NULL,
  `ordertime` char(19) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_t_order_t_user` (`uid`),
  CONSTRAINT `FK_t_order_t_user` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('0CCB07CF28314E97A6CB6A6E80C32E6A', '2016-04-12 20:39:36', '430000.00', '1', '重庆市 南岸区  崇文路2号 重庆邮电大学  XXX收', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('15449292BD2B47C49531E38844BDA334', '2016-04-11 19:47:48', '160000.00', '5', '重庆市 南岸区  崇文路2号 重庆邮电大学  XXX收', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('516774496A0944849B5B705F083A83CB', '2016-04-12 20:42:53', '90000.00', '1', '重庆市 南岸区  崇文路2号 重庆邮电大学  XXX收', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('5C42543B1F9A415292ACABC5A96AA2D1', '2016-04-11 19:37:04', '260000.00', '1', '重庆市 南岸区  崇文路2号 重庆邮电大学  XXX收', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('7941EAE3D60E47EB906B87D3F34894BC', '2016-04-12 20:24:50', '700000.00', '5', '重庆市 南岸区  崇文路2号 重庆邮电大学  XXX收', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('AE15EF64E4704FFFA58C0FAB154F5D8B', '2016-04-12 20:24:51', '700000.00', '1', '重庆市 南岸区  崇文路2号 重庆邮电大学  XXX收', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('B14F05D44267483198F0BA4042B31F14', '2016-04-12 20:54:19', '130000.00', '1', '重庆市 南岸区  崇文路2号 重庆邮电大学  XXX收', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('B5A8195A1CC643CABC44AEEF72022235', '2016-04-12 20:24:51', '700000.00', '1', '重庆市 南岸区  崇文路2号 重庆邮电大学  XXX收', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('CB2F4C71F5134A2CB8ADE6C4DD84FB98', '2016-04-11 19:48:43', '160000.00', '5', '重庆市 南岸区  崇文路2号 重庆邮电大学  XXX收', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `t_order` VALUES ('D4F1E5B8503E4391A8E200BDE1E5A906', '2016-04-12 20:53:13', '100000.00', '1', '重庆市 南岸区  崇文路2号 重庆邮电大学  XXX收', '32DB3700D2564254982BC58B0E4D95BC');

-- ----------------------------
-- Table structure for t_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `orderItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `carId` char(32) DEFAULT NULL,
  `cname` varchar(200) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK_t_orderitem_t_order` (`oid`),
  CONSTRAINT `FK_t_orderitem_t_order` FOREIGN KEY (`oid`) REFERENCES `t_order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('12B3A459ECE04869A0ADBC948AE66F67', '2', '160000.00', '2', '上汽通用雪佛兰 赛欧3订金499元 2015款 1.3L 手动 温馨版', '80000.00', 'car_img/8868045-1_b.jpg', 'CB2F4C71F5134A2CB8ADE6C4DD84FB98');
INSERT INTO `t_orderitem` VALUES ('13014EC96DAA4FA2ABBF74BFF4683A72', '2', '160000.00', '2', '上汽通用雪佛兰 赛欧3订金499元 2015款 1.3L 手动 温馨版', '80000.00', 'car_img/8868045-1_b.jpg', '15449292BD2B47C49531E38844BDA334');
INSERT INTO `t_orderitem` VALUES ('179256927A634C09878F2AFEBDAC10C6', '1', '100000.00', '8CDD007CCC7048F68A7294BDFEEF1E8A', '一汽丰田 威驰订金499元 2016款 1.5L 自动 智臻星耀版', '100000.00', 'car_img/78FE4045C1F54407B7FE05F58B678948_4290918-1_b.jpg', 'D4F1E5B8503E4391A8E200BDE1E5A906');
INSERT INTO `t_orderitem` VALUES ('2004CA07553E477BBE84F1461228DA1A', '2', '260000.00', '1', '哈弗 哈弗H6订金499元 2016款 升级版 1.5T 自动 两驱 精英型', '130000.00', 'car_img/23268960-1_b.jpg', '5C42543B1F9A415292ACABC5A96AA2D1');
INSERT INTO `t_orderitem` VALUES ('21BF1D7AA8DE4A6A88251782D375BF0F', '3', '300000.00', '8CDD007CCC7048F68A7294BDFEEF1E8A', '一汽丰田 威驰订金499元 2016款 1.5L 自动 智臻星耀版', '100000.00', 'car_img/78FE4045C1F54407B7FE05F58B678948_4290918-1_b.jpg', '0CCB07CF28314E97A6CB6A6E80C32E6A');
INSERT INTO `t_orderitem` VALUES ('23C4159E0C6E4FB8912D43CCCE96C43F', '1', '130000.00', '113D0D1BB9174DD19A7DE7E2B37F677F', '哈弗 哈弗H6订金499元 2016款 升级版 1.5T 自动 两驱 精英型', '130000.00', 'car_img/23268960-1_b.jpg', '0CCB07CF28314E97A6CB6A6E80C32E6A');
INSERT INTO `t_orderitem` VALUES ('6F4E4634C4054C9FB9C82D1A976BF415', '1', '130000.00', '113D0D1BB9174DD19A7DE7E2B37F677F', '哈弗 哈弗H6订金499元 2016款 升级版 1.5T 自动 两驱 精英型', '130000.00', 'car_img/23268960-1_b.jpg', 'B14F05D44267483198F0BA4042B31F14');
INSERT INTO `t_orderitem` VALUES ('7FBFD2BE03D74E2B99AD799BDFC46D25', '1', '90000.00', '1286B13F0EA54E4CB75434762121486A', '上汽通用雪佛兰 赛欧3订金499元 2015款 1.3L 手动 温馨版', '90000.00', 'car_img/8868045-1_b.jpg', '516774496A0944849B5B705F083A83CB');
INSERT INTO `t_orderitem` VALUES ('A4917B902B604D39BA50FF06C8AC0B1A', '7', '700000.00', '8CDD007CCC7048F68A7294BDFEEF1E8A', '一汽丰田 威驰订金499元 2016款 1.5L 自动 智臻星耀版', '100000.00', 'car_img/78FE4045C1F54407B7FE05F58B678948_4290918-1_b.jpg', '7941EAE3D60E47EB906B87D3F34894BC');
INSERT INTO `t_orderitem` VALUES ('BC327EE4A3124FBF8F0E34D79FBBA17D', '7', '700000.00', '8CDD007CCC7048F68A7294BDFEEF1E8A', '一汽丰田 威驰订金499元 2016款 1.5L 自动 智臻星耀版', '100000.00', 'car_img/78FE4045C1F54407B7FE05F58B678948_4290918-1_b.jpg', 'B5A8195A1CC643CABC44AEEF72022235');
INSERT INTO `t_orderitem` VALUES ('C047F05C212540BAAC7ED8BA87A6B98D', '7', '700000.00', '8CDD007CCC7048F68A7294BDFEEF1E8A', '一汽丰田 威驰订金499元 2016款 1.5L 自动 智臻星耀版', '100000.00', 'car_img/78FE4045C1F54407B7FE05F58B678948_4290918-1_b.jpg', 'AE15EF64E4704FFFA58C0FAB154F5D8B');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` char(32) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activationCode` char(64) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('32DB3700D2564254982BC58B0E4D95BC', 'lisi', '123', 'itcast_cxf@126.com', '1', '15682E9C4D2849E2AB5D8AFF55D2F7BA87126B0EF55A45C6A136E3CAA90D60F2');
INSERT INTO `t_user` VALUES ('4DE7E4D829A54D4FAB150B7451407198', 'def', 'def', 'itcast_cxf@soh.com', '0', 'D00FAA82457748FF8C1B912042E615B39F3602053E154181B98CDD48D9ECFC96');
INSERT INTO `t_user` VALUES ('531D8A16D524478D86F8A115FE95D93F', 'zhangsan', '123', 'itcast_cxf@163.com', '1', 'FCF142D04C4A420992FF4E7BAC92C1E58AF905F1A46B4818BB455BD925E52DDD');
INSERT INTO `t_user` VALUES ('55790D9C1A1845738E6D93866A148C7E', 'wangWu', '123', 'itcast_cxf@sina.com', '1', '659903B3D5FF4576B82425A593962DFE64B6137EBE934AE5AE19F614E71F4549');
INSERT INTO `t_user` VALUES ('56E9CEAE6B4F4D4CA585FCD8C0ED1609', 'xiaolu', '123', '000@qq.com', '1', '3EEC01DFAEEE4F078CB35B884E95AF156A2CDB60495B424C8A4724D67E0DBF6F');
INSERT INTO `t_user` VALUES ('8F682A63A2D54DEB81895262CF6FDBAB', '123', '234', '528416037@qq.com', '1', '24162E9F0BA24DBB82FB8D647DF3DDFE9E700CAA833A44DB9CC791456749F052');
INSERT INTO `t_user` VALUES ('9CC972DFA2D4481F89841A46FD1B3E7B', 'abc', 'abc', 'itcast_cxf@qq.com', '0', 'D7CEB3DE44364749A4807D98F8B2F63017FDFED9FFC842B6BBC64E20698FED5F');
INSERT INTO `t_user` VALUES ('A111C4C3589F4138AACEFFB988F3E74D', 'xioacheng', '123', '413621484@qq.com', '1', 'A1B615CFA61049FA9DDC5946220AB0202F4F083C97BF4B379B39817136EB62EF');
INSERT INTO `t_user` VALUES ('A460410293B84D03AB3F52EF8EF64124', 'xiaohei', '123', '123@qq.com', '1', '53AF3741A55D4411920DAB4B8228728D627D9F6AE45F4FAEBB6C23AC806EB7AA');
INSERT INTO `t_user` VALUES ('A8BE1580621944E7B6DB90765E92A833', 'xiaoqi', '123', '456@qq.com', '0', 'CBCEE40336DB445EAD3F73A863C77561CAB4013F23584913A55E9A26C2F203C3');
INSERT INTO `t_user` VALUES ('B50ADE921BF14F6EB5331777B1874763', 'aabb', 'aaa', 'abc@abc.cn', '0', '10032D0DFD2B49DC98CA9739F929656B6819FA1C10EC44F8A95206D0C3D62094');
INSERT INTO `t_user` VALUES ('x', '刘备', '123', 'liuBei@163.com', '1', 'x');
INSERT INTO `t_user` VALUES ('xx', '关羽', '123', 'guanYu@163.com', '1', 'xx');
INSERT INTO `t_user` VALUES ('xxx', '张三', '123', 'zhangFei@163.com', '1', 'xxx');
INSERT INTO `t_user` VALUES ('xxxx', '赵云', '123', 'zhaoYun@163.com', '1', 'xxxx');
