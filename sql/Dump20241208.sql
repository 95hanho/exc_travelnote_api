-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: travelnote
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_url` varchar(45) NOT NULL,
  `custom_id_placeholder` varchar(100) DEFAULT NULL,
  `custom_pw_placeholder` varchar(100) DEFAULT NULL,
  `custom_top_title_plain` varchar(100) DEFAULT NULL,
  `custom_top_title_bold` varchar(100) DEFAULT NULL,
  `list_title` varchar(100) DEFAULT NULL,
  `limit_value` int DEFAULT NULL,
  `reflection_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`company_id`,`company_url`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'hanho','아이디','번호 4자리','우리의 여행을 기록하는','TRAVEL NOTE','테스트 노트 입니다.',100,'하루 한 줄, 오늘 하루를 기록해 봅시다~!');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `file_num` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `filePath` varchar(200) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `lecture_idx` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  PRIMARY KEY (`file_num`),
  KEY `company_file_idx` (`company_id`),
  KEY `travelnote_file_idx` (`lecture_idx`),
  KEY `question_file_idx` (`question_id`),
  CONSTRAINT `company_file` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `question_file` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `travelnote_file` FOREIGN KEY (`lecture_idx`) REFERENCES `travelnote` (`lecture_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'travelnote_intro-3eb3e144','https://travelnote.exc.co.kr/assets/travelnote_intro-3eb3e144.png','main_img',1,NULL,NULL),(2,'133731352136505371.jpg','https://travelnote.exc.co.kr/data/img/note/ANSWER-ZL2320241127093604VFAP.png',NULL,NULL,NULL,2),(3,'미션레이스1','https://travelnote.exc.co.kr/data/img/note/QUESTION-98T320231030174903611O.png',NULL,NULL,3,NULL),(4,'미션레이스2','https://travelnote.exc.co.kr/data/img/note/QUESTION-98T320231030174903611O.png',NULL,NULL,3,NULL),(5,'QUESTION-UQGO20230921163615RJOA.jpg','https://travelnote.exc.co.kr/data/img/note/QUESTION-UQGO20230921163615RJOA.jpg',NULL,NULL,4,NULL),(6,'QUESTION-QWH120230921161740NPPM.png','https://travelnote.exc.co.kr/data/img/note/QUESTION-QWH120230921161740NPPM.png',NULL,NULL,5,NULL),(7,'QUESTION-ER7R20231215092154BLFD.PNG','https://travelnote.exc.co.kr/data/img/note/QUESTION-ER7R20231215092154BLFD.PNG',NULL,NULL,6,NULL);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `company_menu_idx` (`company_id`),
  CONSTRAINT `company_menu` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'공지사항','notice',1),(2,'과정소개','program',1),(3,'시간표','schedule',1),(4,'트래블노트 작성','travelnote',1),(5,'Reflection','reflection',1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `content` varchar(8000) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_notice_idx` (`company_id`),
  CONSTRAINT `company_notice` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'[필독] 공지사항을 확인해주세요.','2023-06-30 00:00:00','<p><br></p><p>https://naver.com</p><p><br></p><p><img src=\"/images/sni_0703.jpg\" style=\"background-color: var(--bs-modal-bg) color: var(--bs-modal-color) font-family: var(--bs-body-font-family) font-size: var(--bs-body-font-size) font-weight: var(--bs-body-font-weight) text-align: var(--bs-body-text-align)\"><br></p><p>1. 7월 4일 화요일 집결은&nbsp<span style=\"font-weight: bolder\"><u>8시 50분</u></span>까지, 오늘 처음 버스 탔던&nbsp<span style=\"font-weight: bolder\"><u>서초 사옥</u></span>에서 합니다!</p><p>2. 내일 비가 올 수 있으므로<span style=\"font-weight: bolder\"><u>&nbsp여벌 신발, 여벌 옷 또는 빨리 마르는 옷, 손수건</u></span>&nbsp등을 준비해주세요!<br>&nbsp &nbsp* 우산과 우비는 준비되어 있습니다 :)</p><p><br></p><p><br></p>',1),(2,'테스트공지제목','2023-07-15 00:00:00','테스트테스트테스트',1),(4,'오늘 교육 안내사항','2023-08-14 00:00:00','<p style=\"margin-right: 0px margin-bottom: 0px margin-left: 0px padding: 0px border: 0px font-variant-numeric: inherit font-variant-east-asian: inherit font-variant-alternates: inherit font-variant-position: inherit font-stretch: inherit font-size: 14px line-height: inherit font-family: &quotNoto Sans KR&quot, sans-serif font-optical-sizing: inherit font-kerning: inherit font-feature-settings: inherit font-variation-settings: inherit vertical-align: baseline color: rgb(68, 68, 68)\"><span style=\"margin: 0px padding: 0px border: 0px font: inherit vertical-align: baseline\">혹독한 취준 생활을 거쳐 드디어 어엿한 K-직장인으로 거듭나게 된 아리씨. 합격의 기쁨과 설렘도 잠시,</span></p><p style=\"margin-right: 0px margin-bottom: 0px margin-left: 0px padding: 0px border: 0px font-variant-numeric: inherit font-variant-east-asian: inherit font-variant-alternates: inherit font-variant-position: inherit font-stretch: inherit font-size: 14px line-height: inherit font-family: &quotNoto Sans KR&quot, sans-serif font-optical-sizing: inherit font-kerning: inherit font-feature-settings: inherit font-variation-settings: inherit vertical-align: baseline color: rgb(68, 68, 68)\"><span style=\"margin: 0px padding: 0px border: 0px font: inherit vertical-align: baseline\">첫 출근을 상상하니 머릿속이 새하얘지고 마는데요.</span><br><br></p><p style=\"margin-right: 0px margin-bottom: 0px margin-left: 0px padding: 0px border: 0px font-variant-numeric: inherit font-variant-east-asian: inherit font-variant-alternates: inherit font-variant-position: inherit font-stretch: inherit font-size: 14px line-height: inherit font-family: &quotNoto Sans KR&quot, sans-serif font-optical-sizing: inherit font-kerning: inherit font-feature-settings: inherit font-variation-settings: inherit vertical-align: baseline color: rgb(68, 68, 68)\"><span style=\"margin: 0px padding: 0px border: 0px font: inherit vertical-align: baseline background-color: var(--bs-body-bg) font-size: var(--bs-body-font-size) font-weight: var(--bs-body-font-weight) text-align: var(--bs-body-text-align) color: rgb(50, 52, 56) font-family: Roboto, &ampquotNoto Sans Korean&quot, 돋움, dotum, Arial, sans-serif\">\"뭘 입고 가야 하지? 출근하면 당장 뭐부터 해야 하는 거야? 근데 ‘온보딩’은 대체 무슨 뜻이람...?\"</span></p><p style=\"margin-right: 0px margin-bottom: 0px margin-left: 0px padding: 0px border: 0px font-variant-numeric: inherit font-variant-east-asian: inherit font-variant-alternates: inherit font-variant-position: inherit font-stretch: inherit font-size: 14px line-height: inherit font-family: &quotNoto Sans KR&quot, sans-serif font-optical-sizing: inherit font-kerning: inherit font-feature-settings: inherit font-variation-settings: inherit vertical-align: baseline color: rgb(68, 68, 68)\"><span style=\"margin: 0px padding: 0px border: 0px font: inherit vertical-align: baseline background-color: var(--bs-body-bg) font-size: var(--bs-body-font-size) font-weight: var(--bs-body-font-weight) text-align: var(--bs-body-text-align) color: rgb(50, 52, 56) font-family: Roboto, &ampquotNoto Sans Korean&quot, 돋움, dotum, Arial, sans-serif\"><br></span><span style=\"margin: 0px padding: 0px border: 0px font: inherit vertical-align: baseline\">단정함은 기본, 메다익선, 멍때리기는 금물,<br>햇병아리 직장인을 위한&nbsp</span><span style=\"margin: 0px padding: 0px border: 0px font: inherit vertical-align: baseline\">‘쌩신입 완벽 적응 가이드’&nbsp</span><span style=\"margin: 0px padding: 0px border: 0px font: inherit vertical-align: baseline\">시리즈.</span></p><p style=\"margin-right: 0px margin-bottom: 0px margin-left: 0px padding: 0px border: 0px font-variant-numeric: inherit font-variant-east-asian: inherit font-variant-alternates: inherit font-variant-position: inherit font-stretch: inherit font-size: 14px line-height: inherit font-family: &quotNoto Sans KR&quot, sans-serif font-optical-sizing: inherit font-kerning: inherit font-feature-settings: inherit font-variation-settings: inherit vertical-align: baseline color: rgb(68, 68, 68)\"><span style=\"margin: 0px padding: 0px border: 0px font: inherit vertical-align: baseline\">그 첫 번째 시간으로 오늘은&nbsp</span><span style=\"background-color: var(--bs-body-bg) font-weight: var(--bs-body-font-weight) text-align: var(--bs-body-text-align)\">첫 출근 눈도장 찍는</span><span style=\"font-family: inherit font-size: inherit font-style: inherit font-variant-ligatures: inherit font-variant-caps: inherit font-weight: inherit background-color: var(--bs-body-bg) text-align: var(--bs-body-text-align)\">&nbsp꿀팁을 소</span><span style=\"font-family: inherit font-size: inherit font-style: inherit font-variant-ligatures: inherit font-variant-caps: inherit font-weight: inherit background-color: var(--bs-body-bg) text-align: var(--bs-body-text-align)\">해성인들에게 공유합니다.&nbsp&nbsp</span></p><p style=\"margin-right: 0px margin-bottom: 0px margin-left: 0px padding: 0px border: 0px font-variant-numeric: inherit font-variant-east-asian: inherit font-variant-alternates: inherit font-variant-position: inherit font-stretch: inherit font-size: 14px line-height: inherit font-family: &quotNoto Sans KR&quot, sans-serif font-optical-sizing: inherit font-kerning: inherit font-feature-settings: inherit font-variation-settings: inherit vertical-align: baseline color: rgb(68, 68, 68)\"><br></p><p style=\"margin-right: 0px margin-bottom: 0px margin-left: 0px padding: 0px border: 0px font-variant-numeric: inherit font-variant-east-asian: inherit font-variant-alternates: inherit font-variant-position: inherit font-stretch: inherit font-size: 14px line-height: inherit font-family: &quotNoto Sans KR&quot, sans-serif font-optical-sizing: inherit font-kerning: inherit font-feature-settings: inherit font-variation-settings: inherit vertical-align: baseline color: rgb(68, 68, 68)\"><a href=\"https://www.jobplanet.co.kr/contents/news-4162/\'%EC%8B%A0%EC%9E%85%20%ED%8F%BC%20%EB%AF%B8%EC%B3%A4%EB%8B%A4!\'%20%EC%B2%AB%EC%B6%9C%EA%B7%BC%20%EB%88%88%EB%8F%84%EC%9E%A5%20%EC%B0%8D%EB%8A%94%20%EB%B9%84%EB%B2%95%20%EB%8C%80%EA%B3%B5%EA%B0%9C\" style=\"text-decoration-line: none margin: 0px padding: 0px border: 0px font: inherit vertical-align: baseline background-color: transparent\">\'신입 폼 미쳤다!\' 첫출근 눈도장 찍는 비법 대공개 | 컴퍼니 타임스의 비즈니스 뉴스 | 컴퍼니 타임스 | 잡플래닛 (jobplanet.co.kr)</a><br>* 클릭 시 이동합니다.&nbsp</p>',1);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `contents` varchar(500) DEFAULT NULL,
  `lecture_idx` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travelnote_question_idx` (`lecture_idx`),
  CONSTRAINT `travelnote_question` FOREIGN KEY (`lecture_idx`) REFERENCES `travelnote` (`lecture_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'안녕하세요~','TEXT','안녕하세요!!!sasdads',3),(2,'당신의 이미지를 보여주세요!','IMG',NULL,3),(3,'나의 유형과 특징을 작성해주세요.','TEXT',NULL,4),(4,'질문 2 ~ 두개가 나와야해!!','TEXT',NULL,4),(5,'제작한 비전 기록물의 사진을 업로드 해주세요.','IMG',NULL,5),(6,'활동 소감을 적어주세요.','TEXT',NULL,5),(7,'asfdsasdfsdaffdsasfadsfda','TEXT',NULL,6),(8,'ㅁㄴㅇㄹㅇㅁㄴㄹㅇㄴㅁㄹㄹㅇㅁㄹㄴㅁㅇ','TEXT',NULL,6);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reflection`
--

DROP TABLE IF EXISTS `reflection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reflection` (
  `sc_id` int NOT NULL AUTO_INCREMENT,
  `reflection_content` varchar(300) DEFAULT NULL,
  `s_id` int DEFAULT NULL,
  PRIMARY KEY (`sc_id`),
  KEY `schedule_reflection_idx` (`s_id`),
  CONSTRAINT `schedule_reflection` FOREIGN KEY (`s_id`) REFERENCES `schedule` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reflection`
