/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : eksis

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 30/04/2021 20:37:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2020_12_20_102435_create_table_roles', 1);
INSERT INTO `migrations` VALUES (2, '2020_12_20_102506_create_table_users', 1);
INSERT INTO `migrations` VALUES (3, '2020_12_23_114942_create_table_position', 1);
INSERT INTO `migrations` VALUES (4, '2020_12_23_115044_create_table_departement', 1);
INSERT INTO `migrations` VALUES (5, '2020_12_23_115444_create_table_staff', 1);
INSERT INTO `migrations` VALUES (6, '2020_12_23_120038_create_table_absensi', 1);
INSERT INTO `migrations` VALUES (7, '2020_12_23_121157_create_table_cuti', 1);
INSERT INTO `migrations` VALUES (8, '2020_12_23_121505_create_table_overtime', 1);
INSERT INTO `migrations` VALUES (9, '2020_12_23_121836_create_table_salary', 1);
INSERT INTO `migrations` VALUES (10, '2020_12_23_122258_create_table_schedule', 1);
INSERT INTO `migrations` VALUES (11, '2021_01_02_135908_create_table_attendance', 1);
INSERT INTO `migrations` VALUES (12, '2021_01_02_141320_create_add_field', 1);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'Administrator', '2021-01-02 14:42:41', '2021-01-02 14:42:41');
INSERT INTO `roles` VALUES (3, 'supervisor', 'Petugas Lapangan', '2021-01-28 06:04:21', '2021-04-28 09:28:33');
INSERT INTO `roles` VALUES (4, 'accounting', 'Staff Keuangan', '2021-02-09 03:48:20', '2021-02-09 03:48:20');
INSERT INTO `roles` VALUES (5, 'karyawan', 'karyawan', '2021-04-29 05:15:33', '2021-04-29 05:15:33');

-- ----------------------------
-- Table structure for tb_absensi
-- ----------------------------
DROP TABLE IF EXISTS `tb_absensi`;
CREATE TABLE `tb_absensi`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int UNSIGNED NULL DEFAULT NULL,
  `attendance_id` int UNSIGNED NOT NULL,
  `jumlah_lembur` int NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `periode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_absen` date NOT NULL,
  `waktu_masuk` time NOT NULL,
  `waktu_keluar` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_absensi_attendance_id_foreign`(`attendance_id`) USING BTREE,
  INDEX `tb_absensi_staff_id_foreign`(`staff_id`) USING BTREE,
  CONSTRAINT `tb_absensi_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `tb_attendance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_absensi_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `tb_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 513 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_absensi
-- ----------------------------
INSERT INTO `tb_absensi` VALUES (507, 27, 3, 0, NULL, 'januari-2021', '2021-04-29', '00:00:00', '00:00:00', '2021-04-29 08:20:17', '2021-04-30 00:51:22');
INSERT INTO `tb_absensi` VALUES (508, 30, 1, 0, NULL, 'januari-2021', '2021-04-29', '00:00:00', '00:00:00', '2021-04-29 08:20:17', '2021-04-30 00:51:22');
INSERT INTO `tb_absensi` VALUES (509, 28, 1, 0, NULL, 'januari-2021', '2021-04-29', '00:00:00', '00:00:00', '2021-04-29 08:20:41', '2021-04-29 08:25:21');
INSERT INTO `tb_absensi` VALUES (511, 27, 1, 0, NULL, 'april-2021', '2021-04-29', '00:00:00', '00:00:00', '2021-04-30 00:37:14', '2021-04-30 00:37:14');
INSERT INTO `tb_absensi` VALUES (512, 30, 1, 0, NULL, 'april-2021', '2021-04-29', '00:00:00', '00:00:00', '2021-04-30 00:37:14', '2021-04-30 00:37:14');

