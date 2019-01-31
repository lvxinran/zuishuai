-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydatabase
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `video_info`
--

DROP TABLE IF EXISTS `video_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键(自增长)',
  `video_name` varchar(150) DEFAULT NULL COMMENT '视频名称',
  `video_url` varchar(100) DEFAULT NULL COMMENT '封面图片',
  `video_html` varchar(500) DEFAULT NULL COMMENT '视频html执行元素',
  `video_type_id` int(11) NOT NULL DEFAULT '1' COMMENT '关联typeID',
  `video_del` int(11) DEFAULT '0' COMMENT '是否显示 0显示 1隐藏',
  PRIMARY KEY (`id`),
  KEY `type_idx` (`video_type_id`),
  CONSTRAINT `type` FOREIGN KEY (`video_type_id`) REFERENCES `video_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_info`
--

LOCK TABLES `video_info` WRITE;
/*!40000 ALTER TABLE `video_info` DISABLE KEYS */;
INSERT INTO `video_info` VALUES (5,'世界杯','http://pic1.win4000.com/wallpaper/d/539a54f345eb2.jpg','http://player.youku.com/embed/XMzY2MjIyNjAzMg==',1,0),(11,'dddddkkk','http://image.tianjimedia.com/uploadImages/2014/167/57/8VU41J5GV3EA_1000x500.jpg','asakkk',2,1),(12,'dddddkk','Sa\'skk','asakk',2,1),(13,'casdsaxz','asdzxc','saczasd',2,1),(14,'街舞','www.youku.com','lxr',2,1),(15,'【全场集锦】俄罗斯抢夺世界杯首胜 东道主5-0大胜沙特','https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2851759184,1778776227&fm=11&gp=0.jpg','http://player.youku.com/embed/XMzY2NTE4MTgwNA==',1,0),(16,'吴亦凡诠释年轻我说唱','http://pic2.qiyipic.com/common/lego/20180622/a226231d7c0a4cfb8fb790c2ddcf399c.jpg','http://open.iqiyi.com/developer/player_js/coopPlayerIndex.html?vid=e443471a8696b3b7366e82ea47a53a75&tvId=1126107100&accessToken=2.f22860a2479ad60d8da7697274de9346&appKey=3955c3425820435e86d0f4cdfe56f5e7&appId=1368&height=100%&width=100%',1,0),(17,'黄渤王迅点餐刁难客人','http://pic2.qiyipic.com/common/lego/20180622/c7d2e3fb39ea4b378314d511c636f974.jpg','http://open.iqiyi.com/developer/player_js/coopPlayerIndex.html?vid=df76786b74438db6c75d0a2eb94f3fb6&tvId=1118341300&accessToken=2.f22860a2479ad60d8da7697274de9346&appKey=3955c3425820435e86d0f4cdfe56f5e7&appId=1368&height=100%&width=100%',1,0),(18,'2018年各地高考成绩今起陆续公布','http://img0.imgtn.bdimg.com/it/u=1366599976,1459741802&fm=27&gp=0.jpg','http://open.iqiyi.com/developer/player_js/coopPlayerIndex.html?vid=a09658b0023df4b12382a99169b255aa&tvId=1126991500&accessToken=2.f22860a2479ad60d8da7697274de9346&appKey=3955c3425820435e86d0f4cdfe56f5e7&appId=1368&height=100%&width=100%',1,0),(19,'《中餐厅2》杀青王俊凯抹眼泪','https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3122896122,207580367&fm=27&gp=0.jpg','http://open.iqiyi.com/developer/player_js/coopPlayerIndex.html?vid=a09658b0023df4b12382a99169b255aa&tvId=1126991500&accessToken=2.f22860a2479ad60d8da7697274de9346&appKey=3955c3425820435e86d0f4cdfe56f5e7&appId=1368&height=100%&width=100%',1,0),(20,'里奥梅西，这个C罗一生的天敌，在职业足球射杀无数','http://m.qiyipic.com/u7/image/20180622/38/e1/uv_3080698867_m_601_180_101.jpg','http://open.iqiyi.com/developer/player_js/coopPlayerIndex.html?vid=0de0e67741179b26a03ae18605898a31&tvId=18843881809&accessToken=2.f22860a2479ad60d8da7697274de9346&appKey=3955c3425820435e86d0f4cdfe56f5e7&appId=1368&height=100%&width=100%',1,0),(21,'聊聊撒打开','as是打算','asdasdas',1,1),(22,'何炅变黄磊专属提词器','http://pic1.qiyipic.com/common/lego/20180624/bb8ad230f4e441e2a1988968ea471588.jpg','http://open.iqiyi.com/developer/player_js/coopPlayerIndex.html?vid=2faaf730320ec669dfefda593da43bea&tvId=1130107900&accessToken=2.f22860a2479ad60d8da7697274de9346&appKey=3955c3425820435e86d0f4cdfe56f5e7&appId=1368&height=100%&width=100%',1,0);
/*!40000 ALTER TABLE `video_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-24 13:07:46
