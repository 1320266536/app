/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : shejiao

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 15/03/2019 12:29:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_album
-- ----------------------------
DROP TABLE IF EXISTS `app_album`;
CREATE TABLE `app_album`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `pic_id` bigint(20) NULL DEFAULT NULL COMMENT '图片id',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户图集' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_album
-- ----------------------------
INSERT INTO `app_album` VALUES (1, 2, 2, 1);
INSERT INTO `app_album` VALUES (3, 1, 1, 1);

-- ----------------------------
-- Table structure for app_blcak_list
-- ----------------------------
DROP TABLE IF EXISTS `app_blcak_list`;
CREATE TABLE `app_blcak_list`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `black_user_id` bigint(20) NULL DEFAULT NULL COMMENT '拉黑用户id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '拉黑时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '黑名单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_blcak_list
-- ----------------------------
INSERT INTO `app_blcak_list` VALUES (1, 1, 2, '2019-02-26 09:42:21');
INSERT INTO `app_blcak_list` VALUES (2, 1, 3, '2019-02-26 09:42:22');

-- ----------------------------
-- Table structure for app_care_me
-- ----------------------------
DROP TABLE IF EXISTS `app_care_me`;
CREATE TABLE `app_care_me`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `care_user_id` bigint(20) NULL DEFAULT NULL COMMENT '关注用户id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_feed_back
-- ----------------------------
DROP TABLE IF EXISTS `app_feed_back`;
CREATE TABLE `app_feed_back`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户昵称',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '反馈内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户意见反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_history_video
-- ----------------------------
DROP TABLE IF EXISTS `app_history_video`;
CREATE TABLE `app_history_video`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `video_id` bigint(20) NULL DEFAULT NULL COMMENT '视频id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户视频历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_history_video
-- ----------------------------
INSERT INTO `app_history_video` VALUES (1, 1, 1, NULL);
INSERT INTO `app_history_video` VALUES (2, 1, 3, NULL);

-- ----------------------------
-- Table structure for app_join_meeting
-- ----------------------------
DROP TABLE IF EXISTS `app_join_meeting`;
CREATE TABLE `app_join_meeting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mt_id` bigint(20) NULL DEFAULT NULL COMMENT '会议id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '微信openID',
  `pic` bigint(20) NULL DEFAULT NULL COMMENT '头像ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '参与会议人员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_join_meeting
-- ----------------------------
INSERT INTO `app_join_meeting` VALUES (1, 22, NULL, NULL, 16);
INSERT INTO `app_join_meeting` VALUES (2, 22, NULL, NULL, 17);
INSERT INTO `app_join_meeting` VALUES (3, 22, NULL, NULL, 18);
INSERT INTO `app_join_meeting` VALUES (4, 22, NULL, NULL, 15);
INSERT INTO `app_join_meeting` VALUES (5, 22, NULL, NULL, 16);
INSERT INTO `app_join_meeting` VALUES (6, 22, NULL, NULL, 17);
INSERT INTO `app_join_meeting` VALUES (7, 22, NULL, NULL, 18);
INSERT INTO `app_join_meeting` VALUES (8, 22, NULL, NULL, 15);
INSERT INTO `app_join_meeting` VALUES (9, 22, NULL, NULL, 16);
INSERT INTO `app_join_meeting` VALUES (10, 22, NULL, NULL, 17);
INSERT INTO `app_join_meeting` VALUES (11, 22, NULL, NULL, 18);
INSERT INTO `app_join_meeting` VALUES (12, 22, NULL, NULL, 15);
INSERT INTO `app_join_meeting` VALUES (13, 22, NULL, NULL, 16);
INSERT INTO `app_join_meeting` VALUES (14, 22, NULL, NULL, 17);
INSERT INTO `app_join_meeting` VALUES (15, 22, NULL, NULL, 18);
INSERT INTO `app_join_meeting` VALUES (16, 22, NULL, NULL, 15);

-- ----------------------------
-- Table structure for app_meeting
-- ----------------------------
DROP TABLE IF EXISTS `app_meeting`;
CREATE TABLE `app_meeting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '会议名称',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '会议内容',
  `mt_time` datetime(0) NULL DEFAULT NULL COMMENT '会议时间',
  `adress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '会议地点',
  `coordinates` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '经纬度',
  `qr_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '会议管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_meeting
-- ----------------------------
INSERT INTO `app_meeting` VALUES (22, '两会', '召开国际会议', '2019-03-08 00:00:00', '北京市朝阳区东煌大厦', '116.487776,39.992107', '18');
INSERT INTO `app_meeting` VALUES (23, '人民十七戴表带大会', '研究各种市面常见的表', '2019-03-19 00:00:00', '北京市东城区钟表馆', '116.405129,39.925249', '19');

-- ----------------------------
-- Table structure for app_mobile_user
-- ----------------------------
DROP TABLE IF EXISTS `app_mobile_user`;
CREATE TABLE `app_mobile_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `head_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '密码',
  `company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '公司',
  `positions` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '职位',
  `industry` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '行业',
  `mail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `business_card` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名片',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '身份证号',
  `id_card_positive` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '身份证正面图',
  `id_card_reverse` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '身份证反面图',
  `real_flag` int(11) NULL DEFAULT NULL COMMENT '是否实名',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `im_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '环信id',
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '微信Open_Id',
  `user_from` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户来源',
  `lon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '纬度',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `hand_up_id_card` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '手持身份证',
  `logo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lon`(`lon`) USING BTREE,
  INDEX `lat`(`lat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '移动端用户表（用于app和小程序）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_mobile_user