-- ----------------------------
-- Table structure for tb_attendance
-- ----------------------------
DROP TABLE IF EXISTS `tb_attendance`;
CREATE TABLE `tb_attendance`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` tinyint NOT NULL DEFAULT 0,
  `singkatan` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_attendance
-- ----------------------------
INSERT INTO `tb_attendance` VALUES (1, 'Present', 1, 'H', 'badge badge-success', 'green', '2021-01-02 14:42:41', '2021-01-02 14:42:41');
INSERT INTO `tb_attendance` VALUES (2, 'Permision', 0, 'I', 'badge badge-info', 'blue', '2021-01-02 14:42:41', '2021-01-02 14:42:41');
INSERT INTO `tb_attendance` VALUES (3, 'Sick', 0, 'S', 'badge badge-warning', 'yellow', '2021-01-02 14:42:41', '2021-01-02 14:42:41');
INSERT INTO `tb_attendance` VALUES (4, 'Alpha', 0, 'A', 'badge badge-danger', 'red', '2021-01-02 14:42:41', '2021-01-02 14:42:41');

-- ----------------------------
-- Table structure for tb_cuti
-- ----------------------------
DROP TABLE IF EXISTS `tb_cuti`;
CREATE TABLE `tb_cuti`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int UNSIGNED NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NULL DEFAULT NULL,
  `jumlah_cuti` int NOT NULL DEFAULT 0,
  `status` tinyint NOT NULL DEFAULT 0,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_cuti_staff_id_foreign`(`staff_id`) USING BTREE,
  CONSTRAINT `tb_cuti_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `tb_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_cuti
-- ----------------------------

-- ----------------------------
-- Table structure for tb_departement
-- ----------------------------
DROP TABLE IF EXISTS `tb_departement`;
CREATE TABLE `tb_departement`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_departement
-- ----------------------------
INSERT INTO `tb_departement` VALUES (8, 'Monkey Forest', '2021-04-27 07:51:58', '2021-04-27 09:05:21');
INSERT INTO `tb_departement` VALUES (9, 'UBUD', '2021-04-27 09:05:49', '2021-04-27 09:05:49');
INSERT INTO `tb_departement` VALUES (10, 'canggu', '2021-04-27 09:06:06', '2021-04-27 09:06:06');
INSERT INTO `tb_departement` VALUES (11, 'JIMBARAN', '2021-04-27 09:06:26', '2021-04-27 09:06:26');
INSERT INTO `tb_departement` VALUES (12, 'NYUH KUNING', '2021-04-30 01:49:25', '2021-04-30 01:49:25');
INSERT INTO `tb_departement` VALUES (13, 'Accounting', '2021-04-30 02:10:05', '2021-04-30 02:10:05');
INSERT INTO `tb_departement` VALUES (14, 'HRD', '2021-04-30 02:10:19', '2021-04-30 02:10:19');
INSERT INTO `tb_departement` VALUES (15, 'Direktur', '2021-04-30 02:10:39', '2021-04-30 02:10:39');

-- ----------------------------
-- Table structure for tb_overtime
-- ----------------------------
DROP TABLE IF EXISTS `tb_overtime`;
CREATE TABLE `tb_overtime`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int UNSIGNED NOT NULL,
  `jumlah_overtime` double NOT NULL DEFAULT 0,
  `tgl_overtime` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_overtime_staff_id_foreign`(`staff_id`) USING BTREE,
  CONSTRAINT `tb_overtime_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `tb_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_overtime
-- ----------------------------

-- ----------------------------
-- Table structure for tb_position
-- ----------------------------
DROP TABLE IF EXISTS `tb_position`;
CREATE TABLE `tb_position`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Staff','Daily Worker') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` double NOT NULL DEFAULT 0,
  `salary_overtime` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_position
-- ----------------------------
INSERT INTO `tb_position` VALUES (7, 'Accounting', 'Staff', 5000000, 0, '2021-04-27 07:54:00', '2021-04-28 03:19:07');
INSERT INTO `tb_position` VALUES (8, 'Supervisor/Pengawas Lapangan', 'Staff', 3500000, 0, '2021-04-27 07:54:33', '2021-04-30 02:14:47');
INSERT INTO `tb_position` VALUES (9, 'Outsourcing', 'Daily Worker', 100000, 0, '2021-04-27 07:54:59', '2021-04-30 02:15:06');
INSERT INTO `tb_position` VALUES (10, 'DRIVER', 'Staff', 3200000, 0, '2021-04-27 07:55:25', '2021-04-30 02:15:35');
INSERT INTO `tb_position` VALUES (11, 'Direktur', 'Staff', 6000000, 0, '2021-04-28 03:18:50', '2021-04-28 03:18:50');
INSERT INTO `tb_position` VALUES (12, 'HRD', 'Staff', 5000000, 0, '2021-04-30 02:16:06', '2021-04-30 02:16:06');

