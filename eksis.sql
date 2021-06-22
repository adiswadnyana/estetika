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

 Date: 22/06/2021 13:23:36
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
) ENGINE = InnoDB AUTO_INCREMENT = 1049 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_absensi
-- ----------------------------
INSERT INTO `tb_absensi` VALUES (916, 1, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:08:55', '2021-06-06 17:08:55');
INSERT INTO `tb_absensi` VALUES (917, 2, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:08:55', '2021-06-06 17:08:55');
INSERT INTO `tb_absensi` VALUES (918, 19, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:08:55', '2021-06-06 17:08:55');
INSERT INTO `tb_absensi` VALUES (919, 1, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:09:07', '2021-06-06 17:09:07');
INSERT INTO `tb_absensi` VALUES (920, 2, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:09:07', '2021-06-06 17:09:07');
INSERT INTO `tb_absensi` VALUES (921, 19, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:09:07', '2021-06-06 17:09:07');
INSERT INTO `tb_absensi` VALUES (922, 1, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:09:18', '2021-06-06 17:09:18');
INSERT INTO `tb_absensi` VALUES (923, 2, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:09:18', '2021-06-06 17:09:18');
INSERT INTO `tb_absensi` VALUES (924, 19, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:09:18', '2021-06-06 17:09:18');
INSERT INTO `tb_absensi` VALUES (925, 1, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:09:27', '2021-06-06 17:09:27');
INSERT INTO `tb_absensi` VALUES (926, 2, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:09:27', '2021-06-06 17:09:27');
INSERT INTO `tb_absensi` VALUES (927, 19, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:09:27', '2021-06-06 17:09:27');
INSERT INTO `tb_absensi` VALUES (928, 1, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:09:35', '2021-06-06 17:09:35');
INSERT INTO `tb_absensi` VALUES (929, 2, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:09:35', '2021-06-06 17:09:35');
INSERT INTO `tb_absensi` VALUES (930, 19, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:09:35', '2021-06-06 17:09:35');
INSERT INTO `tb_absensi` VALUES (931, 1, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:09:44', '2021-06-06 17:09:44');
INSERT INTO `tb_absensi` VALUES (932, 2, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:09:44', '2021-06-06 17:09:44');
INSERT INTO `tb_absensi` VALUES (933, 19, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:09:44', '2021-06-06 17:09:44');
INSERT INTO `tb_absensi` VALUES (934, 3, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:09:59', '2021-06-06 17:09:59');
INSERT INTO `tb_absensi` VALUES (935, 9, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:09:59', '2021-06-06 17:09:59');
INSERT INTO `tb_absensi` VALUES (936, 12, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:09:59', '2021-06-06 17:09:59');
INSERT INTO `tb_absensi` VALUES (937, 15, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:09:59', '2021-06-06 17:09:59');
INSERT INTO `tb_absensi` VALUES (938, 20, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:09:59', '2021-06-06 17:09:59');
INSERT INTO `tb_absensi` VALUES (939, 3, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:10:10', '2021-06-06 17:10:10');
INSERT INTO `tb_absensi` VALUES (940, 9, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:10:10', '2021-06-06 17:10:10');
INSERT INTO `tb_absensi` VALUES (941, 12, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:10:10', '2021-06-06 17:10:10');
INSERT INTO `tb_absensi` VALUES (942, 15, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:10:10', '2021-06-06 17:10:10');
INSERT INTO `tb_absensi` VALUES (943, 20, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:10:10', '2021-06-06 17:10:10');
INSERT INTO `tb_absensi` VALUES (944, 3, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:10:22', '2021-06-06 17:10:22');
INSERT INTO `tb_absensi` VALUES (945, 9, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:10:22', '2021-06-06 17:10:22');
INSERT INTO `tb_absensi` VALUES (946, 12, 2, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:10:22', '2021-06-06 17:10:22');
INSERT INTO `tb_absensi` VALUES (947, 15, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:10:22', '2021-06-06 17:10:22');
INSERT INTO `tb_absensi` VALUES (948, 20, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:10:22', '2021-06-06 17:10:22');
INSERT INTO `tb_absensi` VALUES (949, 3, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:10:35', '2021-06-06 17:10:35');
INSERT INTO `tb_absensi` VALUES (950, 9, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:10:35', '2021-06-06 17:10:35');
INSERT INTO `tb_absensi` VALUES (951, 12, 3, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:10:35', '2021-06-06 17:10:35');
INSERT INTO `tb_absensi` VALUES (952, 15, 2, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:10:35', '2021-06-06 17:10:35');
INSERT INTO `tb_absensi` VALUES (953, 20, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:10:35', '2021-06-06 17:10:35');
INSERT INTO `tb_absensi` VALUES (954, 3, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:10:48', '2021-06-06 17:10:48');
INSERT INTO `tb_absensi` VALUES (955, 9, 2, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:10:48', '2021-06-06 17:10:48');
INSERT INTO `tb_absensi` VALUES (956, 12, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:10:48', '2021-06-06 17:10:48');
INSERT INTO `tb_absensi` VALUES (957, 15, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:10:48', '2021-06-06 17:10:48');
INSERT INTO `tb_absensi` VALUES (958, 20, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:10:48', '2021-06-06 17:10:48');
INSERT INTO `tb_absensi` VALUES (959, 3, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:10:59', '2021-06-06 17:10:59');
INSERT INTO `tb_absensi` VALUES (960, 9, 2, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:10:59', '2021-06-06 17:10:59');
INSERT INTO `tb_absensi` VALUES (961, 12, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:10:59', '2021-06-06 17:10:59');
INSERT INTO `tb_absensi` VALUES (962, 15, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:10:59', '2021-06-06 17:10:59');
INSERT INTO `tb_absensi` VALUES (963, 20, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:10:59', '2021-06-06 17:10:59');
INSERT INTO `tb_absensi` VALUES (964, 4, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:11:47', '2021-06-06 17:11:47');
INSERT INTO `tb_absensi` VALUES (965, 6, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:11:47', '2021-06-06 17:11:47');
INSERT INTO `tb_absensi` VALUES (966, 10, 2, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:11:47', '2021-06-06 17:11:47');
INSERT INTO `tb_absensi` VALUES (967, 16, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:11:47', '2021-06-06 17:11:47');
INSERT INTO `tb_absensi` VALUES (968, 4, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:11:56', '2021-06-06 17:11:56');
INSERT INTO `tb_absensi` VALUES (969, 6, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:11:56', '2021-06-06 17:11:56');
INSERT INTO `tb_absensi` VALUES (970, 10, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:11:56', '2021-06-06 17:11:56');
INSERT INTO `tb_absensi` VALUES (971, 16, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:11:56', '2021-06-06 17:11:56');
INSERT INTO `tb_absensi` VALUES (972, 4, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:12:05', '2021-06-06 17:12:05');
INSERT INTO `tb_absensi` VALUES (973, 6, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:12:05', '2021-06-06 17:12:05');
INSERT INTO `tb_absensi` VALUES (974, 10, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:12:05', '2021-06-06 17:12:05');
INSERT INTO `tb_absensi` VALUES (975, 16, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:12:05', '2021-06-06 17:12:05');
INSERT INTO `tb_absensi` VALUES (976, 4, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:12:33', '2021-06-06 17:12:33');
INSERT INTO `tb_absensi` VALUES (977, 6, 2, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:12:33', '2021-06-06 17:12:33');
INSERT INTO `tb_absensi` VALUES (978, 10, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:12:33', '2021-06-06 17:12:33');
INSERT INTO `tb_absensi` VALUES (979, 16, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:12:33', '2021-06-06 17:12:33');
INSERT INTO `tb_absensi` VALUES (980, 4, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:12:46', '2021-06-06 17:12:46');
INSERT INTO `tb_absensi` VALUES (981, 6, 3, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:12:46', '2021-06-06 17:12:46');
INSERT INTO `tb_absensi` VALUES (982, 10, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:12:46', '2021-06-06 17:12:46');
INSERT INTO `tb_absensi` VALUES (983, 16, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:12:46', '2021-06-06 17:12:46');
INSERT INTO `tb_absensi` VALUES (984, 4, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:12:54', '2021-06-06 17:12:54');
INSERT INTO `tb_absensi` VALUES (985, 6, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:12:54', '2021-06-06 17:12:54');
INSERT INTO `tb_absensi` VALUES (986, 10, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:12:54', '2021-06-06 17:12:54');
INSERT INTO `tb_absensi` VALUES (987, 16, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:12:54', '2021-06-06 17:12:54');
INSERT INTO `tb_absensi` VALUES (988, 5, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:13:14', '2021-06-06 17:13:14');
INSERT INTO `tb_absensi` VALUES (989, 8, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:13:14', '2021-06-06 17:13:14');
INSERT INTO `tb_absensi` VALUES (990, 11, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:13:14', '2021-06-06 17:13:14');
INSERT INTO `tb_absensi` VALUES (991, 14, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:13:14', '2021-06-06 17:13:14');
INSERT INTO `tb_absensi` VALUES (992, 17, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:13:14', '2021-06-06 17:13:14');
INSERT INTO `tb_absensi` VALUES (993, 18, 1, 0, NULL, 'juni-2021', '2021-06-01', '00:00:00', '00:00:00', '2021-06-06 17:13:14', '2021-06-06 17:13:14');
INSERT INTO `tb_absensi` VALUES (994, 5, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:13:26', '2021-06-06 17:13:26');
INSERT INTO `tb_absensi` VALUES (995, 8, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:13:26', '2021-06-06 17:13:26');
INSERT INTO `tb_absensi` VALUES (996, 11, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:13:26', '2021-06-06 17:13:26');
INSERT INTO `tb_absensi` VALUES (997, 14, 1, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:13:26', '2021-06-06 17:13:26');
INSERT INTO `tb_absensi` VALUES (998, 17, 2, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:13:26', '2021-06-06 17:13:26');
INSERT INTO `tb_absensi` VALUES (999, 18, 2, 0, NULL, 'juni-2021', '2021-06-02', '00:00:00', '00:00:00', '2021-06-06 17:13:26', '2021-06-06 17:13:26');
INSERT INTO `tb_absensi` VALUES (1000, 5, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:13:41', '2021-06-06 17:13:41');
INSERT INTO `tb_absensi` VALUES (1001, 8, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:13:41', '2021-06-06 17:13:41');
INSERT INTO `tb_absensi` VALUES (1002, 11, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:13:41', '2021-06-06 17:13:41');
INSERT INTO `tb_absensi` VALUES (1003, 14, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:13:41', '2021-06-06 17:13:41');
INSERT INTO `tb_absensi` VALUES (1004, 17, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:13:41', '2021-06-06 17:13:41');
INSERT INTO `tb_absensi` VALUES (1005, 18, 1, 0, NULL, 'juni-2021', '2021-06-03', '00:00:00', '00:00:00', '2021-06-06 17:13:41', '2021-06-06 17:13:41');
INSERT INTO `tb_absensi` VALUES (1006, 5, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:14:03', '2021-06-06 17:14:03');
INSERT INTO `tb_absensi` VALUES (1007, 8, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:14:03', '2021-06-06 17:14:03');
INSERT INTO `tb_absensi` VALUES (1008, 11, 4, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:14:03', '2021-06-06 17:14:03');
INSERT INTO `tb_absensi` VALUES (1009, 14, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:14:03', '2021-06-06 17:14:03');
INSERT INTO `tb_absensi` VALUES (1010, 17, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:14:03', '2021-06-06 17:14:03');
INSERT INTO `tb_absensi` VALUES (1011, 18, 1, 0, NULL, 'juni-2021', '2021-06-04', '00:00:00', '00:00:00', '2021-06-06 17:14:03', '2021-06-06 17:14:03');
INSERT INTO `tb_absensi` VALUES (1012, 5, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:14:18', '2021-06-06 17:14:18');
INSERT INTO `tb_absensi` VALUES (1013, 8, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:14:18', '2021-06-06 17:14:18');
INSERT INTO `tb_absensi` VALUES (1014, 11, 2, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:14:18', '2021-06-06 17:14:18');
INSERT INTO `tb_absensi` VALUES (1015, 14, 3, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:14:18', '2021-06-06 17:14:18');
INSERT INTO `tb_absensi` VALUES (1016, 17, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:14:18', '2021-06-06 17:14:18');
INSERT INTO `tb_absensi` VALUES (1017, 18, 1, 0, NULL, 'juni-2021', '2021-06-05', '00:00:00', '00:00:00', '2021-06-06 17:14:18', '2021-06-06 17:14:18');
INSERT INTO `tb_absensi` VALUES (1018, 5, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:14:27', '2021-06-06 17:14:27');
INSERT INTO `tb_absensi` VALUES (1019, 8, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:14:27', '2021-06-06 17:14:27');
INSERT INTO `tb_absensi` VALUES (1020, 11, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:14:27', '2021-06-06 17:14:27');
INSERT INTO `tb_absensi` VALUES (1021, 14, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:14:27', '2021-06-06 17:14:27');
INSERT INTO `tb_absensi` VALUES (1022, 17, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:14:27', '2021-06-06 17:14:27');
INSERT INTO `tb_absensi` VALUES (1023, 18, 1, 0, NULL, 'juni-2021', '2021-06-06', '00:00:00', '00:00:00', '2021-06-06 17:14:27', '2021-06-06 17:14:27');
INSERT INTO `tb_absensi` VALUES (1024, 3, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-07 03:09:46', '2021-06-07 03:09:46');
INSERT INTO `tb_absensi` VALUES (1025, 9, 2, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-07 03:09:46', '2021-06-07 03:09:46');
INSERT INTO `tb_absensi` VALUES (1026, 12, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-07 03:09:46', '2021-06-07 03:09:46');
INSERT INTO `tb_absensi` VALUES (1027, 15, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-07 03:09:46', '2021-06-07 03:09:46');
INSERT INTO `tb_absensi` VALUES (1028, 20, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-07 03:09:46', '2021-06-07 03:09:46');
INSERT INTO `tb_absensi` VALUES (1029, 4, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:11:45', '2021-06-08 02:11:45');
INSERT INTO `tb_absensi` VALUES (1030, 6, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:11:45', '2021-06-08 02:11:45');
INSERT INTO `tb_absensi` VALUES (1031, 10, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:11:45', '2021-06-08 02:11:45');
INSERT INTO `tb_absensi` VALUES (1032, 16, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:11:45', '2021-06-08 02:11:45');
INSERT INTO `tb_absensi` VALUES (1034, 5, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:11:59', '2021-06-08 02:11:59');
INSERT INTO `tb_absensi` VALUES (1035, 8, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:11:59', '2021-06-08 02:11:59');
INSERT INTO `tb_absensi` VALUES (1036, 11, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:11:59', '2021-06-08 02:11:59');
INSERT INTO `tb_absensi` VALUES (1037, 14, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:11:59', '2021-06-08 02:11:59');
INSERT INTO `tb_absensi` VALUES (1038, 17, 2, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:11:59', '2021-06-08 02:11:59');
INSERT INTO `tb_absensi` VALUES (1039, 18, 2, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:11:59', '2021-06-08 02:11:59');
INSERT INTO `tb_absensi` VALUES (1040, 1, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:12:20', '2021-06-08 02:12:20');
INSERT INTO `tb_absensi` VALUES (1041, 2, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:12:20', '2021-06-08 02:12:20');
INSERT INTO `tb_absensi` VALUES (1042, 19, 1, 0, NULL, 'juni-2021', '2021-06-07', '00:00:00', '00:00:00', '2021-06-08 02:12:20', '2021-06-08 02:12:20');
INSERT INTO `tb_absensi` VALUES (1043, 3, 1, 0, NULL, 'juni-2021', '2021-06-08', '00:00:00', '00:00:00', '2021-06-08 06:19:34', '2021-06-08 06:19:34');
INSERT INTO `tb_absensi` VALUES (1044, 9, 1, 0, NULL, 'juni-2021', '2021-06-08', '00:00:00', '00:00:00', '2021-06-08 06:19:34', '2021-06-08 06:19:34');
INSERT INTO `tb_absensi` VALUES (1045, 12, 1, 0, NULL, 'juni-2021', '2021-06-08', '00:00:00', '00:00:00', '2021-06-08 06:19:34', '2021-06-08 06:19:34');
INSERT INTO `tb_absensi` VALUES (1046, 15, 1, 0, NULL, 'juni-2021', '2021-06-08', '00:00:00', '00:00:00', '2021-06-08 06:19:34', '2021-06-08 06:19:34');
INSERT INTO `tb_absensi` VALUES (1047, 20, 1, 0, NULL, 'juni-2021', '2021-06-08', '00:00:00', '00:00:00', '2021-06-08 06:19:34', '2021-06-08 06:19:34');
INSERT INTO `tb_absensi` VALUES (1048, 103, 1, 0, NULL, 'juni-2021', '2021-06-08', '00:00:00', '00:00:00', '2021-06-08 06:19:34', '2021-06-08 06:19:34');

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
-- Table structure for tb_departement
-- ----------------------------
DROP TABLE IF EXISTS `tb_departement`;
CREATE TABLE `tb_departement`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_departement
-- ----------------------------
INSERT INTO `tb_departement` VALUES (8, 'Monkey Forest', '2021-04-27 07:51:58', '2021-04-27 09:05:21');
INSERT INTO `tb_departement` VALUES (9, 'UBUD', '2021-04-27 09:05:49', '2021-04-27 09:05:49');
INSERT INTO `tb_departement` VALUES (10, 'canggu', '2021-04-27 09:06:06', '2021-04-27 09:06:06');
INSERT INTO `tb_departement` VALUES (20, 'Office', '2021-06-06 14:21:32', '2021-06-06 14:21:32');

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
  `pot_bpjs` double NULL DEFAULT 0,
  `transportasi` double NULL DEFAULT 0,
  `uang_overtime` double NULL DEFAULT 0,
  `total` double NULL DEFAULT 0,
  `jumlah_overtime` double NULL DEFAULT 0,
  `jumlah_kehadiran` double NOT NULL DEFAULT 0,
  `periode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status_gaji` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tgl_salary` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_salary
-- ----------------------------
INSERT INTO `tb_salary` VALUES (87, 19, 5000000, NULL, NULL, 0, 5000000, 0, 0, 'Mei-2021', 'Staff', 'Dibayar', '2021-06-07', '2021-06-07 00:30:10', '2021-06-07 00:30:10', NULL);
INSERT INTO `tb_salary` VALUES (88, 4, 3500000, NULL, NULL, 0, 3500000, 0, 0, 'Mei-2021', 'Staff', 'Dibayar', '2021-06-07', '2021-06-07 00:30:22', '2021-06-07 00:30:22', NULL);
INSERT INTO `tb_salary` VALUES (89, 5, 3500000, NULL, NULL, 0, 3500000, 0, 0, 'Mei-2021', 'Staff', 'Dibayar', '2021-06-07', '2021-06-07 00:30:31', '2021-06-07 00:30:31', NULL);
INSERT INTO `tb_salary` VALUES (90, 19, 5000000, 150000, 0, 0, 4850000, 0, 0, 'Juni-2021', 'Staff', 'Dibayar', '2021-06-07', '2021-06-07 00:31:04', '2021-06-07 00:31:04', NULL);
INSERT INTO `tb_salary` VALUES (91, 4, 3500000, 150000, 0, 0, 3350000, 0, 0, 'Juni-2021', 'Staff', 'Dibayar', '2021-06-07', '2021-06-07 00:31:46', '2021-06-07 00:31:46', NULL);
INSERT INTO `tb_salary` VALUES (92, 3, 600000, NULL, NULL, 25000, 725000, 5, 0, 'Juni-2021', 'Daily Worker', 'Dibayar', '2021-06-07', '2021-06-07 00:33:20', '2021-06-07 00:33:20', NULL);
INSERT INTO `tb_salary` VALUES (93, 2, 5000000, 150000, 100000, 25000, 5200000, 10, 0, 'Juni-2021', 'Staff', 'Dibayar', '2021-06-07', '2021-06-07 03:11:46', '2021-06-07 03:11:46', NULL);
INSERT INTO `tb_salary` VALUES (94, 12, 500000, NULL, NULL, 0, 500000, 0, 0, 'Juni-2021', 'Daily Worker', 'Dibayar', '2021-06-07', '2021-06-07 03:12:24', '2021-06-07 03:12:24', NULL);
INSERT INTO `tb_salary` VALUES (95, 17, 500000, NULL, NULL, 0, 500000, 0, 0, 'Juni-2021', 'Daily Worker', 'Dibayar', '2021-06-08', '2021-06-08 06:27:22', '2021-06-08 06:27:22', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_staff
-- ----------------------------
INSERT INTO `tb_staff` VALUES (1, 11, 20, 26, 'PUTU BENNY ADNYANA', '1988-11-16', 'Jl Graha Wisata 3 no 93. Sidakarya', '2016-07-07', '087222939912', 'img/uploads/profile/7eaf6200aa36ab2c6da9d21e2dc5a381.jpg', '2021-04-28 03:23:05', '2021-06-06 14:21:50', NULL);
INSERT INTO `tb_staff` VALUES (2, 12, 20, 32, 'I WAYAN SUDARTA', '1986-05-07', 'Jl Pasek Dewata 19', '2014-05-21', '087123929910', NULL, '2021-05-14 05:10:18', '2021-06-06 14:22:00', NULL);
INSERT INTO `tb_staff` VALUES (3, 9, 8, NULL, 'DEWA AYU PUTRI NOVITA SARI', '1999-11-25', 'PURI GADING JIMBARAN', '2018-01-02', '085738180306', NULL, '2021-01-02 14:47:08', '2021-03-03 13:38:40', NULL);
INSERT INTO `tb_staff` VALUES (4, 8, 9, 33, 'I KADEK ADI SWADNYANA', '1999-05-16', 'SIDAKARYA', '2018-01-02', '098765799765', NULL, '2021-03-03 12:39:08', '2021-05-31 11:50:23', NULL);
INSERT INTO `tb_staff` VALUES (5, 8, 10, 34, 'KADEK SURYA ADI', '1999-11-11', 'PRATAMA,NUSA DUA', '2018-02-05', '089765468756', NULL, '2021-03-03 12:40:22', '2021-06-05 06:33:11', NULL);
INSERT INTO `tb_staff` VALUES (6, 9, 9, NULL, 'I PUTU DIKA ADHITIYA', '1997-02-08', 'TAMAN GIRI NUSA DUA', '2019-02-16', '0896467865', NULL, '2021-03-03 12:41:39', '2021-05-31 11:46:20', NULL);
INSERT INTO `tb_staff` VALUES (8, 10, 10, NULL, 'SIGIT PRABOWO', '1998-05-31', 'JL. PRATAMA GANG DAMAI, NUSA DUA', '2018-10-03', '089765678987', NULL, '2021-03-03 13:04:10', '2021-06-05 06:32:25', NULL);
INSERT INTO `tb_staff` VALUES (9, 9, 8, NULL, 'I WAYAN ARIMBAWA', '1997-07-08', 'SAWANGAN NUSA DUA', '2019-09-08', '087876543541', NULL, '2021-03-03 13:05:16', '2021-03-03 13:05:16', NULL);
INSERT INTO `tb_staff` VALUES (10, 9, 9, NULL, 'NI KADEK APRIANTINI', '1996-06-07', 'UNGASAN', '2019-08-28', '087654991005', NULL, '2021-03-03 13:06:38', '2021-03-03 13:15:00', NULL);
INSERT INTO `tb_staff` VALUES (11, 9, 10, NULL, 'DINDA NOVIA RESMITA', '1999-11-18', 'BALANGAN, UNGASAN', '2019-07-31', '087897064531', NULL, '2021-03-03 13:07:45', '2021-03-03 13:07:45', NULL);
INSERT INTO `tb_staff` VALUES (12, 9, 8, NULL, 'Made Sarya', '1998-02-08', 'JIMBARAN', '2018-02-08', '085678754231', NULL, '2021-03-03 13:11:11', '2021-05-31 11:46:03', NULL);
INSERT INTO `tb_staff` VALUES (14, 9, 10, NULL, 'KADEK TEJA DWIPUTA', '1997-08-27', 'PENYARIKAN NUSA DUA', '2019-08-31', '089065778910', NULL, '2021-03-03 13:13:24', '2021-05-31 11:46:59', NULL);
INSERT INTO `tb_staff` VALUES (15, 9, 8, NULL, 'I KADEK ADY PRAYOGA', '1998-08-21', 'PENYARIKAN, NUSA DUA', '2020-02-08', '0857634487765', NULL, '2021-03-03 13:14:39', '2021-03-03 13:14:39', NULL);
INSERT INTO `tb_staff` VALUES (16, 9, 9, NULL, 'I MADE SANDITYA PRAMANA', '1993-04-01', 'DENPASAR', '2019-12-01', '089776543675', NULL, '2021-04-05 16:48:52', '2021-04-05 16:48:52', NULL);
INSERT INTO `tb_staff` VALUES (17, 9, 10, NULL, 'VIVIN CRISMA PUTRI', '1999-11-05', 'TAMAN GRIYA JIMBARAN', '2019-01-07', '087986475434', NULL, '2021-04-06 01:12:30', '2021-04-06 01:12:30', NULL);
INSERT INTO `tb_staff` VALUES (18, 9, 10, NULL, 'BILAL SURYA NANDA', '1998-01-01', 'JIMBARAN', '2020-07-04', '087876890765', NULL, '2021-04-07 01:38:59', '2021-05-31 11:46:42', NULL);
INSERT INTO `tb_staff` VALUES (19, 7, 20, 30, 'MADE YUNITA DARMAJI', '1986-02-06', 'Jalan Raya Celuk, Sukawati', '2017-06-16', '081023801', NULL, '2021-04-30 19:03:01', '2021-06-06 14:22:17', NULL);
INSERT INTO `tb_staff` VALUES (20, 8, 8, 31, 'I Ketut Sunastra', '1983-02-21', 'Jalan Pendidikan X no 7C', '2013-06-06', '083091283801', NULL, '2021-05-14 05:06:57', '2021-05-14 05:06:57', NULL);
INSERT INTO `tb_staff` VALUES (103, 9, 8, NULL, 'I Made Adi Swadnyana', '1998-01-07', 'Jl. Pendidikan Gang Baja IV', '2021-06-01', '08968390806', NULL, '2021-06-08 06:18:05', '2021-06-08 06:18:05', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (24, 1, NULL, 'Adi Swadnyana', 'admin1', '$2y$10$XgtwcAVyozCIKXwZNlmTIO.5coTXdcTj4cZ0SlVqjeMpkHvAycdKG', NULL, NULL, '2021-04-27 04:44:17', '2021-04-27 04:44:17', NULL);
INSERT INTO `users` VALUES (26, 1, NULL, 'Putu Benny Adnyana', 'bennyadnyana', '$2y$10$gXCk2ic/jioMMDZlkpUHW.G1ygqY58wzukVSoJD6vEytdnefncjz.', NULL, NULL, '2021-04-28 03:23:05', '2021-05-01 11:56:30', NULL);
INSERT INTO `users` VALUES (30, 4, NULL, 'MADE YUNITA DARMAJI', 'accounting', '$2y$10$QR1DUY.Yz3j1QWtbDj.ju.7okB8n0Rc6RFJf1QaDJL5A/ux67QvM6', NULL, NULL, '2021-05-14 04:06:55', '2021-05-14 04:06:55', NULL);
INSERT INTO `users` VALUES (31, 3, NULL, 'I Ketut Sunastra', 'sunastra', '$2y$10$SqTXBgOnyQL7sLtBK59NCe2L/igjgTgGgNFRu/46Lsjhbx02YjSv6', NULL, NULL, '2021-05-14 05:06:57', '2021-05-14 05:06:57', NULL);
INSERT INTO `users` VALUES (32, 1, NULL, 'I Wayan Sudarta', 'sudarta', '$2y$10$yDubHLIOvsI/yU3FjpFWs.eS5qN0BuK9CFlN7dJCGbxsHjscOmSjC', NULL, NULL, '2021-05-14 05:10:18', '2021-05-14 05:10:18', NULL);
INSERT INTO `users` VALUES (33, 3, NULL, 'I KADEK ADI SWADNYANA', 'adiswadnyana', '$2y$10$QpihRtSxbF//H3j8pbDQ6uVg6lqN9onaGp1DK6RjZgpUiYU08t0Yu', NULL, NULL, '2021-05-31 11:50:23', '2021-05-31 11:50:23', NULL);
INSERT INTO `users` VALUES (34, 3, NULL, 'KADEK SURYA ADI', 'suryaadi', '$2y$10$WO4PSrHjBb1HAw7T1Vck4OgenjALLCDoYSG7hQt3va7jqIL1nOJgG', NULL, NULL, '2021-05-31 11:50:40', '2021-05-31 11:50:40', NULL);

SET FOREIGN_KEY_CHECKS = 1;