-- ----------------------------
INSERT INTO `app_mobile_user` VALUES (1, '15', '风之气息', '男', '18744422377', '4925152f1764d4b1bd8786232820f58f', '王大拿家具', '保安队长', '装修', '187441@163.com', '2019-02-27 03:36:37', '16', '王木生', '234567887654323456789', NULL, NULL, 1, 1, '12324543', '42314', 'miniprogram', '39.9920285216', '116.4727324052', NULL, NULL, NULL, NULL);
INSERT INTO `app_mobile_user` VALUES (9, '29', 'CanMeng', '男', '14747324146', '9f221a2112f6430aa8dc3da92a373c3d', NULL, NULL, NULL, NULL, '2019-03-08 10:02:53', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 'app', '39.9920285216', '116.4727324052', NULL, NULL, NULL, NULL);
INSERT INTO `app_mobile_user` VALUES (12, '365', 'Zd!', NULL, '18888888888', 'f35d3014ece9e3927563d513a933bf1f', '品信', '前端', 'IT', '947894008@qq.com', '2019-03-11 09:25:30', NULL, '┈━═☆', NULL, NULL, NULL, 0, 1, NULL, 'oR-VZ5HezIIsmbrhO-etIf-U1Vtw', 'miniprogram', '39.9920285216', '116.4727324052', NULL, NULL, '233', '北京市');
INSERT INTO `app_mobile_user` VALUES (16, '345', NULL, '0', '13671067814', '79e8be30798b1410745db2199befcfad', NULL, NULL, NULL, NULL, '2019-03-14 12:13:29', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 'app', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for app_statistical
-- ----------------------------
DROP TABLE IF EXISTS `app_statistical`;
CREATE TABLE `app_statistical`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `action` int(11) NULL DEFAULT NULL COMMENT '动作',
  `object` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '对象',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_tag_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `app_tag_dictionary`;
CREATE TABLE `app_tag_dictionary`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int(11) NULL DEFAULT NULL COMMENT '类别',
  `td_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '标签字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_vcard_floder
-- ----------------------------
DROP TABLE IF EXISTS `app_vcard_floder`;
CREATE TABLE `app_vcard_floder`  (
  `id` bigint(20) NULL DEFAULT NULL COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `receoved_user_id` bigint(20) NULL DEFAULT NULL COMMENT '接受者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '名片夹' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_video
-- ----------------------------
DROP TABLE IF EXISTS `app_video`;
CREATE TABLE `app_video`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `theme` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '视频主题',
  `release_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `permissions` int(11) NULL DEFAULT NULL COMMENT '私密性',
  `fileId` bigint(20) NULL DEFAULT NULL COMMENT '视频ID',
  `praises` int(11) NULL DEFAULT 0 COMMENT '点赞',
  `comments` int(11) NULL DEFAULT 0 COMMENT '评论数量',
  `share` int(11) NULL DEFAULT 0 COMMENT '转发数量',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `recommended` int(11) NULL DEFAULT NULL COMMENT '是否推荐',
  `re_time` datetime(0) NULL DEFAULT NULL COMMENT '推荐日期',
  `coordinates` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '经纬度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '视频作品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_video
-- ----------------------------
INSERT INTO `app_video` VALUES (1, 1, '1', NULL, NULL, 15, 5, NULL, NULL, 1, '无', 0, NULL, NULL);
INSERT INTO `app_video` VALUES (2, 1, NULL, NULL, NULL, 15, 6, NULL, NULL, 1, '无', 0, NULL, NULL);
INSERT INTO `app_video` VALUES (3, 1, NULL, NULL, NULL, 15, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO `app_video` VALUES (4, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `file_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文件名称',
  `file_path` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文件路径',
  `file_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `upload_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传人',
  `upload_date` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `file_remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文件备注',
  `width` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宽',
  `height` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 366 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES (1, '1.mp4', '/', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `files` VALUES (2, '732dc23edb3c4cf09a2dcbee4c89ecd7.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:29:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (3, 'f3331064c54c44718aac2556225ac0b7.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:37:06', NULL, NULL, NULL);
INSERT INTO `files` VALUES (4, 'c7767a19a4654210b81157f257dc99b7.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:37:42', NULL, NULL, NULL);
INSERT INTO `files` VALUES (5, '7911368a84a74287a892cd822985d8c1.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:38:33', NULL, NULL, NULL);
INSERT INTO `files` VALUES (6, '2a963002ffb046898b8530d5cf337198.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:39:20', NULL, NULL, NULL);
INSERT INTO `files` VALUES (7, '083cbf3677df44e5b3bc5ea6f435b677.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:41:38', NULL, NULL, NULL);
INSERT INTO `files` VALUES (8, 'a902ff54ed454934b0618f94147bf178.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:42:22', NULL, NULL, NULL);
INSERT INTO `files` VALUES (9, 'c04d1ba777f24a9a809b68dff3f6ace6.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:46:02', NULL, NULL, NULL);
INSERT INTO `files` VALUES (10, '12003af42ac246a8a342c3df0b87b852.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:47:08', NULL, NULL, NULL);
INSERT INTO `files` VALUES (11, '6147befc42074084a9ce672ae481d86c.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:47:41', NULL, NULL, NULL);
INSERT INTO `files` VALUES (12, 'f8f2d5b9fade449faf6b6de1cd383885.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:47:56', NULL, NULL, NULL);
INSERT INTO `files` VALUES (13, '3d335700d66449879a1d8d05c3cd148f.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:49:31', NULL, NULL, NULL);
INSERT INTO `files` VALUES (14, 'e443ea0c5b6748d0bd3965d8813e4d0a.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:51:58', NULL, NULL, NULL);
INSERT INTO `files` VALUES (15, 'd7dde05ec5c54ed8a790df7a22c33edc.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:52:14', NULL, NULL, NULL);
INSERT INTO `files` VALUES (16, 'a00e21b353d043ccb9d71b4acad15abb.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:52:43', NULL, NULL, NULL);
INSERT INTO `files` VALUES (17, 'a8343b06a9a8433ab1eb61ac4872bfae.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:52:55', NULL, NULL, NULL);
INSERT INTO `files` VALUES (18, '69dc7ba0a3f9477db4adff3426329875.png', '/2019/03/01/14/', NULL, NULL, 'admin', '2019-03-01 14:53:35', NULL, NULL, NULL);
INSERT INTO `files` VALUES (19, '4e1776c11d5848318f8b623297cae8c7.png', '/2019/03/01/15/', NULL, NULL, 'admin', '2019-03-01 15:24:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (20, '8dde34bebe7443f384f864f2aafab9c7.jpg', '2019/03/04/11/', NULL, NULL, '王木生', '2019-03-04 11:18:32', NULL, NULL, NULL);
INSERT INTO `files` VALUES (21, '9fdfded64953489084ffdb2e8a0d4475.jpg', '2019/03/06/10/', NULL, NULL, '王木生', '2019-03-06 10:27:08', NULL, NULL, NULL);
INSERT INTO `files` VALUES (22, '018e3a2392d04e94834db9e2616b462b.png', '2019/03/06/10/', NULL, NULL, '王木生', '2019-03-06 10:27:08', NULL, NULL, NULL);
INSERT INTO `files` VALUES (23, 'd4ad8a4b872849a3b8830915df357d00jpg', '2019/03/06/16/', NULL, NULL, '6', '2019-03-06 16:47:54', NULL, NULL, NULL);
INSERT INTO `files` VALUES (24, '100489d812524561b99151d60f3e999d.jpeg', '2019/03/07/16/', NULL, NULL, '系统上传', '2019-03-07 16:09:54', NULL, NULL, NULL);
INSERT INTO `files` VALUES (25, '0a1796f637324892aa23d544f77407b9.jpeg', '2019/03/07/17/', NULL, NULL, '系统上传', '2019-03-07 17:57:30', NULL, NULL, NULL);
INSERT INTO `files` VALUES (26, '07c8eb945d2f4a26aa796e12d0356f8d.jpeg', '2019/03/07/17/', NULL, NULL, '系统上传', '2019-03-07 17:59:01', NULL, NULL, NULL);
INSERT INTO `files` VALUES (27, 'e25272f8cc5b4bb3a7dcf420fde20149.jpeg', '2019/03/07/18/', NULL, NULL, '系统上传', '2019-03-07 18:03:06', NULL, NULL, NULL);
INSERT INTO `files` VALUES (28, '5c541d010c0340cd9f0dfe348aeb52a6.jpeg', '2019/03/08/09/', NULL, NULL, '系统上传', '2019-03-08 09:56:35', NULL, NULL, NULL);
INSERT INTO `files` VALUES (29, 'b54b05833e4244478ea8b7f2061358f0.jpeg', '2019/03/08/10/', NULL, NULL, NULL, '2019-03-08 10:02:39', NULL, NULL, NULL);
INSERT INTO `files` VALUES (30, '3ea51d209f2447a596c8dd0cf618b459.jpg', '2019/03/08/15/', NULL, NULL, '系统头像', '2019-03-08 15:55:57', NULL, NULL, NULL);
INSERT INTO `files` VALUES (31, 'd21a9c8023fa42a29c4ac2077f08f5c8.jpg', '2019/03/08/16/', NULL, NULL, '系统头像', '2019-03-08 16:28:41', NULL, NULL, NULL);
INSERT INTO `files` VALUES (32, 'b045cb2bfbe049b0bbd18d2ec96e7682.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:25:30', NULL, NULL, NULL);
INSERT INTO `files` VALUES (33, '411d49dfb9ed469fa0d3e615d3ebf33e.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:26:27', NULL, NULL, NULL);
INSERT INTO `files` VALUES (34, 'd6288080e6634dd78ab52220418e2fd3.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:26:48', NULL, NULL, NULL);
INSERT INTO `files` VALUES (35, '3b740a2fac1a468e844279199ffabca5.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:27:19', NULL, NULL, NULL);
INSERT INTO `files` VALUES (36, 'ff07744b2b074af78e37a2a3e4bc434e.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:27:44', NULL, NULL, NULL);
INSERT INTO `files` VALUES (37, 'f76df601ad1d498685fff92d797362c2.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:28:23', NULL, NULL, NULL);
INSERT INTO `files` VALUES (38, '58d1524e5c0c45c48efbfb9826e8a748.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:28:43', NULL, NULL, NULL);
INSERT INTO `files` VALUES (39, '854aab2ede37412fb6533589dc57a395.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:29:06', NULL, NULL, NULL);
INSERT INTO `files` VALUES (40, '3849ca42fa8b46ab98440e79e0f00e86.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:42:00', NULL, NULL, NULL);
INSERT INTO `files` VALUES (41, '4a59f50e599a498cb5772359ff914541.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:42:00', NULL, NULL, NULL);
INSERT INTO `files` VALUES (42, 'cc6323eb547b499d912857c5cc405db4.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:43:17', NULL, NULL, NULL);
INSERT INTO `files` VALUES (43, 'bb28a54cc0bf46609619c674a82fa0ec.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:44:33', NULL, NULL, NULL);
INSERT INTO `files` VALUES (44, '8a043280d4f240f28bf79279327ce750.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:46:26', NULL, NULL, NULL);
INSERT INTO `files` VALUES (45, '1d54856f2c07426fb598121a7e58f96d.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:48:54', NULL, NULL, NULL);
INSERT INTO `files` VALUES (46, 'c147243e954740f29fa9fdfe6648a8cc.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:48:59', NULL, NULL, NULL);
INSERT INTO `files` VALUES (47, '75bfecf939094d2caf88b88ba2093f21.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:51:46', NULL, NULL, NULL);
INSERT INTO `files` VALUES (48, 'f1dd2da041c24ae29f1bb4169580674a.jpg', '2019/03/11/09/', NULL, NULL, '系统上传', '2019-03-11 09:51:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (49, '647a1e8ce3094ce6963282009fd9152c.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:06:34', NULL, NULL, NULL);
INSERT INTO `files` VALUES (50, '79450978c393418daab87eb52126baeb.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:06:59', NULL, NULL, NULL);
INSERT INTO `files` VALUES (51, 'cdda31aff83c4016b954ca9401eb9642.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:07:13', NULL, NULL, NULL);
INSERT INTO `files` VALUES (52, 'e5d1d307dc854df3a49eebacb8b0535c.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:07:50', NULL, NULL, NULL);
INSERT INTO `files` VALUES (53, '2efc2e9086b44a948a613204431d6502.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:15:15', NULL, NULL, NULL);
INSERT INTO `files` VALUES (54, 'c4801c55589f420eaf0a873c364ae98b.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:18:39', NULL, NULL, NULL);
INSERT INTO `files` VALUES (55, 'a04d5d2643e34cff9085dbc59887cd97.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:22:00', NULL, NULL, NULL);
INSERT INTO `files` VALUES (56, '4a6997fae3de442a8853420222c33cf2.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:52:19', NULL, NULL, NULL);
INSERT INTO `files` VALUES (57, '7ca0358c73034efca77d1db9204e53ca.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:54:14', NULL, NULL, NULL);
INSERT INTO `files` VALUES (58, '96d90df210a34bba869241261863f425.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:54:51', NULL, NULL, NULL);
INSERT INTO `files` VALUES (59, '53d710b59da54ae1ba15e65bad3f8444.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:55:12', NULL, NULL, NULL);
INSERT INTO `files` VALUES (60, '24ba45e8f94a4aa9a5b45b1d03c50d79.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:55:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (61, '9bad2e9c75354a478d3dc01e5686a8b4.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:56:02', NULL, NULL, NULL);
INSERT INTO `files` VALUES (62, '5fb0514ea9264c2ca308fa3f6ce2ae60.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:56:17', NULL, NULL, NULL);
INSERT INTO `files` VALUES (63, '0438ce061f1648c1afed34a8aa5dff17.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:58:17', NULL, NULL, NULL);
INSERT INTO `files` VALUES (64, 'd8b8b086a5b74fb0b912a213203a1020.jpg', '2019/03/11/10/', NULL, NULL, '系统上传', '2019-03-11 10:58:53', NULL, NULL, NULL);
INSERT INTO `files` VALUES (65, '81272e5ae18a46049939f541283daec1.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:01:00', NULL, NULL, NULL);
INSERT INTO `files` VALUES (66, 'fd4a7868ea5c448599be991dd8d80e9e.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:02:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (67, 'd2373c958f254acb835774a36bb0bbf2.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:03:31', NULL, NULL, NULL);
INSERT INTO `files` VALUES (68, 'd962d979d6ad4e2281b5ef6c1d9c2e60.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:05:11', NULL, NULL, NULL);
INSERT INTO `files` VALUES (69, 'de3631da5d0f465d85dc0be09bd120ae.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:05:31', NULL, NULL, NULL);
INSERT INTO `files` VALUES (70, 'fc6b67bceb4e469cbfcc6e86dcebf24c.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:05:39', NULL, NULL, NULL);
INSERT INTO `files` VALUES (71, 'c50fdfe97a2045d987cdb84d34c3cd7d.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:06:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (72, '0e3fa0a12bd04330a2645f454a5f5e42.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:07:26', NULL, NULL, NULL);
INSERT INTO `files` VALUES (73, '98863a67577c46988f123bc7e693c88c.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:09:09', NULL, NULL, NULL);
INSERT INTO `files` VALUES (74, '3b99f278ad1f469d9cc78a39541997a5.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:11:09', NULL, NULL, NULL);
INSERT INTO `files` VALUES (75, '5c853c80ba37475eb6bed7df043a5181.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:13:00', NULL, NULL, NULL);
INSERT INTO `files` VALUES (76, 'f4d8188083b54872be7ccd0a5fa27310.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:13:49', NULL, NULL, NULL);
INSERT INTO `files` VALUES (77, '2a16bf4902ed4ec4b3c9e3fc9df837e0.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:14:00', NULL, NULL, NULL);
INSERT INTO `files` VALUES (78, '3a302a7ced704a33af51280c00006d08.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:14:33', NULL, NULL, NULL);
INSERT INTO `files` VALUES (79, 'abb63a3056ad4feca0573be5cbc70313.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:14:53', NULL, NULL, NULL);
INSERT INTO `files` VALUES (80, '6b080b2d18e74ed18e960b51e741d28e.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:15:30', NULL, NULL, NULL);
INSERT INTO `files` VALUES (81, '784e8846a4bd4343bb81e30f0fbccb0d.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:16:56', NULL, NULL, NULL);
INSERT INTO `files` VALUES (82, 'd5792cb23ca54a44a6aa1492f4517619.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:17:40', NULL, NULL, NULL);
INSERT INTO `files` VALUES (83, '219c2c9c702f426a99ba7923c32b3153.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:20:22', NULL, NULL, NULL);
INSERT INTO `files` VALUES (84, '1d5bd150ebf843b39596852d9bd15d07.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:20:50', NULL, NULL, NULL);
INSERT INTO `files` VALUES (85, '5547559a15e2421fae9daca7cbaba80f.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:21:46', NULL, NULL, NULL);
INSERT INTO `files` VALUES (86, '54335649dfe846c39329fac6feb37315.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:22:30', NULL, NULL, NULL);
INSERT INTO `files` VALUES (87, '8b4575ea22e240549d065a3dded4ed0a.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:22:43', NULL, NULL, NULL);
INSERT INTO `files` VALUES (88, 'ce0e7c3434084089afe3b2f33ff73b92.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:23:14', NULL, NULL, NULL);
INSERT INTO `files` VALUES (89, '58cd30d11bfc46cea34cce0c1f3c9e2d.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:28:03', NULL, NULL, NULL);
INSERT INTO `files` VALUES (90, 'a4a4bfd90d854784bcf41b7fb10431c4.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:28:08', NULL, NULL, NULL);
INSERT INTO `files` VALUES (91, '025ed856e5434bf6898d5b708a811a82.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:34:10', NULL, NULL, NULL);
INSERT INTO `files` VALUES (92, '2a0bc15069bf4eddbb7111e7e5f2e6e1.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:35:16', NULL, NULL, NULL);
INSERT INTO `files` VALUES (93, 'b619085e7ad7427fadea982a4a60c7cb.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:35:48', NULL, NULL, NULL);
INSERT INTO `files` VALUES (94, '3e21410c791b4a5095f53abaaff0817a.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:36:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (95, 'd197fa66de524a36ae7dae062068f973.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:36:21', NULL, NULL, NULL);
INSERT INTO `files` VALUES (96, 'c1d4cb94edf548e0829193c060706962.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:36:36', NULL, NULL, NULL);
INSERT INTO `files` VALUES (97, 'dde24a7ff10944c5b36834a03446e497.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:36:48', NULL, NULL, NULL);
INSERT INTO `files` VALUES (98, '127bedc3ec7c4d589377c6877022a993.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:37:16', NULL, NULL, NULL);
INSERT INTO `files` VALUES (99, '609ba56ccfa34824b2f4a85e7aa996c3.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:37:34', NULL, NULL, NULL);
INSERT INTO `files` VALUES (100, '7aeeed940f2f47de85824dc796537845.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:38:23', NULL, NULL, NULL);
INSERT INTO `files` VALUES (101, '406d301f299746c7932d2311f11cbac9.jpg', '2019/03/11/11/', NULL, NULL, '系统上传', '2019-03-11 11:38:38', NULL, NULL, NULL);
INSERT INTO `files` VALUES (102, '6c72a68587de48529309bc4775c0c961.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:31:12', NULL, NULL, NULL);
INSERT INTO `files` VALUES (103, '7e55606a6386477888d9db7f3b466fa8.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:34:08', NULL, NULL, NULL);
INSERT INTO `files` VALUES (104, '9946205f43ed4a84b7a7f1d13714df97.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:37:04', NULL, NULL, NULL);
INSERT INTO `files` VALUES (105, '059d0856800744a6878641dad221b57d.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:37:09', NULL, NULL, NULL);
INSERT INTO `files` VALUES (106, '31611a5925064009af8f796839749745.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:37:44', NULL, NULL, NULL);
INSERT INTO `files` VALUES (107, '3867e743b4f4447cb61b23a36db2c33d.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:43:58', NULL, NULL, NULL);
INSERT INTO `files` VALUES (108, '29009eff6c304e1bbf4ade570c7f8b4b.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:47:12', NULL, NULL, NULL);
INSERT INTO `files` VALUES (109, '1af9106097be414baa54997a669446c3.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:47:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (110, '08de399d3f294c2fb742ee4c958acf1f.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:48:59', NULL, NULL, NULL);
INSERT INTO `files` VALUES (111, '889a825952074a3d9cad14987a953692.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:50:17', NULL, NULL, NULL);
INSERT INTO `files` VALUES (112, 'a98be382d23341589dba77c712ef049e.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:51:39', NULL, NULL, NULL);
INSERT INTO `files` VALUES (113, '750be746d49f44f1a681c7563c7d6118.jpg', '2019/03/11/14/', NULL, NULL, '系统上传', '2019-03-11 14:53:18', NULL, NULL, NULL);
INSERT INTO `files` VALUES (114, '5c8449b2e90f4fb2b0cd940494064471.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:02:40', NULL, NULL, NULL);
INSERT INTO `files` VALUES (115, '986ca7213a164ca78eeeabe154e8445c.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:03:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (116, '12c2de28cc754520931e8415e39c7c99.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:12:15', NULL, NULL, NULL);
INSERT INTO `files` VALUES (117, 'd0e4f57ff94b4b2dacc4409520d14ee1.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:12:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (118, 'fef9809f04a6463cb5aff6ee677e7589.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:13:41', NULL, NULL, NULL);
INSERT INTO `files` VALUES (119, 'd06daca4cda7417aa31f0764eaab2123.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:15:22', NULL, NULL, NULL);
INSERT INTO `files` VALUES (120, 'b5f54647f246468f9d5aa9c53556163a.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:15:38', NULL, NULL, NULL);
INSERT INTO `files` VALUES (121, '3bca0139e39141b1b83723ab2b6599c6.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:15:56', NULL, NULL, NULL);
INSERT INTO `files` VALUES (122, '8d2478f161514dc681a3396262ae911e.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:17:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (123, '1d21a7d5daaa451aa3d01ba2bb229440.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:17:17', NULL, NULL, NULL);
INSERT INTO `files` VALUES (124, '7f9b5ed5d72642e8b1692bad5c6c2995.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:18:39', NULL, NULL, NULL);
INSERT INTO `files` VALUES (125, '90d3abbc81d949f4a63ed8394398c65f.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:19:05', NULL, NULL, NULL);
INSERT INTO `files` VALUES (126, '9837ed54d9f648b3a93da32c675e3869.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:19:18', NULL, NULL, NULL);
INSERT INTO `files` VALUES (127, 'ef82c83b9e834e4ba1b9824b3678a8f8.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:19:51', NULL, NULL, NULL);
INSERT INTO `files` VALUES (128, '40a9afe20a004b54a2d46b0eb8556cbd.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:20:10', NULL, NULL, NULL);
INSERT INTO `files` VALUES (129, '2f7d894e088045d88662460b6e23d36e.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:26:12', NULL, NULL, NULL);
INSERT INTO `files` VALUES (130, '0f640e9bd1444fb88be6284c8a794596.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:26:58', NULL, NULL, NULL);
INSERT INTO `files` VALUES (131, '6a6682f6eb7e4533bff646724999375d.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:27:19', NULL, NULL, NULL);
INSERT INTO `files` VALUES (132, '3a2f86562639498fb1a8c5e222b0cb4c.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:27:39', NULL, NULL, NULL);
INSERT INTO `files` VALUES (133, 'fbd1ff2959bf4af9ae1a2529edd24d0f.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:29:50', NULL, NULL, NULL);
INSERT INTO `files` VALUES (134, 'e132499a9ec54493978ab012d35970ad.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:40:57', NULL, NULL, NULL);
INSERT INTO `files` VALUES (135, 'a2d750763bbb4b2aa3931fe58c518d61.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:48:09', NULL, NULL, NULL);
INSERT INTO `files` VALUES (136, 'f82c0d1c0ead4dff8013bece14c80e4c.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:49:43', NULL, NULL, NULL);
INSERT INTO `files` VALUES (137, 'e395c5151ccb4c8f87d4f90e5040d975.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:49:47', NULL, NULL, NULL);
INSERT INTO `files` VALUES (138, '8775dcdba6fb43a583068faa4af2145d.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:50:11', NULL, NULL, NULL);
INSERT INTO `files` VALUES (139, '2554528f59cd4f8db6f61087293e2cd8.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:50:28', NULL, NULL, NULL);
INSERT INTO `files` VALUES (140, '705080c3d293408a8c0d4cf71b70edf6.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:51:20', NULL, NULL, NULL);
INSERT INTO `files` VALUES (141, '2e7ef400129548d9966a6b4154b26f50.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:51:48', NULL, NULL, NULL);
INSERT INTO `files` VALUES (142, '58be8faf0e9441e082e1fc823c0d7395.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:52:26', NULL, NULL, NULL);
INSERT INTO `files` VALUES (143, '0a797b2c05f1492690e6943527de8793.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:52:57', NULL, NULL, NULL);
INSERT INTO `files` VALUES (144, 'daa01d24c64d45a681d6ef5c8cee29e3.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:54:29', NULL, NULL, NULL);
INSERT INTO `files` VALUES (145, 'bbf9adea72114e7b9228bbba34926fa6.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:55:53', NULL, NULL, NULL);
INSERT INTO `files` VALUES (146, 'c7d979a014d544669635eabe2c0719d5.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:56:17', NULL, NULL, NULL);
INSERT INTO `files` VALUES (147, '0b59c6554b124f5b8c58a5a3a0751d60.jpg', '2019/03/11/15/', NULL, NULL, '系统上传', '2019-03-11 15:58:41', NULL, NULL, NULL);
INSERT INTO `files` VALUES (148, '6d9a17c6c4f4492884019fd16d933476.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:01:06', NULL, NULL, NULL);
INSERT INTO `files` VALUES (149, '5383bdc53fea4574bb1e6e953dad6d0c.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:02:30', NULL, NULL, NULL);
INSERT INTO `files` VALUES (150, 'ea06f398bbe44c4dbd1129e1daad5f7b.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:04:39', NULL, NULL, NULL);
INSERT INTO `files` VALUES (151, '62b96b3081144659b693666cba6ae5e5.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:07:40', NULL, NULL, NULL);
INSERT INTO `files` VALUES (152, 'afd711a84b1e4cefa55cc2cc544e9210.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:08:42', NULL, NULL, NULL);
INSERT INTO `files` VALUES (153, '70d6f7bdfde14d2a8aaac71592d6b96b.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:09:59', NULL, NULL, NULL);
INSERT INTO `files` VALUES (154, '210ca5b81f91492aa03281cd3a59fa12.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:10:03', NULL, NULL, NULL);
INSERT INTO `files` VALUES (155, '131951ec8a5e4d168de6ced252249f7a.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:11:28', NULL, NULL, NULL);
INSERT INTO `files` VALUES (156, '01adcba94e1b40ad98d3ceb16e3e08d2.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:14:46', NULL, NULL, NULL);
INSERT INTO `files` VALUES (157, '148ec60e61b4464d839ead3e19dc61e0.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:35:32', NULL, NULL, NULL);
INSERT INTO `files` VALUES (158, '07ce8500ff684947b14b13b592192eaf.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:46:37', NULL, NULL, NULL);
INSERT INTO `files` VALUES (159, '9e843bf85b9940358e1674c4d464307b.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:47:51', NULL, NULL, NULL);
INSERT INTO `files` VALUES (160, 'f23d250f8cd64644b636831ab148800e.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:48:06', NULL, NULL, NULL);
INSERT INTO `files` VALUES (161, '9933de2247f14e4c94b949fe87d9fc99.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:48:53', NULL, NULL, NULL);
INSERT INTO `files` VALUES (162, 'e92aec026a464c3e85fde238e2c3a87c.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:49:00', NULL, NULL, NULL);
INSERT INTO `files` VALUES (163, 'bc6c8d30fe9c4836a41a45f95f415f0c.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:51:33', NULL, NULL, NULL);
INSERT INTO `files` VALUES (164, '6ab5138250d0447e92e18c288f978b52.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:51:49', NULL, NULL, NULL);
INSERT INTO `files` VALUES (165, 'a3fcb93582914e4292d9c71520973d25.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:52:27', NULL, NULL, NULL);
INSERT INTO `files` VALUES (166, '28f1180a38de47ec8cc5cdc2e2307290.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:52:41', NULL, NULL, NULL);
INSERT INTO `files` VALUES (167, '764e12a2c6524f2783b0c71424eb186a.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:52:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (168, 'e14ae08b7b8c402797d93535b7b05f78.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:53:08', NULL, NULL, NULL);
INSERT INTO `files` VALUES (169, 'c47d4cb649a14bd290a11a67f64d3c25.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:53:13', NULL, NULL, NULL);
INSERT INTO `files` VALUES (170, '768b37c0db2340bba371dcb97439cc41.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:53:29', NULL, NULL, NULL);
INSERT INTO `files` VALUES (171, '9998c6fadb934fb1808949cb3983b87c.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:53:30', NULL, NULL, NULL);
INSERT INTO `files` VALUES (172, 'f69c47e9a6d04bed8218cafd31369cba.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:54:08', NULL, NULL, NULL);
INSERT INTO `files` VALUES (173, 'd908f16c2dd34603a54f12a69f623ed7.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:54:18', NULL, NULL, NULL);
INSERT INTO `files` VALUES (174, 'f3adc654b24b44a4a7b3a5be0d232f12.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:54:54', NULL, NULL, NULL);
INSERT INTO `files` VALUES (175, '8f394fe16227453880cc1988c77aab0a.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:55:08', NULL, NULL, NULL);
INSERT INTO `files` VALUES (176, '5cfdf43da7f943ccbe3a3da46b5883f4.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:55:22', NULL, NULL, NULL);
INSERT INTO `files` VALUES (177, 'a3075aa585e64858b319a57a1ddd828b.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:55:27', NULL, NULL, NULL);
INSERT INTO `files` VALUES (178, '822ddc1a1caa4169b08fa3735f82ee06.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:55:34', NULL, NULL, NULL);
INSERT INTO `files` VALUES (179, '1c5d1162d2514e0fbb7ea7df685df9e6.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:55:41', NULL, NULL, NULL);
INSERT INTO `files` VALUES (180, 'b1b83f5edc50497bb7580e395ea3f6de.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:57:51', NULL, NULL, NULL);
INSERT INTO `files` VALUES (181, 'b47c91b50ccc48b19e9f5862d615ca02.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:57:58', NULL, NULL, NULL);
INSERT INTO `files` VALUES (182, 'ae37419b99924390ab878d27e8b36a7d.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:58:35', NULL, NULL, NULL);
INSERT INTO `files` VALUES (183, '60b43f1174894551a63a64c3078f4c95.jpg', '2019/03/11/16/', NULL, NULL, '系统上传', '2019-03-11 16:58:42', NULL, NULL, NULL);
INSERT INTO `files` VALUES (184, '3a0c4e40f1264677890242ed620e96c8.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:02:48', NULL, NULL, NULL);
INSERT INTO `files` VALUES (185, 'f619fa19337445bca68b6b884ea13ff3.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:03:46', NULL, NULL, NULL);
INSERT INTO `files` VALUES (186, '5e737b57d17c486f9525ee4377581b4d.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:03:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (187, 'a2c6c7ab2185420498247f2825b83aad.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:04:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (188, '1a0b1299fa9a480c899ff1b057998946.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:04:13', NULL, NULL, NULL);
INSERT INTO `files` VALUES (189, '15f98120c64147b3a267cd117752762a.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:05:32', NULL, NULL, NULL);
INSERT INTO `files` VALUES (190, '881976a984e74bebaa8e25bf0eee2d89.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:05:38', NULL, NULL, NULL);
INSERT INTO `files` VALUES (191, '5db9e73b23114cffbfa03e2dca9e7ad6.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:05:43', NULL, NULL, NULL);
INSERT INTO `files` VALUES (192, 'b3872508724e455eb5c6cc9831c6efb1.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:06:38', NULL, NULL, NULL);
INSERT INTO `files` VALUES (193, '23c51fd5110f407e9d61622fe13870e6.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:06:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (194, '63e30cdac6cf4b01a6e59492ae05aa22.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:15:34', NULL, NULL, NULL);
INSERT INTO `files` VALUES (195, '36401e5a97ff427a904ad6e3a549fb01.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:48:10', NULL, NULL, NULL);
INSERT INTO `files` VALUES (196, '5cf98bdf4a784975a01ef307a80369a5.jpg', '2019/03/11/17/', NULL, NULL, '系统上传', '2019-03-11 17:52:01', NULL, NULL, NULL);
INSERT INTO `files` VALUES (197, '7c5cdf9a2cde4f6b8d19ee006185e987.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:42:20', NULL, NULL, NULL);
INSERT INTO `files` VALUES (198, '0def8496642a4759a952b98a1cc5c6f4.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:44:28', NULL, NULL, NULL);
INSERT INTO `files` VALUES (199, 'a7f92137628f4d44a97d20a13fe7233d.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:44:40', NULL, NULL, NULL);
INSERT INTO `files` VALUES (200, '951b4109069e4f27844f4fa024e5c8a2.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:46:37', NULL, NULL, NULL);
INSERT INTO `files` VALUES (201, '702b43bca12e45a8b7edd8a85bb5654f.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:47:48', NULL, NULL, NULL);
INSERT INTO `files` VALUES (202, 'd6d462b47e8a493f84eef4bbe2f0a439.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:47:55', NULL, NULL, NULL);
INSERT INTO `files` VALUES (203, '1459919fb0394fc088766d6a30fd7c86.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:50:09', NULL, NULL, NULL);
INSERT INTO `files` VALUES (204, '80d30a90523443608c0ffc70f4882e4c.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:50:36', NULL, NULL, NULL);
INSERT INTO `files` VALUES (205, '98fc9b2eb1d54215b86e3a4acd1928d1.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:50:53', NULL, NULL, NULL);
INSERT INTO `files` VALUES (206, '63aff7432f364e3589d97f6488730554.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:51:29', NULL, NULL, NULL);
INSERT INTO `files` VALUES (207, '03908c52d0ed495a91119ae0864fd96c.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:51:56', NULL, NULL, NULL);
INSERT INTO `files` VALUES (208, 'f6e4f3e126f1419bb54a87d1fa14e76a.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:52:09', NULL, NULL, NULL);
INSERT INTO `files` VALUES (209, 'd254a3503fec49b5a58ffb85ddfadf74.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:56:31', NULL, NULL, NULL);
INSERT INTO `files` VALUES (210, '7b331d0e04084cf0bdc2558ac6f3c663.jpg', '2019/03/13/09/', NULL, NULL, '系统上传', '2019-03-13 09:57:58', NULL, NULL, NULL);
INSERT INTO `files` VALUES (211, 'fd4a411fbcdd4a848eeaab23ad7d1722.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:38:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (212, '59dbdf6f862a49e2aebc833c465a71b6.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:38:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (213, 'e83710b37a8b4cd7b06e2c99d3d4284f.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:38:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (214, 'f59822742ded443c802a7155252ffa11.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:38:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (215, '5a7a2451081c47469e57c780084e30cd.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:38:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (216, 'e098dcc7b45042e395ed3fa3f341e982.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:38:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (217, '7abe2b4b37b044cf90af0b969496d4f8.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:38:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (218, '89a9576467d64cd19539bc9d60ad8135.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:38:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (219, 'bc26f9b44bce40959212ad4a68e3c225.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:38:54', NULL, NULL, NULL);
INSERT INTO `files` VALUES (220, 'd1f6c1d5e2d8418a892945e542ee6f27.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:43:18', NULL, NULL, NULL);
INSERT INTO `files` VALUES (221, '7a11f5b9a47841319975d36a4995ae56.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:43:58', NULL, NULL, NULL);
INSERT INTO `files` VALUES (222, '893f87b3e8024c77a6354fbb6fb2b7c2.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:44:08', NULL, NULL, NULL);
INSERT INTO `files` VALUES (223, 'a52e871054d54208a464cea9266e49b6.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:45:29', NULL, NULL, NULL);
INSERT INTO `files` VALUES (224, 'b5f4bdf8c4f54ea883f985031d177e69.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:45:44', NULL, NULL, NULL);
INSERT INTO `files` VALUES (225, 'dc914e3b202049a6a351e724953b7327.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:46:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (226, '330ce73908314c22999f677a1f266050.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:49:31', NULL, NULL, NULL);
INSERT INTO `files` VALUES (227, '83036c9188364f27a5ea5206c9c94369.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:50:34', NULL, NULL, NULL);
INSERT INTO `files` VALUES (228, '8246d32753fe4438bb88b8f3de3fe996.jpg', '2019/03/13/10/', NULL, NULL, '系统上传', '2019-03-13 10:53:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (229, '24c09bd2fe5e4c9fa2b47afbea40e5e9.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:08:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (230, 'caee6923b139411fa8599a7c191a3e04.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:08:46', NULL, NULL, NULL);
INSERT INTO `files` VALUES (231, '6695f7e7957e433a9c5587146561ee8e.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:11:14', NULL, NULL, NULL);
INSERT INTO `files` VALUES (232, '2a525d2c476f4ff5a51130123e64b37d.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:18:27', NULL, NULL, NULL);
INSERT INTO `files` VALUES (233, '564b5971b6e742e593bd640a31986278.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:19:21', NULL, NULL, NULL);
INSERT INTO `files` VALUES (234, '7ee0ec0cd20541208dd2a3d984334329.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:26:28', NULL, NULL, NULL);
INSERT INTO `files` VALUES (235, 'ebf6910b11ee43cf94cad90572776851.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:32:09', NULL, NULL, NULL);
INSERT INTO `files` VALUES (236, '828940019fc948a495f75d9b547817ec.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:32:56', NULL, NULL, NULL);
INSERT INTO `files` VALUES (237, 'a275973fb8574b3689f8ec50ce856a09.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:33:58', NULL, NULL, NULL);
INSERT INTO `files` VALUES (238, '88f04a093720405fbe9737e705de3666.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:37:19', NULL, NULL, NULL);
INSERT INTO `files` VALUES (239, '9ca07e86ac1f405ead8c3dd5a8f2e5da.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:39:23', NULL, NULL, NULL);
INSERT INTO `files` VALUES (240, '26ed261f8b7e43459c5031d0b675f2e1.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:48:58', NULL, NULL, NULL);
INSERT INTO `files` VALUES (241, 'c74a246066f84879b79e0953fc0cf520.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:50:11', NULL, NULL, NULL);
INSERT INTO `files` VALUES (242, '014e7c3f9c1149dca9d1cc50f0ade488.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:51:10', NULL, NULL, NULL);
INSERT INTO `files` VALUES (243, 'd5d4f4aa3c334df98639ee51794a494d.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:51:44', NULL, NULL, NULL);
INSERT INTO `files` VALUES (244, '43c640b48cfc49359968f6e7acb24804.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:53:25', NULL, NULL, NULL);
INSERT INTO `files` VALUES (245, '9fb5e4e44cbf4a57ac24083bc26054df.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:54:10', NULL, NULL, NULL);
INSERT INTO `files` VALUES (246, 'e356079ec4174a309a3868af5a19e428.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:54:35', NULL, NULL, NULL);
INSERT INTO `files` VALUES (247, '40aac9f9e92d40168a07d7f6b43ffa71.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:54:58', NULL, NULL, NULL);
INSERT INTO `files` VALUES (248, '0b94a107bdad4c8fbf59affaa8d38945.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:55:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (249, '74241eccffbc4c83a47edad73be54d2d.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:57:16', NULL, NULL, NULL);
INSERT INTO `files` VALUES (250, '5978e61827c94f6393c77b93c339259f.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:59:09', NULL, NULL, NULL);
INSERT INTO `files` VALUES (251, '8b63f2f6a821466ba17360defdf5a131.jpg', '2019/03/13/11/', NULL, NULL, '系统上传', '2019-03-13 11:59:31', NULL, NULL, NULL);
INSERT INTO `files` VALUES (252, '61b35949c57c4925a105c9a3e2f759b1.jpg', '2019/03/13/12/', NULL, NULL, '系统上传', '2019-03-13 12:00:18', NULL, NULL, NULL);
INSERT INTO `files` VALUES (253, '2c9ac14946684449a6cd182a3f42e28e.jpg', '2019/03/13/12/', NULL, NULL, '系统上传', '2019-03-13 12:00:46', NULL, NULL, NULL);
INSERT INTO `files` VALUES (254, '4883bf3d2d5d4e5a85d49b285972bf7b.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:00:08', NULL, NULL, NULL);
INSERT INTO `files` VALUES (255, '65e7af9455214e2f9e6cc03f389e41cf.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:03:23', NULL, NULL, NULL);
INSERT INTO `files` VALUES (256, 'b00f47415890461eba43ef1b9151a21e.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:03:39', NULL, NULL, NULL);
INSERT INTO `files` VALUES (257, '58f4b8331a63458185bfe4bb8f2b2bb6.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:03:54', NULL, NULL, NULL);
INSERT INTO `files` VALUES (258, '51c825baa16640919b612234fa6d84e0.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:04:26', NULL, NULL, NULL);
INSERT INTO `files` VALUES (259, '8351ba43220048b5ae9e5a44ca1c5630.png', '/2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:04:32', NULL, NULL, NULL);
INSERT INTO `files` VALUES (260, 'b015bce3b0b84858971ea6aff393c182.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:05:06', NULL, NULL, NULL);
INSERT INTO `files` VALUES (261, '21795bf79b0e478ba84b86fe411b9fe1.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:05:19', NULL, NULL, NULL);
INSERT INTO `files` VALUES (262, '66fd8ca763cd4d7899211c230ba799d2.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:06:24', NULL, NULL, NULL);
INSERT INTO `files` VALUES (263, '1836a120002f4f00872679385bf9ee5b.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:06:40', NULL, NULL, NULL);
INSERT INTO `files` VALUES (264, '63c750ad19724daf9cbb52f63aeaff78.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:06:58', NULL, NULL, NULL);
INSERT INTO `files` VALUES (265, 'fa6cc5f2589c461593c9ae0115e7f5f8.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:07:20', NULL, NULL, NULL);
INSERT INTO `files` VALUES (266, 'e4ba912cb1af4547ba434c2536ae79b0.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:07:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (267, '54894279e1234e07a9fe8db9241ceb25.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:08:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (268, '9ddddc75841447c28c54e2e7d97cb6ce.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:08:48', NULL, NULL, NULL);
INSERT INTO `files` VALUES (269, 'ab77691e6cbd43f7be05db5e2d958aa8.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:09:23', NULL, NULL, NULL);
INSERT INTO `files` VALUES (270, '29f90b963d864392a8e2318396f4a726.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:09:42', NULL, NULL, NULL);
INSERT INTO `files` VALUES (271, '5ed6388b94dd4c02b3e84a98085e1a8b.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:10:29', NULL, NULL, NULL);
INSERT INTO `files` VALUES (272, '871798f5b2d64931852e0faca3500fbb.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:10:40', NULL, NULL, NULL);
INSERT INTO `files` VALUES (273, '4f2620887dfe4c089b59174a2166344e.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:15:11', NULL, NULL, NULL);
INSERT INTO `files` VALUES (274, '0345f0c24f834329b9c1ce7fe3990077.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:18:42', NULL, NULL, NULL);
INSERT INTO `files` VALUES (275, 'dcdeb136411b4a03a5fe7bd9a07b6fe6.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:18:47', NULL, NULL, NULL);
INSERT INTO `files` VALUES (276, '1f736274d073412287d0635c43a1ebcb.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:19:13', NULL, NULL, NULL);
INSERT INTO `files` VALUES (277, 'f9af0fbdc6664527827a35126555b123.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:19:31', NULL, NULL, NULL);
INSERT INTO `files` VALUES (278, 'b80abad60d914b059cd27279f542aca5.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:19:42', NULL, NULL, NULL);
INSERT INTO `files` VALUES (279, 'bee2a1439acb42159c8e3f2a3f89a5ed.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:19:55', NULL, NULL, NULL);
INSERT INTO `files` VALUES (280, '0c2485fb46ec457a94b0c0f54e13c00e.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:20:11', NULL, NULL, NULL);
INSERT INTO `files` VALUES (281, '7b408b6f194244f9bee25eae9463a966.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:20:24', NULL, NULL, NULL);
INSERT INTO `files` VALUES (282, '3326c86a41374535a61936cfdb9d0c9b.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:20:34', NULL, NULL, NULL);
INSERT INTO `files` VALUES (283, '26be7d434c7141e5a6e68a4e1c85434f.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:34:31', NULL, NULL, NULL);
INSERT INTO `files` VALUES (284, '29cf1925e7054931bfaa038bcd872469.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:34:41', NULL, NULL, NULL);
INSERT INTO `files` VALUES (285, '8e5d45cc57504c7486001ad0d02930d1.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:34:56', NULL, NULL, NULL);
INSERT INTO `files` VALUES (286, '48a0b3b926b34f69afce6030c1a29ba0.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:35:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (287, 'efd09da8c3464679a1da83877e1d9b3c.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:35:19', NULL, NULL, NULL);
INSERT INTO `files` VALUES (288, '314dfe376b684c2b8ba336bbbd7e56de.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:35:36', NULL, NULL, NULL);
INSERT INTO `files` VALUES (289, 'e8ebef30ac724a30be8815d5b8c8ee97.jpg', '2019/03/13/14/', NULL, NULL, '系统上传', '2019-03-13 14:35:50', NULL, NULL, NULL);
INSERT INTO `files` VALUES (290, 'af4e85abe9654165be1726db6d7b3c68.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:18:43', NULL, NULL, NULL);
INSERT INTO `files` VALUES (291, '796786ec746e4bc7b6b2d793cea8325f.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:20:50', NULL, NULL, NULL);
INSERT INTO `files` VALUES (292, 'e5a3fb8ad82c47028da7ff00b967e2ff.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:22:30', NULL, NULL, NULL);
INSERT INTO `files` VALUES (293, 'b0657ced85c441ce817a5c1e2e06b613.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:22:54', NULL, NULL, NULL);
INSERT INTO `files` VALUES (294, '91550a9ad8d14adbab6a7f0b4e316414.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:23:25', NULL, NULL, NULL);
INSERT INTO `files` VALUES (295, '1b8bf396977b4bba9a092f3d52e92851.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:27:37', NULL, NULL, NULL);
INSERT INTO `files` VALUES (296, '30b36fc4d080490caa0a015b1483431a.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:30:16', NULL, NULL, NULL);
INSERT INTO `files` VALUES (297, '7df0f96568b44c2898d8687e5f2f19ff.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:30:27', NULL, NULL, NULL);
INSERT INTO `files` VALUES (298, 'f5506217d14249f481de6d455d1dc696.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:30:49', NULL, NULL, NULL);
INSERT INTO `files` VALUES (299, '9de23a2efc2a4b3c9dcf6ad7962c42a9.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:31:02', NULL, NULL, NULL);
INSERT INTO `files` VALUES (300, 'd85389498636416fac499d3277acf7d7.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:31:32', NULL, NULL, NULL);
INSERT INTO `files` VALUES (301, '71224e05d03e451c98b5be9c47f68df4.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:34:17', NULL, NULL, NULL);
INSERT INTO `files` VALUES (302, '62f194ff40d14e1688b1d939f6a1e522.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:34:26', NULL, NULL, NULL);
INSERT INTO `files` VALUES (303, '8f02ff22488a45a79dcabccf219bd172.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:34:48', NULL, NULL, NULL);
INSERT INTO `files` VALUES (304, 'dc3cf3354c454d8d8243df35900becd5.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:35:00', NULL, NULL, NULL);
INSERT INTO `files` VALUES (305, '921ad5c329814331a0b4058b8c860cf5.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:38:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (306, 'de9d2861306e4c16a3a1e163fc3e18ef.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:40:06', NULL, NULL, NULL);
INSERT INTO `files` VALUES (307, '471a0cb1a28740e4b4a90ca241d701df.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:52:32', NULL, NULL, NULL);
INSERT INTO `files` VALUES (308, 'b36c71497e8c4097a8e640a42df78465.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:52:49', NULL, NULL, NULL);
INSERT INTO `files` VALUES (309, '89b575dd95de47b9bd0b5ddcab245c32.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:52:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (310, '67395ad0afed4ef6a4b046739f486b6c.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:53:27', NULL, NULL, NULL);
INSERT INTO `files` VALUES (311, '3722df853ea24f6796de5fc9c513827d.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:53:55', NULL, NULL, NULL);
INSERT INTO `files` VALUES (312, '0cb14d619ccd42ababf8e73b6ed698ce.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:54:26', NULL, NULL, NULL);
INSERT INTO `files` VALUES (313, '0ea1d5dc4d2b4479923ed3118f716d92.jpg', '2019/03/13/15/', NULL, NULL, '系统上传', '2019-03-13 15:54:38', NULL, NULL, NULL);
INSERT INTO `files` VALUES (314, '46c5c536c8c54f759c1d99028edcb600.jpg', '2019/03/13/16/', NULL, NULL, '系统上传', '2019-03-13 16:14:55', NULL, NULL, NULL);
INSERT INTO `files` VALUES (315, '8220964ab4ea4cfda5325a28ef12a3ce.jpg', '2019/03/13/16/', NULL, NULL, '系统上传', '2019-03-13 16:15:25', NULL, NULL, NULL);
INSERT INTO `files` VALUES (316, '371837edb9dd4df6ad07442e37dca880.jpg', '2019/03/13/16/', NULL, NULL, '系统上传', '2019-03-13 16:17:47', NULL, NULL, NULL);
INSERT INTO `files` VALUES (317, 'ebc70647f5684abc889982fd82e8de3b.jpg', '2019/03/13/16/', NULL, NULL, '系统上传', '2019-03-13 16:17:52', NULL, NULL, NULL);
INSERT INTO `files` VALUES (318, '582acf0c7a894ab1be81ef1f02dbc522.jpg', '2019/03/13/16/', NULL, NULL, '系统上传', '2019-03-13 16:18:06', NULL, NULL, NULL);
INSERT INTO `files` VALUES (319, '99a252288baa4d4dbdc73950b21e2e24.jpg', '2019/03/13/16/', NULL, NULL, '系统上传', '2019-03-13 16:18:38', NULL, NULL, NULL);
INSERT INTO `files` VALUES (320, 'f75b70b3f2fe460d9da638cae3a15456.jpg', '2019/03/13/16/', NULL, NULL, '系统上传', '2019-03-13 16:23:48', NULL, NULL, NULL);
INSERT INTO `files` VALUES (321, '24317c9287d2451c95c6bebfaaba611e.jpg', '2019/03/13/16/', NULL, NULL, '系统上传', '2019-03-13 16:27:12', NULL, NULL, NULL);
INSERT INTO `files` VALUES (322, '7abcacf098df4d4e82073819dd2ffe18.jpg', '2019/03/13/18/', NULL, NULL, '系统上传', '2019-03-13 18:28:30', NULL, NULL, NULL);
INSERT INTO `files` VALUES (323, '4402a3b678d647d39f07f9eeca2a6284.jpg', '2019/03/13/18/', NULL, NULL, '系统上传', '2019-03-13 18:28:40', NULL, NULL, NULL);
INSERT INTO `files` VALUES (324, 'a2d428bc4bea4648affd9475459a2d30.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:37:40', NULL, NULL, NULL);
INSERT INTO `files` VALUES (325, 'e11518b0a56546838372ea563346aecc.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:38:26', NULL, NULL, NULL);
INSERT INTO `files` VALUES (326, '61d2bdf838f444e88ae36836d667a98f.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:38:33', NULL, NULL, NULL);
INSERT INTO `files` VALUES (327, 'cffc31344e164d55886c49eca8929741.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:42:22', NULL, NULL, NULL);
INSERT INTO `files` VALUES (328, '00cc48164eff4e179cdff379ea7bb968.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:42:47', NULL, NULL, NULL);
INSERT INTO `files` VALUES (329, 'c66223c9968e43b6b921f7aafb06505c.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:43:41', NULL, NULL, NULL);
INSERT INTO `files` VALUES (330, '331139b70b424cd199280c37f678c895.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:46:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (331, 'ed18ec6fd8e24de69763fedee05547a9.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:49:59', NULL, NULL, NULL);
INSERT INTO `files` VALUES (332, 'd7d48a409b984248a5007316837d0494.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:50:31', NULL, NULL, NULL);
INSERT INTO `files` VALUES (333, 'fbd4e8acb1ec4e6ba163cef1e4539ee2.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:50:45', NULL, NULL, NULL);
INSERT INTO `files` VALUES (334, 'c8a0013ad9a044478b62c13e5ce46dc4.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:51:23', NULL, NULL, NULL);
INSERT INTO `files` VALUES (335, '00a487186c0142c8aa831c0e9c05dae4.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:51:54', NULL, NULL, NULL);
INSERT INTO `files` VALUES (336, '1555989f5f2548f2a57f1da5f4e4fbc7.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:52:06', NULL, NULL, NULL);
INSERT INTO `files` VALUES (337, '3b1901f80e724fb8b17795a775beda3d.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:52:33', NULL, NULL, NULL);
INSERT INTO `files` VALUES (338, 'ef80233ae5524cf2ad51872167bd36a1.jpg', '2019/03/14/09/', NULL, NULL, '系统上传', '2019-03-14 09:52:42', NULL, NULL, NULL);
INSERT INTO `files` VALUES (339, '37e3087b67d04a82aa8fb488c1510cd6.jpg', '2019/03/14/10/', NULL, NULL, '系统上传', '2019-03-14 10:00:59', NULL, NULL, NULL);
INSERT INTO `files` VALUES (340, '3c4e5bae5174460ab5411acc7bd8c6f0.jpg', '2019/03/14/11/', NULL, NULL, '系统上传', '2019-03-14 11:36:32', NULL, NULL, NULL);
INSERT INTO `files` VALUES (341, '5963e541def94278a5a648c160db358d.jpg', '2019/03/14/11/', NULL, NULL, '系统上传', '2019-03-14 11:43:26', NULL, NULL, NULL);
INSERT INTO `files` VALUES (342, '55e3d43e852148ebab55c010039a548c.jpg', '2019/03/14/11/', NULL, NULL, '系统上传', '2019-03-14 11:52:02', NULL, NULL, NULL);
INSERT INTO `files` VALUES (343, 'ec27f207fbef4f0a81daa3bc7fe436ec.jpg', '2019/03/14/12/', NULL, NULL, '系统上传', '2019-03-14 12:01:24', NULL, NULL, NULL);
INSERT INTO `files` VALUES (344, 'f8bf402419d0475880c95d5fbda5dbb1.jpg', '2019/03/14/12/', NULL, NULL, '系统上传', '2019-03-14 12:06:37', NULL, NULL, NULL);
INSERT INTO `files` VALUES (345, '9084712f78504dad83a59d1c07a68d66.jpg', '2019/03/14/12/', NULL, NULL, '系统上传', '2019-03-14 12:13:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (346, '6f68f4a767e241e2b9647a9cca5b40e0.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:33:59', NULL, NULL, NULL);
INSERT INTO `files` VALUES (347, '306d89efb8d044e4ae5169fb2fa5b86d.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:34:10', NULL, NULL, NULL);
INSERT INTO `files` VALUES (348, '257b3112e05c4e6cbea0272b700901c4.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:53:21', NULL, NULL, NULL);
INSERT INTO `files` VALUES (349, 'f6fb76b3a11c456998ddfd3f9ce1988a.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:54:51', NULL, NULL, NULL);
INSERT INTO `files` VALUES (350, 'abbd4dffbf144c22a50ffeb3bb9a9063.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:56:37', NULL, NULL, NULL);
INSERT INTO `files` VALUES (351, '07b0f275c557437caaf81373d0d1b426.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:56:46', NULL, NULL, NULL);
INSERT INTO `files` VALUES (352, '6ff5c241b48246d1990c42ef79a57aa0.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:57:04', NULL, NULL, NULL);
INSERT INTO `files` VALUES (353, 'c71c8553360c4db488bda853e7125561.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:57:14', NULL, NULL, NULL);
INSERT INTO `files` VALUES (354, 'aeb65116cddb405b8a3e320601125812.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:57:31', NULL, NULL, NULL);
INSERT INTO `files` VALUES (355, '5daa31d8785e4b699e58c64d4ac6b794.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:58:00', NULL, NULL, NULL);
INSERT INTO `files` VALUES (356, 'f691f1a1c3a74a11ba4b70e08a06c134.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:58:41', NULL, NULL, NULL);
INSERT INTO `files` VALUES (357, '87f857a2c56248f7ab4d24788e9f5e8d.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:58:55', NULL, NULL, NULL);
INSERT INTO `files` VALUES (358, '483f4de3f7d54821b7c7fad2f4c1ebc3.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:59:07', NULL, NULL, NULL);
INSERT INTO `files` VALUES (359, '4e4856587a014ae6ad960d22a586632a.jpg', '2019/03/14/14/', NULL, NULL, '系统上传', '2019-03-14 14:59:13', NULL, NULL, NULL);
INSERT INTO `files` VALUES (360, '1bd7d45c41724a22bdd12f78cef8b109.jpg', '2019/03/14/15/', NULL, NULL, '系统上传', '2019-03-14 15:03:15', NULL, NULL, NULL);
INSERT INTO `files` VALUES (361, '16f79b04aea44664b0150549db5e1127.jpg', '2019/03/14/15/', NULL, NULL, '系统上传', '2019-03-14 15:03:35', NULL, NULL, NULL);
INSERT INTO `files` VALUES (362, '1a2cbfdbe0f84bb2bf92d6f371685da7.jpg', '2019/03/14/15/', NULL, NULL, '系统上传', '2019-03-14 15:10:46', NULL, NULL, NULL);
INSERT INTO `files` VALUES (363, 'c19146bb97b743b688628b1c269acf4f.jpg', '2019/03/14/15/', NULL, NULL, '系统上传', '2019-03-14 15:10:50', NULL, NULL, NULL);
INSERT INTO `files` VALUES (364, 'dc969e42feb844a7aed2c71b9a87cc00.jpg', '2019/03/14/15/', NULL, NULL, '系统上传', '2019-03-14 15:12:06', NULL, NULL, NULL);
INSERT INTO `files` VALUES (365, 'e33fe236f05d466494c4e3606916a6c1.jpg', '2019/03/14/15/', NULL, NULL, '系统上传', '2019-03-14 15:15:41', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `OA_TEST_AUDIT_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '审批流程测试表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('825693cd6c1c4f6b86699fc3f1a54887', '', '136', '', '', '', '', '技能提高', '', '', '', '', '100', '', '', '', '同意', '同意', '总经理审批', '1', '2017-12-15 22:01:41', '1', '2017-12-15 22:01:41', NULL, '1');
INSERT INTO `salary` VALUES ('a80e1d9ef35a4502bd65b0e5ba7eafff', '', 'cccc', 'ccc', 'ccccc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-11-30 16:35:15', '', '2017-11-30 16:35:15', '', '');
INSERT INTO `salary` VALUES ('b5d228f729f74833883917825749f0d5', '', '', '', '', '', '', '', '', '', '', '', '', '防守打法', '', '', '', '', '', '', '2017-11-30 19:58:36', '', '2017-11-30 19:58:36', '', '');
INSERT INTO `salary` VALUES ('cc2e8083f9d8478f831b2ea852e5c17b', '', '', 'cc', 'cc', '', '', 'xxx', '', '', '', '', '', '', '', '', '', '', '', '', '2017-11-30 19:18:59', '', '2017-11-30 19:18:59', '', '');
INSERT INTO `salary` VALUES ('cebdb316794b48be87d93dd4dbfb7d4b', '', '', '', '发的顺丰', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-11-30 19:58:43', '', '2017-11-30 19:58:43', '', '');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (6, 0, '研发部', 1, 1);
INSERT INTO `sys_dept` VALUES (7, 6, '研發一部', 1, 1);
INSERT INTO `sys_dept` VALUES (8, 6, '研发二部', 2, 1);
INSERT INTO `sys_dept` VALUES (9, 0, '销售部', 2, 1);
INSERT INTO `sys_dept` VALUES (10, 9, '销售一部', 1, 1);
INSERT INTO `sys_dept` VALUES (11, 0, '产品部', 3, 1);
INSERT INTO `sys_dept` VALUES (12, 11, '产品一部', 1, 1);
INSERT INTO `sys_dept` VALUES (13, 0, '测试部', 5, 1);
INSERT INTO `sys_dept` VALUES (14, 13, '测试一部', 1, 1);
INSERT INTO `sys_dept` VALUES (15, 13, '测试二部', 2, 1);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) NULL DEFAULT 0 COMMENT '父级编号',
  `create_by` int(64) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`name`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, '正常', '0', 'del_flag', '删除标记', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (3, '显示', '1', 'show_hide', '显示/隐藏', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (4, '隐藏', '0', 'show_hide', '显示/隐藏', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (5, '是', '1', 'yes_no', '是/否', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (6, '否', '0', 'yes_no', '是/否', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (7, '红色', 'red', 'color', '颜色值', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (8, '绿色', 'green', 'color', '颜色值', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (9, '蓝色', 'blue', 'color', '颜色值', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (10, '黄色', 'yellow', 'color', '颜色值', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (11, '橙色', 'orange', 'color', '颜色值', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (12, '默认主题', 'default', 'theme', '主题方案', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (13, '天蓝主题', 'cerulean', 'theme', '主题方案', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (14, '橙色主题', 'readable', 'theme', '主题方案', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (15, '红色主题', 'united', 'theme', '主题方案', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (16, 'Flat主题', 'flat', 'theme', '主题方案', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (17, '国家', '1', 'sys_area_type', '区域类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (18, '省份、直辖市', '2', 'sys_area_type', '区域类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (19, '地市', '3', 'sys_area_type', '区域类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (20, '区县', '4', 'sys_area_type', '区域类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (21, '公司', '1', 'sys_office_type', '机构类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (22, '部门', '2', 'sys_office_type', '机构类型', 70, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (23, '小组', '3', 'sys_office_type', '机构类型', 80, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (24, '其它', '4', 'sys_office_type', '机构类型', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (25, '综合部', '1', 'sys_office_common', '快捷通用部门', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (26, '开发部', '2', 'sys_office_common', '快捷通用部门', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (27, '人力部', '3', 'sys_office_common', '快捷通用部门', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (28, '一级', '1', 'sys_office_grade', '机构等级', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (29, '二级', '2', 'sys_office_grade', '机构等级', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (30, '三级', '3', 'sys_office_grade', '机构等级', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (31, '四级', '4', 'sys_office_grade', '机构等级', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (32, '所有数据', '1', 'sys_data_scope', '数据范围', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (33, '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (34, '所在公司数据', '3', 'sys_data_scope', '数据范围', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (35, '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (36, '所在部门数据', '5', 'sys_data_scope', '数据范围', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (37, '仅本人数据', '8', 'sys_data_scope', '数据范围', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (38, '按明细设置', '9', 'sys_data_scope', '数据范围', 100, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (39, '系统管理', '1', 'sys_user_type', '用户类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (40, '部门经理', '2', 'sys_user_type', '用户类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (41, '普通用户', '3', 'sys_user_type', '用户类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (42, '基础主题', 'basic', 'cms_theme', '站点主题', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (43, '蓝色主题', 'blue', 'cms_theme', '站点主题', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (44, '红色主题', 'red', 'cms_theme', '站点主题', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (45, '文章模型', 'article', 'cms_module', '栏目模型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (46, '图片模型', 'picture', 'cms_module', '栏目模型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (47, '下载模型', 'download', 'cms_module', '栏目模型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (48, '链接模型', 'link', 'cms_module', '栏目模型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (49, '专题模型', 'special', 'cms_module', '栏目模型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (50, '默认展现方式', '0', 'cms_show_modes', '展现方式', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (51, '首栏目内容列表', '1', 'cms_show_modes', '展现方式', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (52, '栏目第一条内容', '2', 'cms_show_modes', '展现方式', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (53, '发布', '0', 'cms_del_flag', '内容状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (54, '删除', '1', 'cms_del_flag', '内容状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (55, '审核', '2', 'cms_del_flag', '内容状态', 15, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (56, '首页焦点图', '1', 'cms_posid', '推荐位', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (57, '栏目页文章推荐', '2', 'cms_posid', '推荐位', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (58, '咨询', '1', 'cms_guestbook', '留言板分类', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (59, '建议', '2', 'cms_guestbook', '留言板分类', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (60, '投诉', '3', 'cms_guestbook', '留言板分类', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (61, '其它', '4', 'cms_guestbook', '留言板分类', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (62, '公休', '1', 'oa_leave_type', '请假类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (63, '病假', '2', 'oa_leave_type', '请假类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (64, '事假', '3', 'oa_leave_type', '请假类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (65, '调休', '4', 'oa_leave_type', '请假类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (66, '婚假', '5', 'oa_leave_type', '请假类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (67, '接入日志', '1', 'sys_log_type', '日志类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (68, '异常日志', '2', 'sys_log_type', '日志类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (69, '请假流程', 'leave', 'act_type', '流程类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (70, '审批测试流程', 'test_audit', 'act_type', '流程类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (71, '分类1', '1', 'act_category', '流程分类', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (72, '分类2', '2', 'act_category', '流程分类', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (73, '增删改查', 'crud', 'gen_category', '代码生成分类', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (74, '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (75, '树结构', 'tree', 'gen_category', '代码生成分类', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (76, '=', '=', 'gen_query_type', '查询方式', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (77, '!=', '!=', 'gen_query_type', '查询方式', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (78, '&gt;', '&gt;', 'gen_query_type', '查询方式', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (79, '&lt;', '&lt;', 'gen_query_type', '查询方式', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (80, 'Between', 'between', 'gen_query_type', '查询方式', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (81, 'Like', 'like', 'gen_query_type', '查询方式', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (82, 'Left Like', 'left_like', 'gen_query_type', '查询方式', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (83, 'Right Like', 'right_like', 'gen_query_type', '查询方式', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (84, '文本框', 'input', 'gen_show_type', '字段生成方案', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (85, '文本域', 'textarea', 'gen_show_type', '字段生成方案', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (86, '下拉框', 'select', 'gen_show_type', '字段生成方案', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (87, '复选框', 'checkbox', 'gen_show_type', '字段生成方案', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (88, '单选框', 'radiobox', 'gen_show_type', '字段生成方案', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (89, '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (90, '人员选择', 'userselect', 'gen_show_type', '字段生成方案', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (91, '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (92, '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (93, 'String', 'String', 'gen_java_type', 'Java类型', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (94, 'Long', 'Long', 'gen_java_type', 'Java类型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (95, '仅持久层', 'dao', 'gen_category', '代码生成分类', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (96, '男', '1', 'sex', '性别', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (97, '女', '2', 'sex', '性别', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (98, 'Integer', 'Integer', 'gen_java_type', 'Java类型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (99, 'Double', 'Double', 'gen_java_type', 'Java类型', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (100, 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (104, 'Custom', 'Custom', 'gen_java_type', 'Java类型', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (105, '会议通告', '1', 'oa_notify_type', '通知通告类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (106, '奖惩通告', '2', 'oa_notify_type', '通知通告类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (107, '活动通告', '3', 'oa_notify_type', '通知通告类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (108, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (109, '发布', '1', 'oa_notify_status', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (110, '未读', '0', 'oa_notify_read', '通知通告状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (111, '已读', '1', 'oa_notify_read', '通知通告状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (112, '草稿', '0', 'oa_notify_status', '通知通告状态', 10, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (113, '删除', '0', 'del_flag', '删除标记', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (118, '关于', 'about', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '全url是:/blog/open/page/about', '');
INSERT INTO `sys_dict` VALUES (119, '交流', 'communication', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (120, '文章', 'article', 'blog_type', '博客类型', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (121, '编码', 'code', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (122, '绘画', 'painting', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', '');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (110, 0, '/files/d64a62e3-6821-48f1-bac6-a1b9945f4afb.jpg', '2017-10-14 16:20:17');
INSERT INTO `sys_file` VALUES (111, 0, '/files/aa2c3dc6-495f-48cc-8e12-446eceb2535e.jpg', '2017-10-14 16:20:21');
INSERT INTO `sys_file` VALUES (118, 0, '/files/a973499e-3ec7-4d43-8a52-b6f6517c77e3.jpg', '2017-10-20 11:53:52');
INSERT INTO `sys_file` VALUES (132, 0, '/files/e6f13526-e31c-4ebe-a3cf-5fd88dd10be6.jpg', '2017-12-18 20:19:51');
INSERT INTO `sys_file` VALUES (134, 0, '/files/cd016e72-77f7-4425-afe2-b79dfbdc3ae9.jpeg', '2017-12-18 22:44:07');
INSERT INTO `sys_file` VALUES (138, 0, '/files/9ec12ee7-65b5-4cc5-9900-d2ec6185b336.jpg', '2017-12-19 19:55:27');
INSERT INTO `sys_file` VALUES (139, 0, '/files/f6aab9d4-00a1-4bc8-a695-40fc472d4ea9.jpg', '2018-01-02 19:53:24');
INSERT INTO `sys_file` VALUES (141, 0, '/files/445c5d98-b3b6-4226-a5af-249d1b2a6a34.jpg', '2018-01-09 19:28:53');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `time` int(11) NULL DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1147 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (760, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'java.lang.NullPointerException', NULL, '2019-02-15 16:01:39');
INSERT INTO `sys_log` VALUES (761, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'java.lang.NullPointerException', NULL, '2019-02-15 16:02:31');
INSERT INTO `sys_log` VALUES (762, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'java.lang.NullPointerException', NULL, '2019-02-15 16:03:28');
INSERT INTO `sys_log` VALUES (763, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'java.lang.NullPointerException', NULL, '2019-02-15 16:05:52');
INSERT INTO `sys_log` VALUES (764, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'java.lang.NullPointerException', NULL, '2019-02-15 16:07:36');
INSERT INTO `sys_log` VALUES (765, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'java.lang.NullPointerException', NULL, '2019-02-15 16:08:48');
INSERT INTO `sys_log` VALUES (766, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'java.lang.NullPointerException', NULL, '2019-02-15 16:10:14');
INSERT INTO `sys_log` VALUES (767, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'java.lang.NullPointerException', NULL, '2019-02-15 16:10:55');
INSERT INTO `sys_log` VALUES (768, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'com.alibaba.fastjson.JSONException: syntax error, expect {, actual [, pos 0', NULL, '2019-02-15 16:16:02');
INSERT INTO `sys_log` VALUES (769, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'com.alibaba.fastjson.JSONException: syntax error, expect {, actual [, pos 0', NULL, '2019-02-15 16:22:11');
INSERT INTO `sys_log` VALUES (770, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'com.alibaba.fastjson.JSONException: syntax error, expect {, actual [, pos 0', NULL, '2019-02-15 16:22:40');
INSERT INTO `sys_log` VALUES (771, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'userResultDO\' on field \'list\': rejected value [[{\"answerId\":18,\"topicId\":11},{\"answerId\":17,\"topicId\":10},{\"answerId\":16,\"topicId\":9},{\"answerId\":15,\"topicId\":8},{\"answerId\":14,\"topicId\":7},{\"answerId\":13,\"topicId\":6},{\"answerId\":10,\"topicId\":5},{\"answerId\":12,\"topicId\":4},{\"answerId\":5,\"topicId\":3},{\"answerId\":4,\"topicId\":2},{\"answerId\":2,\"topicId\":1}]]; codes [typeMismatch.userResultDO.list,typeMismatch.list,typeMismatch.java.util.List,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userResultDO.list,list]; arguments []; default message [list]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.List\' for property \'list\'; nested exception is java.lang.IllegalStateException: Cannot convert value of type \'java.lang.String\' to required type \'com.bootdo.app.domain.ResultDetailsDO\' for property \'list[0]\': no matching editors or conversion strategy found]', NULL, '2019-02-15 16:26:54');
INSERT INTO `sys_log` VALUES (772, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'userResultDO\' on field \'list\': rejected value [[{\"answerId\":18,\"topicId\":11},{\"answerId\":17,\"topicId\":10},{\"answerId\":16,\"topicId\":9},{\"answerId\":15,\"topicId\":8},{\"answerId\":14,\"topicId\":7},{\"answerId\":13,\"topicId\":6},{\"answerId\":10,\"topicId\":5},{\"answerId\":12,\"topicId\":4},{\"answerId\":5,\"topicId\":3},{\"answerId\":4,\"topicId\":2},{\"answerId\":2,\"topicId\":1}]]; codes [typeMismatch.userResultDO.list,typeMismatch.list,typeMismatch.java.util.List,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userResultDO.list,list]; arguments []; default message [list]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.List\' for property \'list\'; nested exception is java.lang.IllegalStateException: Cannot convert value of type \'java.lang.String\' to required type \'com.bootdo.app.domain.ResultDetailsDO\' for property \'list[0]\': no matching editors or conversion strategy found]', NULL, '2019-02-15 16:28:34');
INSERT INTO `sys_log` VALUES (773, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors\nField error in object \'userResultDO\' on field \'list\': rejected value [[{\"answerId\":18,\"topicId\":11},{\"answerId\":17,\"topicId\":10},{\"answerId\":16,\"topicId\":9},{\"answerId\":15,\"topicId\":8},{\"answerId\":14,\"topicId\":7},{\"answerId\":13,\"topicId\":6},{\"answerId\":10,\"topicId\":5},{\"answerId\":12,\"topicId\":4},{\"answerId\":5,\"topicId\":3},{\"answerId\":4,\"topicId\":2},{\"answerId\":2,\"topicId\":1}]]; codes [typeMismatch.userResultDO.list,typeMismatch.list,typeMismatch.java.util.List,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [userResultDO.list,list]; arguments []; default message [list]]; default message [Failed to convert property value of type \'java.lang.String\' to required type \'java.util.List\' for property \'list\'; nested exception is java.lang.IllegalStateException: Cannot convert value of type \'java.lang.String\' to required type \'com.bootdo.app.domain.ResultDetailsDO\' for property \'list[0]\': no matching editors or conversion strategy found]', NULL, '2019-02-15 16:29:08');
INSERT INTO `sys_log` VALUES (774, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'com.alibaba.fastjson.JSONException: syntax error, expect {, actual [, pos 0', NULL, '2019-02-15 16:31:46');
INSERT INTO `sys_log` VALUES (775, NULL, NULL, 'error', NULL, 'http://192.168.1.16:9994/oscar/addNewAnswer', 'com.alibaba.fastjson.JSONException: syntax error, expect {, actual [, pos 0', NULL, '2019-02-15 16:35:41');
INSERT INTO `sys_log` VALUES (776, 1, 'admin', '登录', 364, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-15 16:51:54');
INSERT INTO `sys_log` VALUES (777, 1, 'admin', '请求访问主页', 87, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-15 16:51:55');
INSERT INTO `sys_log` VALUES (778, 1, 'admin', '登录', 368, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-16 10:41:09');
INSERT INTO `sys_log` VALUES (779, 1, 'admin', '请求访问主页', 91, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-16 10:41:09');
INSERT INTO `sys_log` VALUES (780, 1, 'admin', '登录', 363, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-16 10:56:33');
INSERT INTO `sys_log` VALUES (781, 1, 'admin', '请求访问主页', 91, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-16 10:56:33');
INSERT INTO `sys_log` VALUES (782, 1, 'admin', '登录', 369, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-16 11:02:24');
INSERT INTO `sys_log` VALUES (783, 1, 'admin', '请求访问主页', 82, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-16 11:02:24');
INSERT INTO `sys_log` VALUES (784, 1, 'admin', '登录', 457, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-16 11:06:30');
INSERT INTO `sys_log` VALUES (785, 1, 'admin', '请求访问主页', 101, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-16 11:06:30');
INSERT INTO `sys_log` VALUES (786, 1, 'admin', '登录', 379, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-16 11:45:39');
INSERT INTO `sys_log` VALUES (787, 1, 'admin', '请求访问主页', 85, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-16 11:45:40');
INSERT INTO `sys_log` VALUES (788, 1, 'admin', '登录', 7, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '192.168.1.12', '2019-02-16 11:45:48');
INSERT INTO `sys_log` VALUES (789, 1, 'admin', '请求访问主页', 15, 'com.bootdo.system.controller.LoginController.index()', NULL, '192.168.1.12', '2019-02-16 11:45:48');
INSERT INTO `sys_log` VALUES (790, 1, 'admin', '请求访问主页', 12, 'com.bootdo.system.controller.LoginController.index()', NULL, '192.168.1.12', '2019-02-16 11:47:33');
INSERT INTO `sys_log` VALUES (791, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '192.168.1.12', '2019-02-16 11:47:34');
INSERT INTO `sys_log` VALUES (792, 1, 'admin', '请求访问主页', 12, 'com.bootdo.system.controller.LoginController.index()', NULL, '192.168.1.12', '2019-02-16 11:47:43');
INSERT INTO `sys_log` VALUES (793, 1, 'admin', '登录', 6, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '192.168.1.9', '2019-02-16 11:48:06');
INSERT INTO `sys_log` VALUES (794, 1, 'admin', '请求访问主页', 14, 'com.bootdo.system.controller.LoginController.index()', NULL, '192.168.1.9', '2019-02-16 11:48:06');
INSERT INTO `sys_log` VALUES (795, 1, 'admin', '请求访问主页', 8, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-16 11:52:35');
INSERT INTO `sys_log` VALUES (796, 1, 'admin', '登录', 36, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-16 12:25:38');
INSERT INTO `sys_log` VALUES (797, 1, 'admin', '请求访问主页', 79, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-16 12:25:38');
INSERT INTO `sys_log` VALUES (798, 1, 'admin', '登录', 39, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-16 15:49:54');
INSERT INTO `sys_log` VALUES (799, 1, 'admin', '请求访问主页', 93, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-16 15:49:54');
INSERT INTO `sys_log` VALUES (800, 1, 'admin', '登录', 366, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-16 17:31:47');
INSERT INTO `sys_log` VALUES (801, 1, 'admin', '请求访问主页', 90, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-16 17:31:47');
INSERT INTO `sys_log` VALUES (802, 1, 'admin', '登录', 436, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-16 20:32:43');
INSERT INTO `sys_log` VALUES (803, 1, 'admin', '请求访问主页', 488, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-16 20:32:43');
INSERT INTO `sys_log` VALUES (804, 1, 'admin', '登录', 219, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '123.66.148.191', '2019-02-16 20:42:54');
INSERT INTO `sys_log` VALUES (805, -1, '获取用户信息为空', '登录', 15, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '111.199.189.36', '2019-02-16 20:42:54');
INSERT INTO `sys_log` VALUES (806, 1, 'admin', '请求访问主页', 151, 'com.bootdo.system.controller.LoginController.index()', NULL, '123.66.148.191', '2019-02-16 20:42:54');
INSERT INTO `sys_log` VALUES (807, 1, 'admin', '登录', 0, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '123.66.148.191', '2019-02-16 20:44:38');
INSERT INTO `sys_log` VALUES (808, 1, 'admin', '登录', 16, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '123.66.148.191', '2019-02-16 20:44:43');
INSERT INTO `sys_log` VALUES (809, 1, 'admin', '请求访问主页', 109, 'com.bootdo.system.controller.LoginController.index()', NULL, '123.66.148.191', '2019-02-16 20:44:43');
INSERT INTO `sys_log` VALUES (810, 1, 'admin', '登录', 17, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '103.233.54.249', '2019-02-16 20:45:04');
INSERT INTO `sys_log` VALUES (811, 1, 'admin', '请求访问主页', 104, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-16 20:45:04');
INSERT INTO `sys_log` VALUES (812, 1, 'admin', '请求访问主页', 105, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-16 20:45:05');
INSERT INTO `sys_log` VALUES (813, 1, 'admin', '编辑角色', 15, 'com.bootdo.system.controller.RoleController.edit()', NULL, '123.66.148.191', '2019-02-16 20:46:22');
INSERT INTO `sys_log` VALUES (814, 1, 'admin', '编辑用户', 122, 'com.bootdo.system.controller.UserController.edit()', NULL, '123.66.148.191', '2019-02-16 20:47:19');
INSERT INTO `sys_log` VALUES (815, 1, 'admin', '编辑用户', 116, 'com.bootdo.system.controller.UserController.edit()', NULL, '103.233.54.249', '2019-02-16 20:47:21');
INSERT INTO `sys_log` VALUES (816, 1, 'admin', '更新用户', 139, 'com.bootdo.system.controller.UserController.update()', NULL, '103.233.54.249', '2019-02-16 20:47:27');
INSERT INTO `sys_log` VALUES (817, 1, 'admin', '添加用户', 14, 'com.bootdo.system.controller.UserController.add()', NULL, '123.66.148.191', '2019-02-16 20:47:32');
INSERT INTO `sys_log` VALUES (818, 1, 'admin', '请求访问主页', 115, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-16 21:06:09');
INSERT INTO `sys_log` VALUES (819, 1, 'admin', '登录', 27, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '123.66.148.191', '2019-02-16 21:25:52');
INSERT INTO `sys_log` VALUES (820, 1, 'admin', '请求访问主页', 101, 'com.bootdo.system.controller.LoginController.index()', NULL, '123.66.148.191', '2019-02-16 21:25:52');
INSERT INTO `sys_log` VALUES (821, 1, 'admin', 'error', NULL, 'http://39.104.71.192:9994/oscar/uploadPic', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: org.apache.tomcat.util.http.fileupload.FileUploadBase$IOFileUploadException: Processing of multipart/form-data request failed. Unexpected EOF read on the socket', NULL, '2019-02-16 21:27:24');
INSERT INTO `sys_log` VALUES (822, 1, 'admin', '登录', 15, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '123.66.148.191', '2019-02-16 21:27:34');
INSERT INTO `sys_log` VALUES (823, 1, 'admin', '请求访问主页', 101, 'com.bootdo.system.controller.LoginController.index()', NULL, '123.66.148.191', '2019-02-16 21:27:34');
INSERT INTO `sys_log` VALUES (824, 1, 'admin', '请求访问主页', 102, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-16 21:28:37');
INSERT INTO `sys_log` VALUES (825, 1, 'admin', '请求访问主页', 102, 'com.bootdo.system.controller.LoginController.index()', NULL, '123.66.148.191', '2019-02-16 21:33:58');
INSERT INTO `sys_log` VALUES (826, -1, '获取用户信息为空', '登录', 4, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '123.66.148.191', '2019-02-16 22:08:49');
INSERT INTO `sys_log` VALUES (827, 1, 'admin', '登录', 88, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '123.66.148.191', '2019-02-16 22:08:54');
INSERT INTO `sys_log` VALUES (828, 1, 'admin', '请求访问主页', 115, 'com.bootdo.system.controller.LoginController.index()', NULL, '123.66.148.191', '2019-02-16 22:08:54');
INSERT INTO `sys_log` VALUES (829, 1, 'admin', '登录', 22, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '103.233.54.249', '2019-02-16 22:10:44');
INSERT INTO `sys_log` VALUES (830, 1, 'admin', '请求访问主页', 77, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-16 22:10:44');
INSERT INTO `sys_log` VALUES (831, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '103.233.54.249', '2019-02-16 22:32:10');
INSERT INTO `sys_log` VALUES (832, 1, 'admin', '登录', 12, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '103.233.54.249', '2019-02-16 22:32:15');
INSERT INTO `sys_log` VALUES (833, 1, 'admin', '请求访问主页', 74, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-16 22:32:17');
INSERT INTO `sys_log` VALUES (834, 1, 'admin', '添加用户', 20, 'com.bootdo.system.controller.UserController.add()', NULL, '103.233.54.249', '2019-02-16 22:34:55');
INSERT INTO `sys_log` VALUES (835, 1, 'admin', '保存用户', 106, 'com.bootdo.system.controller.UserController.save()', NULL, '103.233.54.249', '2019-02-16 22:35:28');
INSERT INTO `sys_log` VALUES (836, 1, 'admin', '编辑角色', 12, 'com.bootdo.system.controller.RoleController.edit()', NULL, '103.233.54.249', '2019-02-16 22:35:42');
INSERT INTO `sys_log` VALUES (837, 1, 'admin', '更新角色', 74, 'com.bootdo.system.controller.RoleController.update()', NULL, '103.233.54.249', '2019-02-16 22:35:58');
INSERT INTO `sys_log` VALUES (838, 3, 'txt', '登录', 12, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '103.233.54.249', '2019-02-16 22:36:36');
INSERT INTO `sys_log` VALUES (839, 3, 'txt', '请求访问主页', 80, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-16 22:36:36');
INSERT INTO `sys_log` VALUES (840, -1, '获取用户信息为空', '登录', 0, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '103.233.54.249', '2019-02-17 00:12:37');
INSERT INTO `sys_log` VALUES (841, 1, 'admin', '登录', 12, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '103.233.54.249', '2019-02-17 00:12:41');
INSERT INTO `sys_log` VALUES (842, 1, 'admin', '请求访问主页', 80, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-17 00:12:41');
INSERT INTO `sys_log` VALUES (843, 1, 'admin', '请求访问主页', 89, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-17 00:16:46');
INSERT INTO `sys_log` VALUES (844, 1, 'admin', '请求访问主页', 90, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-17 00:23:55');
INSERT INTO `sys_log` VALUES (845, 1, 'admin', '请求访问主页', 79, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-17 00:55:16');
INSERT INTO `sys_log` VALUES (846, 1, 'admin', '请求访问主页', 94, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-17 00:59:40');
INSERT INTO `sys_log` VALUES (847, 1, 'admin', '请求访问主页', 92, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-17 01:12:36');
INSERT INTO `sys_log` VALUES (848, 1, 'admin', '请求访问主页', 88, 'com.bootdo.system.controller.LoginController.index()', NULL, '103.233.54.249', '2019-02-17 01:18:24');
INSERT INTO `sys_log` VALUES (849, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/addNewAnswer', 'java.lang.NullPointerException', NULL, '2019-02-17 09:23:06');
INSERT INTO `sys_log` VALUES (850, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/addNewAnswer', 'java.lang.NullPointerException', NULL, '2019-02-17 09:23:58');
INSERT INTO `sys_log` VALUES (851, 1, 'admin', '登录', 29, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '221.220.231.134', '2019-02-17 09:28:20');
INSERT INTO `sys_log` VALUES (852, 1, 'admin', '请求访问主页', 105, 'com.bootdo.system.controller.LoginController.index()', NULL, '221.220.231.134', '2019-02-17 09:28:20');
INSERT INTO `sys_log` VALUES (853, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/base64ToImg', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.lang.IllegalStateException: The multi-part request contained parameter data (excluding uploaded files) that exceeded the limit for maxPostSize set on the associated connector', NULL, '2019-02-17 18:26:25');
INSERT INTO `sys_log` VALUES (854, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/base64ToImg', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.lang.IllegalStateException: The multi-part request contained parameter data (excluding uploaded files) that exceeded the limit for maxPostSize set on the associated connector', NULL, '2019-02-17 18:26:41');
INSERT INTO `sys_log` VALUES (855, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/base64ToImg', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.lang.IllegalStateException: The multi-part request contained parameter data (excluding uploaded files) that exceeded the limit for maxPostSize set on the associated connector', NULL, '2019-02-17 18:38:52');
INSERT INTO `sys_log` VALUES (856, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/base64ToImg', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.lang.IllegalStateException: The multi-part request contained parameter data (excluding uploaded files) that exceeded the limit for maxPostSize set on the associated connector', NULL, '2019-02-17 18:41:12');
INSERT INTO `sys_log` VALUES (857, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/topicList', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-02-17 19:37:08');
INSERT INTO `sys_log` VALUES (858, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/base64ToImg', 'org.apache.catalina.connector.ClientAbortException: java.io.IOException: Broken pipe', NULL, '2019-02-18 09:22:41');
INSERT INTO `sys_log` VALUES (859, -1, '获取用户信息为空', '登录', 29, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '221.220.231.134', '2019-02-18 09:52:56');
INSERT INTO `sys_log` VALUES (860, 1, 'admin', '登录', 14, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '221.220.231.134', '2019-02-18 09:53:00');
INSERT INTO `sys_log` VALUES (861, 1, 'admin', '请求访问主页', 128, 'com.bootdo.system.controller.LoginController.index()', NULL, '221.220.231.134', '2019-02-18 09:53:00');
INSERT INTO `sys_log` VALUES (862, 1, 'admin', '登录', 13, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '221.220.231.134', '2019-02-18 14:39:10');
INSERT INTO `sys_log` VALUES (863, 1, 'admin', '请求访问主页', 104, 'com.bootdo.system.controller.LoginController.index()', NULL, '221.220.231.134', '2019-02-18 14:39:11');
INSERT INTO `sys_log` VALUES (864, 1, 'admin', '登录', 26, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '221.223.39.51', '2019-02-18 17:16:48');
INSERT INTO `sys_log` VALUES (865, 1, 'admin', '请求访问主页', 145, 'com.bootdo.system.controller.LoginController.index()', NULL, '221.223.39.51', '2019-02-18 17:16:48');
INSERT INTO `sys_log` VALUES (866, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/base64ToImg', 'org.apache.catalina.connector.ClientAbortException: java.io.IOException: Broken pipe', NULL, '2019-02-18 17:44:51');
INSERT INTO `sys_log` VALUES (867, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/answerByPhone/12345678901', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-02-18 17:52:59');
INSERT INTO `sys_log` VALUES (868, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/answerByPhone/12345678901', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-02-18 17:52:59');
INSERT INTO `sys_log` VALUES (869, NULL, NULL, 'error', NULL, 'http://39.104.71.192:9994/oscar/answerByPhone/12345678901', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-02-18 17:53:00');
INSERT INTO `sys_log` VALUES (870, 1, 'admin', '登录', 369, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-22 10:12:54');
INSERT INTO `sys_log` VALUES (871, 1, 'admin', '请求访问主页', 89, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-22 10:12:54');
INSERT INTO `sys_log` VALUES (872, 1, 'admin', '请求访问主页', 37, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-22 10:18:24');
INSERT INTO `sys_log` VALUES (873, 1, 'admin', '删除菜单', 10, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-02-22 10:18:32');
INSERT INTO `sys_log` VALUES (874, 1, 'admin', '删除菜单', 5, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-02-22 10:18:35');
INSERT INTO `sys_log` VALUES (875, 1, 'admin', '删除菜单', 6, 'com.bootdo.system.controller.MenuController.remove()', NULL, '127.0.0.1', '2019-02-22 10:18:37');
INSERT INTO `sys_log` VALUES (876, 1, 'admin', '登录', 341, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-22 10:22:06');
INSERT INTO `sys_log` VALUES (877, 1, 'admin', '请求访问主页', 79, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-22 10:22:06');
INSERT INTO `sys_log` VALUES (878, 1, 'admin', '登录', 370, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-26 15:16:32');
INSERT INTO `sys_log` VALUES (879, 1, 'admin', '请求访问主页', 95, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-26 15:16:32');
INSERT INTO `sys_log` VALUES (880, 1, 'admin', 'error', NULL, 'http://localhost:9994/common/generator/batchCode', 'org.apache.catalina.connector.ClientAbortException: java.io.IOException: 你的主机中的软件中止了一个已建立的连接。', NULL, '2019-02-26 15:17:37');
INSERT INTO `sys_log` VALUES (881, 1, 'admin', '登录', 229, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-26 16:31:46');
INSERT INTO `sys_log` VALUES (882, 1, 'admin', '请求访问主页', 52, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-26 16:31:46');
INSERT INTO `sys_log` VALUES (883, 1, 'admin', '登录', 222, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-26 16:32:44');
INSERT INTO `sys_log` VALUES (884, 1, 'admin', '请求访问主页', 48, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-26 16:32:44');
INSERT INTO `sys_log` VALUES (885, 1, 'admin', '登录', 335, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-26 16:40:29');
INSERT INTO `sys_log` VALUES (886, 1, 'admin', '请求访问主页', 127, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-26 16:40:30');
INSERT INTO `sys_log` VALUES (887, 1, 'admin', '登录', 225, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-26 17:27:16');
INSERT INTO `sys_log` VALUES (888, 1, 'admin', '请求访问主页', 48, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-26 17:27:16');
INSERT INTO `sys_log` VALUES (889, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/wid/in', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-02-26 17:40:22');
INSERT INTO `sys_log` VALUES (890, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/wid/in', 'java.lang.NullPointerException', NULL, '2019-02-26 17:40:30');
INSERT INTO `sys_log` VALUES (891, 1, 'admin', '登录', 299, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 09:48:07');
INSERT INTO `sys_log` VALUES (892, 1, 'admin', '请求访问主页', 58, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 09:48:07');
INSERT INTO `sys_log` VALUES (893, -1, '获取用户信息为空', '登录', 12, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 11:01:14');
INSERT INTO `sys_log` VALUES (894, -1, '获取用户信息为空', '登录', 8, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 11:16:48');
INSERT INTO `sys_log` VALUES (895, -1, '获取用户信息为空', '登录', 56, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 11:17:15');
INSERT INTO `sys_log` VALUES (896, -1, '获取用户信息为空', '登录', 5, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 11:17:35');
INSERT INTO `sys_log` VALUES (897, -1, '获取用户信息为空', '登录', 4, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 11:17:38');
INSERT INTO `sys_log` VALUES (898, -1, '获取用户信息为空', '登录', 2, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 11:17:41');
INSERT INTO `sys_log` VALUES (899, 1, 'admin', '登录', 572, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 11:20:09');
INSERT INTO `sys_log` VALUES (900, 1, 'admin', '登录', 507, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 11:25:00');
INSERT INTO `sys_log` VALUES (901, 1, 'admin', '请求访问主页', 99, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 11:25:00');
INSERT INTO `sys_log` VALUES (902, 1, 'admin', '添加菜单', 1, 'com.bootdo.system.controller.MenuController.add()', NULL, '127.0.0.1', '2019-02-27 11:27:57');
INSERT INTO `sys_log` VALUES (903, 1, 'admin', '保存菜单', 8, 'com.bootdo.system.controller.MenuController.save()', NULL, '127.0.0.1', '2019-02-27 11:28:09');
INSERT INTO `sys_log` VALUES (904, 1, 'admin', '编辑菜单', 11, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-02-27 11:28:11');
INSERT INTO `sys_log` VALUES (905, 1, 'admin', '更新菜单', 13, 'com.bootdo.system.controller.MenuController.update()', NULL, '127.0.0.1', '2019-02-27 11:28:13');
INSERT INTO `sys_log` VALUES (906, 1, 'admin', '编辑菜单', 5, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-02-27 11:28:15');
INSERT INTO `sys_log` VALUES (907, 1, 'admin', '更新菜单', 8, 'com.bootdo.system.controller.MenuController.update()', NULL, '127.0.0.1', '2019-02-27 11:28:22');
INSERT INTO `sys_log` VALUES (908, 1, 'admin', '添加菜单', 5, 'com.bootdo.system.controller.MenuController.add()', NULL, '127.0.0.1', '2019-02-27 11:28:23');
INSERT INTO `sys_log` VALUES (909, 1, 'admin', '保存菜单', 5, 'com.bootdo.system.controller.MenuController.save()', NULL, '127.0.0.1', '2019-02-27 11:28:57');
INSERT INTO `sys_log` VALUES (910, 1, 'admin', '编辑角色', 5, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-02-27 11:29:00');
INSERT INTO `sys_log` VALUES (911, 1, 'admin', '编辑角色', 3, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-02-27 11:29:09');
INSERT INTO `sys_log` VALUES (912, 1, 'admin', '请求访问主页', 11, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 11:32:26');
INSERT INTO `sys_log` VALUES (913, 1, 'admin', '请求访问主页', 6, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 11:34:47');
INSERT INTO `sys_log` VALUES (914, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 11:41:35');
INSERT INTO `sys_log` VALUES (915, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 11:42:51');
INSERT INTO `sys_log` VALUES (916, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 11:43:23');
INSERT INTO `sys_log` VALUES (917, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 11:44:00');
INSERT INTO `sys_log` VALUES (918, 1, 'admin', '登录', 484, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 12:01:35');
INSERT INTO `sys_log` VALUES (919, 1, 'admin', '请求访问主页', 102, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 12:01:35');
INSERT INTO `sys_log` VALUES (920, 1, 'admin', '登录', 506, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 12:15:37');
INSERT INTO `sys_log` VALUES (921, 1, 'admin', '请求访问主页', 114, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 12:15:38');
INSERT INTO `sys_log` VALUES (922, 1, 'admin', '编辑菜单', 14, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-02-27 12:15:43');
INSERT INTO `sys_log` VALUES (923, 1, 'admin', '更新菜单', 28, 'com.bootdo.system.controller.MenuController.update()', NULL, '127.0.0.1', '2019-02-27 12:15:52');
INSERT INTO `sys_log` VALUES (924, 1, 'admin', '添加菜单', 5, 'com.bootdo.system.controller.MenuController.add()', NULL, '127.0.0.1', '2019-02-27 12:15:56');
INSERT INTO `sys_log` VALUES (925, 1, 'admin', '保存菜单', 7, 'com.bootdo.system.controller.MenuController.save()', NULL, '127.0.0.1', '2019-02-27 12:16:14');
INSERT INTO `sys_log` VALUES (926, 1, 'admin', '请求访问主页', 11, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 12:16:16');
INSERT INTO `sys_log` VALUES (927, 1, 'admin', 'error', NULL, 'http://localhost:9994/app/mobileUser/list', 'java.lang.NullPointerException', NULL, '2019-02-27 12:16:19');
INSERT INTO `sys_log` VALUES (928, 1, 'admin', '编辑菜单', 15, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-02-27 12:16:33');
INSERT INTO `sys_log` VALUES (929, 1, 'admin', '更新菜单', 19, 'com.bootdo.system.controller.MenuController.update()', NULL, '127.0.0.1', '2019-02-27 12:16:38');
INSERT INTO `sys_log` VALUES (930, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 12:16:43');
INSERT INTO `sys_log` VALUES (931, 1, 'admin', '编辑菜单', 9, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-02-27 12:16:51');
INSERT INTO `sys_log` VALUES (932, 1, 'admin', '更新菜单', 9, 'com.bootdo.system.controller.MenuController.update()', NULL, '127.0.0.1', '2019-02-27 12:16:54');
INSERT INTO `sys_log` VALUES (933, 1, 'admin', '编辑菜单', 10, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-02-27 12:16:57');
INSERT INTO `sys_log` VALUES (934, 1, 'admin', '编辑菜单', 8, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-02-27 12:17:00');
INSERT INTO `sys_log` VALUES (935, 1, 'admin', '更新菜单', 6, 'com.bootdo.system.controller.MenuController.update()', NULL, '127.0.0.1', '2019-02-27 12:17:01');
INSERT INTO `sys_log` VALUES (936, 1, 'admin', '请求访问主页', 8, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 12:17:04');
INSERT INTO `sys_log` VALUES (937, 1, 'admin', 'error', NULL, 'http://localhost:9994/app/mobileUser/list', 'java.lang.NullPointerException', NULL, '2019-02-27 12:17:05');
INSERT INTO `sys_log` VALUES (938, 1, 'admin', 'error', NULL, 'http://localhost:9994/app/mobileUser/list', 'java.lang.NullPointerException', NULL, '2019-02-27 12:17:09');
INSERT INTO `sys_log` VALUES (939, 1, 'admin', 'error', NULL, 'http://localhost:9994/app/mobileUser/list', 'java.lang.NullPointerException', NULL, '2019-02-27 12:18:14');
INSERT INTO `sys_log` VALUES (940, 1, 'admin', '登录', 491, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 12:23:17');
INSERT INTO `sys_log` VALUES (941, 1, 'admin', '请求访问主页', 116, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 12:23:17');
INSERT INTO `sys_log` VALUES (942, 1, 'admin', '添加菜单', 7, 'com.bootdo.system.controller.MenuController.add()', NULL, '127.0.0.1', '2019-02-27 12:32:37');
INSERT INTO `sys_log` VALUES (943, 1, 'admin', '保存菜单', 6, 'com.bootdo.system.controller.MenuController.save()', NULL, '127.0.0.1', '2019-02-27 12:33:25');
INSERT INTO `sys_log` VALUES (944, 1, 'admin', '请求访问主页', 7, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 12:33:27');
INSERT INTO `sys_log` VALUES (945, 1, 'admin', '请求访问主页', 12, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 12:33:29');
INSERT INTO `sys_log` VALUES (946, 1, 'admin', '编辑角色', 4, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-02-27 12:33:40');
INSERT INTO `sys_log` VALUES (947, 1, 'admin', '更新角色', 35, 'com.bootdo.system.controller.RoleController.update()', NULL, '127.0.0.1', '2019-02-27 12:33:43');
INSERT INTO `sys_log` VALUES (948, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 12:33:44');
INSERT INTO `sys_log` VALUES (949, 1, 'admin', '登录', 498, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 12:43:25');
INSERT INTO `sys_log` VALUES (950, 1, 'admin', '请求访问主页', 127, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 12:43:26');
INSERT INTO `sys_log` VALUES (951, -1, '获取用户信息为空', '登录', 9, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 13:05:04');
INSERT INTO `sys_log` VALUES (952, 1, 'admin', '登录', 213, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 13:05:07');
INSERT INTO `sys_log` VALUES (953, 1, 'admin', '请求访问主页', 106, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 13:05:07');
INSERT INTO `sys_log` VALUES (954, -1, '获取用户信息为空', '登录', 1, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 13:41:50');
INSERT INTO `sys_log` VALUES (955, 1, 'admin', '登录', 10, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 13:41:51');
INSERT INTO `sys_log` VALUES (956, 1, 'admin', '请求访问主页', 17, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 13:41:51');
INSERT INTO `sys_log` VALUES (957, 1, 'admin', '编辑菜单', 12, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-02-27 13:41:59');
INSERT INTO `sys_log` VALUES (958, 1, 'admin', '更新菜单', 28, 'com.bootdo.system.controller.MenuController.update()', NULL, '127.0.0.1', '2019-02-27 13:42:07');
INSERT INTO `sys_log` VALUES (959, 1, 'admin', '请求访问主页', 12, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 13:42:58');
INSERT INTO `sys_log` VALUES (960, 1, 'admin', '登录', 511, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 13:50:52');
INSERT INTO `sys_log` VALUES (961, 1, 'admin', '请求访问主页', 102, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 13:50:52');
INSERT INTO `sys_log` VALUES (962, 1, 'admin', '登录', 562, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 13:56:37');
INSERT INTO `sys_log` VALUES (963, 1, 'admin', '请求访问主页', 98, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 13:56:37');
INSERT INTO `sys_log` VALUES (964, 1, 'admin', '登录', 584, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 14:18:49');
INSERT INTO `sys_log` VALUES (965, 1, 'admin', '请求访问主页', 92, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 14:18:49');
INSERT INTO `sys_log` VALUES (966, 1, 'admin', 'error', NULL, 'http://localhost:9994/app/video/videoPlayer/2', 'java.lang.NullPointerException', NULL, '2019-02-27 14:37:38');
INSERT INTO `sys_log` VALUES (967, 1, 'admin', '登录', 508, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 14:45:29');
INSERT INTO `sys_log` VALUES (968, 1, 'admin', '请求访问主页', 114, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 14:45:29');
INSERT INTO `sys_log` VALUES (969, 1, 'admin', '登录', 6, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '192.168.1.8', '2019-02-27 14:47:08');
INSERT INTO `sys_log` VALUES (970, 1, 'admin', '请求访问主页', 11, 'com.bootdo.system.controller.LoginController.index()', NULL, '192.168.1.8', '2019-02-27 14:47:08');
INSERT INTO `sys_log` VALUES (971, 1, 'admin', 'error', NULL, 'http://192.168.1.12:9994/app/video/videoPlayer/3', 'java.lang.NullPointerException', NULL, '2019-02-27 14:47:13');
INSERT INTO `sys_log` VALUES (972, 1, 'admin', '请求访问主页', 8, 'com.bootdo.system.controller.LoginController.index()', NULL, '192.168.1.8', '2019-02-27 14:47:14');
INSERT INTO `sys_log` VALUES (973, 1, 'admin', '请求访问主页', 7, 'com.bootdo.system.controller.LoginController.index()', NULL, '192.168.1.8', '2019-02-27 14:48:17');
INSERT INTO `sys_log` VALUES (974, 1, 'admin', 'error', NULL, 'http://localhost:9994/app/video/videoPlayer/3', 'java.lang.NullPointerException', NULL, '2019-02-27 14:48:19');
INSERT INTO `sys_log` VALUES (975, 1, 'admin', 'error', NULL, 'http://192.168.1.12:9994/app/video/videoPlayer/3', 'java.lang.NullPointerException', NULL, '2019-02-27 14:48:21');
INSERT INTO `sys_log` VALUES (976, 1, 'admin', '登录', 494, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-27 16:49:33');
INSERT INTO `sys_log` VALUES (977, 1, 'admin', '请求访问主页', 116, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 16:49:33');
INSERT INTO `sys_log` VALUES (978, 1, 'admin', '请求访问主页', 16, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 16:59:17');
INSERT INTO `sys_log` VALUES (979, 1, 'admin', '添加菜单', 8, 'com.bootdo.system.controller.MenuController.add()', NULL, '127.0.0.1', '2019-02-27 16:59:29');
INSERT INTO `sys_log` VALUES (980, 1, 'admin', '保存菜单', 8, 'com.bootdo.system.controller.MenuController.save()', NULL, '127.0.0.1', '2019-02-27 16:59:42');
INSERT INTO `sys_log` VALUES (981, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 17:01:15');
INSERT INTO `sys_log` VALUES (982, 1, 'admin', '编辑角色', 5, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-02-27 17:01:19');
INSERT INTO `sys_log` VALUES (983, 1, 'admin', '更新角色', 36, 'com.bootdo.system.controller.RoleController.update()', NULL, '127.0.0.1', '2019-02-27 17:01:23');
INSERT INTO `sys_log` VALUES (984, 1, 'admin', '请求访问主页', 10, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 17:01:28');
INSERT INTO `sys_log` VALUES (985, 1, 'admin', '编辑菜单', 26, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-02-27 17:01:35');
INSERT INTO `sys_log` VALUES (986, 1, 'admin', '更新菜单', 8, 'com.bootdo.system.controller.MenuController.update()', NULL, '127.0.0.1', '2019-02-27 17:01:39');
INSERT INTO `sys_log` VALUES (987, 1, 'admin', '编辑菜单', 9, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-02-27 17:01:44');
INSERT INTO `sys_log` VALUES (988, 1, 'admin', '更新菜单', 6, 'com.bootdo.system.controller.MenuController.update()', NULL, '127.0.0.1', '2019-02-27 17:01:46');
INSERT INTO `sys_log` VALUES (989, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-27 17:01:48');
INSERT INTO `sys_log` VALUES (990, 1, 'admin', '登录', 527, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-28 11:02:45');
INSERT INTO `sys_log` VALUES (991, 1, 'admin', '请求访问主页', 105, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-28 11:02:45');
INSERT INTO `sys_log` VALUES (992, 1, 'admin', '请求访问主页', 15, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-28 11:05:40');
INSERT INTO `sys_log` VALUES (993, 1, 'admin', '请求访问主页', 14, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-28 11:05:53');
INSERT INTO `sys_log` VALUES (994, 1, 'admin', '添加菜单', 10, 'com.bootdo.system.controller.MenuController.add()', NULL, '127.0.0.1', '2019-02-28 11:05:59');
INSERT INTO `sys_log` VALUES (995, 1, 'admin', '保存菜单', 6, 'com.bootdo.system.controller.MenuController.save()', NULL, '127.0.0.1', '2019-02-28 11:06:09');
INSERT INTO `sys_log` VALUES (996, 1, 'admin', '编辑角色', 5, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-02-28 11:06:12');
INSERT INTO `sys_log` VALUES (997, 1, 'admin', '更新角色', 34, 'com.bootdo.system.controller.RoleController.update()', NULL, '127.0.0.1', '2019-02-28 11:06:14');
INSERT INTO `sys_log` VALUES (998, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-28 11:06:15');
INSERT INTO `sys_log` VALUES (999, 1, 'admin', '编辑菜单', 25, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-02-28 11:06:25');
INSERT INTO `sys_log` VALUES (1000, 1, 'admin', '更新菜单', 9, 'com.bootdo.system.controller.MenuController.update()', NULL, '127.0.0.1', '2019-02-28 11:06:28');
INSERT INTO `sys_log` VALUES (1001, 1, 'admin', '请求访问主页', 9, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-28 11:06:33');
INSERT INTO `sys_log` VALUES (1002, 1, 'admin', '登录', 10, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-28 13:38:13');
INSERT INTO `sys_log` VALUES (1003, 1, 'admin', '请求访问主页', 10, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-28 13:38:13');
INSERT INTO `sys_log` VALUES (1004, 1, 'admin', '添加菜单', 7, 'com.bootdo.system.controller.MenuController.add()', NULL, '127.0.0.1', '2019-02-28 13:39:40');
INSERT INTO `sys_log` VALUES (1005, 1, 'admin', '保存菜单', 6, 'com.bootdo.system.controller.MenuController.save()', NULL, '127.0.0.1', '2019-02-28 13:39:54');
INSERT INTO `sys_log` VALUES (1006, 1, 'admin', '编辑角色', 2, 'com.bootdo.system.controller.RoleController.edit()', NULL, '127.0.0.1', '2019-02-28 13:39:58');
INSERT INTO `sys_log` VALUES (1007, 1, 'admin', '更新角色', 16, 'com.bootdo.system.controller.RoleController.update()', NULL, '127.0.0.1', '2019-02-28 13:40:01');
INSERT INTO `sys_log` VALUES (1008, 1, 'admin', '请求访问主页', 10, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-28 13:40:02');
INSERT INTO `sys_log` VALUES (1009, 1, 'admin', '登录', 525, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-02-28 14:09:59');
INSERT INTO `sys_log` VALUES (1010, 1, 'admin', '请求访问主页', 128, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-02-28 14:10:00');
INSERT INTO `sys_log` VALUES (1011, 1, 'admin', '登录', 484, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-01 13:25:02');
INSERT INTO `sys_log` VALUES (1012, 1, 'admin', '请求访问主页', 158, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 13:25:03');
INSERT INTO `sys_log` VALUES (1013, 1, 'admin', '请求访问主页', 13, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 13:25:43');
INSERT INTO `sys_log` VALUES (1014, 1, 'admin', '登录', 563, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-01 13:29:14');
INSERT INTO `sys_log` VALUES (1015, 1, 'admin', '请求访问主页', 102, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 13:29:14');
INSERT INTO `sys_log` VALUES (1016, 1, 'admin', 'error', NULL, 'http://localhost:9994/app/meeting/token', 'org.springframework.http.converter.HttpMessageConversionException: Type definition error: [simple type, class org.apache.http.conn.EofSensorInputStream]; nested exception is com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class org.apache.http.conn.EofSensorInputStream and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.apache.http.impl.execchain.ResponseEntityProxy[\"content\"])', NULL, '2019-03-01 13:29:17');
INSERT INTO `sys_log` VALUES (1017, 1, 'admin', 'error', NULL, 'http://localhost:9994/app/meeting/token', 'org.springframework.http.converter.HttpMessageConversionException: Type definition error: [simple type, class org.apache.http.conn.EofSensorInputStream]; nested exception is com.fasterxml.jackson.databind.exc.InvalidDefinitionException: No serializer found for class org.apache.http.conn.EofSensorInputStream and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationFeature.FAIL_ON_EMPTY_BEANS) (through reference chain: org.apache.http.impl.execchain.ResponseEntityProxy[\"content\"])', NULL, '2019-03-01 13:30:15');
INSERT INTO `sys_log` VALUES (1018, 1, 'admin', '登录', 538, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-01 13:53:51');
INSERT INTO `sys_log` VALUES (1019, 1, 'admin', '请求访问主页', 130, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 13:53:51');
INSERT INTO `sys_log` VALUES (1020, 1, 'admin', '登录', 510, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-01 14:10:08');
INSERT INTO `sys_log` VALUES (1021, 1, 'admin', '请求访问主页', 119, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 14:10:09');
INSERT INTO `sys_log` VALUES (1022, 1, 'admin', '登录', 516, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-01 14:18:15');
INSERT INTO `sys_log` VALUES (1023, 1, 'admin', '请求访问主页', 120, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 14:18:16');
INSERT INTO `sys_log` VALUES (1024, 1, 'admin', '登录', 562, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-01 14:29:44');
INSERT INTO `sys_log` VALUES (1025, 1, 'admin', '请求访问主页', 128, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 14:29:44');
INSERT INTO `sys_log` VALUES (1026, 1, 'admin', '登录', 497, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-01 14:36:53');
INSERT INTO `sys_log` VALUES (1027, 1, 'admin', '请求访问主页', 107, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 14:36:53');
INSERT INTO `sys_log` VALUES (1028, 1, 'admin', '登录', 552, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-01 14:41:19');
INSERT INTO `sys_log` VALUES (1029, 1, 'admin', '请求访问主页', 113, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 14:41:19');
INSERT INTO `sys_log` VALUES (1030, 1, 'admin', '登录', 542, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-01 15:12:05');
INSERT INTO `sys_log` VALUES (1031, 1, 'admin', '请求访问主页', 117, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 15:12:06');
INSERT INTO `sys_log` VALUES (1032, 1, 'admin', '请求访问主页', 7, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 15:23:02');
INSERT INTO `sys_log` VALUES (1033, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/login', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-03-01 16:57:17');
INSERT INTO `sys_log` VALUES (1034, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/login', 'java.lang.NullPointerException', NULL, '2019-03-01 16:57:47');
INSERT INTO `sys_log` VALUES (1035, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/login', 'java.lang.NullPointerException', NULL, '2019-03-01 16:58:03');
INSERT INTO `sys_log` VALUES (1036, 1, 'admin', '登录', 524, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-01 22:31:38');
INSERT INTO `sys_log` VALUES (1037, 1, 'admin', '请求访问主页', 376, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-01 22:31:38');
INSERT INTO `sys_log` VALUES (1038, 1, 'admin', '编辑菜单', 12, 'com.bootdo.system.controller.MenuController.edit()', NULL, '127.0.0.1', '2019-03-01 22:35:05');
INSERT INTO `sys_log` VALUES (1039, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9994/user/test', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-03-04 10:57:19');
INSERT INTO `sys_log` VALUES (1040, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9994/base/sendCode/18744422377', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-03-04 11:11:38');
INSERT INTO `sys_log` VALUES (1041, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9994/user/codeLogin/18744422377/206130', 'java.lang.NullPointerException', NULL, '2019-03-04 11:12:02');
INSERT INTO `sys_log` VALUES (1042, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9994/user/codeLogin/18744422377/206130', 'java.lang.NullPointerException', NULL, '2019-03-04 11:12:30');
INSERT INTO `sys_log` VALUES (1043, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/in', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-03-06 14:28:33');
INSERT INTO `sys_log` VALUES (1044, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/in', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-03-06 14:28:37');
INSERT INTO `sys_log` VALUES (1045, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/wxLogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-03-06 15:08:26');
INSERT INTO `sys_log` VALUES (1046, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/wxLogin', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.executor.ExecutorException: Error getting generated key or setting result to parameter object. Cause: org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'id\' in java.lang.Class.', NULL, '2019-03-06 15:08:43');
INSERT INTO `sys_log` VALUES (1047, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/wxLogin', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.executor.ExecutorException: Error getting generated key or setting result to parameter object. Cause: org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'id\' in java.lang.Class.', NULL, '2019-03-06 15:10:36');
INSERT INTO `sys_log` VALUES (1048, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/wxLogin', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.executor.ExecutorException: Error getting generated key or setting result to parameter object. Cause: org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'id\' in java.lang.Class.', NULL, '2019-03-06 15:14:04');
INSERT INTO `sys_log` VALUES (1049, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9994/user/codeLogin/14747324146/1', 'org.apache.catalina.connector.ClientAbortException: java.io.IOException: 远程主机强迫关闭了一个现有的连接。', NULL, '2019-03-06 15:47:28');
INSERT INTO `sys_log` VALUES (1050, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/wxLogin', 'java.net.MalformedURLException', NULL, '2019-03-08 14:57:42');
INSERT INTO `sys_log` VALUES (1051, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'java.lang.NullPointerException', NULL, '2019-03-08 15:02:28');
INSERT INTO `sys_log` VALUES (1052, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-03-08 15:03:29');
INSERT INTO `sys_log` VALUES (1053, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'java.lang.NullPointerException', NULL, '2019-03-08 15:18:32');
INSERT INTO `sys_log` VALUES (1054, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/wxLogin', 'com.alibaba.fastjson.JSONException: syntax error, expect {, actual error, pos 0', NULL, '2019-03-08 15:41:34');
INSERT INTO `sys_log` VALUES (1055, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/wxLogin', 'com.alibaba.fastjson.JSONException: syntax error, expect {, actual error, pos 0', NULL, '2019-03-08 15:43:33');
INSERT INTO `sys_log` VALUES (1056, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'java.lang.NullPointerException', NULL, '2019-03-08 15:47:08');
INSERT INTO `sys_log` VALUES (1057, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'java.lang.NullPointerException', NULL, '2019-03-08 15:48:06');
INSERT INTO `sys_log` VALUES (1058, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'java.lang.NullPointerException', NULL, '2019-03-08 15:48:44');
INSERT INTO `sys_log` VALUES (1059, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'java.lang.NullPointerException', NULL, '2019-03-08 15:49:05');
INSERT INTO `sys_log` VALUES (1060, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'java.lang.NullPointerException', NULL, '2019-03-08 15:49:07');
INSERT INTO `sys_log` VALUES (1061, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'java.lang.NullPointerException', NULL, '2019-03-08 15:50:36');
INSERT INTO `sys_log` VALUES (1062, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'java.lang.NullPointerException', NULL, '2019-03-08 15:53:12');
INSERT INTO `sys_log` VALUES (1063, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'java.lang.NullPointerException', NULL, '2019-03-08 15:54:18');
INSERT INTO `sys_log` VALUES (1064, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.executor.ExecutorException: Error getting generated key or setting result to parameter object. Cause: org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'id\' in java.lang.Class.', NULL, '2019-03-08 15:56:29');
INSERT INTO `sys_log` VALUES (1065, NULL, NULL, 'error', NULL, 'http://192.168.1.14:9998/miniProgram/wxLogin', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.executor.ExecutorException: Error getting generated key or setting result to parameter object. Cause: org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'id\' in java.lang.Class.', NULL, '2019-03-08 16:28:41');
INSERT INTO `sys_log` VALUES (1066, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 09:45:10');
INSERT INTO `sys_log` VALUES (1067, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 09:45:27');
INSERT INTO `sys_log` VALUES (1068, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:06:27');
INSERT INTO `sys_log` VALUES (1069, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:06:38');
INSERT INTO `sys_log` VALUES (1070, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:07:04');
INSERT INTO `sys_log` VALUES (1071, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:07:32');
INSERT INTO `sys_log` VALUES (1072, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:08:38');
INSERT INTO `sys_log` VALUES (1073, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:11:54');
INSERT INTO `sys_log` VALUES (1074, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:14:30');
INSERT INTO `sys_log` VALUES (1075, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:14:31');
INSERT INTO `sys_log` VALUES (1076, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:15:33');
INSERT INTO `sys_log` VALUES (1077, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:15:47');
INSERT INTO `sys_log` VALUES (1078, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:20:44');
INSERT INTO `sys_log` VALUES (1079, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:23:38');
INSERT INTO `sys_log` VALUES (1080, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:38:42');
INSERT INTO `sys_log` VALUES (1081, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:41:47');
INSERT INTO `sys_log` VALUES (1082, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:43:55');
INSERT INTO `sys_log` VALUES (1083, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder', 'java.lang.NullPointerException', NULL, '2019-03-11 10:44:09');
INSERT INTO `sys_log` VALUES (1084, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder/12', 'java.lang.IllegalArgumentException: \'Content-Type\' cannot contain wildcard type \'*\'', NULL, '2019-03-11 11:06:51');
INSERT INTO `sys_log` VALUES (1085, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder/12', 'java.lang.IllegalArgumentException: \'Content-Type\' cannot contain wildcard type \'*\'', NULL, '2019-03-11 11:07:26');
INSERT INTO `sys_log` VALUES (1086, NULL, NULL, 'error', NULL, 'http://192.168.1.17:9998/miniProgram/vCardFolder/12', 'java.lang.IllegalArgumentException: \'Content-Type\' cannot contain wildcard type \'*\'', NULL, '2019-03-11 11:08:25');
INSERT INTO `sys_log` VALUES (1087, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/userInfo/12', 'java.lang.NumberFormatException: For input string: \"wwangj\"', NULL, '2019-03-11 14:37:03');
INSERT INTO `sys_log` VALUES (1088, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/userInfo/12', 'java.lang.NumberFormatException: For input string: \"wwangj\"', NULL, '2019-03-11 14:37:08');
INSERT INTO `sys_log` VALUES (1089, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/userInfo/12', 'java.lang.NumberFormatException: For input string: \"wwangj\"', NULL, '2019-03-11 14:37:44');
INSERT INTO `sys_log` VALUES (1090, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/userInfo/12', 'java.lang.NumberFormatException: For input string: \"wwangj\"', NULL, '2019-03-11 14:41:52');
INSERT INTO `sys_log` VALUES (1091, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/wxLogin', 'cn.hutool.http.HttpException: Remote host closed connection during handshake', NULL, '2019-03-11 14:41:52');
INSERT INTO `sys_log` VALUES (1092, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/userInfo/12', 'java.lang.NumberFormatException: For input string: \"wwangj\"', NULL, '2019-03-11 14:43:57');
INSERT INTO `sys_log` VALUES (1093, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/userInfo/12', 'java.lang.NumberFormatException: For input string: \"北京市品信\"', NULL, '2019-03-11 15:37:26');
INSERT INTO `sys_log` VALUES (1094, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/userInfo/12', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-03-11 15:37:42');
INSERT INTO `sys_log` VALUES (1095, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/userInfo/12', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-03-11 15:37:42');
INSERT INTO `sys_log` VALUES (1096, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/userInfo/12', 'java.lang.NumberFormatException: For input string: \"北京市品信\"', NULL, '2019-03-11 15:37:51');
INSERT INTO `sys_log` VALUES (1097, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/downLoadPic', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-03-11 16:07:40');
INSERT INTO `sys_log` VALUES (1098, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/downLoadPic', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-03-11 16:07:54');
INSERT INTO `sys_log` VALUES (1099, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/downLoadPic', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-03-11 16:10:16');
INSERT INTO `sys_log` VALUES (1100, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/downLoadPic', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-03-11 16:11:23');
INSERT INTO `sys_log` VALUES (1101, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-03-11 16:12:24');
INSERT INTO `sys_log` VALUES (1102, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-03-11 16:13:10');
INSERT INTO `sys_log` VALUES (1103, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'org.springframework.web.bind.MissingServletRequestParameterException: Required String parameter \'urlLink\' is not present', NULL, '2019-03-11 16:13:22');
INSERT INTO `sys_log` VALUES (1104, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'org.springframework.web.bind.MissingServletRequestParameterException: Required String parameter \'urlLink\' is not present', NULL, '2019-03-11 16:13:30');
INSERT INTO `sys_log` VALUES (1105, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'org.springframework.web.bind.MissingServletRequestParameterException: Required String parameter \'urlLink\' is not present', NULL, '2019-03-11 16:14:11');
INSERT INTO `sys_log` VALUES (1106, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'org.springframework.web.bind.MissingServletRequestParameterException: Required String parameter \'urlLink\' is not present', NULL, '2019-03-11 16:14:21');
INSERT INTO `sys_log` VALUES (1107, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-03-11 16:15:22');
INSERT INTO `sys_log` VALUES (1108, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'java.net.UnknownHostException: tmp', NULL, '2019-03-11 16:15:40');
INSERT INTO `sys_log` VALUES (1109, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'java.net.UnknownHostException: tmp', NULL, '2019-03-11 16:16:22');
INSERT INTO `sys_log` VALUES (1110, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/downLoadPic', 'java.net.UnknownHostException: tmp', NULL, '2019-03-11 16:18:47');
INSERT INTO `sys_log` VALUES (1111, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9995/base/uploadFile', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.2402373351540997137.9995\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-11 18:20:02');
INSERT INTO `sys_log` VALUES (1112, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9995/base/uploadFile', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.2402373351540997137.9995\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-11 18:20:27');
INSERT INTO `sys_log` VALUES (1113, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9995/base/uploadFile', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.2402373351540997137.9995\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-11 18:23:35');
INSERT INTO `sys_log` VALUES (1114, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9995/base/uploadFile', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.2402373351540997137.9995\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-11 18:34:40');
INSERT INTO `sys_log` VALUES (1115, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9995/base/uploadFile', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.2402373351540997137.9995\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-11 18:42:27');
INSERT INTO `sys_log` VALUES (1116, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9995/base/uploadFile', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.2402373351540997137.9995\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-11 18:47:47');
INSERT INTO `sys_log` VALUES (1117, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9995/base/uploadFile', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.2402373351540997137.9995\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-11 18:56:02');
INSERT INTO `sys_log` VALUES (1118, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9995/base/uploadFile', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.2402373351540997137.9995\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-11 18:59:48');
INSERT INTO `sys_log` VALUES (1119, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9995/social/userDetails/12', 'java.lang.NullPointerException', NULL, '2019-03-12 11:43:39');
INSERT INTO `sys_log` VALUES (1120, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9995/social/userDetails/12', 'java.lang.NullPointerException', NULL, '2019-03-12 11:51:19');
INSERT INTO `sys_log` VALUES (1121, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9994/social/userDetails/13', 'java.lang.NullPointerException', NULL, '2019-03-12 12:42:43');
INSERT INTO `sys_log` VALUES (1122, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9994/social/userDetails/13', 'java.lang.NullPointerException', NULL, '2019-03-12 12:43:06');
INSERT INTO `sys_log` VALUES (1123, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9994/social/userDetails/13', 'java.lang.NullPointerException', NULL, '2019-03-12 12:49:21');
INSERT INTO `sys_log` VALUES (1124, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9994/social/userDetails/13', 'java.lang.NullPointerException', NULL, '2019-03-12 12:50:07');
INSERT INTO `sys_log` VALUES (1125, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9994/social/userDetails/13', 'java.lang.NullPointerException', NULL, '2019-03-12 12:55:37');
INSERT INTO `sys_log` VALUES (1126, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/vCardFolder/12/2', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.5325479074264751316.9998\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-13 10:39:49');
INSERT INTO `sys_log` VALUES (1127, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/uploadFile', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.5325479074264751316.9998\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-13 10:47:20');
INSERT INTO `sys_log` VALUES (1128, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/uploadFile', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.5325479074264751316.9998\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-13 10:47:34');
INSERT INTO `sys_log` VALUES (1129, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/uploadFile', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.5325479074264751316.9998\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-13 10:48:45');
INSERT INTO `sys_log` VALUES (1130, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/downLoadPic', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.5325479074264751316.9998\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-13 10:49:37');
INSERT INTO `sys_log` VALUES (1131, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/downLoadPic', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.5325479074264751316.9998\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-13 10:50:00');
INSERT INTO `sys_log` VALUES (1132, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/downLoadPic', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.5325479074264751316.9998\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-13 10:50:39');
INSERT INTO `sys_log` VALUES (1133, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.5325479074264751316.9998\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-13 10:51:44');
INSERT INTO `sys_log` VALUES (1134, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'org.springframework.web.multipart.MultipartException: Failed to parse multipart servlet request; nested exception is java.io.IOException: The temporary upload location [C:\\Users\\10892\\AppData\\Local\\Temp\\tomcat.5325479074264751316.9998\\work\\Tomcat\\localhost\\ROOT] is not valid', NULL, '2019-03-13 10:52:03');
INSERT INTO `sys_log` VALUES (1135, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/downLoadPic', 'java.net.UnknownHostException: tmp', NULL, '2019-03-13 10:52:48');
INSERT INTO `sys_log` VALUES (1136, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/downLoadPic', 'org.springframework.web.bind.MissingServletRequestParameterException: Required String parameter \'urlLink\' is not present', NULL, '2019-03-13 10:53:08');
INSERT INTO `sys_log` VALUES (1137, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/downLoadPic', 'org.springframework.web.bind.MissingServletRequestParameterException: Required String parameter \'urlLink\' is not present', NULL, '2019-03-13 10:53:36');
INSERT INTO `sys_log` VALUES (1138, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9998/miniProgram/downLoadPic', 'org.springframework.web.bind.MissingServletRequestParameterException: Required String parameter \'urlLink\' is not present', NULL, '2019-03-13 10:54:42');
INSERT INTO `sys_log` VALUES (1139, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/miniProgram/qrCode/12', 'java.lang.NullPointerException', NULL, '2019-03-13 14:03:36');
INSERT INTO `sys_log` VALUES (1140, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9994/user/pwdLogin/13671067814/E10ADC3949BA59ABBE56E057F20F883E', 'java.lang.NullPointerException', NULL, '2019-03-14 11:53:11');
INSERT INTO `sys_log` VALUES (1141, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9994/user/pwdLogin/18744422377/123456', 'com.alibaba.fastjson.JSONException: write javaBean error, class org.springframework.web.multipart.support.StandardMultipartHttpServletRequest', NULL, '2019-03-14 12:28:24');
INSERT INTO `sys_log` VALUES (1142, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9994/social/userDetails/16', 'java.lang.NullPointerException', NULL, '2019-03-14 14:35:45');
INSERT INTO `sys_log` VALUES (1143, NULL, NULL, 'error', NULL, 'http://192.168.1.13:9994/social/userDetails/16', 'java.lang.NullPointerException', NULL, '2019-03-14 14:37:28');
INSERT INTO `sys_log` VALUES (1144, NULL, NULL, 'error', NULL, 'http://127.0.0.1:9998/test/qwd', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', NULL, '2019-03-14 15:08:43');
INSERT INTO `sys_log` VALUES (1145, 1, 'admin', '登录', 251, 'com.bootdo.system.controller.LoginController.ajaxLogin()', NULL, '127.0.0.1', '2019-03-15 12:24:43');
INSERT INTO `sys_log` VALUES (1146, 1, 'admin', '请求访问主页', 77, 'com.bootdo.system.controller.LoginController.index()', NULL, '127.0.0.1', '2019-03-15 12:24:43');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, 3, '系统菜单', 'sys/menu/', 'sys:menu:menu', 1, 'fa fa-th-list', 2, '2017-08-09 22:55:15', NULL);
INSERT INTO `sys_menu` VALUES (3, 0, '系统管理', NULL, NULL, 0, 'fa fa-desktop', 1, '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES (6, 3, '用户管理', 'sys/user/', 'sys:user:user', 1, 'fa fa-user', 0, '2017-08-10 14:12:11', NULL);
INSERT INTO `sys_menu` VALUES (7, 3, '角色管理', 'sys/role', 'sys:role:role', 1, 'fa fa-paw', 1, '2017-08-10 14:13:19', NULL);
INSERT INTO `sys_menu` VALUES (12, 6, '新增', '', 'sys:user:add', 2, '', 0, '2017-08-14 10:51:35', NULL);
INSERT INTO `sys_menu` VALUES (13, 6, '编辑', '', 'sys:user:edit', 2, '', 0, '2017-08-14 10:52:06', NULL);
INSERT INTO `sys_menu` VALUES (14, 6, '删除', NULL, 'sys:user:remove', 2, NULL, 0, '2017-08-14 10:52:24', NULL);
INSERT INTO `sys_menu` VALUES (15, 7, '新增', '', 'sys:role:add', 2, '', 0, '2017-08-14 10:56:37', NULL);
INSERT INTO `sys_menu` VALUES (20, 2, '新增', '', 'sys:menu:add', 2, '', 0, '2017-08-14 10:59:32', NULL);
INSERT INTO `sys_menu` VALUES (21, 2, '编辑', '', 'sys:menu:edit', 2, '', 0, '2017-08-14 10:59:56', NULL);
INSERT INTO `sys_menu` VALUES (22, 2, '删除', '', 'sys:menu:remove', 2, '', 0, '2017-08-14 11:00:26', NULL);
INSERT INTO `sys_menu` VALUES (24, 6, '批量删除', '', 'sys:user:batchRemove', 2, '', 0, '2017-08-14 17:27:18', NULL);
INSERT INTO `sys_menu` VALUES (25, 6, '停用', NULL, 'sys:user:disable', 2, NULL, 0, '2017-08-14 17:27:43', NULL);
INSERT INTO `sys_menu` VALUES (26, 6, '重置密码', '', 'sys:user:resetPwd', 2, '', 0, '2017-08-14 17:28:34', NULL);
INSERT INTO `sys_menu` VALUES (27, 91, '系统日志', 'common/log', 'common:log', 1, 'fa fa-warning', 0, '2017-08-14 22:11:53', NULL);
INSERT INTO `sys_menu` VALUES (28, 27, '刷新', NULL, 'sys:log:list', 2, NULL, 0, '2017-08-14 22:30:22', NULL);
INSERT INTO `sys_menu` VALUES (29, 27, '删除', NULL, 'sys:log:remove', 2, NULL, 0, '2017-08-14 22:30:43', NULL);
INSERT INTO `sys_menu` VALUES (30, 27, '清空', NULL, 'sys:log:clear', 2, NULL, 0, '2017-08-14 22:31:02', NULL);
INSERT INTO `sys_menu` VALUES (48, 77, '代码生成', 'common/generator', 'common:generator', 1, 'fa fa-code', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (55, 7, '编辑', '', 'sys:role:edit', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (56, 7, '删除', '', 'sys:role:remove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (57, 91, '运行监控', '/druid/index.html', '', 1, 'fa fa-caret-square-o-right', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (61, 2, '批量删除', '', 'sys:menu:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (62, 7, '批量删除', '', 'sys:role:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (73, 3, '部门管理', '/system/sysDept', 'system:sysDept:sysDept', 1, 'fa fa-users', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (74, 73, '增加', '/system/sysDept/add', 'system:sysDept:add', 2, NULL, 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (75, 73, '刪除', 'system/sysDept/remove', 'system:sysDept:remove', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (76, 73, '编辑', '/system/sysDept/edit', 'system:sysDept:edit', 2, NULL, 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (77, 0, '系统工具', '', '', 0, 'fa fa-gear', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (91, 0, '系统监控', '', '', 0, 'fa fa-video-camera', 5, NULL, NULL);
INSERT INTO `sys_menu` VALUES (92, 91, '在线用户', 'sys/online', '', 1, 'fa fa-user', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (104, 77, 'swagger', '/swagger-ui.html', '', 1, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (105, 0, 'APP管理', '', '', 0, 'fa fa-hdd-o', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (106, 105, 'APP用户管理', '/app/mobileUser/app', '', 1, '', 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (107, 105, '小程序用户管理', '/app/mobileUser/miniprogram', '', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (108, 105, '视频管理', '/app/video', '', 1, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (109, 105, '意见反馈', '/app/feedBack', '', 1, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (110, 105, '会议管理', 'app/meeting', '', 1, '', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (111, 105, '标签管理', '/app/tagDictionary', '', 1, '', 5, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级用户角色', 'admin', '拥有最高权限', 2, '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES (59, '普通用户', NULL, '基本用户权限', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3536 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (367, 44, 1);
INSERT INTO `sys_role_menu` VALUES (368, 44, 32);
INSERT INTO `sys_role_menu` VALUES (369, 44, 33);
INSERT INTO `sys_role_menu` VALUES (370, 44, 34);
INSERT INTO `sys_role_menu` VALUES (371, 44, 35);
INSERT INTO `sys_role_menu` VALUES (372, 44, 28);
INSERT INTO `sys_role_menu` VALUES (373, 44, 29);
INSERT INTO `sys_role_menu` VALUES (374, 44, 30);
INSERT INTO `sys_role_menu` VALUES (375, 44, 38);
INSERT INTO `sys_role_menu` VALUES (376, 44, 4);
INSERT INTO `sys_role_menu` VALUES (377, 44, 27);
INSERT INTO `sys_role_menu` VALUES (378, 45, 38);
INSERT INTO `sys_role_menu` VALUES (379, 46, 3);
INSERT INTO `sys_role_menu` VALUES (380, 46, 20);
INSERT INTO `sys_role_menu` VALUES (381, 46, 21);
INSERT INTO `sys_role_menu` VALUES (382, 46, 22);
INSERT INTO `sys_role_menu` VALUES (383, 46, 23);
INSERT INTO `sys_role_menu` VALUES (384, 46, 11);
INSERT INTO `sys_role_menu` VALUES (385, 46, 12);
INSERT INTO `sys_role_menu` VALUES (386, 46, 13);
INSERT INTO `sys_role_menu` VALUES (387, 46, 14);
INSERT INTO `sys_role_menu` VALUES (388, 46, 24);
INSERT INTO `sys_role_menu` VALUES (389, 46, 25);
INSERT INTO `sys_role_menu` VALUES (390, 46, 26);
INSERT INTO `sys_role_menu` VALUES (391, 46, 15);
INSERT INTO `sys_role_menu` VALUES (392, 46, 2);
INSERT INTO `sys_role_menu` VALUES (393, 46, 6);
INSERT INTO `sys_role_menu` VALUES (394, 46, 7);
INSERT INTO `sys_role_menu` VALUES (598, 50, 38);
INSERT INTO `sys_role_menu` VALUES (632, 38, 42);
INSERT INTO `sys_role_menu` VALUES (737, 51, 38);
INSERT INTO `sys_role_menu` VALUES (738, 51, 39);
INSERT INTO `sys_role_menu` VALUES (739, 51, 40);
INSERT INTO `sys_role_menu` VALUES (740, 51, 41);
INSERT INTO `sys_role_menu` VALUES (741, 51, 4);
INSERT INTO `sys_role_menu` VALUES (742, 51, 32);
INSERT INTO `sys_role_menu` VALUES (743, 51, 33);
INSERT INTO `sys_role_menu` VALUES (744, 51, 34);
INSERT INTO `sys_role_menu` VALUES (745, 51, 35);
INSERT INTO `sys_role_menu` VALUES (746, 51, 27);
INSERT INTO `sys_role_menu` VALUES (747, 51, 28);
INSERT INTO `sys_role_menu` VALUES (748, 51, 29);
INSERT INTO `sys_role_menu` VALUES (749, 51, 30);
INSERT INTO `sys_role_menu` VALUES (750, 51, 1);
INSERT INTO `sys_role_menu` VALUES (1064, 54, 53);
INSERT INTO `sys_role_menu` VALUES (1095, 55, 2);
INSERT INTO `sys_role_menu` VALUES (1096, 55, 6);
INSERT INTO `sys_role_menu` VALUES (1097, 55, 7);
INSERT INTO `sys_role_menu` VALUES (1098, 55, 3);
INSERT INTO `sys_role_menu` VALUES (1099, 55, 50);
INSERT INTO `sys_role_menu` VALUES (1100, 55, 49);
INSERT INTO `sys_role_menu` VALUES (1101, 55, 1);
INSERT INTO `sys_role_menu` VALUES (1856, 53, 28);
INSERT INTO `sys_role_menu` VALUES (1857, 53, 29);
INSERT INTO `sys_role_menu` VALUES (1858, 53, 30);
INSERT INTO `sys_role_menu` VALUES (1859, 53, 27);
INSERT INTO `sys_role_menu` VALUES (1860, 53, 57);
INSERT INTO `sys_role_menu` VALUES (1861, 53, 71);
INSERT INTO `sys_role_menu` VALUES (1862, 53, 48);
INSERT INTO `sys_role_menu` VALUES (1863, 53, 72);
INSERT INTO `sys_role_menu` VALUES (1864, 53, 1);
INSERT INTO `sys_role_menu` VALUES (1865, 53, 7);
INSERT INTO `sys_role_menu` VALUES (1866, 53, 55);
INSERT INTO `sys_role_menu` VALUES (1867, 53, 56);
INSERT INTO `sys_role_menu` VALUES (1868, 53, 62);
INSERT INTO `sys_role_menu` VALUES (1869, 53, 15);
INSERT INTO `sys_role_menu` VALUES (1870, 53, 2);
INSERT INTO `sys_role_menu` VALUES (1871, 53, 61);
INSERT INTO `sys_role_menu` VALUES (1872, 53, 20);
INSERT INTO `sys_role_menu` VALUES (1873, 53, 21);
INSERT INTO `sys_role_menu` VALUES (1874, 53, 22);
INSERT INTO `sys_role_menu` VALUES (2084, 56, 68);
INSERT INTO `sys_role_menu` VALUES (2085, 56, 60);
INSERT INTO `sys_role_menu` VALUES (2086, 56, 59);
INSERT INTO `sys_role_menu` VALUES (2087, 56, 58);
INSERT INTO `sys_role_menu` VALUES (2088, 56, 51);
INSERT INTO `sys_role_menu` VALUES (2089, 56, 50);
INSERT INTO `sys_role_menu` VALUES (2090, 56, 49);
INSERT INTO `sys_role_menu` VALUES (2243, 48, 72);
INSERT INTO `sys_role_menu` VALUES (2247, 63, -1);
INSERT INTO `sys_role_menu` VALUES (2248, 63, 84);
INSERT INTO `sys_role_menu` VALUES (2249, 63, 85);
INSERT INTO `sys_role_menu` VALUES (2250, 63, 88);
INSERT INTO `sys_role_menu` VALUES (2251, 63, 87);
INSERT INTO `sys_role_menu` VALUES (2252, 64, 84);
INSERT INTO `sys_role_menu` VALUES (2253, 64, 89);
INSERT INTO `sys_role_menu` VALUES (2254, 64, 88);
INSERT INTO `sys_role_menu` VALUES (2255, 64, 87);
INSERT INTO `sys_role_menu` VALUES (2256, 64, 86);
INSERT INTO `sys_role_menu` VALUES (2257, 64, 85);
INSERT INTO `sys_role_menu` VALUES (2258, 65, 89);
INSERT INTO `sys_role_menu` VALUES (2259, 65, 88);
INSERT INTO `sys_role_menu` VALUES (2260, 65, 86);
INSERT INTO `sys_role_menu` VALUES (2262, 67, 48);
INSERT INTO `sys_role_menu` VALUES (2263, 68, 88);
INSERT INTO `sys_role_menu` VALUES (2264, 68, 87);
INSERT INTO `sys_role_menu` VALUES (2265, 69, 89);
INSERT INTO `sys_role_menu` VALUES (2266, 69, 88);
INSERT INTO `sys_role_menu` VALUES (2267, 69, 86);
INSERT INTO `sys_role_menu` VALUES (2268, 69, 87);
INSERT INTO `sys_role_menu` VALUES (2269, 69, 85);
INSERT INTO `sys_role_menu` VALUES (2270, 69, 84);
INSERT INTO `sys_role_menu` VALUES (2271, 70, 85);
INSERT INTO `sys_role_menu` VALUES (2272, 70, 89);
INSERT INTO `sys_role_menu` VALUES (2273, 70, 88);
INSERT INTO `sys_role_menu` VALUES (2274, 70, 87);
INSERT INTO `sys_role_menu` VALUES (2275, 70, 86);
INSERT INTO `sys_role_menu` VALUES (2276, 70, 84);
INSERT INTO `sys_role_menu` VALUES (2277, 71, 87);
INSERT INTO `sys_role_menu` VALUES (2278, 72, 59);
INSERT INTO `sys_role_menu` VALUES (2279, 73, 48);
INSERT INTO `sys_role_menu` VALUES (2280, 74, 88);
INSERT INTO `sys_role_menu` VALUES (2281, 74, 87);
INSERT INTO `sys_role_menu` VALUES (2282, 75, 88);
INSERT INTO `sys_role_menu` VALUES (2283, 75, 87);
INSERT INTO `sys_role_menu` VALUES (2284, 76, 85);
INSERT INTO `sys_role_menu` VALUES (2285, 76, 89);
INSERT INTO `sys_role_menu` VALUES (2286, 76, 88);
INSERT INTO `sys_role_menu` VALUES (2287, 76, 87);
INSERT INTO `sys_role_menu` VALUES (2288, 76, 86);
INSERT INTO `sys_role_menu` VALUES (2289, 76, 84);
INSERT INTO `sys_role_menu` VALUES (2292, 78, 88);
INSERT INTO `sys_role_menu` VALUES (2293, 78, 87);
INSERT INTO `sys_role_menu` VALUES (2294, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2295, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2296, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2308, 80, 87);
INSERT INTO `sys_role_menu` VALUES (2309, 80, 86);
INSERT INTO `sys_role_menu` VALUES (2310, 80, -1);
INSERT INTO `sys_role_menu` VALUES (2311, 80, 84);
INSERT INTO `sys_role_menu` VALUES (2312, 80, 85);
INSERT INTO `sys_role_menu` VALUES (2328, 79, 72);
INSERT INTO `sys_role_menu` VALUES (2329, 79, 48);
INSERT INTO `sys_role_menu` VALUES (2330, 79, 77);
INSERT INTO `sys_role_menu` VALUES (2331, 79, 84);
INSERT INTO `sys_role_menu` VALUES (2332, 79, 89);
INSERT INTO `sys_role_menu` VALUES (2333, 79, 88);
INSERT INTO `sys_role_menu` VALUES (2334, 79, 87);
INSERT INTO `sys_role_menu` VALUES (2335, 79, 86);
INSERT INTO `sys_role_menu` VALUES (2336, 79, 85);
INSERT INTO `sys_role_menu` VALUES (2337, 79, -1);
INSERT INTO `sys_role_menu` VALUES (2338, 77, 89);
INSERT INTO `sys_role_menu` VALUES (2339, 77, 88);
INSERT INTO `sys_role_menu` VALUES (2340, 77, 87);
INSERT INTO `sys_role_menu` VALUES (2341, 77, 86);
INSERT INTO `sys_role_menu` VALUES (2342, 77, 85);
INSERT INTO `sys_role_menu` VALUES (2343, 77, 84);
INSERT INTO `sys_role_menu` VALUES (2344, 77, 72);
INSERT INTO `sys_role_menu` VALUES (2345, 77, -1);
INSERT INTO `sys_role_menu` VALUES (2346, 77, 77);
INSERT INTO `sys_role_menu` VALUES (2974, 57, 93);
INSERT INTO `sys_role_menu` VALUES (2975, 57, 99);
INSERT INTO `sys_role_menu` VALUES (2976, 57, 95);
INSERT INTO `sys_role_menu` VALUES (2977, 57, 101);
INSERT INTO `sys_role_menu` VALUES (2978, 57, 96);
INSERT INTO `sys_role_menu` VALUES (2979, 57, 94);
INSERT INTO `sys_role_menu` VALUES (2980, 57, -1);
INSERT INTO `sys_role_menu` VALUES (2981, 58, 93);
INSERT INTO `sys_role_menu` VALUES (2982, 58, 99);
INSERT INTO `sys_role_menu` VALUES (2983, 58, 95);
INSERT INTO `sys_role_menu` VALUES (2984, 58, 101);
INSERT INTO `sys_role_menu` VALUES (2985, 58, 96);
INSERT INTO `sys_role_menu` VALUES (2986, 58, 94);
INSERT INTO `sys_role_menu` VALUES (2987, 58, -1);
INSERT INTO `sys_role_menu` VALUES (3356, 59, 76);
INSERT INTO `sys_role_menu` VALUES (3357, 59, 75);
INSERT INTO `sys_role_menu` VALUES (3358, 59, 74);
INSERT INTO `sys_role_menu` VALUES (3359, 59, 62);
INSERT INTO `sys_role_menu` VALUES (3360, 59, 56);
INSERT INTO `sys_role_menu` VALUES (3361, 59, 55);
INSERT INTO `sys_role_menu` VALUES (3362, 59, 15);
INSERT INTO `sys_role_menu` VALUES (3363, 59, 26);
INSERT INTO `sys_role_menu` VALUES (3364, 59, 25);
INSERT INTO `sys_role_menu` VALUES (3365, 59, 24);
INSERT INTO `sys_role_menu` VALUES (3366, 59, 14);
INSERT INTO `sys_role_menu` VALUES (3367, 59, 13);
INSERT INTO `sys_role_menu` VALUES (3368, 59, 12);
INSERT INTO `sys_role_menu` VALUES (3369, 59, 61);
INSERT INTO `sys_role_menu` VALUES (3370, 59, 22);
INSERT INTO `sys_role_menu` VALUES (3371, 59, 21);
INSERT INTO `sys_role_menu` VALUES (3372, 59, 20);
INSERT INTO `sys_role_menu` VALUES (3373, 59, 73);
INSERT INTO `sys_role_menu` VALUES (3374, 59, 7);
INSERT INTO `sys_role_menu` VALUES (3375, 59, 6);
INSERT INTO `sys_role_menu` VALUES (3376, 59, 2);
INSERT INTO `sys_role_menu` VALUES (3377, 59, 3);
INSERT INTO `sys_role_menu` VALUES (3378, 59, 105);
INSERT INTO `sys_role_menu` VALUES (3379, 59, 107);
INSERT INTO `sys_role_menu` VALUES (3380, 59, 106);
INSERT INTO `sys_role_menu` VALUES (3381, 59, -1);
INSERT INTO `sys_role_menu` VALUES (3496, 1, 110);
INSERT INTO `sys_role_menu` VALUES (3497, 1, 109);
INSERT INTO `sys_role_menu` VALUES (3498, 1, 108);
INSERT INTO `sys_role_menu` VALUES (3499, 1, 107);
INSERT INTO `sys_role_menu` VALUES (3500, 1, 106);
INSERT INTO `sys_role_menu` VALUES (3501, 1, 92);
INSERT INTO `sys_role_menu` VALUES (3502, 1, 57);
INSERT INTO `sys_role_menu` VALUES (3503, 1, 30);
INSERT INTO `sys_role_menu` VALUES (3504, 1, 29);
INSERT INTO `sys_role_menu` VALUES (3505, 1, 28);
INSERT INTO `sys_role_menu` VALUES (3506, 1, 104);
INSERT INTO `sys_role_menu` VALUES (3507, 1, 48);
INSERT INTO `sys_role_menu` VALUES (3508, 1, 76);
INSERT INTO `sys_role_menu` VALUES (3509, 1, 75);
INSERT INTO `sys_role_menu` VALUES (3510, 1, 74);
INSERT INTO `sys_role_menu` VALUES (3511, 1, 62);
INSERT INTO `sys_role_menu` VALUES (3512, 1, 56);
INSERT INTO `sys_role_menu` VALUES (3513, 1, 55);
INSERT INTO `sys_role_menu` VALUES (3514, 1, 15);
INSERT INTO `sys_role_menu` VALUES (3515, 1, 26);
INSERT INTO `sys_role_menu` VALUES (3516, 1, 25);
INSERT INTO `sys_role_menu` VALUES (3517, 1, 24);
INSERT INTO `sys_role_menu` VALUES (3518, 1, 14);
INSERT INTO `sys_role_menu` VALUES (3519, 1, 13);
INSERT INTO `sys_role_menu` VALUES (3520, 1, 12);
INSERT INTO `sys_role_menu` VALUES (3521, 1, 61);
INSERT INTO `sys_role_menu` VALUES (3522, 1, 22);
INSERT INTO `sys_role_menu` VALUES (3523, 1, 21);
INSERT INTO `sys_role_menu` VALUES (3524, 1, 20);
INSERT INTO `sys_role_menu` VALUES (3525, 1, 27);
INSERT INTO `sys_role_menu` VALUES (3526, 1, 91);
INSERT INTO `sys_role_menu` VALUES (3527, 1, 77);
INSERT INTO `sys_role_menu` VALUES (3528, 1, 73);
INSERT INTO `sys_role_menu` VALUES (3529, 1, 7);
INSERT INTO `sys_role_menu` VALUES (3530, 1, 6);
INSERT INTO `sys_role_menu` VALUES (3531, 1, 2);
INSERT INTO `sys_role_menu` VALUES (3532, 1, 3);
INSERT INTO `sys_role_menu` VALUES (3533, 1, 111);
INSERT INTO `sys_role_menu` VALUES (3534, 1, 105);
INSERT INTO `sys_role_menu` VALUES (3535, 1, -1);

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) NULL DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) NULL DEFAULT NULL COMMENT '性别',
  `birth` datetime(0) NULL DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) NULL DEFAULT NULL,
  `live_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超级管理员', '27bd386e70f280e24c2f4f2a549b82cf', 6, 'admin@example.com', '17699999999', 1, 1, '2017-08-15 21:40:39', '2017-08-15 21:41:00', 96, '2017-12-14 00:00:00', 138, 'ccc', '122;121;', '北京市', '北京市市辖区', '东城区');
INSERT INTO `sys_user` VALUES (2, 'test', '临时用户', '6cf3bb3deba2aadbd41ec9a22511084e', 6, 'test@bootdo.com', NULL, 1, 1, '2017-08-14 13:43:05', '2017-08-14 21:15:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (3, 'txt', '我 ', '2d6dc24a3068e6203d4ea082ce006adf', NULL, '740463895@qq.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_plus
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_plus`;
CREATE TABLE `sys_user_plus`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `payment` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (73, 30, 48);
INSERT INTO `sys_user_role` VALUES (74, 30, 49);
INSERT INTO `sys_user_role` VALUES (75, 30, 50);
INSERT INTO `sys_user_role` VALUES (76, 31, 48);
INSERT INTO `sys_user_role` VALUES (77, 31, 49);
INSERT INTO `sys_user_role` VALUES (78, 31, 52);
INSERT INTO `sys_user_role` VALUES (79, 32, 48);
INSERT INTO `sys_user_role` VALUES (80, 32, 49);
INSERT INTO `sys_user_role` VALUES (81, 32, 50);
INSERT INTO `sys_user_role` VALUES (82, 32, 51);
INSERT INTO `sys_user_role` VALUES (83, 32, 52);
INSERT INTO `sys_user_role` VALUES (84, 33, 38);
INSERT INTO `sys_user_role` VALUES (85, 33, 49);
INSERT INTO `sys_user_role` VALUES (86, 33, 52);
INSERT INTO `sys_user_role` VALUES (87, 34, 50);
INSERT INTO `sys_user_role` VALUES (88, 34, 51);
INSERT INTO `sys_user_role` VALUES (89, 34, 52);
INSERT INTO `sys_user_role` VALUES (111, 2, 1);
INSERT INTO `sys_user_role` VALUES (124, NULL, 48);
INSERT INTO `sys_user_role` VALUES (125, 1, 1);
INSERT INTO `sys_user_role` VALUES (126, 3, 59);

SET FOREIGN_KEY_CHECKS = 1;
