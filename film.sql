CREATE DATABASE IF NOT EXISTS`film` ;

USE `film`;

/* 电影(film)关系 */

DROP TABLE IF EXISTS `film`;

CREATE TABLE `film` (
	`film_id` INT (11),
	`film_name` VARCHAR (2025),
	`film_pic` VARCHAR (2025),
	`film_type_id` INT (11),
	`film_price` DOUBLE ,
	`film_actors` VARCHAR (2700),
	`film_date` DATE ,
	`film_scene` VARCHAR (2700),
	`film_room` VARCHAR (450),
	`film_score` DOUBLE ,
	`film_desc` TEXT 
); 
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('1','人生大事','01.jpg','4','78','朱一龙 杨恩又','2022-06-03','09:00,13:00','1号放映厅','4.33','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 殡葬师莫三妹（朱一龙 饰）\r\n在刑满释放不久后的一次出殡中，遇到了孤儿武小文（杨恩又 饰），\r\n小文的出现，意外地改变了莫三妹对职业和生活的态度。');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('2','天才计划','02.jpg','6','67','丹尼尔·雷德克里夫   丹尼尔 韦伯','2022-06-14','11:00,13:00','2号放映厅','3.5','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 机械天才蒂姆·詹金搭档好兄弟\r\n史蒂芬·李秘密组建越狱行动队，上演了一场令人窒息步步惊心的精巧\r\n越狱大秀。面对冷血狱警的无理压迫，看行动队如何摆脱404天牢狱之灾，如何冲破15道自由之门，\r\n手握天才之钥密室逃生。');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('3','镜世界','03.jpg','3','45','罗翔  苏小妹','2022-06-15','13:00,17:00','3号放映厅','3','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;午夜黑暗房间，镜前点蜡烛占卜，\r\n穿红衣削苹果，如皮断了，将在镜里看到不干净东西。本身对镜子\r\n有心理阴影的少女姗姗，被她的同学拉去参加一场恐怖的镜子游戏，不慎削断果皮，受镜中不明事物\r\n惊吓不省人事，数日没有苏醒，身体开始发生异样地扭曲。姐姐为唤醒弥留的妹妹，参加一个能进入\r\n沉睡者脑中意识空间的恐怖实验，在极度恐怖的意识异境中寻找迷失的妹妹……');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('4','侏罗纪世界3','04.jpg','5','99','科林·特雷沃罗   布莱丝·达拉斯·霍华德','2022-06-15','15:00,17:00','4号放映厅','3.5','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电影将故事的开篇设定在了努布\r\n拉岛被摧毁四年之后。如今，恐龙在世界各 地与人类共存，并猎食。\r\n这一脆弱的平衡将重塑未来，并最终决定人类能否 在这颗与史上最可怕生物共享的星球上继续站在\r\n食物链的顶端。');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('5','暗恋橘生淮南','05.jpg','1','88','张雪迎 辛云来','2022-06-24','11:00,17:00','5号放映厅','4.1','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;有多少人的青春是从一场暗恋开\r\n始的？儿时的一次偶遇，少年时期的默默竞争，大学的意外重逢，\r\n洛枳（张雪迎 饰）对盛淮南（辛云来 饰）的漫长暗恋，最终会收获何种结局？影片改编自八月长\r\n安振华系列，为电影《最好的我们》续篇。');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('6','坏蛋联盟','6.jpg','3','77','山姆·洛克威尔','2022-06-29','09:00,13:00','1号放映厅','3.7','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	梦工场最新动画喜剧电影\r\n《坏蛋联盟》(The Bad Guys)改编自同名畅销漫画，全球出版1600万册。本片由《功夫熊猫》系列电\r\n影资深动画师彼埃尔·佩里菲尔执导，《魔发精灵》《宝贝老板》王牌制片人保驾护航。漫画由\r\n艾伦·布拉培创作，黑白风格，围绕五个“坏蛋”：大坏狼、美肚鲨、贪心蛇、食人鱼、骇客蛛展开故事，\r\n它们是令人闻风丧胆的“坏蛋联盟”，然而它们却决定成为模范公民。它们是真的想改“邪”归“正”吗？');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('7','密室逃脱2','7.jpg','6','87','泰勒·拉赛尔  洛根·米勒','2022-06-15','11:00,13:00','2号放映厅','2.5','&nbsp;&nbsp;&nbsp;&nbsp;好莱坞惊悚大片《密室逃生2》由《速度与激情》系列金牌制片人重磅打\r\n造，前作曾创下中国影史进口惊悚片票房最高纪录。续作在闯关难度和惊险刺激程度上全面升级，\r\n集结全球顶级玩家合力解锁超高难度密室，开启危机重重的极限挑战。影片将于2022年4月2日全国上映。');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('8','这个杀手不太冷静','8.jpg','2','67','马丽  魏翔','2022-07-22','13:00,17:00','3号放映厅','4.6','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;马丽魏翔携手演绎高口碑爆笑\r\n喜剧！《夏洛特烦恼》《西虹市首富》导演闫非、彭大魔监制，邢文雄执导，马丽、魏翔等喜剧人\r\n主演，携手打造爆笑“杀手奇遇”！小人物龙套演员魏成功（魏翔 饰）得到当红女星米兰（马丽 饰）\r\n“赏识”，被邀请出演男一号神秘杀手，却没想到这一切竟是一场危机四伏的“戏中戏”、“局中局”。\r\n被蒙在鼓里的魏成功数次凭借自己的演技和好运化险为夷，而这场阴谋却逐渐失控，残酷的真相\r\n也离他越来越近……');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('9','长津湖之水门桥','9.jpg','4','100','吴京，易烊千玺','2022-06-23','15:00,17:00','4号放映厅','3.8','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;封号南拳王的洪拳武术家暴毙于隧道中的自家车上，尸体并没刀\r\n伤或枪伤痕迹，初步监定死于重拳，重案组总督察陆玄心（杨采妮 饰）负责调查，对死因感到不解；此时却收到监狱传来消息，犯了误杀罪的服刑犯人夏侯武（甄子丹 饰），主动表示愿意协助警方调查，条件是即时假释。 &lt;br /&gt;\r\n　电影《长津湖之水门桥》以抗美援朝战争第二次战役中的长津湖战役为背景，讲述了在结束了新兴\r\n里和下碣隅里的战斗之后，七连战士们又接到了更艰巨的任务…… &lt;br /&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('10','神奇动物:邓布利多之谜','10.jpg','4','89','艾迪·雷德梅恩 艾莉森·苏朵儿','2022-06-18','11:00,17:00','5号放映厅','2.1','阿不思·邓布利多教授（裘德·洛 饰）意识到强大的黑巫师盖勒特·格林德沃（麦斯·米科尔森 饰）\r\n正试图夺取魔法世界的控制权。邓布利多了解仅凭他一人之力，将无法阻止格林德沃，于是他委托\r\n魔法动物学家纽特·斯卡曼德（埃迪·雷德梅恩 饰）带领一支精良的团队——成员包括男巫、女巫\r\n及一位勇敢的麻瓜面包师，来共同执行这项危险任务。一路上他们会遇到各式各样的神奇动物，\r\n既有老朋友，也有前所未见的神秘生物；同时他们也随时会与格林德沃不断壮大的追随者发生冲突。\r\n这次行动的风险是如此之高……邓布利多还能袖手旁观多久？');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('11','我要我们在一起','11.jpg','4','67','屈楚萧  张婧仪','2022-06-15','09:00,13:00','1号放映厅','4.5','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你有没有爱过一个人，\r\n曾经拼了命，只为和TA在一起。十年前，差生吕钦扬当众告白凌一尧，两人从校园步入社会，\r\n为了让她幸福，他不惜以命相搏。然而金钱、房子、婚姻等现实的考验，却将两人越推越远。\r\n十年长跑，他们能否还记得曾经刻在心底的约定：我要我们在一起。');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('12','哆啦A梦','12.jpg','4','78','哆啦A梦 水田山葵','2022-06-30','11:00,13:00','2号放映厅','3.9','&nbsp;&nbsp;&nbsp;&nbsp;大雄意外结识拇指外星人帕比，在哆啦A梦的帮助下，与大家一起穿越星际共同去守护匹里卡星，并开展了一段奇妙的宇宙冒险。&lt;br /&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('13','月球陨落','13.jpg','3','67','哈莉·贝瑞   帕特里克·威尔森','2022-06-15','13:00,17:00','3号放映厅','5','仰望星空，月亮一向是永恒的。但在不久的将来，月亮被一股神秘的力量驱使离开月球轨道，向我们地球飞来。');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('14','唐顿庄园2','14.jpg','1','75','米歇尔·道尔瑞   休·博纳维尔','2022-06-27','15:00,17:00','4号放映厅','5','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;封号南拳王的洪拳武术家暴毙于隧道中的自家车上，尸体并没刀伤或枪伤痕迹，初步监定死于重拳，重案组总督察陆玄心（杨采妮 饰）负责调查，对死因感到不解；此时却收到监狱传来消息，犯了误杀罪的服刑犯人夏侯武（甄子丹 饰），主动表示愿意协助警方调查，条件是即时假释。 &lt;br /&gt;\r\n　影片为2019年《唐顿庄园》电影的续集，在这一部故事中，唐顿庄园将迎来一个崭新的时代，与此同时，老伯爵夫人的一段神秘过往也将被揭晓。 &lt;br /&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('15','遇见你之后','15.jpg','2','87','黄尧  刘迅','2022-06-19','11:00,17:00','5号放映厅','4.5','最幸运是遇见你，最遗憾也是遇见你。当黄曼曼遇上彭柏杨的那天，她以为自己遇到了生命中\r\n最懂自己的人，没想到这份爱还是败给了现实，只想爱人幸福的柏杨，也低估了曼曼想跟他走下去\r\n的决心。');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('16','一周的朋友','16.jpg','4','66','赵今麦   林一','2022-07-14','09:00,13:00','1号放映厅','4.3','胜华高中的复读班上，新来了一个转学生林湘之（赵今麦饰），她文静聪明却总是孤独一人，\r\n不跟其他的同学做朋友。但这样的她却吸引了班上的学渣徐又树（林一饰）的注意。\r\n在徐又树不断想跟林湘之做朋友的过程中，他和古灵精怪的宋晓楠（沈月饰）、\r\n和高冷学霸蒋吾（汪佳辉饰）发现了林湘之的秘密，原来她患了一种特殊的疾病，她对朋友的记忆\r\n只有七天。为了帮助这个孤独的女孩，他们四个人组成了“末日生存”小队不断为她创造惊喜和\r\n属于他们的记忆。殊不知，林湘之的疾病背后却有个更悲伤的秘密......');
INSERT INTO `film` (`film_id`, `film_name`, `film_pic`, `film_type_id`, `film_price`, `film_actors`, `film_date`, `film_scene`, `film_room`, `film_score`, `film_desc`) VALUES('17','好想去你的世界爱你','17.jpg','3','65','周怡然，施柏然','2022-07-21','11:00,13:00','2号放映厅','3.8','这世上是否有个人知你冷暖，懂你悲喜？身处北京的助理建筑师安易(周依然 饰)与远在德国\r\n的调音师高昂(施柏宇 饰)，因一场意外脑电波相连，从此他们听觉、味觉、触觉神奇共享。\r\n“被迫绑定”的日子，使他们方寸大乱，笑料百出，却也因为无时无刻的陪伴成为了互相最懂彼此的人...... \r\n但一次误会使二人产生了隔阂，面对遥远的距离，未知的将来，他们是否会坚定地去往对方的世界？\r\n感谢那些看透了我们，却一直陪在我们身边的人。');

/* 电影类型(film_type)关系 */

DROP TABLE IF EXISTS `film_type`;

CREATE TABLE `film_type` (
	`film_type_id` INT (11),
	`film_type_name` VARCHAR (2025)
); 
INSERT INTO `film_type` (`film_type_id`, `film_type_name`) VALUES('1','爱情片');
INSERT INTO `film_type` (`film_type_id`, `film_type_name`) VALUES('2','喜剧片');
INSERT INTO `film_type` (`film_type_id`, `film_type_name`) VALUES('3','科幻片');
INSERT INTO `film_type` (`film_type_id`, `film_type_name`) VALUES('4','剧情片');
INSERT INTO `film_type` (`film_type_id`, `film_type_name`) VALUES('5','恐怖片');
INSERT INTO `film_type` (`film_type_id`, `film_type_name`) VALUES('6','悬疑片');

/* 公告(info)关系 */

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
	`info_id` INT (11),
	`info_title` VARCHAR (2025),
	`info_content` TEXT ,
	`info_admin` VARCHAR (450),
	`info_date` DATETIME ,
	`info_pic` VARCHAR (2025)
); 
INSERT INTO `info` (`info_id`, `info_title`, `info_content`, `info_admin`, `info_date`, `info_pic`) VALUES('1','最新会员消息通知','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一个月后电影院将开通会员功能，大家尽请期待。会员购票享受85折优惠，会员数量有限，先到先得。','管理员','2022-06-12 08:45:20','');
INSERT INTO `info` (`info_id`, `info_title`, `info_content`, `info_admin`, `info_date`, `info_pic`) VALUES('2','最新电影《才恋》正在筹备拍摄','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年度巨作《才恋》正在筹备拍摄中，世界巨星才才子李得才担任主演，讲述得才寻找爱情的坎坷之路。','管理员','2022-05-20 10:46:06','');
INSERT INTO `info` (`info_id`, `info_title`, `info_content`, `info_admin`, `info_date`, `info_pic`) VALUES('3','电影院扩建通知','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着电影院的发展，电影院越来越火，场场爆满，为了给顾客提供更好的服务，本影院正在扩建，增加放映厅数量，建设分店。','管理员','2022-06-06 12:00:00',NULL);
INSERT INTO `info` (`info_id`, `info_title`, `info_content`, `info_admin`, `info_date`, `info_pic`) VALUES('4','电影《侏罗纪世界3》即将上映','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;由科林·特雷沃罗，布莱丝·达拉斯·霍华德主演，科林·特莱沃若导演的《侏罗纪世界3》即将上映，喜欢的朋友不要错过。','管理员','2022-05-23 17:46:06',NULL);
INSERT INTO `info` (`info_id`, `info_title`, `info_content`, `info_admin`, `info_date`, `info_pic`) VALUES('5','最新优惠通知','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为回报广大用户，本电影院对高考考生进行打折优惠政策。','管理员','2022-06-12 14:45:20',NULL);
INSERT INTO `info` (`info_id`, `info_title`, `info_content`, `info_admin`, `info_date`, `info_pic`) VALUES('6','电影推荐','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;《侏罗纪世界3》  《暗恋橘生淮南》 《一周的朋友》','管理员','2022-05-14 10:46:06',NULL);
INSERT INTO `info` (`info_id`, `info_title`, `info_content`, `info_admin`, `info_date`, `info_pic`) VALUES('7','广告招商','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本电影院还留有少数广告位，希望合作的朋友可以联系本院。电话：88888888','管理员','2022-05-31 15:45:20',NULL);
INSERT INTO `info` (`info_id`, `info_title`, `info_content`, `info_admin`, `info_date`, `info_pic`) VALUES('8','祝大家在影院开开心心','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;祝大家开开心心每一天。','管理员','2022-06-13 13:46:06',NULL);

/* 订票(orders)关系 */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
	`orders_id` INT (11),
	`user_id` INT (11),
	`film_id` INT (11),
	`orders_count` INT (11),
	`orders_date` DATE ,
	`orders_flag` INT (11),
	`orders_seat` VARCHAR (2025),
	`film_scene` VARCHAR (2700)
); 
INSERT INTO `orders` (`orders_id`, `user_id`, `film_id`, `orders_count`, `orders_date`, `orders_flag`, `orders_seat`, `film_scene`) VALUES(NULL,'0','13','1','2022-06-14','1','9-16','13:00');
INSERT INTO `orders` (`orders_id`, `user_id`, `film_id`, `orders_count`, `orders_date`, `orders_flag`, `orders_seat`, `film_scene`) VALUES(NULL,'0','8','1','2022-06-15','1','1-2','13:00');