-- ----------------------------
-- Table structure for tb_salary
-- ----------------------------
DROP TABLE IF EXISTS `tb_salary`;
CREATE TABLE `tb_salary`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int UNSIGNED NOT NULL,
  `salary` double NOT NULL DEFAULT 0,
  `pot_bpjs` double NOT NULL DEFAULT 0,
  `transportasi` double NOT NULL DEFAULT 0,
  `uang_overtime` double NOT NULL DEFAULT 0,
  `total` double NOT NULL DEFAULT 0,
  `jumlah_overtime` double NOT NULL DEFAULT 0,
  `jumlah_kehadiran` double NOT NULL DEFAULT 0,
  `periode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status_gaji` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tgl_salary` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_salary
-- ----------------------------
INSERT INTO `tb_salary` VALUES (23, 27, 5000000, 10000, 100000, 0, 5110000, 0, 0, 'Januari-2021', 'Staff', NULL, '2021-04-01', '2021-04-30 01:27:40', '2021-04-30 04:53:28', '2021-04-30 04:53:28');
INSERT INTO `tb_salary` VALUES (24, 27, 5000000, 0, 0, 0, 5000000, 0, 0, 'Februari-2021', 'Staff', 'Dibayar', '2021-04-30', '2021-04-30 02:08:00', '2021-04-30 04:53:51', '2021-04-30 04:53:51');
INSERT INTO `tb_salary` VALUES (25, 27, 5000000, 0, 0, 0, 5000000, 0, 0, 'Januari-2021', 'Staff', 'Dibayar', '2021-04-30', '2021-04-30 04:55:02', '2021-04-30 04:55:06', '2021-04-30 04:55:06');
INSERT INTO `tb_salary` VALUES (26, 27, 5000000, 500000, 40000, 0, 5540000, 0, 0, 'Januari-2021', 'Staff', NULL, '2021-04-30', '2021-04-30 04:55:25', '2021-04-30 04:55:25', NULL);
INSERT INTO `tb_salary` VALUES (27, 28, 100000, 0, 0, 0, 100000, 0, 0, 'Januari-2021', 'Daily Worker', 'Dibayar', '2021-04-30', '2021-04-30 05:12:54', '2021-04-30 05:12:54', NULL);

-- ----------------------------
-- Table structure for tb_salary_daily
-- ----------------------------
DROP TABLE IF EXISTS `tb_salary_daily`;
CREATE TABLE `tb_salary_daily`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int UNSIGNED NOT NULL,
  `salary` double NOT NULL DEFAULT 0,
  `salary_overtime` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_salary_daily_staff_id_foreign`(`staff_id`) USING BTREE,
  CONSTRAINT `tb_salary_daily_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `tb_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_salary_daily
-- ----------------------------

-- ----------------------------
-- Table structure for tb_salary_month
-- ----------------------------
DROP TABLE IF EXISTS `tb_salary_month`;
CREATE TABLE `tb_salary_month`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int UNSIGNED NOT NULL,
  `salary` double NOT NULL DEFAULT 0,
  `salary_overtime` double NOT NULL DEFAULT 0,
  `tunjangan_bpjs` double NOT NULL DEFAULT 0,
  `tunjangan_transportasi` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_salary_month_staff_id_foreign`(`staff_id`) USING BTREE,
  CONSTRAINT `tb_salary_month_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `tb_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_salary_month
-- ----------------------------

-- ----------------------------
-- Table structure for tb_schedule
-- ----------------------------
DROP TABLE IF EXISTS `tb_schedule`;
CREATE TABLE `tb_schedule`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int UNSIGNED NOT NULL,
  `tgl_masuk` date NOT NULL,
  `ket_schedule` enum('Morning(05:00-14:00)','Afternoon(13:00-22:00)','Middle Morning(10:00-19:00)','Middle Afternoon(12:00-21:00)','Evening (19:00-04:00)','Mignight (22:00-07:00)') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Staff','Daily Worker') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_schedule_staff_id_foreign`(`staff_id`) USING BTREE,
  CONSTRAINT `tb_schedule_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `tb_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_schedule
