/*
 Navicat Premium Data Transfer

 Source Server         : ByHyperion - Ny maskine
 Source Server Type    : MySQL
 Source Server Version : 100307
 Source Host           : localhost:3306
 Source Schema         : vrpfx

 Target Server Type    : MySQL
 Target Server Version : 100307
 File Encoding         : 65001

 Date: 27/10/2018 02:46:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for _log_banstory
-- ----------------------------
DROP TABLE IF EXISTS `_log_banstory`;
CREATE TABLE `_log_banstory`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `ban_from` int(11) NOT NULL,
  `ban_to` int(11) NOT NULL,
  `ban_reason` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `_upd` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 970 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for _log_cashflow
-- ----------------------------
DROP TABLE IF EXISTS `_log_cashflow`;
CREATE TABLE `_log_cashflow`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cash_type` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cash_start` bigint(20) NOT NULL,
  `cash_move` bigint(20) NOT NULL,
  `cash_end` bigint(20) NOT NULL,
  `_upd` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1829952 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for _log_user_switch
-- ----------------------------
DROP TABLE IF EXISTS `_log_user_switch`;
CREATE TABLE `_log_user_switch`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `userid` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `userid_UNIQUE`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for _log_vehicles
-- ----------------------------
DROP TABLE IF EXISTS `_log_vehicles`;
CREATE TABLE `_log_vehicles`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `action` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `vehicle` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vehicle_price` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23378 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access`  (
  `accessID` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `address` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `failed` int(11) NOT NULL,
  PRIMARY KEY (`accessID`) USING BTREE,
  UNIQUE INDEX `accessID`(`accessID`) USING BTREE,
  INDEX `accessID_1`(`accessID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cache_weapons_user
-- ----------------------------
DROP TABLE IF EXISTS `cache_weapons_user`;
CREATE TABLE `cache_weapons_user`  (
  `id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `to` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `from` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `weapon_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `_time` timestamp(0) NULL DEFAULT current_timestamp(),
  `weapon_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for carwarning
-- ----------------------------
DROP TABLE IF EXISTS `carwarning`;
CREATE TABLE `carwarning`  (
  `carwarning_id` int(11) NOT NULL AUTO_INCREMENT,
  `carwarning_cpr` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carwarning_car` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `carwarning_count` int(11) NOT NULL DEFAULT 1,
  `carwarning_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`carwarning_id`) USING BTREE,
  INDEX `carwarning_cpr`(`carwarning_cpr`) USING BTREE,
  CONSTRAINT `FK_carwarning_vrp_user_identities` FOREIGN KEY (`carwarning_cpr`) REFERENCES `vrp_user_identities` (`registration`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for containers
-- ----------------------------
DROP TABLE IF EXISTS `containers`;
CREATE TABLE `containers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `classname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pos` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `inventory` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gear` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dir` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `owned` tinyint(1) NULL DEFAULT 0,
  `insert_time` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`, `pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driverlicense
-- ----------------------------
DROP TABLE IF EXISTS `driverlicense`;
CREATE TABLE `driverlicense`  (
  `ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `driverlicense` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1424 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gangs
-- ----------------------------
DROP TABLE IF EXISTS `gangs`;
CREATE TABLE `gangs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `members` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `maxmembers` int(3) NULL DEFAULT 8,
  `bank` int(100) NULL DEFAULT 0,
  `active` tinyint(1) NULL DEFAULT 1,
  `insert_time` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name_UNIQUE`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pos` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `owned` tinyint(1) NULL DEFAULT 0,
  `insert_time` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`, `pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lawyer_log
-- ----------------------------
DROP TABLE IF EXISTS `lawyer_log`;
CREATE TABLE `lawyer_log`  (
  `reimbursement_id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `reason` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Ingen',
  `notes` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `staff_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp(0) NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`reimbursement_id`) USING BTREE,
  UNIQUE INDEX `reimbursement_id`(`reimbursement_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `user` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`logid`) USING BTREE,
  UNIQUE INDEX `logid`(`logid`) USING BTREE,
  INDEX `logid_2`(`logid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(50) CHARACTER SET latin1 COLLATE latin1_danish_ci NOT NULL,
  `description` int(100) NOT NULL DEFAULT 0,
  `staff_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notes
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes`  (
  `note_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing note_id of each user, unique index',
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `staff_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `note_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `warning` enum('1','2','3','4') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `note_updated` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`note_id`) USING BTREE,
  UNIQUE INDEX `note_id`(`note_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for police_log
-- ----------------------------
DROP TABLE IF EXISTS `police_log`;
CREATE TABLE `police_log`  (
  `reimbursement_id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `reason` varchar(9999) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `notes` varchar(9999) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `staff_name` varchar(9999) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp(0) NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`reimbursement_id`) USING BTREE,
  UNIQUE INDEX `reimbursement_id`(`reimbursement_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reimbursement_log
-- ----------------------------
DROP TABLE IF EXISTS `reimbursement_log`;
CREATE TABLE `reimbursement_log`  (
  `reimbursement_id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `comp` int(100) NOT NULL DEFAULT 0,
  `reason` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `punishment` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `notes` varchar(2555) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `staff_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp(0) NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `buffer` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`reimbursement_id`) USING BTREE,
  UNIQUE INDEX `reimbursement_id`(`reimbursement_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1547 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sigtelser
-- ----------------------------
DROP TABLE IF EXISTS `sigtelser`;
CREATE TABLE `sigtelser`  (
  `ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sigtelser` text CHARACTER SET latin1 COLLATE latin1_danish_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unregisteredvehicle
-- ----------------------------
DROP TABLE IF EXISTS `unregisteredvehicle`;
CREATE TABLE `unregisteredvehicle`  (
  `unregisteredvehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `unregisteredvehicle_cpr` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unregisteredvehicle_car` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `unregisteredvehicle_count` int(11) NOT NULL DEFAULT 1,
  `unregisteredvehicle_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`unregisteredvehicle_id`) USING BTREE,
  INDEX `unregisteredvehicle_cpr`(`unregisteredvehicle_cpr`) USING BTREE,
  CONSTRAINT `FK_unregisteredvehicle_vrp_user_identities` FOREIGN KEY (`unregisteredvehicle_cpr`) REFERENCES `vrp_user_identities` (`registration`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permissions` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `classname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT 1,
  `blacklist` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gear` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fuel` double NOT NULL DEFAULT 1,
  `damage` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `insert_time` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `side`(`side`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vrp_cardealer
-- ----------------------------
DROP TABLE IF EXISTS `vrp_cardealer`;
CREATE TABLE `vrp_cardealer`  (
  `cardealer_id` int(11) NOT NULL AUTO_INCREMENT,
  `cardealer_seller` int(11) NOT NULL,
  `cardealer_sellername` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cardealer_vehicle` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cardealer_vehiclename` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cardealer_vehicledesc` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cardealer_price` int(11) NOT NULL,
  `cardealer_img` varchar(600) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cardealer_soldtoid` int(11) NULL DEFAULT 0,
  `cardealer_solddate` timestamp(0) NULL DEFAULT NULL,
  `cardealer_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `cardealer_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `cardealer_created` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cardealer_id`) USING BTREE,
  INDEX `cardealer_seller`(`cardealer_seller`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 297 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vrp_srv_data
-- ----------------------------
DROP TABLE IF EXISTS `vrp_srv_data`;
CREATE TABLE `vrp_srv_data`  (
  `dkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dvalue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`dkey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vrp_user_business
-- ----------------------------
DROP TABLE IF EXISTS `vrp_user_business`;
CREATE TABLE `vrp_user_business`  (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `capital` int(11) NULL DEFAULT 0,
  `laundered` int(11) NULL DEFAULT 0,
  `reset_timestamp` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_business_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vrp_user_data
-- ----------------------------
DROP TABLE IF EXISTS `vrp_user_data`;
CREATE TABLE `vrp_user_data`  (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `dkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dvalue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`user_id`, `dkey`) USING BTREE,
  CONSTRAINT `fk_user_data_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vrp_user_homes
-- ----------------------------
DROP TABLE IF EXISTS `vrp_user_homes`;
CREATE TABLE `vrp_user_homes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `home` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `home`(`home`, `number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 503 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vrp_user_identities
-- ----------------------------
DROP TABLE IF EXISTS `vrp_user_identities`;
CREATE TABLE `vrp_user_identities`  (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `registration` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT 0,
  `eyes` int(255) NULL DEFAULT 1,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `registration_UNIQUE`(`registration`) USING BTREE,
  UNIQUE INDEX `phone_UNIQUE`(`phone`) USING BTREE,
  INDEX `registration`(`registration`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  CONSTRAINT `fk_user_identities_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vrp_user_ids
-- ----------------------------
DROP TABLE IF EXISTS `vrp_user_ids`;
CREATE TABLE `vrp_user_ids`  (
  `identifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE,
  INDEX `fk_user_ids_users`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_ids_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vrp_user_moneys
-- ----------------------------
DROP TABLE IF EXISTS `vrp_user_moneys`;
CREATE TABLE `vrp_user_moneys`  (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `wallet` bigint(20) NULL DEFAULT 0,
  `bank` bigint(20) NULL DEFAULT 0,
  `_log_upd` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_moneys_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vrp_user_vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vrp_user_vehicles`;
CREATE TABLE `vrp_user_vehicles`  (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `vehicle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `vehicle_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vehicle_plate` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `veh_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default',
  `vehicle_colorprimary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_colorsecondary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_wheelcolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_plateindex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_neoncolor1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_neoncolor2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_neoncolor3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_windowtint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_wheeltype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods0` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods16` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_turbo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'off',
  `vehicle_tiresmoke` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'off',
  `vehicle_xenon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'off',
  `vehicle_mods23` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_mods24` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_neon0` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_neon1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_neon2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_neon3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_bulletproof` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_smokecolor1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_smokecolor2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_smokecolor3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle_modvariation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'off',
  `vehicle_price` int(60) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`, `vehicle_plate`, `vehicle`) USING BTREE,
  CONSTRAINT `fk_user_vehicles_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vrp_users
-- ----------------------------
DROP TABLE IF EXISTS `vrp_users`;
CREATE TABLE `vrp_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_date` text CHARACTER SET utf8 COLLATE utf8_danish_ci NULL,
  `whitelisted` tinyint(1) NULL DEFAULT 0,
  `banned` tinyint(1) NULL DEFAULT 0,
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `DmvTest` int(11) NOT NULL DEFAULT 1,
  `_updated` timestamp(0) NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11799 CHARACTER SET = utf8 COLLATE = utf8_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wanted
-- ----------------------------
DROP TABLE IF EXISTS `wanted`;
CREATE TABLE `wanted`  (
  `wantedID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wantedName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wantedCrimes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wantedBounty` int(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `insert_time` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`wantedID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for weapon
-- ----------------------------
DROP TABLE IF EXISTS `weapon`;
CREATE TABLE `weapon`  (
  `ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weapon` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for whitelist
-- ----------------------------
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE `whitelist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `user` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `guid` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `uid` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for banned
-- ----------------------------
DROP VIEW IF EXISTS `banned`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `banned` AS select `ident`.`user_id` AS `user_id`,conv(replace(`ident`.`identifier`,'steam:',''),16,10) AS `steamid`,`status`.`banned` AS `status`,`status`.`reason` AS `reason` from (`vrp_user_ids` `ident` join `vrp_users` `status` on(`ident`.`user_id` = `status`.`id`)) where `status`.`banned` > 0 order by `ident`.`user_id` ;

-- ----------------------------
-- View structure for cars_forbes
-- ----------------------------
DROP VIEW IF EXISTS `cars_forbes`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `cars_forbes` AS select `vrpfx`.`vrp_user_vehicles`.`user_id` AS `user_id`,sum(`vrpfx`.`vrp_user_vehicles`.`vehicle_price`) AS `SUM(vehicle_price)` from `vrp_user_vehicles` group by `vrpfx`.`vrp_user_vehicles`.`user_id` order by sum(`vrpfx`.`vrp_user_vehicles`.`vehicle_price`) desc ; ;

-- ----------------------------
-- View structure for cars_inactive_import
-- ----------------------------
DROP VIEW IF EXISTS `cars_inactive_import`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `cars_inactive_import` AS select `vehicle`.`user_id` AS `id`,concat(`ident`.`firstname`,' ',`ident`.`name`) AS `name`,`vehicle`.`vehicle` AS `spawnname`,`vehicle`.`veh_type` AS `type`,`vehicle`.`vehicle_name` AS `vehicle_name`,cast(`money`.`_log_upd` as date) AS `last_money_transaction`,to_days(curdate()) - to_days(cast(`money`.`_log_upd` as date)) AS `days` from ((`vrp_user_identities` `ident` join `vrp_user_vehicles` `vehicle` on(`vehicle`.`user_id` = `ident`.`user_id` and `vehicle`.`vehicle` <> 'sandking' and `vehicle`.`vehicle` <> 'sanchez' and `vehicle`.`vehicle` <> 'sultan' and `vehicle`.`vehicle` <> 'premier')) join `vrp_user_moneys` `money` on(`vehicle`.`user_id` = `money`.`user_id` and `vehicle`.`vehicle_name` <> '' and `vehicle`.`vehicle_price` = 0 and `vehicle`.`vehicle_plate` <> '')) where cast(`money`.`_log_upd` as date) <= curdate() - interval 30 day order by to_days(curdate()) - to_days(cast(`money`.`_log_upd` as date)) desc ; ;

-- ----------------------------
-- View structure for cars_list
-- ----------------------------
DROP VIEW IF EXISTS `cars_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `cars_list` AS select `vrpfx`.`vrp_user_vehicles`.`vehicle` AS `spawnname`,`vrpfx`.`vrp_user_vehicles`.`vehicle_name` AS `vehicle_name` from `vrp_user_vehicles` where `vrpfx`.`vrp_user_vehicles`.`vehicle_name` <> '' group by `vrpfx`.`vrp_user_vehicles`.`vehicle_name` order by `vrpfx`.`vrp_user_vehicles`.`vehicle_name` ; ;

-- ----------------------------
-- View structure for moneyhoes
-- ----------------------------
DROP VIEW IF EXISTS `moneyhoes`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `moneyhoes` AS select `ident`.`user_id` AS `id`,concat(`ident`.`firstname`,' ',`ident`.`name`) AS `name`,`money`.`wallet` + `money`.`bank` AS `value` from (`vrp_user_identities` `ident` join `vrp_user_moneys` `money` on(`ident`.`user_id` = `money`.`user_id`)) order by `money`.`wallet` + `money`.`bank` desc ; ;

-- ----------------------------
-- Triggers structure for table vrp_user_ids
-- ----------------------------
DROP TRIGGER IF EXISTS `vrp_user_ids_logging`;
delimiter ;;
CREATE TRIGGER `vrp_user_ids_logging` AFTER DELETE ON `vrp_user_ids` FOR EACH ROW BEGIN

	INSERT INTO
		`_log_user_switch`
        (`identifier`,`userid`)
	VALUES
		(OLD.`identifier`,OLD.`user_id`)
	
    ON DUPLICATE KEY UPDATE `userid`=`userid`;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table vrp_user_moneys
-- ----------------------------
DROP TRIGGER IF EXISTS `vrp_user_moneys_analysis_update`;
delimiter ;;
CREATE TRIGGER `vrp_user_moneys_analysis_update` AFTER UPDATE ON `vrp_user_moneys` FOR EACH ROW BEGIN
	/* Lets check if the wallet has changed */
    IF ( IFNULL(OLD.`wallet`,0) != IFNULL(NEW.`wallet`,0) ) THEN
        INSERT INTO `vrpfx`.`_log_cashflow`
            (
                `user_id`,
                `cash_type`,
                `cash_start`,
                `cash_move`,
                `cash_end`
            )
                VALUES
            (
                OLD.`user_id`,
                'WALLET',
                IFNULL(OLD.`wallet`,0),
                ( IFNULL(NEW.`wallet`,0) - IFNULL(OLD.`wallet`,0) ),
                IFNULL(NEW.`wallet`,0)
            )
        ;
    END IF;

    /* Lets check if the wallet has changed */
    IF ( IFNULL(OLD.`bank`,0) != IFNULL(NEW.`bank`,0) ) THEN
        INSERT INTO `vrpfx`.`_log_cashflow`
            (
                `user_id`,
                `cash_type`,
                `cash_start`,
                `cash_move`,
                `cash_end`
            )
                VALUES
            (
                OLD.`user_id`,
                'BANK',
                IFNULL(OLD.`bank`,0),
                ( IFNULL(NEW.`bank`,0) - IFNULL(OLD.`bank`,0) ),
                IFNULL(NEW.`bank`,0)
            )
        ;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table vrp_user_vehicles