/* 评论(sblog)关系 */

DROP TABLE IF EXISTS `sblog`;

CREATE TABLE `sblog` (
	`sblog_id` INT (11),
	`film_id` INT (11),
	`user_id` INT (11),
	`sblog_score` DOUBLE ,
	`sblog_content` TEXT ,
	`sblog_date` DATETIME ,
	`sblog_pic` VARCHAR (2025)
); 
INSERT INTO `sblog` (`sblog_id`, `film_id`, `user_id`, `sblog_score`, `sblog_content`, `sblog_date`, `sblog_pic`) VALUES('1','1','2','5','这部电影真的很不错……','2022-06-10 00:51:55','images/head/01.gif');
INSERT INTO `sblog` (`sblog_id`, `film_id`, `user_id`, `sblog_score`, `sblog_content`, `sblog_date`, `sblog_pic`) VALUES('2','1','3','4','片子很好看，新导演的节奏很好，生死这个主题下能喜剧感拉满又不低俗 ，实属不易。\r\n而我在刚才电影院满场的爆笑声中，哭成狗。','2022-06-01 00:52:00','images/head/02.gif');
INSERT INTO `sblog` (`sblog_id`, `film_id`, `user_id`, `sblog_score`, `sblog_content`, `sblog_date`, `sblog_pic`) VALUES('3','2','4','4','没有华丽的语言，就是好看，我觉得这部电影毫不夸张的说是我迄今为止看过最好看的电影之一，\r\n一分一秒都不想错过，看完大家迟迟不愿意走！第一次感觉时间过得快！ ','2022-06-06 00:52:04','images/head/01.gif');
INSERT INTO `sblog` (`sblog_id`, `film_id`, `user_id`, `sblog_score`, `sblog_content`, `sblog_date`, `sblog_pic`) VALUES('4','2','2','5','已经是第二次来了，第一次来就很惊艳，没想到第二次来还有新的惊喜，爱了.','2022-05-26 20:19:11','images/head/02.gif');
INSERT INTO `sblog` (`sblog_id`, `film_id`, `user_id`, `sblog_score`, `sblog_content`, `sblog_date`, `sblog_pic`) VALUES('5','1','2','4','不是电影不好，是我们关系真的没办法挽留了，在电影院等你的三四十分钟里我想过好几种见你的方式，\r\n我不知道我会不会跟以前一样被你笑着拉进电影院，不知道咱俩之间会不会因为这一段时间的\r\n分开变得陌生，很期待见面后会借着电影好好聊聊这段时间的感受，一起拥抱接吻变成以前那样，\r\n很期待跟你再次复合。','2022-05-31 10:03:43','images/head/01.gif');
INSERT INTO `sblog` (`sblog_id`, `film_id`, `user_id`, `sblog_score`, `sblog_content`, `sblog_date`, `sblog_pic`) VALUES('7','4','2','4','这个电影也终结了，但根据电影看的感觉来说，似乎故事还没有说完，中心思想就是要想长久的发展，\r\n必须要学会共存，可让我看来，复活恐龙这件事情本来就不对，口中打这为它们好，重现生命，\r\n但其实还不是为了让自己能在有生之年看到恐龙，研究恐龙，希望能够对生命有进一步研究和突破，\r\n把它们重新带入不属于它们的时代，对于它们来说本就不负责任，不够尊重，对于人类的安全来说，\r\n本就不负责任，电影总体还行，没有什么跌宕起伏，也够完整，比较平淡。','2022-05-16 23:36:32','images/head/02.gif');

