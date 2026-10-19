-- MySQL dump 10.13  Distrib 5.7.15, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping_platform
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌名称',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌识别关键词，逗号分隔',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值，越小越靠前',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_brand_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'苹果 Apple','苹果,Apple,iPhone,iPad,MacBook,Mac,AirPods,iOS',1,'2026-09-22 10:11:50'),(2,'联想 Lenovo','联想,Lenovo,拯救者,Legion,ThinkPad,小新,天骄,Yoga',2,'2026-09-22 10:11:50'),(3,'耐克 Nike','耐克,Nike,AJ,Air Jordan,AirMax,Jordan,飞人',3,'2026-09-22 10:11:50'),(4,'晨光 M&G','晨光,M&G,MG,文具,中性笔,按动,皮面笔记本,笔',4,'2026-09-22 10:11:50'),(5,'巴黎欧莱雅 L\'Oréal Paris','欧莱雅,L\'Oreal,Loreal,巴黎欧莱雅,护肤,口红,洁面,保湿,面部,保养,套装,精华,面霜,洗面奶',5,'2026-09-22 10:11:50');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '璐?墿杞﹁?褰旾D',
  `user_id` bigint(20) NOT NULL COMMENT '涔板?鐢ㄦ埛ID',
  `product_id` bigint(20) NOT NULL COMMENT '鍟嗗搧ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '鍔犲叆鏃堕棿',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_product` (`user_id`,`product_id`),
  KEY `idx_cart_user` (`user_id`),
  KEY `idx_cart_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='璐?墿杞﹁〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值，越小越靠前',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_category_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'生活用品',1,'2026-09-02 10:54:12'),(2,'运动',2,'2026-09-02 10:54:12'),(3,'数码科技',3,'2026-09-02 10:54:12'),(4,'食品生鲜',4,'2026-09-02 11:14:54'),(5,'服饰鞋包',5,'2026-09-02 11:14:54'),(6,'美妆个护',6,'2026-09-02 11:14:54'),(7,'图书文娱',7,'2026-09-02 11:14:54'),(8,'家居家装',8,'2026-09-02 11:14:54'),(9,'母婴玩具',9,'2026-09-02 11:14:54'),(10,'办公用品',10,'2026-09-02 11:14:54');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '状态ID',
  `status_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态编码：PAID 已支付 / CANCELLED 已取消 / REFUNDING 退款中 / REFUNDED 已退款',
  `status_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态说明',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_status_code` (`status_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'PAID','已支付','订单已支付成功',1),(2,'CANCELLED','已取消','订单已取消',2),(3,'REFUNDING','退款中','退款处理中',3),(4,'REFUNDED','已退款','已退款完成',4);
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号，唯一',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID',
  `buyer_id` bigint(20) NOT NULL COMMENT '买家用户ID',
  `seller_id` bigint(20) NOT NULL COMMENT '卖家用户ID',
  `amount` decimal(10,2) NOT NULL COMMENT '下单金额（商品价格快照）',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PAID' COMMENT '订单状态：PAID 已支付',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`),
  KEY `idx_order_buyer` (`buyer_id`),
  KEY `idx_order_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,'SO17889194623196721',2,3,2,1199.00,'CANCELLED','2026-09-09 10:04:22'),(4,'SO17889194623513515',11,3,2,39.90,'CANCELLED','2026-09-09 10:04:22'),(5,'SO17889194623610299',12,3,2,29.90,'PAID','2026-09-09 10:04:22'),(6,'SO17889194623722153',13,3,2,999.00,'CANCELLED','2026-09-09 10:04:22'),(7,'SO17889194623827707',14,3,2,9.90,'PAID','2026-09-09 10:04:22'),(8,'SO17894538611190825',23,3,2,45.00,'PAID','2026-09-15 14:31:01'),(9,'SO17894577346223780',31,3,2,66.00,'CANCELLED','2026-09-15 15:35:35'),(10,'SO17894577346414301',32,3,2,89.00,'CANCELLED','2026-09-15 15:35:35'),(11,'SO17894607491777911',32,3,2,89.00,'CANCELLED','2026-09-15 16:25:49'),(12,'SO17901348413948757',37,3,2,949.00,'PAID','2026-09-23 11:40:41'),(13,'SO17905642855343308',11,5,2,39.90,'PAID','2026-09-28 10:58:06');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `seller_id` bigint(20) NOT NULL COMMENT '发布人（卖家）用户ID',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品详情描述',
  `price` decimal(10,2) NOT NULL COMMENT '售价',
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品封面图地址',
  `images` json DEFAULT NULL COMMENT '商品图片URL列表(JSON数组)，第一张为封面',
  `category_id` bigint(20) DEFAULT NULL COMMENT '商品分类ID',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌ID',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ONSALE' COMMENT '状态：ONSALE 可售 / RESERVED 已预购 / OUT_OF_STOCK 无库存',
  `listed` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否上架：1 上架 / 0 下架',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_product_seller` (`seller_id`),
  KEY `idx_product_brand` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,2,'羽毛球拍','全碳素一体拍，攻防一体\n      攻防兼备掌控全场',999.00,'/uploads/4de8ec63e6f143569fe6709e92d40624.png','[\"/uploads/4de8ec63e6f143569fe6709e92d40624.png\"]',1,1,'ONSALE',1,'2026-09-01 16:27:32','2026-09-28 09:54:18'),(2,2,'山地自行车','入门硬尾山地车 | 入门无门槛，骑行有质感\n以初心致少年，解锁骑行新可能！2026-黑客350作为入门级硬尾山地车，融合X6铝合金车架与内走线设计，搭配21速变速系统与机械碟刹，以轻便、耐用、易上手的姿态，打破入门骑行的壁垒，助你轻松应对日常通勤与休闲骑行的双重需求，开启骑行之旅第一步。',1199.00,'/uploads/b03a42579f934899ba9488d36e5f50a7.png','[\"/uploads/b03a42579f934899ba9488d36e5f50a7.png\"]',2,NULL,'ONSALE',1,'2026-09-01 16:38:09','2026-09-22 11:34:12'),(3,2,'MJ水杯（限量版）','遇冷变色，渐变由白变红。',99.00,'/uploads/73081f35cad44788b791ad6f16c179b7.jpg','[\"/uploads/73081f35cad44788b791ad6f16c179b7.jpg\"]',1,NULL,'ONSALE',1,'2026-09-01 17:25:30','2026-09-22 11:34:12'),(5,2,'拯救者Y9000P（2024款冰魄白）','拯救者Y9000P（2024款冰魄白）',12999.00,'/uploads/e15905c7432b4d43a746d43f80b74fae.png','[\"/uploads/e15905c7432b4d43a746d43f80b74fae.png\"]',3,2,'ONSALE',1,'2026-09-02 08:41:11','2026-09-22 11:34:12'),(9,2,'赣南脐橙','25.5元一箱8个',25.50,'/uploads/b56f81be3a0b4c48988bbdb6a20ddeb8.jpg','[\"/uploads/b56f81be3a0b4c48988bbdb6a20ddeb8.jpg\"]',4,NULL,'ONSALE',1,'2026-09-02 11:31:09','2026-09-22 11:34:12'),(10,2,'新鲜草莓','一盒独立包装，果实鲜红饱满，色泽艳丽有光泽，果肉紧实，果香清甜浓郁，果蒂翠绿鲜活，果粒完整饱满，新鲜诱人。',39.90,'/uploads/cf5de427dbd640f788049816933304fb.jpg','[\"/uploads/cf5de427dbd640f788049816933304fb.jpg\"]',4,NULL,'ONSALE',1,'2026-09-02 11:33:32','2026-09-22 11:34:12'),(11,2,'云南蓝莓','2盒，果粒圆润饱满，果皮自带天然果霜，果肉紧实，果香醇厚，果型匀称完好，颗粒完整，品质优良。',39.90,'/uploads/b13059ad0e0b4e97a8201ef0dd3948f9.jpg','[\"/uploads/b13059ad0e0b4e97a8201ef0dd3948f9.jpg\"]',4,NULL,'RESERVED',1,'2026-09-02 11:34:56','2026-09-28 10:58:06'),(12,2,'活力28植护洗衣液','瓶体圆润轻便，倾倒顺滑。洗衣液质地通透粘稠，添加香氛精油与洁净酵素，去污力强，可清洁领口顽固污渍。洗护一体，洗涤后衣物蓬松柔软，自带悠长花香，配方亲肤不刺激，适配棉麻、化纤多种面料，机洗手洗都适用。',29.90,'/uploads/aa1e54a21a364b609270301332260b8b.jpg','[\"/uploads/aa1e54a21a364b609270301332260b8b.jpg\"]',1,NULL,'RESERVED',1,'2026-09-02 11:53:21','2026-09-22 11:34:12'),(13,2,'苹果蓝牙耳机AirPods4','个性化空间音频，支持动态头部追踪，单词充电聆听时间最长可达5小时，防尘防水。',999.00,'/uploads/e89877ede8f549d08d2704cdb7086716.jpg','[\"/uploads/e89877ede8f549d08d2704cdb7086716.jpg\"]',3,1,'ONSALE',1,'2026-09-02 11:56:10','2026-09-22 11:34:12'),(14,2,'小青菜','9.9元3捆\n',9.90,'/uploads/f6a4d09fb6014bde96b2367fb908ecbf.png','[\"/uploads/f6a4d09fb6014bde96b2367fb908ecbf.png\"]',4,NULL,'RESERVED',1,'2026-09-07 10:40:26','2026-09-22 11:34:12'),(15,2,'男士休闲大容量双肩背包','全新，防水面料，多隔层设计，可放15.6寸笔记本电脑，日常通勤、短途旅行都适用。肩带加厚不勒肩。',299.00,'/uploads/85fc5aa0264f4ead822ddde954d2ca3b.png','[\"/uploads/85fc5aa0264f4ead822ddde954d2ca3b.png\"]',5,NULL,'ONSALE',1,'2026-09-15 11:36:21','2026-09-22 11:34:12'),(16,2,'经典百搭小白鞋（42码）','干净无磨损，百搭款，配牛仔裤、休闲裤都好看。尺码合适再拍，售出不退换。',129.00,'/uploads/ab9c7211fae747f1b745e15687da73f4.png','[\"/uploads/ab9c7211fae747f1b745e15687da73f4.png\"]',5,NULL,'ONSALE',1,'2026-09-15 11:36:22','2026-09-22 11:34:12'),(17,2,'简约通勤单肩斜挎包','软皮质感，隔层合理，能装手机、钱包、雨伞和小平板。五金光亮无氧化，背带可调节，通勤出街都方便。',69.00,'/uploads/15c818612c684295ace10998b6a983a2.png','[\"/uploads/15c818612c684295ace10998b6a983a2.png\"]',5,NULL,'ONSALE',1,'2026-09-15 11:36:24','2026-09-22 11:34:12'),(18,2,'丝绒哑光保湿口红（豆沙色）','保质期到2027年，正品保证，膏体完好。',99.00,'/uploads/26bc357a42ea4fe5aafd3cdf03ae6f6f.png','[\"/uploads/26bc357a42ea4fe5aafd3cdf03ae6f6f.png\"]',6,5,'ONSALE',1,'2026-09-15 11:36:28','2026-09-22 11:34:12'),(19,2,'氨基酸温和洁面乳 150ml','敏感肌可用，泡沫细腻，洗完不紧绷。自用囤多了转出一瓶，塑封完整，保质期到2027年6月。',39.00,'/uploads/93160affc5a5420cba432a2fe5276594.jpg','[\"/uploads/93160affc5a5420cba432a2fe5276594.jpg\"]',6,5,'ONSALE',1,'2026-09-15 11:36:30','2026-09-22 11:34:12'),(20,2,'便携化妆刷套装（8支装）','含散粉刷、眼影刷、遮瑕刷等8支，刷毛柔软不扎脸，送收纳刷包。',35.00,'/uploads/173294da73d549b9a503f7cf324c1159.png','[\"/uploads/173294da73d549b9a503f7cf324c1159.png\"]',6,5,'ONSALE',1,'2026-09-15 11:36:33','2026-09-22 11:34:12'),(21,2,'经典科幻小说精装合集','含三部经典科幻长篇，硬壳精装，书页干净无划线、无折角。原价一百多，现低价转出，适合收藏和通勤阅读。',58.00,'/uploads/d765306e14af4cde913fb61bb5cbc3e3.jpg','[\"/uploads/d765306e14af4cde913fb61bb5cbc3e3.jpg\"]',7,NULL,'ONSALE',1,'2026-09-15 11:36:38','2026-09-22 11:34:12'),(22,2,'文艺手账本 A5（200页）','封面为雾面PU材质，内页是100g米黄道林纸，不透墨。含月计划、方格和空白页，全新未拆封，自用送礼均可。',26.00,'/uploads/3da1d72cad264249b2149d540f7e508c.jpg','[\"/uploads/3da1d72cad264249b2149d540f7e508c.jpg\"]',7,NULL,'ONSALE',1,'2026-09-15 11:36:40','2026-09-22 11:34:12'),(23,2,'聚会桌游卡牌套装','适合3-8人聚会，规则简单，五分钟上手。卡牌齐全无缺件，不影响使用，送说明书和收纳袋。',45.00,'/uploads/9d64e268d3f54505938d9fe883472500.jpg','[\"/uploads/9d64e268d3f54505938d9fe883472500.jpg\"]',7,NULL,'RESERVED',1,'2026-09-15 11:36:44','2026-09-22 11:34:12'),(24,2,'北欧风陶瓷马克杯 350ml','釉面光滑，杯口圆润，微波炉和洗碗机都可用。家里杯子太多转出，全新仅拆封检查，无磕碰、无划痕。',22.00,'/uploads/067ee81d18494d3cb93adb87ef6fbbd2.png','[\"/uploads/067ee81d18494d3cb93adb87ef6fbbd2.png\"]',1,NULL,'ONSALE',1,'2026-09-15 11:36:45','2026-09-22 11:34:12'),(25,2,'简约护眼床头台灯','三档色温、无极调光，触控开关，USB供电。灯臂可弯折，看书、起夜都合适，功能完好，配件齐全。',39.00,'/uploads/096b4e0948a14c73b828cf8dc9f1a66b.png','[\"/uploads/096b4e0948a14c73b828cf8dc9f1a66b.png\"]',8,NULL,'ONSALE',1,'2026-09-15 11:36:49','2026-09-22 11:34:12'),(26,2,'加厚亚麻抱枕套 45×45cm（一对）','一对装，仅枕套不含枕芯。隐形拉链设计，可拆洗，面料厚实不起球。颜色为浅灰色，与沙发、床品都好搭。',49.00,'/uploads/79d1d7b51829411d99ee34dbe90913c8.jpg','[\"/uploads/79d1d7b51829411d99ee34dbe90913c8.jpg\"]',8,NULL,'ONSALE',1,'2026-09-15 11:36:52','2026-09-22 11:34:12'),(27,2,'幼儿启蒙绘本套装（10册）','含认知、习惯养成、睡前故事等10册，纸张厚实耐翻，圆角设计不伤手，内页干净。',48.00,'/uploads/2eb447baa3a24109b1c339e8c7737728.jpg','[\"/uploads/2eb447baa3a24109b1c339e8c7737728.jpg\"]',9,NULL,'ONSALE',1,'2026-09-15 11:36:57','2026-09-22 11:34:12'),(28,2,'A5商务皮面笔记本','深棕色PU皮面，180度平摊，160页80g米黄纸，含书签带和插笔位。全新，适合会议记录和日常备忘。',18.00,'/uploads/4224f67e384d4a7ead50866c15de0d15.png','[\"/uploads/4224f67e384d4a7ead50866c15de0d15.png\"]',10,4,'ONSALE',1,'2026-09-15 11:37:00','2026-09-22 11:34:12'),(29,2,'金属按动中性笔套装（0.5mm 6支）','黑色子弹头，书写顺滑不断墨，金属笔身有分量。6支装含备用笔芯，全新未拆封，办公、学习都适用。',15.00,'/uploads/521b3df5398b4530ab95939679885c4f.jpg','[\"/uploads/521b3df5398b4530ab95939679885c4f.jpg\"]',10,4,'ONSALE',1,'2026-09-15 11:37:02','2026-09-22 11:34:12'),(30,2,'桌面多层文件收纳架','四层分格，可放A4文件、杂志、笔记本和小文具，安装简单，结构稳固无松动。',29.00,'/uploads/6ad6528a1e274c4fa465f5a965e927d6.png','[\"/uploads/6ad6528a1e274c4fa465f5a965e927d6.png\"]',10,NULL,'ONSALE',1,'2026-09-15 11:37:03','2026-09-22 11:34:12'),(31,2,'婴儿纯棉连体哈衣（80码）','100%纯棉，A类婴幼儿标准，按扣设计换尿布方便。已洗净消毒，无污渍、无起球。',66.00,'/uploads/29a4c60c4f2e4ae8b4ba21516274265b.png','[\"/uploads/29a4c60c4f2e4ae8b4ba21516274265b.png\"]',9,NULL,'ONSALE',1,'2026-09-15 11:37:49','2026-09-22 11:34:12'),(32,2,'儿童大颗粒益智积木（108粒）','大颗粒圆润无毛刺，适合3岁以上宝宝，锻炼动手和颜色认知。配件齐全，含收纳桶和图纸。',89.00,'/uploads/b472d10a37584dbe8f95fa7eb4d99dc4.jpg','[\"/uploads/b472d10a37584dbe8f95fa7eb4d99dc4.jpg\"]',9,NULL,'ONSALE',1,'2026-09-15 11:37:52','2026-09-22 11:34:12'),(33,2,'面部保养套装','这款面部保养套装售价399元，包含日常护理所需的基础步骤，适合想要简化护肤流程、又希望兼顾效果的你。套装主打温和保湿与肌肤维稳，帮助改善干燥、粗糙等常见问题，让肌肤保持柔软水润的状态。质地清爽不黏腻，早晚使用都无负担，各种肤质均可尝试。作为日常自用或送人都不错。购买前建议先确认自己的肤质是否适合，敏感肌可先在耳后测试。现在下单，给肌肤一份简单又实在的呵护。',399.00,'/uploads/da9138c93c5a4defb7ee317feb94deed.png','[\"/uploads/da9138c93c5a4defb7ee317feb94deed.png\"]',6,5,'ONSALE',1,'2026-09-22 10:30:06','2026-09-22 11:34:12'),(35,2,'Nike Air Force 1 Shadow 女子空军一号运动鞋','Nike Air Force 1 Shadow 女子空军一号运动鞋，以经典空军一号为蓝本，融入层叠设计语言，鞋身线条更显丰富立体。加厚中底搭配双重Swoosh标志，复古又带点俏皮，轻松点亮日常穿搭。无论是牛仔裤、运动裤还是裙装，都能穿出随性时髦感。售价809元，喜欢的朋友建议尽早入手，热门尺码容易售罄，下单前记得确认库存和尺码表哦。',809.00,'/uploads/e0b056bfea1145f69434a47e95f39ce1.png','[\"/uploads/e0b056bfea1145f69434a47e95f39ce1.png\"]',5,3,'ONSALE',1,'2026-09-22 11:01:02','2026-09-22 11:34:12'),(36,2,'Nike Air Force 1 \'07','经典归来，风格由你定义。Nike Air Force 1 \'07 延续标志性低帮轮廓与利落线条，轻松驾驭日常通勤与休闲出街。优质鞋面搭配 Air 缓震配置，脚感舒适，行走自在。简约百搭的设计，无论搭配牛仔裤还是运动裤都很有型。售价 799 元，喜欢的朋友建议尽早入手，热门尺码手慢无。选它，为每一步注入经典态度。',799.00,'/uploads/6c6257d93d0f4522bdc9750de5853ee2.png','[\"/uploads/6c6257d93d0f4522bdc9750de5853ee2.png\"]',5,3,'ONSALE',1,'2026-09-22 11:04:40','2026-09-22 11:34:12'),(37,2,'Nike Air Force 1 Low By 天津 津门虎 专属定制运动鞋','这双Nike Air Force 1 Low By 天津津门虎专属定制款，将经典AF1鞋型与津门虎的球队元素巧妙融合。鞋身细节处点缀专属标识，配色呼应球队气质，既有街头潮流感，也承载着主场情怀。AF1标志性的舒适中底与耐磨橡胶外底，日常穿搭或收藏都很合适。售价949元，定制款数量有限，喜欢的朋友建议尽早入手。下单前请确认尺码，定制类商品通常不支持退换，具体以店铺规则为准。',949.00,'/uploads/cb49e6571f6a4a66be16c19f8ad6d546.png','[\"/uploads/cb49e6571f6a4a66be16c19f8ad6d546.png\", \"/uploads/071877dac60c484cb8421ed4e4ff0d52.png\", \"/uploads/38bde809cdcc40468051a18f52892807.png\"]',5,3,'RESERVED',1,'2026-09-22 11:06:31','2026-09-28 10:59:20'),(39,1,'测试商品','这是一件测试商品',19.90,'/uploads/b39288549f3d4055aede68fefac2fe1c.jpg','[\"/uploads/b39288549f3d4055aede68fefac2fe1c.jpg\"]',1,NULL,'ONSALE',1,'2026-09-28 10:52:09','2026-09-28 11:08:19');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_comment`
--

DROP TABLE IF EXISTS `product_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID',
  `user_id` bigint(20) NOT NULL COMMENT '评论用户ID',
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `idx_comment_product` (`product_id`),
  KEY `idx_comment_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_comment`
