/*
 Navicat Premium Data Transfer

 Source Server         : localhost_test
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost:3306
 Source Schema         : hoteldb

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 03/02/2020 13:40:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `createId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `days` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `departureDate` date DEFAULT NULL,
  `totalCosts` double DEFAULT NULL,
  `checkinID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `loginId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKs9745b9r27vpahex80d7i3q0k`(`checkinID`) USING BTREE,
  INDEX `FKgr3dcan3bap2pfsr4jfbe00i9`(`loginId`) USING BTREE,
  CONSTRAINT `FKgr3dcan3bap2pfsr4jfbe00i9` FOREIGN KEY (`loginId`) REFERENCES `sysuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKs9745b9r27vpahex80d7i3q0k` FOREIGN KEY (`checkinID`) REFERENCES `checkin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('3a64535c-6884-48c7-8e03-ec9b2c0645e9', NULL, NULL, 0, '0', '2018-01-01', 599, 'c9bb26f5-35f5-4c29-936e-567e69b8bd71', NULL);

-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `createId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `arrivalDate` date DEFAULT NULL,
  `bookingDate` date DEFAULT NULL,
  `roomTypeID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `vipPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKeys32vgwhojwdjk88ojg97y10`(`roomTypeID`) USING BTREE,
  INDEX `FKeett6elu0xx6t2ojixk371a2u`(`vipPhone`) USING BTREE,
  CONSTRAINT `FKeett6elu0xx6t2ojixk371a2u` FOREIGN KEY (`vipPhone`) REFERENCES `vip` (`phone`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKeys32vgwhojwdjk88ojg97y10` FOREIGN KEY (`roomTypeID`) REFERENCES `room_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking
-- ----------------------------
INSERT INTO `booking` VALUES ('07d3fda9-97f8-48bf-bfa2-56f6c2903516', NULL, NULL, 0, '2018-01-26', '2018-01-01', 'ca0409a8-7379-41ab-a3d7-075595447eb2', '222', NULL);
INSERT INTO `booking` VALUES ('3f7e2150-6989-4cfc-8caa-e5d1ac9e5995', NULL, NULL, 0, '2018-01-25', '2018-01-01', '64a6cc44-beb0-4ed4-92e8-b1730d68a291', '222', NULL);
INSERT INTO `booking` VALUES ('72ac965d-ea0a-48e5-b49c-1cc8eb9684c9', NULL, NULL, 0, '2018-01-19', '2018-01-01', '64a6cc44-beb0-4ed4-92e8-b1730d68a291', '333', NULL);

-- ----------------------------
-- Table structure for checkin
-- ----------------------------
DROP TABLE IF EXISTS `checkin`;
CREATE TABLE `checkin`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `createId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `accesscardID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `arrivalDate` date DEFAULT NULL,
  `ispay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roomID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `vipID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKli2l2l7attjp8vt7m9c0ymuxs`(`roomID`) USING BTREE,
  INDEX `FKmcw130e4a020t8xv4gi77fbyy`(`vipID`) USING BTREE,
  CONSTRAINT `FKli2l2l7attjp8vt7m9c0ymuxs` FOREIGN KEY (`roomID`) REFERENCES `room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKmcw130e4a020t8xv4gi77fbyy` FOREIGN KEY (`vipID`) REFERENCES `vip` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checkin
-- ----------------------------
INSERT INTO `checkin` VALUES ('c9bb26f5-35f5-4c29-936e-567e69b8bd71', NULL, NULL, 1, '1', '2018-01-01', '1', '111', 'f702e0a4-087a-46b0-899a-cf48072272d3', '4f0e7ed9-e22c-4fe1-a874-d38ee3163e9d');
INSERT INTO `checkin` VALUES ('f7cee9d7-26db-42f6-9db9-737e79571884', NULL, NULL, 0, '2', '2018-01-01', '0', '0402', 'dfe01db5-bcab-49a1-a518-53a6b984d72e', '4f0e7ed9-e22c-4fe1-a874-d38ee3163e9d');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `createId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL,
  `vipID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK78ryjool0tvf40e7v8fwj6c1b`(`vipID`) USING BTREE,
  CONSTRAINT `FK78ryjool0tvf40e7v8fwj6c1b` FOREIGN KEY (`vipID`) REFERENCES `vip` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('37cde05f-65ae-4610-b65a-27873b369cdb', NULL, NULL, 0, '比较愉快的入住体验。办理入住的时候等候了许久，前台给了两张免费饮料券，边喝饮料边聊天，拿到房间后，Kathy主动陪同我们到了房间，见我怀了宝宝，主动送了一台空气净化器来，非常贴心，很感谢！更衣室去游泳池没有指示，找了许久，前台小哥服务态度非常好，主动带我到了泳池。因为是结婚纪念日，吃完晚饭回来有惊喜，送了一个非常精美的蛋糕与卡片，非常美味！', '2018-01-01 14:42:42.963000', '4f0e7ed9-e22c-4fe1-a874-d38ee3163e9d');
INSERT INTO `comment` VALUES ('3fb0b005-88c2-4ea0-9a81-8682b1c3bf1b', NULL, NULL, 0, '罗莱夏朵精品酒店联盟上海唯一酒店会员。借口陪娃考试，来体验一下5C服务。之前看了评论，有心理准备，所以感觉服务还是达到courtoisie标准，至少是中国区标准了。老上海的小洋房很有味道，两米大床带娃睡也没问题。早餐是定制的，二选一，感觉西餐做得更好，中餐里白粥熬的不错，糍饭糕最美味。', '2018-01-01 14:40:19.867000', '20165787-6c93-487a-9e1b-f5e0aa690a73');
INSERT INTO `comment` VALUES ('6f833b96-2afa-4de5-823e-268cbd21173f', NULL, NULL, 0, '这哪里是早餐啊，分明是brunch，除了陈列的水果和冷盘及面包外，热食都是随点现做的，而且不限量！你可以吃到11点，那量绝对足够应付到下午茶。还有餐具都是纯银的，拿起来就压手。房间可以加床，但是我觉得没必要，沙发上绝对挤下了。酒店比较高端，孩子若能控制好哭闹，问题不大。酒店位置在外滩源头，风景无敌，可以去艾利爵士酒吧一望黄浦江两岸风景', '2018-01-01 14:46:13.557000', 'f1d5ae20-e956-4588-b751-9f92cf3df26c');
INSERT INTO `comment` VALUES ('8e7c79f6-f6b2-4dc4-8885-707e0dff6a80', NULL, NULL, 0, '真的被酒店惊喜到了，房间浓郁的老上海调调，暖心的送餐服务，大堂吧charming songs and whiskey，让匆忙的商务出行有了回家的温暖，忍不住要评论，下次回再预定', '2018-01-01 14:41:18.509000', '4f0e7ed9-e22c-4fe1-a874-d38ee3163e9d');
INSERT INTO `comment` VALUES ('a909e458-d643-4e38-ac20-dd0760a78938', NULL, NULL, 0, '酒店设施齐全，健身房24小时开放，室内泳池早上6点开放，可是因为现在比较冷，水温28度有点冷，可以去按摩水池泡一下，很暖和舒服。餐厅的自助早餐中西结合，味道还不错，跟朋友渡过了很愉快的周末。晚上的woobar适合小酌聊天，夜店音乐伴随，喝的不贵，平时也可以去 :)', '2018-01-01 14:49:16.669000', '20165787-6c93-487a-9e1b-f5e0aa690a73');
INSERT INTO `comment` VALUES ('d420d4e0-c6a6-4421-bc9a-2735c9efc61d', NULL, NULL, 0, '国内外高端酒店控，半岛开在全世界的分店也都一一住遍。Ritz Carton 和华尔道夫悦榕庄在上海是跟半岛没法比的。首先，半岛酒店在机场有24小时礼宾部接机，和奔驰宝马劳斯莱斯接机服务。那么商务人士和希望方便的可以选择接送，接机人员服务态度非常好。半岛也适合带孩子，因为有准备很多的学习活动，你可以在官网看并提前预约。酒店位置很好，黄金地段离国金大厦和恒隆都不远。餐饮方面我吃过的里面逸龙阁粤菜川汁明虾球最具特色，西餐需要你特别喜欢吃那么去吃吃也适合。', '2018-01-01 14:44:40.276000', 'f1d5ae20-e956-4588-b751-9f92cf3df26c');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `createId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `customerAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customerCard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customerPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customerSex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `vipID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_cond5jwrdl459dg1ybbabcgyf`(`customerCard`) USING BTREE,
  INDEX `FKandbyolvkmawycsbeba8j15di`(`vipID`) USING BTREE,
  CONSTRAINT `FKandbyolvkmawycsbeba8j15di` FOREIGN KEY (`vipID`) REFERENCES `vip` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('11aa98cb-77e7-4c52-b61b-35cd6a8b98fb', NULL, NULL, 0, '广东广州', '333', '熙雯', '333', '女', '', '20165787-6c93-487a-9e1b-f5e0aa690a73');
INSERT INTO `customer` VALUES ('b888a412-01cf-4128-8864-c8250b5acd8a', NULL, NULL, 0, '东莞理工学院城市学院', '111', '邓煜豪', '111', '男', NULL, '4f0e7ed9-e22c-4fe1-a874-d38ee3163e9d');
INSERT INTO `customer` VALUES ('ba1fe6a9-a42a-40bd-a650-a9981ef30088', NULL, NULL, 1, '东莞理工学院', '222', '汤才', '222', '男', '', 'f1d5ae20-e956-4588-b751-9f92cf3df26c');

-- ----------------------------
-- Table structure for customer_checkin
-- ----------------------------
DROP TABLE IF EXISTS `customer_checkin`;
CREATE TABLE `customer_checkin`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `createId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `checkinID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customerID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKj840lxxo8mkuyo0d7hmd1vgvw`(`checkinID`) USING BTREE,
  INDEX `FKjyvpinj7l2crsgtoopsvty6l9`(`customerID`) USING BTREE,
  CONSTRAINT `FKj840lxxo8mkuyo0d7hmd1vgvw` FOREIGN KEY (`checkinID`) REFERENCES `checkin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKjyvpinj7l2crsgtoopsvty6l9` FOREIGN KEY (`customerID`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_checkin
-- ----------------------------
INSERT INTO `customer_checkin` VALUES ('36ad1836-1c8c-442d-945a-ae0a5eae3de7', NULL, NULL, 0, 'f7cee9d7-26db-42f6-9db9-737e79571884', 'b888a412-01cf-4128-8864-c8250b5acd8a');
INSERT INTO `customer_checkin` VALUES ('805212ef-0901-4816-a7d5-66d921e3e02e', NULL, NULL, 0, 'c9bb26f5-35f5-4c29-936e-567e69b8bd71', 'b888a412-01cf-4128-8864-c8250b5acd8a');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `createId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roomAble` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roomName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roomPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roomPrice` double DEFAULT NULL,
  `roomState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roomTypeId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_7naxk12lho25o5c13slimv96q`(`roomName`) USING BTREE,
  INDEX `FKgk4m9p1t7pt8y1d7i5df70l88`(`roomTypeId`) USING BTREE,
  CONSTRAINT `FKgk4m9p1t7pt8y1d7i5df70l88` FOREIGN KEY (`roomTypeId`) REFERENCES `room_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('022aa88d-51c7-4614-8d0a-1a8fc5f2e6d8', NULL, NULL, 1, '0802', '1', '0802', '0802', 599, '空房', '64a6cc44-beb0-4ed4-92e8-b1730d68a291');
INSERT INTO `room` VALUES ('1aeb056f-16c5-4eeb-83f8-ce67dc6ae6f3', NULL, NULL, 0, '0603', '1', '0603', '0603', 399, '空房', '5fa7cf9f-514f-4cb2-93a9-e49e155d481a');
INSERT INTO `room` VALUES ('4baa5168-8150-421a-983e-fabd5efde9fb', NULL, NULL, 0, '0303', '1', '0303', '0303', 499, '空房', '56e0192e-059c-419f-a44c-5fe753cb0c1d');
INSERT INTO `room` VALUES ('55d65e74-5753-4e1b-87d1-962af64e6fcf', NULL, NULL, 0, '0403', '1', '0403', '0403', 499, '空房', 'd026d6ca-8790-4505-92eb-3baf1c5cdff9');
INSERT INTO `room` VALUES ('5828feba-905e-4eef-8daa-6e5e45cba9cf', NULL, NULL, 0, '0305', '1', '0305', '0305', 499, '空房', '56e0192e-059c-419f-a44c-5fe753cb0c1d');
INSERT INTO `room` VALUES ('5ed9c050-8a05-424f-8618-7cd237e63045', NULL, NULL, 0, '0302', '1', '0302', '0302', 499, '空房', '56e0192e-059c-419f-a44c-5fe753cb0c1d');
INSERT INTO `room` VALUES ('698b1789-1673-4399-a430-41cbdc655646', NULL, NULL, 1, '0701', '1', '0701', '0701', 999, '空房', '34d7316e-972c-43ef-b60f-5edffe5c639b');
INSERT INTO `room` VALUES ('6a9ad72e-bcd1-4f2d-b843-292b608ad83d', NULL, NULL, 0, '0605', '1', '0605', '0605', 399, '空房', '5fa7cf9f-514f-4cb2-93a9-e49e155d481a');
INSERT INTO `room` VALUES ('6dbfbeae-de49-459c-aeff-7d3aef3a1a23', NULL, NULL, 0, '0304', '1', '0304', '0304', 499, '空房', '56e0192e-059c-419f-a44c-5fe753cb0c1d');
INSERT INTO `room` VALUES ('76b3be4d-4ec8-4e2c-8d48-5a8534bbb312', NULL, NULL, 0, '0604', '1', '0604', '0604', 399, '空房', '5fa7cf9f-514f-4cb2-93a9-e49e155d481a');
INSERT INTO `room` VALUES ('78b220df-accf-4db3-9e9c-81b3b45b688e', NULL, NULL, 1, '0503', '1', '0503', '0503', 199, '空房', 'ca0409a8-7379-41ab-a3d7-075595447eb2');
INSERT INTO `room` VALUES ('78c5daed-7833-404a-b48f-1c6c498e4954', NULL, NULL, 0, '0301', '1', '0301', '0301', 499, '空房', '56e0192e-059c-419f-a44c-5fe753cb0c1d');
INSERT INTO `room` VALUES ('8b6bf288-d68c-43a8-8c30-433d0c0729bd', NULL, NULL, 0, '0702', '1', '0702', '0702', 999, '空房', '34d7316e-972c-43ef-b60f-5edffe5c639b');
INSERT INTO `room` VALUES ('972614b0-6d5d-442b-8fa5-eca8463bd9ce', NULL, NULL, 0, '0803', '1', '0803', '0803', 599, '空房', '64a6cc44-beb0-4ed4-92e8-b1730d68a291');
INSERT INTO `room` VALUES ('a19c223d-d7e1-4441-b2d2-b73b6ef4e5c5', NULL, NULL, 0, '0504', '1', '0504', '0504', 199, '空房', 'ca0409a8-7379-41ab-a3d7-075595447eb2');
INSERT INTO `room` VALUES ('a98453a9-1f6d-43ba-83c1-2bc6cbc8ee18', NULL, NULL, 0, '0501', '1', '0501', '0501', 199, '空房', 'ca0409a8-7379-41ab-a3d7-075595447eb2');
INSERT INTO `room` VALUES ('ad7e9969-2241-4b7f-a170-9d302d2e8ad7', NULL, NULL, 1, '0502', '1', '0502', '0502', 199, '空房', 'ca0409a8-7379-41ab-a3d7-075595447eb2');
INSERT INTO `room` VALUES ('bbf3a5f7-c541-4fa9-8811-8685fc184605', NULL, NULL, 0, '0401', '1', '0401', '0401', 499, '空房', 'd026d6ca-8790-4505-92eb-3baf1c5cdff9');
INSERT INTO `room` VALUES ('c671d70d-0549-4099-9b4e-37bcde962a88', NULL, NULL, 0, '0601', '1', '0601', '0601', 399, '空房', '5fa7cf9f-514f-4cb2-93a9-e49e155d481a');
INSERT INTO `room` VALUES ('d5a9807d-0c82-4cea-89bb-34b04fdd204a', NULL, NULL, 0, '0504', '1', '0505', '0505', 199, '空房', 'ca0409a8-7379-41ab-a3d7-075595447eb2');
INSERT INTO `room` VALUES ('d9ddc3f3-fba7-46c2-94b6-22e940cca147', NULL, NULL, 0, '0602', '1', '0602', '0602', 399, '空房', '5fa7cf9f-514f-4cb2-93a9-e49e155d481a');
INSERT INTO `room` VALUES ('dfe01db5-bcab-49a1-a518-53a6b984d72e', NULL, NULL, 1, '0402', '1', '0402', '0402', 499, '有客', 'd026d6ca-8790-4505-92eb-3baf1c5cdff9');
INSERT INTO `room` VALUES ('f27c2e83-d285-4d5a-bf5d-0fb27d2b2c07', NULL, NULL, 0, '0703', '1', '0703', '0703', 999, '空房', '34d7316e-972c-43ef-b60f-5edffe5c639b');
INSERT INTO `room` VALUES ('f702e0a4-087a-46b0-899a-cf48072272d3', NULL, NULL, 3, '0801', '1', '0801', '0801', 599, '空房', '64a6cc44-beb0-4ed4-92e8-b1730d68a291');

-- ----------------------------
-- Table structure for room_type
-- ----------------------------
DROP TABLE IF EXISTS `room_type`;
CREATE TABLE `room_type`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `createId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `roomTypeDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roomTypeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roomTypeUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_type
-- ----------------------------
INSERT INTO `room_type` VALUES ('34d7316e-972c-43ef-b60f-5edffe5c639b', NULL, NULL, 1, '总统套房有书房，会议室，饱览迷人风光的全景天窗，可容纳12人的豪华小餐厅，厨具一应俱全，主客两间卧室各设会客区和浴室。', '总统套房', '1260af33-39af-4ac4-b275-6c8e978de91a.jpg');
INSERT INTO `room_type` VALUES ('56e0192e-059c-419f-a44c-5fe753cb0c1d', NULL, NULL, 1, '该客房提供水疗服务，让您褪去劳累一天后的工作与生活中的疲惫，放松身心，感受无尽的快乐。', '水疗房', '7952d8ec-1a87-4241-972f-98e0b72ab2e1.jpg');
INSERT INTO `room_type` VALUES ('5fa7cf9f-514f-4cb2-93a9-e49e155d481a', NULL, NULL, 1, '优雅的商务套房享有50平方米私人空间，更配有独立客厅，东城南城的亮丽的景致尽收眼底。', '商务套房', 'ae5f8cd9-9586-46d8-b9e6-b9762dcb56b3.jpg');
INSERT INTO `room_type` VALUES ('64a6cc44-beb0-4ed4-92e8-b1730d68a291', NULL, NULL, 1, '行政套房采用开放式设计，让您坐拥极致瑰丽的珠江美景。房间尊享独立客厅设计，宽敞的客厅以现代、简约、环保的风格精心搭配，让视野所及之处都令您的身心倍感舒畅与温暖。', '行政套房', 'cab43f31-5304-44d0-9ec1-3947db6f162d.jpg');
INSERT INTO `room_type` VALUES ('ca0409a8-7379-41ab-a3d7-075595447eb2', NULL, NULL, 1, '客房采用现代、简约、环保的设计理念结合别具岭南特色的设计风格，让您倍感宽敞舒适。房间内设有现代中式家具和平面电视，为您的商务出行提供温馨及舒适的居停体验。', '经济客房', 'a171b5ca-78d4-445d-9566-c718a65bed1d.jpg');
INSERT INTO `room_type` VALUES ('d026d6ca-8790-4505-92eb-3baf1c5cdff9', NULL, NULL, 1, '客房采用欧陆风格设计结合温馨舒适的起居配置，在突显高贵雅致的情调同时让您舒缓在忙碌工作后的疲劳。宽敞的玻璃窗及高楼层开阔的视野，为您呈奉美丽的东莞景。', '欧式套房', '1ee31454-a0fe-4377-9e40-c880b05fb7e1.jpg');

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `createId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `able` int(11) DEFAULT NULL,
  `loginId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_5gb2c19q1di6q7uvam3b288bn`(`loginId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('0799c15f-eaeb-4597-b943-4e179e8cc799', NULL, NULL, 1, 1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', NULL, '超级管理员');
INSERT INTO `sysuser` VALUES ('7b2ba4e4-30a6-47c5-bcbb-db453dbbfeda', NULL, NULL, 0, 0, '1', 'c4ca4238a0b923820dcc509a6f75849b', NULL, '测试账户');

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `createId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `nums` int(11) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `vipCredit` int(11) DEFAULT NULL,
  `vipLevel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_paj0dcc21ge1v0a1dq1ohy26f`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('20165787-6c93-487a-9e1b-f5e0aa690a73', NULL, NULL, 0, '1997-02-24', 1, '333', '333', 10, '白银会员');
INSERT INTO `vip` VALUES ('4f0e7ed9-e22c-4fe1-a874-d38ee3163e9d', NULL, NULL, 0, '2018-01-01', 1, '111', '111', 10, '白银会员');
INSERT INTO `vip` VALUES ('f1d5ae20-e956-4588-b751-9f92cf3df26c', NULL, NULL, 0, '2017-01-02', 1, '222', '222', 10, '白银会员');

SET FOREIGN_KEY_CHECKS = 1;