-- ----------------------------
DROP TRIGGER IF EXISTS `_log_adding`;
delimiter ;;
CREATE TRIGGER `_log_adding` BEFORE INSERT ON `vrp_user_vehicles` FOR EACH ROW INSERT INTO `vrpfx`.`_log_vehicles` (`action`,`user_id`,`vehicle`,`vehicle_price`) VALUES ('insert', NEW.`user_id`, NEW.`vehicle`, NEW.`vehicle_price`)
;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table vrp_user_vehicles
-- ----------------------------
DROP TRIGGER IF EXISTS `_log_deleting`;
delimiter ;;
CREATE TRIGGER `_log_deleting` BEFORE DELETE ON `vrp_user_vehicles` FOR EACH ROW INSERT INTO `vrpfx`.`_log_vehicles` (`action`,`user_id`,`vehicle`,`vehicle_price`) VALUES ('delete', OLD.`user_id`, OLD.`vehicle`, OLD.`vehicle_price`)
;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table vrp_users
-- ----------------------------
DROP TRIGGER IF EXISTS `vrp_users_analysis_bannings`;
delimiter ;;
CREATE TRIGGER `vrp_users_analysis_bannings` BEFORE UPDATE ON `vrp_users` FOR EACH ROW BEGIN

	IF ( IFNULL(OLD.`banned`,0) != IFNULL(NEW.`banned`,0) ) THEN
		INSERT INTO `_log_banstory`
			(`user_id`,`ban_from`,`ban_to`,`ban_reason`)
				VALUES
            (OLD.`id`,OLD.`banned`,NEW.`banned`,IFNULL(NEW.`reason`,''))
		;
    END IF;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