--

LOCK TABLES `product_comment` WRITE;
/*!40000 ALTER TABLE `product_comment` DISABLE KEYS */;
INSERT INTO `product_comment` VALUES (1,23,3,'卡牌质量很不错，印刷清晰，纸质后市不容易折，玩法简单，朋友聚会晚特别开心，很满意！','2026-09-15 14:33:13'),(2,14,3,'菜品很新鲜，无虫咬的痕迹','2026-09-15 14:33:51');
/*!40000 ALTER TABLE `product_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '价格记录ID',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID',
  `price_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '售价' COMMENT '价格名称：售价/原价等',
  `price` decimal(10,2) NOT NULL COMMENT '价格金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`id`),
  KEY `idx_product_price_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品价格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price`
--

LOCK TABLES `product_price` WRITE;
/*!40000 ALTER TABLE `product_price` DISABLE KEYS */;
INSERT INTO `product_price` VALUES (1,1,'售价',999.00,'2026-09-02 10:54:12'),(2,2,'售价',1199.00,'2026-09-02 10:54:12'),(3,3,'售价',99.00,'2026-09-02 10:54:12'),(5,5,'售价',12999.00,'2026-09-02 10:54:12'),(12,9,'售价',25.50,'2026-09-02 11:31:09'),(13,10,'售价',29.90,'2026-09-02 11:33:32'),(14,11,'售价',39.90,'2026-09-02 11:34:56'),(15,12,'售价',29.90,'2026-09-02 11:53:21'),(16,13,'售价',999.00,'2026-09-02 11:56:10'),(17,14,'售价',9.90,'2026-09-07 10:40:26'),(18,15,'售价',89.00,'2026-09-15 11:36:21'),(19,16,'售价',129.00,'2026-09-15 11:36:22'),(20,17,'售价',69.00,'2026-09-15 11:36:24'),(21,18,'售价',49.00,'2026-09-15 11:36:28'),(22,19,'售价',39.00,'2026-09-15 11:36:30'),(23,20,'售价',35.00,'2026-09-15 11:36:33'),(24,21,'售价',58.00,'2026-09-15 11:36:38'),(25,22,'售价',26.00,'2026-09-15 11:36:40'),(26,23,'售价',45.00,'2026-09-15 11:36:44'),(27,24,'售价',22.00,'2026-09-15 11:36:45'),(28,25,'售价',75.00,'2026-09-15 11:36:49'),(29,26,'售价',32.00,'2026-09-15 11:36:52'),(30,27,'售价',48.00,'2026-09-15 11:36:57'),(31,28,'售价',18.00,'2026-09-15 11:37:00'),(32,29,'售价',15.00,'2026-09-15 11:37:02'),(33,30,'售价',39.00,'2026-09-15 11:37:03'),(34,31,'售价',29.00,'2026-09-15 11:37:49'),(35,32,'售价',66.00,'2026-09-15 11:37:52'),(36,29,'售价',15.00,'2026-09-15 13:55:25'),(37,31,'售价',29.00,'2026-09-15 14:11:23'),(38,30,'售价',39.00,'2026-09-15 14:12:55'),(39,32,'售价',66.00,'2026-09-15 14:13:10'),(40,28,'售价',18.00,'2026-09-15 14:14:35'),(41,28,'售价',18.00,'2026-09-15 14:14:44'),(42,27,'售价',48.00,'2026-09-15 14:14:57'),(43,26,'售价',32.00,'2026-09-15 14:15:07'),(44,25,'售价',75.00,'2026-09-15 14:15:29'),(45,24,'售价',22.00,'2026-09-15 14:15:48'),(46,23,'售价',45.00,'2026-09-15 14:16:07'),(47,22,'售价',26.00,'2026-09-15 14:16:14'),(48,20,'售价',35.00,'2026-09-15 14:16:32'),(49,19,'售价',39.00,'2026-09-15 14:16:47'),(50,18,'售价',49.00,'2026-09-15 14:17:23'),(51,17,'售价',69.00,'2026-09-15 14:18:29'),(52,16,'售价',129.00,'2026-09-15 14:19:03'),(53,16,'售价',129.00,'2026-09-15 14:19:09'),(54,15,'售价',89.00,'2026-09-15 14:19:39'),(55,32,'售价',66.00,'2026-09-15 14:19:56'),(56,20,'售价',35.00,'2026-09-15 14:22:01'),(57,24,'售价',22.00,'2026-09-15 14:22:59'),(58,31,'售价',66.00,'2026-09-15 14:34:52'),(59,32,'售价',108.00,'2026-09-15 14:34:59'),(60,30,'售价',29.00,'2026-09-15 14:35:08'),(61,26,'售价',49.00,'2026-09-15 14:35:30'),(62,25,'售价',39.00,'2026-09-15 14:35:46'),(63,18,'售价',99.00,'2026-09-15 14:36:09'),(64,15,'售价',299.00,'2026-09-15 14:36:21'),(65,10,'售价',39.90,'2026-09-15 14:36:39'),(66,2,'售价',1199.00,'2026-09-15 14:37:14'),(67,32,'售价',89.00,'2026-09-15 14:37:33'),(68,33,'售价',399.00,'2026-09-22 10:30:06'),(70,35,'售价',809.00,'2026-09-22 11:01:02'),(71,36,'售价',799.00,'2026-09-22 11:04:40'),(72,37,'售价',949.00,'2026-09-22 11:06:31'),(73,1,'售价',888.00,'2026-09-22 11:14:08'),(74,1,'售价',999.00,'2026-09-22 11:14:08'),(75,1,'售价',100.00,'2026-09-22 11:18:03'),(76,37,'售价',949.00,'2026-09-22 11:23:01'),(77,32,'售价',89.00,'2026-09-22 11:23:18'),(81,1,'售价',999.00,'2026-09-22 11:51:29'),(82,37,'售价',949.00,'2026-09-22 11:52:18'),(83,37,'售价',949.00,'2026-09-22 11:52:42'),(84,37,'售价',949.00,'2026-09-22 11:53:52'),(86,39,'售价',19.90,'2026-09-28 10:52:09'),(87,37,'售价',949.00,'2026-09-28 10:59:20'),(88,39,'售价',19.90,'2026-09-28 11:08:19');
/*!40000 ALTER TABLE `product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录用户名，唯一',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'BCrypt 加密后的密码',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER' COMMENT '角色：USER 普通用户 / ADMIN 管理员',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$10$sj37XgD8vHLW4Gu7i/iGJ.1vTUXvT87okFQVX.WlUqijroZ7oFhCe','平台管理员','ADMIN',NULL,'2026-09-01 16:13:50'),(2,'yuqi','$2a$10$0/hNwBi7AT9j.bLXjgCqBumNeOnJNEvX/68NaafAgHQTjJ3S1xGIK','忬柒','USER','\"C:\\Users\\14831\\Pictures\\Screenshots\\丹尼斯.jpg\"','2026-09-01 16:19:21'),(3,'buytest','$2a$10$0/hNwBi7AT9j.bLXjgCqBumNeOnJNEvX/68NaafAgHQTjJ3S1xGIK','测试买家','USER',NULL,'2026-09-09 10:04:15'),(4,'买买买','$2a$10$b1i1EwrkxJ837tCu9ajjheDUgo2qnL2LarnZkVozXl0Lj5uj6vO0.','买买买','USER',NULL,'2026-09-23 11:38:22'),(5,'admin1','$2a$10$B0WqAXOOwIj9.DldsNqAK.VrRudK15AEmUk7HUExVaAP/mA.2Qtg.','admin1','USER',NULL,'2026-09-28 10:52:39');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_change_log`
--

DROP TABLE IF EXISTS `user_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_change_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `change_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '修改类型：INFO 个人信息 / PASSWORD 密码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_change_user` (`user_id`),
  KEY `idx_user_change_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户修改记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_change_log`
--

LOCK TABLES `user_change_log` WRITE;
/*!40000 ALTER TABLE `user_change_log` DISABLE KEYS */;
INSERT INTO `user_change_log` VALUES (3,2,'INFO','2026-09-02 11:37:00');
/*!40000 ALTER TABLE `user_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'shopping_platform'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-12  9:38:25