-- ----------------------------
INSERT INTO `tb_schedule` VALUES (24, 27, '2021-04-27', 'Morning(05:00-14:00)', NULL, '2021-04-27 08:26:02', '2021-04-27 08:26:02');
INSERT INTO `tb_schedule` VALUES (25, 28, '2021-04-14', 'Middle Morning(10:00-19:00)', 'Daily Worker', '2021-04-21 18:53:49', '2021-04-26 18:53:59');

-- ----------------------------
-- Table structure for tb_staff
-- ----------------------------
DROP TABLE IF EXISTS `tb_staff`;
CREATE TABLE `tb_staff`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `position_id` int UNSIGNED NOT NULL,
  `departement_id` int UNSIGNED NOT NULL,
  `users_id` int UNSIGNED NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` date NOT NULL,
  `addres` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `startdate` date NOT NULL,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_staff_position_id_foreign`(`position_id`) USING BTREE,
  INDEX `tb_staff_departement_id_foreign`(`departement_id`) USING BTREE,
  INDEX `tb_staff_users_id_foreign`(`users_id`) USING BTREE,
  CONSTRAINT `tb_staff_departement_id_foreign` FOREIGN KEY (`departement_id`) REFERENCES `tb_departement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_staff_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `tb_position` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_staff_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_staff
-- ----------------------------
INSERT INTO `tb_staff` VALUES (27, 7, 13, 25, 'I KADEK ADI SWADNYANA', '1999-05-16', 'Jl. Pendidikan', '2021-02-11', '08968390806', 'img/uploads/profile/99ca2f57c0a371162de3b95ba95d957b.png', '2021-04-27 07:56:45', '2021-04-30 03:38:49', NULL);
INSERT INTO `tb_staff` VALUES (28, 9, 9, 27, 'DEWA AYU PUTRI NOVITA SARI', '1999-11-25', 'Test1', '2021-03-09', '081237760468', NULL, '2021-04-27 10:07:16', '2021-04-28 09:20:06', NULL);
INSERT INTO `tb_staff` VALUES (30, 11, 15, 26, 'PUTU BENNY ADNYANA', '1988-11-16', 'Jl Graha Wisata 3 no 93. Sidakarya', '2016-07-07', '087222939912', NULL, '2021-04-28 03:23:05', '2021-04-30 03:38:29', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (24, 1, NULL, 'Adi Swadnyana', 'admin1', '$2y$10$XgtwcAVyozCIKXwZNlmTIO.5coTXdcTj4cZ0SlVqjeMpkHvAycdKG', NULL, NULL, '2021-04-27 04:44:17', '2021-04-27 04:44:17', NULL);
INSERT INTO `users` VALUES (25, 3, NULL, 'I Kadek Adi Swadnyana', 'adiswadnyana', '$2y$10$bYmi0QbvACQvv5mMyCN0luc8yrFdCStbOfRQp/rzEMbIseNolcAwm', NULL, NULL, '2021-04-27 07:56:45', '2021-04-27 07:56:45', NULL);
INSERT INTO `users` VALUES (26, 1, NULL, 'Putu Benny Adnyana', 'bennyadnyana', '$2y$10$KclbkN2w63548pFcEH21aehIcGIB2HwM0P/ilHJ6ZCnztyZvcU2ZO', NULL, NULL, '2021-04-28 03:23:05', '2021-04-28 03:23:05', NULL);
INSERT INTO `users` VALUES (27, 4, NULL, 'DEWA AYU PUTRI NOVITA SARI', 'dewaayu', '$2y$10$xdt1Dk/z05f3erc3e2Rq3e0PRvg1f/YNvncBdvsRHt6auDNG9Xyju', NULL, NULL, '2021-04-28 09:20:06', '2021-04-28 09:20:06', NULL);
INSERT INTO `users` VALUES (28, 5, NULL, 'I Made Licig', 'karyawan', '$2y$10$qx/FlxVYnGvFWwgECFWmmuKreJ0lrUw0WqbItGEaTB2UmqiN/GnWq', NULL, NULL, '2021-04-29 05:16:39', '2021-04-29 05:16:39', NULL);

SET FOREIGN_KEY_CHECKS = 1;