--

LOCK TABLES `reflection` WRITE;
/*!40000 ALTER TABLE `reflection` DISABLE KEYS */;
INSERT INTO `reflection` VALUES (1,'asdsdsa',1);
/*!40000 ALTER TABLE `reflection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `html_raw` varchar(3000) DEFAULT NULL,
  `sc_date` datetime DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `reflection_content` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `company_schedule_idx` (`company_id`),
  CONSTRAINT `company_schedule` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-01 00:00:00',1,'13211321'),(2,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-02 00:00:00',1,NULL),(3,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-03 00:00:00',1,NULL),(4,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-04 00:00:00',1,NULL),(5,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-05 00:00:00',1,NULL),(6,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-06 00:00:00',1,NULL),(7,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-07 00:00:00',1,NULL),(8,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-08 00:00:00',1,NULL),(9,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-09 00:00:00',1,NULL),(10,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-10 00:00:00',1,NULL),(11,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-11 00:00:00',1,NULL),(12,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-12 00:00:00',1,NULL),(13,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-13 00:00:00',1,NULL),(14,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-14 00:00:00',1,NULL),(15,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-15 00:00:00',1,NULL),(16,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-16 00:00:00',1,NULL),(17,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-17 00:00:00',1,NULL),(18,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-18 00:00:00',1,NULL),(19,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-19 00:00:00',1,NULL),(20,'<div class=\"c_table_wrap\">\n    <table style=\"width:100%\">\n        <caption></caption>\n        <colgroup>\n            <col style=\"width:130px\">\n            <col>\n        </colgroup>\n        <thead>\n            <tr>\n                <th scope=\"col\"><span id=\"scheduleDay\">8월 1일</span></th>\n                <th scope=\"col\">과정명</th>\n            </tr>\n        </thead><thead>\n        </thead><tbody>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray \">09:00~11:00</td>\n                <td>과정명11111</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">11:00~12:00</td>\n                <td>과정명2</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">12:00~13:00</td>\n                <td>점심시간</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">13:00~14:00</td>\n                <td>과정명4</td>\n            </tr>\n            <tr class=\"tr_data\">\n                <td class=\"text_c c_gray\">15:00~16:00</td>\n                <td>과정명5</td>\n            </tr>\n        </tbody>\n    </table>\n</div>\n\n','2024-12-20 00:00:00',1,NULL);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `token_num` int NOT NULL AUTO_INCREMENT,
  `refresh_token` varchar(200) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `connect_ip` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `member_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`token_num`),
  KEY `user_token_idx` (`member_id`),
  CONSTRAINT `user_token` FOREIGN KEY (`member_id`) REFERENCES `user` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (17,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzM4NCJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM2NjE4MTQsImV4cCI6MTczMzY3Mjc5NH0.Z8se7ICTwvWmWhTZkdlyEpXPMN-2MeC-whRD6FKKbo2nw4rmlYOkTeB7HJ-bl8cW','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','2024-12-06 16:42:41','test'),(18,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzM4NCJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM2NjE4MTQsImV4cCI6MTczMzY3Mjc5NH0.Z8se7ICTwvWmWhTZkdlyEpXPMN-2MeC-whRD6FKKbo2nw4rmlYOkTeB7HJ-bl8cW','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','2024-12-08 15:19:29','test'),(19,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzM4NCJ9.eyJpc3MiOiJteXRlYW0iLCJpYXQiOjE3MzM2NjE4MTQsImV4cCI6MTczMzY3Mjc5NH0.Z8se7ICTwvWmWhTZkdlyEpXPMN-2MeC-whRD6FKKbo2nw4rmlYOkTeB7HJ-bl8cW','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','0:0:0:0:0:0:0:1','2024-12-08 20:10:51','test');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelnote`
--

DROP TABLE IF EXISTS `travelnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelnote` (
  `lecture_idx` int NOT NULL AUTO_INCREMENT,
  `program_description` varchar(100) DEFAULT NULL,
  `program_title` varchar(100) DEFAULT NULL,
  `week` int DEFAULT NULL,
  `s_id` int DEFAULT NULL,
  PRIMARY KEY (`lecture_idx`),
  KEY `schedule_travelnote_idx` (`s_id`),
  CONSTRAINT `schedule_travelnote` FOREIGN KEY (`s_id`) REFERENCES `schedule` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelnote`
--

LOCK TABLES `travelnote` WRITE;
/*!40000 ALTER TABLE `travelnote` DISABLE KEYS */;
INSERT INTO `travelnote` VALUES (3,'두근두근, 신입사원 첫 만남을 기록해주세요!','두근두근, 첫 만남',1,5),(4,'기록해주세요!','모듈명',2,10),(5,'기록해주세요!','모듈명',2,11),(6,'한국교직원공제회에서 어떤 모습으로 성장하고 싶은가요?','나를 이끄는 힘, 셀프리더십',3,18);
/*!40000 ALTER TABLE `travelnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `member_id` varchar(100) NOT NULL,
  `member_password` varchar(200) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `company_user_idx` (`company_id`),
  CONSTRAINT `company_user` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('test','1234',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-08 21:51:06