/* 用户(user)关系 */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
	`user_id` INT (11),
	`user_name` VARCHAR (450),
	`user_pass` VARCHAR (1800),
	`real_name` VARCHAR (450),
	`nick_name` VARCHAR (450),
	`user_sex` INT (11),
	`user_age` INT (11),
	`user_mail` VARCHAR (450),
	`reg_date` DATETIME ,
	`user_type` INT (11)
); 
INSERT INTO `user` (`user_id`, `user_name`, `user_pass`, `real_name`, `nick_name`, `user_sex`, `user_age`, `user_mail`, `reg_date`, `user_type`) VALUES('1','coco','98d59c97b27720129d3241dc93308655911a01c3','可','ke','1','20','18888888888','2022-06-14 20:10:30','2');
INSERT INTO `user` (`user_id`, `user_name`, `user_pass`, `real_name`, `nick_name`, `user_sex`, `user_age`, `user_mail`, `reg_date`, `user_type`) VALUES('4','peilinqing','4cb0a5502e9aa44a0ca99e96742f2e788aad875a','裴霖庆','庆','1','25','15888888888','2022-06-13 23:08:44','1');
INSERT INTO `user` (`user_id`, `user_name`, `user_pass`, `real_name`, `nick_name`, `user_sex`, `user_age`, `user_mail`, `reg_date`, `user_type`) VALUES('3','zhangsan','4cb0a5502e9aa44a0ca99e96742f2e788aad875a','张三','三','2','22','15888888888','2022-06-14 23:08:46','1');
INSERT INTO `user` (`user_id`, `user_name`, `user_pass`, `real_name`, `nick_name`, `user_sex`, `user_age`, `user_mail`, `reg_date`, `user_type`) VALUES('2','lisi','4cb0a5502e9aa44a0ca99e96742f2e788aad875a','李四','四','2','22','15888888888','2022-06-11 19:08:43','1');
INSERT INTO `user` (`user_id`, `user_name`, `user_pass`, `real_name`, `nick_name`, `user_sex`, `user_age`, `user_mail`, `reg_date`, `user_type`) VALUES('5','ouyang','4cb0a5502e9aa44a0ca99e96742f2e788aad875a','欧阳','yang','1','21','15888888888','2022-06-13 18:08:44','1');
INSERT INTO `user` (`user_id`, `user_name`, `user_pass`, `real_name`, `nick_name`, `user_sex`, `user_age`, `user_mail`, `reg_date`, `user_type`) VALUES('6','wangwu','4cb0a5502e9aa44a0ca99e96742f2e788aad875a','王五','五','1','18','15888888888','2022-06-14 10:37:14','1');

