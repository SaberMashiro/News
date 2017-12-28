-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.17-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 news 的数据库结构
CREATE DATABASE IF NOT EXISTS `news` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `news`;


-- 导出  表 news.category 结构
CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在导出表  news.category 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`cat_id`, `name`) VALUES
	(1, 'PE'),
	(2, 'AC'),
	(3, 'WA'),
	(4, 'recommend');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- 导出  表 news.news 结构
CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `attachment` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `clicks` int(11) DEFAULT NULL,
  `synposis` text,
  `title_img` text,
  PRIMARY KEY (`news_id`),
  KEY `fk_news_cat` (`cat_id`),
  KEY `fk_news_user` (`user_id`),
  CONSTRAINT `fk_news_cat` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_news_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- 正在导出表  news.news 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`news_id`, `cat_id`, `user_id`, `title`, `content`, `attachment`, `time`, `clicks`, `synposis`, `title_img`) VALUES
	(1, 4, 1, '习近平主持中共中央政治局会议 分析研究2018年经济工作', '会议认为，党的十八大以来，党中央准确把握复杂局势，科学判断，正确决策，真抓实干，使我国经济发展取得历史性成就、发生历史性变革。供给侧结构性改革有力推进，经济结构出现重大变革，全面深化改革使经济更具活力和韧性，我国经济实力再上新台阶，成为世界经济增长的主要动力源和稳定器，对全球经济发展的影响力、对全球治理的话语权大幅度提升。', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-27 12:50:55', NULL, '会议认为，党的十八大以来，党中央准确把握复杂局势，科学判断，正确决策，真抓实干，使我国经济发展取得历史性成就、发生历史性变革。供给侧结构性改革有力推进，经济结构出现重大变革', NULL),
	(2, 1, 2, '中使馆：恐怖分子策划对中国驻巴基斯坦机构恐袭', '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中国公民切实提高安防意识，加强内部防范，尽量减少外出，避免前往人员密集场所。', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-28 09:34:27', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0'),
	(3, 4, 1, '朝鲜船停靠日本小岛后欲离开 被日巡逻船强行拖回', '11月，一艘朝鲜木船因恶劣天气时临时在北海道松前町无人岛“松前小岛”避难。当地时间12月8日下午3点半左右，该船突然启动引擎欲离开日本巡逻船。日本海上保安部见此状追了上去，并用绳索将木船拖航，再次拴在日本巡逻船上。', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-27 14:28:45', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', NULL),
	(4, 1, 3, '女孩跳楼被卡晾衣架 怼消防:不是你们我早跳下去了', '现代快报讯 近日，在镇江市丹徒区，一名12岁女孩和母亲吵架后想要跳楼，结果被卡在了4楼窗外的晾衣架上，后来她被公安消防合力救下，令人没想到的是，获救后她却责怪起了民警和消防官兵……', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-28 09:34:38', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0'),
	(5, 3, 1, '女员工与老板开会发生口角 抡椅子将老板砸翻在地', '12月5日，安徽淮南，一家公司正开晨会，女员工金某与老板发生口角，见老板弯腰拿椅子做出要砸她的架势，金某也抡起椅子怒砸老板，老板受伤倒地。目前，金某因故意伤害被行政拘留6日，罚款200元。', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-28 09:34:30', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0'),
	(6, 4, 2, '警察核对信息"多看了一眼" 分离37年的双胞胎相认', '为了核对信息的准确性，民警联系了河南省镇平县辖区派出所请求协助，得到的结果是王姓男子一直在当地生活。随后，民警与他取得了联系，根据相关信息的比对结果，确定双方就是已经分离了37年的双胞胎兄弟。', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-27 14:28:51', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', NULL),
	(7, 2, 1, '醉酒男遇抢匪"失手"将其掐死 死者家属索赔170万', '自称喝酒后被害人苏某强行向其要钱，俩人在争执中，平某用手扼压苏某，导致苏某窒息死亡。12月8日上午，被控涉嫌故意杀人罪的平某在北京二中院受审。', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-19 09:21:50', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', NULL),
	(8, 1, 2, '台教授挑唆台军:告诉解放军 客气点还能礼尚往来', '范世平还称，台军再遇到这种“不友善”的行为，也可以采取广播喊话，但语气要更强硬，比如“你已进入台湾‘领空’，严重影响台湾安全；你若不投诚，请立即离开，否则若遭击落，后果自负，台军不负责搜救。”', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-19 09:21:46', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', NULL),
	(9, 4, 1, '英国欧盟就脱欧达成共识 归功于这个问题成功解决', '今天，英国首相特雷莎·梅以及欧盟委员会主席容克在布鲁塞尔宣布，欧盟与英国达成脱欧协议，将迈向贸易谈判。据英国广播公司（BBC）网站报道，英欧双方此次在脱欧问题上迅速达成共识，主要是因为双方在复杂敏感的北爱尔兰地位问题上成功达成一致。', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-27 14:28:53', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', NULL),
	(10, 3, 1, '中央政治局召开会议：2018年加快住房制度改革', '8日召开的中共中央政治局会议分析研究2018年经济工作，提出：加快住房制度改革和长效机制建设是明年要着力抓好的一项重点工作。推动高质量发展是当前和今后一个时期确定发展思路、制定经济政策、实施宏观调控的根本要求。', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-19 09:22:06', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', NULL),
	(11, 4, 1, '小情侣开微店做时装"代购" 所卖正品服装基本靠偷', '一对23岁的小情侣“代购”快时尚品牌服装，和普通代购赚差价不同，他们的利润几乎是100%——绝大多数衣服不是通过正规渠道进货，而是靠偷。澎湃新闻12月8日从杭州滨江警方获悉，目前两人均已被刑事拘留，案件正在进一步侦办。', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-28 09:34:11', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', NULL),
	(12, 1, 3, '浙江一公司虚开增值税专用发票 涉案金额120余亿', '浙江舟山市警方日前破获浙江席琳贸易有限公司特大虚开增值税专用发票案，涉案金额120余亿元，涉及20多个省市800余家企业，警方已抓获10名犯罪嫌疑人并移送检察机关起诉。', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-19 09:22:03', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', NULL),
	(13, 1, 3, '加拿大总理访华未启动中加自贸协定谈判 中方回应', '中方一贯在相互尊重、互不干涉内政等原则的基础上，发展同其他国家的关系。我们也始终遵循这些原则发展同澳大利亚的关系。我们强烈敦促澳方有关人士摒弃冷战思维和对华偏见，立即停止发表损害中澳政治互信与互利合作的错误言论，并采取有效措施消除负面影响，以免对中澳关系发展造成干扰和冲击。', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-19 09:22:11', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', NULL),
	(14, 1, 1, '外交部:中朝友谊桥因维修将关闭 与联合国决议无关', '当天，有记者问，据报道，中国丹东和朝鲜之间的中朝友谊桥因维修需要将在本月11日关闭。这对中方执行联合国安理会决议有何影响？', 'http://cms-bucket.nosdn.127.net/catchpic/0/07/07e5539dd9489ad2bfa44262dc0238de.jpg?imageView&thumbnail=550x0', '2017-12-08 21:02:10', NULL, '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中', NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


-- 导出  表 news.review 结构
CREATE TABLE IF NOT EXISTS `review` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` varchar(16) DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  KEY `fk_review_news` (`news_id`),
  CONSTRAINT `fk_review_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  news.review 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` (`rev_id`, `news_id`, `content`, `time`, `state`, `ip`) VALUES
	(1, 1, '我们是社会主义的接班人', '2017-12-28 09:35:24', NULL, NULL),
	(2, 12, '恩恩恩恩恩太难了', '2017-12-28 09:36:16', NULL, NULL),
	(3, 2, '学习真是太难了', '2017-12-28 09:36:46', NULL, NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;


-- 导出  表 news.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  news.user 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `name`, `password`, `priority`) VALUES
	(1, 'joker', '123456', 1),
	(2, 'ROSE', '654321', 2),
	(3, 'penny', '456789', 3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
