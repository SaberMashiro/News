INSERT INTO `user` (`username`, `password`, `priority`) VALUES
	('大佬', '123456', 1),
	('弱鸡', '123456', 1),
	('打杂', '123456', 1),
	('猴子', '123456', 1),
	('端茶', '123456', 1);

INSERT INTO `category` (`category_id`, `name`) VALUES
	(1, '国际'),
	(2, '社会'),
	(3, '政治'),
	(4, '军事'),
	(5, '科技'),
	(6, '财经'),
	(7, '娱乐'),
	(8, '体育');

INSERT INTO `news` (`news_id`, `title`, `icon`, `synopsis`, `content`, `time`, `username`, `clicks`) VALUES
	(1, '习近平主持中共中央政治局会议 分析研究2018年经济工作', 'http://img.cyol.com/img/news/attachement/jpg/site2/20171209/IMG00ff1e90f16046281770044.jpg', '会议认为，党的十八大以来，党中央准确把握复杂局势，科学判断，正确决策，真抓实干，使我国经济发展取得历史性成就、发生历史性变革。', '会议认为，党的十八大以来，党中央准确把握复杂局势，科学判断，正确决策，真抓实干，使我国经济发展取得历史性成就、发生历史性变革。供给侧结构性改革有力推进，经济结构出现重大变革，全面深化改革使经济更具活力和韧性，我国经济实力再上新台阶，成为世界经济增长的主要动力源和稳定器，对全球经济发展的影响力、对全球治理的话语权大幅度提升。', '2017-12-28 19:12:40', '弱鸡', NULL),
	(2, '中使馆：恐怖分子策划对中国驻巴基斯坦机构恐袭', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3230844448,481284245&fm=11&gp=0.jpg', '中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。', '中新网12月8日电 中国驻巴基斯坦大使馆网站消息称，据悉，恐怖分子策划近期对中国驻巴基斯坦机构和人员发动系列恐袭。中国驻巴使馆提醒在巴中资机构和中国公民切实提高安防意识，加强内部防范，尽量减少外出，避免前往人员密集场所。', '2017-12-28 19:12:40', '打杂', NULL),
	(3, '朝鲜船停靠日本小岛后欲离开 被日巡逻船强行拖回', 'http://cms-bucket.nosdn.127.net/catchpic/5/53/53667863f8d95f3195f078936b514380.jpg?imageView&thumbnail=550x0', '11月，一艘朝鲜木船因恶劣天气时临时在北海道松前町无人岛“松前小岛”避难。', '11月，一艘朝鲜木船因恶劣天气时临时在北海道松前町无人岛“松前小岛”避难。当地时间12月8日下午3点半左右，该船突然启动引擎欲离开日本巡逻船。日本海上保安部见此状追了上去，并用绳索将木船拖航，再次拴在日本巡逻船上。', '2017-12-28 19:12:40', '端茶', NULL),
	(4, '女孩跳楼被卡晾衣架 怼消防:不是你们我早跳下去了', 'http://news.cnhubei.com/xw/gn/201712/W020171209266964824736.jpg', '12岁女孩和母亲吵架后想要跳楼，结果被卡在了4楼窗外的晾衣架上。', '现代快报讯 近日，在镇江市丹徒区，一名12岁女孩和母亲吵架后想要跳楼，结果被卡在了4楼窗外的晾衣架上，后来她被公安消防合力救下，令人没想到的是，获救后她却责怪起了民警和消防官兵……', '2017-12-28 19:12:40', '大佬', NULL),
	(5, '女员工与老板开会发生口角 抡椅子将老板砸翻在地', 'http://img1.utuku.china.com/534x0/toutiao/20171208/5fc9fddc-c947-451b-8380-3baf49981a36.jpg', '女员工与老板发生口角，抡起椅子怒砸老板。', '12月5日，安徽淮南，一家公司正开晨会，女员工金某与老板发生口角，见老板弯腰拿椅子做出要砸她的架势，金某也抡起椅子怒砸老板，老板受伤倒地。目前，金某因故意伤害被行政拘留6日，罚款200元。', '2017-12-28 19:12:40', '弱鸡', NULL),
	(6, '醉酒男遇抢匪"失手"将其掐死 死者家属索赔170万', 'http://cms-bucket.nosdn.127.net/catchpic/8/84/842e69eafe671516f6b34e868c9fd5c0.jpg?imageView&thumbnail=550x0', '自称喝酒后被害人苏某强行向其要钱，俩人在争执中，平某用手扼压苏某，导致苏某窒息死亡。', '自称喝酒后被害人苏某强行向其要钱，俩人在争执中，平某用手扼压苏某，导致苏某窒息死亡。12月8日上午，被控涉嫌故意杀人罪的平某在北京二中院受审。', '2017-12-28 19:12:40', '打杂', NULL),
	(7, '台教授挑唆台军:告诉解放军 客气点还能礼尚往来', 'http://n.sinaimg.cn/translate/w600h400/20171208/sLbx-fypnsin9971532.jpg', '范世平还称，台军再遇到这种“不友善”的行为，也可以采取广播喊话，但语气要更强硬。', '范世平还称，台军再遇到这种“不友善”的行为，也可以采取广播喊话，但语气要更强硬，比如“你已进入台湾‘领空’，严重影响台湾安全；你若不投诚，请立即离开，否则若遭击落，后果自负，台军不负责搜救。”', '2017-12-28 19:12:40', '端茶', NULL),
	(8, '英国欧盟就脱欧达成共识 归功于这个问题成功解决', 'http://cms-bucket.nosdn.127.net/catchpic/d/de/de22965c87211083a774c7a2b8e81ce4.png?imageView&thumbnail=550x0', '今天，英国首相特雷莎·梅以及欧盟委员会主席容克在布鲁塞尔宣布，欧盟与英国达成脱欧协议，将迈向贸易谈判。', '今天，英国首相特雷莎·梅以及欧盟委员会主席容克在布鲁塞尔宣布，欧盟与英国达成脱欧协议，将迈向贸易谈判。据英国广播公司（BBC）网站报道，英欧双方此次在脱欧问题上迅速达成共识，主要是因为双方在复杂敏感的北爱尔兰地位问题上成功达成一致。', '2017-12-28 19:12:40', '大佬', NULL),
	(9, '小情侣开微店做时装"代购" 所卖正品服装基本靠偷', 'http://seopic.699pic.com/photo/50013/2640.jpg_wh1200.jpg', '一对23岁的小情侣“代购”快时尚品牌服装，和普通代购赚差价不同，他们的利润几乎是100%——绝大多数衣服不是通过正规渠道进货，而是靠偷。', '一对23岁的小情侣“代购”快时尚品牌服装，和普通代购赚差价不同，他们的利润几乎是100%——绝大多数衣服不是通过正规渠道进货，而是靠偷。澎湃新闻12月8日从杭州滨江警方获悉，目前两人均已被刑事拘留，案件正在进一步侦办。', '2017-12-28 19:12:40', '猴子', NULL),
	(10, '浙江一公司虚开增值税专用发票 涉案金额120余亿', 'http://image.tupian114.com/20160818/2033120172.jpg.238.jpg', '浙江舟山市警方日前破获浙江席琳贸易有限公司特大虚开增值税专用发票案，涉案金额120余亿元，涉及20多个省市800余家企业。', '浙江舟山市警方日前破获浙江席琳贸易有限公司特大虚开增值税专用发票案，涉案金额120余亿元，涉及20多个省市800余家企业，警方已抓获10名犯罪嫌疑人并移送检察机关起诉。', '2017-12-28 19:12:40', '猴子', NULL),
	(11, '加拿大总理访华未启动中加自贸协定谈判 中方回应', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3690466695,2270064394&fm=11&gp=0.jpg', '中方一贯在相互尊重、互不干涉内政等原则的基础上，发展同其他国家的关系。', '中方一贯在相互尊重、互不干涉内政等原则的基础上，发展同其他国家的关系。我们也始终遵循这些原则发展同澳大利亚的关系。我们强烈敦促澳方有关人士摒弃冷战思维和对华偏见，立即停止发表损害中澳政治互信与互利合作的错误言论，并采取有效措施消除负面影响，以免对中澳关系发展造成干扰和冲击。', '2017-12-28 19:12:40', '猴子', NULL);

INSERT INTO `category_news` (`category_id`, `news_id`) VALUES
	(3, 1),
	(1, 2),
	(1, 3),
	(2, 4),
	(2, 5),
	(2, 6),
	(4, 7),
	(1, 8),
	(2, 9),
	(6, 10),
	(1, 11);

INSERT INTO `comment` (`comment_id`, `news_id`, `guestname`, `content`, `time`, `ip`) VALUES
	(1, 1, '離莂鉽ゅ痛哭', '威武！', '2017-12-28 19:12:40', '222.231.1.56'),
	(2, 1, '追妚廽の歲枂', '习大大威武！', '2017-12-28 19:12:40', '222.231.1.67'),
	(3, 1, '‵溚讪獨橆〆', '好！', '2017-12-28 19:12:40', '222.231.1.42'),
	(4, 1, 'εㄖ乍亱嬌χιυψ', '威武！！！', '2017-12-28 19:12:40', '222.231.1.77'),
	(5, 2, '⒐玥⒐號娶尓', '坚决打击恐怖主义！', '2017-12-28 19:12:40', '78.46.98.121'),
	(6, 1, 'Clark Kent', 'Very Good!', '2017-12-29 03:27:49', '192.168.1.110'),
	(7, 1, 'Bruce Wayne', 'I am Batman!', '2017-12-29 03:28:34', '127.0.0.1'),
	(8, 1, 'Bruce Wayne', 'I am Vengeance!\r\nI am the Night!\r\nI am Batman!', '2017-12-29 04:22:42', '127.0.0.1');
