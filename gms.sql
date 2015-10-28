-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-10-23 11:44:29
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gms`
--

-- --------------------------------------------------------

--
-- 表的结构 `gms_action`
--

CREATE TABLE IF NOT EXISTS `gms_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL COMMENT '标识',
  `title` char(80) NOT NULL COMMENT '标题',
  `remark` char(140) NOT NULL COMMENT '描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `gms_action`
--

INSERT INTO `gms_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次！', 'table:member|field:score|condition:uid={$self} AND status&gt;-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1444460123);

-- --------------------------------------------------------

--
-- 表的结构 `gms_action_log`
--

CREATE TABLE IF NOT EXISTS `gms_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `gms_auth_group`
--

CREATE TABLE IF NOT EXISTS `gms_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL COMMENT '用户组标题',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '用户组状态',
  `rules` text NOT NULL COMMENT '用户权限',
  `sort` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `gms_auth_group`
--

INSERT INTO `gms_auth_group` (`id`, `title`, `status`, `rules`, `sort`) VALUES
(1, '超级管理组', 1, '1,41,42,4,33,36,35,34,45,46,47,48,61,49,52,51,50,29,32,31,30,5,62,38,37,40,39,2', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gms_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `gms_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gms_auth_group_access`
--

INSERT INTO `gms_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `gms_auth_rule`
--

CREATE TABLE IF NOT EXISTS `gms_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `show_type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `hide` tinyint(2) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- 转存表中的数据 `gms_auth_rule`
--

INSERT INTO `gms_auth_rule` (`id`, `pid`, `name`, `title`, `icon`, `type`, `show_type`, `hide`, `status`, `sort`, `condition`) VALUES
(1, 0, '', '系统', 'iconfont icon-computer', 2, 0, 0, 1, 1, ''),
(2, 0, '', '用户', 'iconfont icon-user', 2, 0, 0, 1, 2, ''),
(3, 0, '', '扩展', 'iconfont icon-all', 2, 0, 0, 1, 3, ''),
(4, 1, '', '系统设置', 'iconfont icon-computer', 2, 0, 0, 1, 1, ''),
(5, 1, '', '数据库管理', 'iconfont icon-associated', 2, 0, 0, 1, 2, ''),
(6, 2, '', '用户管理', 'iconfont icon-user', 2, 0, 0, 1, 1, ''),
(7, 2, '', '行为管理', 'iconfont icon-monitoring', 2, 0, 0, 1, 2, ''),
(8, 3, '', '在线平台', 'iconfont icon-cloud', 2, 0, 0, 1, 1, ''),
(9, 3, '', '模块管理', 'iconfont icon-data', 2, 0, 0, 1, 2, ''),
(10, 3, '', '插件管理', 'iconfont icon-keyboard', 2, 0, 0, 1, 3, ''),
(11, 8, '', '模块商店', 'iconfont icon-cart', 2, 0, 0, 1, 1, ''),
(12, 8, '', '插件商店', 'iconfont icon-cart', 2, 0, 0, 1, 2, ''),
(13, 7, 'Admin/Action/index', '行为管理', 'iconfont icon-monitoring', 1, 0, 0, 1, 1, ''),
(14, 13, 'Admin/Action/add', '新增', '', 1, 0, 0, 1, 1, ''),
(15, 13, 'Admin/Action/edit', '编辑', '', 1, 0, 0, 1, 1, ''),
(16, 13, 'Admin/Action/del', '删除', '', 1, 0, 0, 1, 1, ''),
(17, 7, 'Admin/ActionLog/index', '日志管理', 'iconfont icon-survey', 1, 0, 0, 1, 1, ''),
(20, 17, 'Admin/ActionLog/del', '删除', '', 1, 0, 0, 1, 1, ''),
(25, 6, 'Admin/AuthGroup/index', '用户组管理', 'iconfont icon-members', 1, 0, 0, 1, 2, ''),
(26, 25, 'Admin/AuthGroup/add', '新增', '', 1, 0, 0, 1, 1, ''),
(27, 25, 'Admin/AuthGroup/edit', '编辑', '', 1, 0, 0, 1, 1, ''),
(28, 25, 'Admin/AuthGroup/del', '删除', '', 1, 0, 0, 1, 1, ''),
(29, 4, 'Admin/AuthRule/index', '菜单管理', 'iconfont icon-viewlist', 1, 0, 0, 1, 5, ''),
(30, 29, 'Admin/AuthRule/add', '新增', '', 1, 0, 0, 1, 1, ''),
(31, 29, 'Admin/AuthRule/edit', '编辑', '', 1, 0, 0, 1, 1, ''),
(32, 29, 'Admin/AuthRule/del', '删除', '', 1, 0, 0, 1, 1, ''),
(33, 4, 'Admin/Config/index', '配置管理', 'iconfont icon-set', 1, 0, 0, 1, 9, ''),
(34, 33, 'Admin/Config/add', '新增', '', 1, 0, 0, 1, 1, ''),
(35, 33, 'Admin/Config/edit', '编辑', '', 1, 0, 0, 1, 1, ''),
(36, 33, 'Admin/Config/del', '删除', '', 1, 0, 0, 1, 1, ''),
(37, 5, 'Admin/Database/index?type=export', '备份数据库', 'iconfont icon-indentation-right', 1, 1, 0, 1, 1, ''),
(38, 62, 'Admin/Database/del', '删除', '', 1, 0, 0, 1, 1, ''),
(39, 37, 'Admin/Database/repair', '修复表', '', 1, 0, 0, 1, 1, ''),
(40, 37, 'Admin/Database/optimize', '优化表', '', 1, 0, 0, 1, 1, ''),
(41, 1, 'Admin/Index/index', '后台首页', '', 1, 0, 1, 1, 1, ''),
(42, 41, 'Admin/Index/menu', '导航菜单', '', 1, 0, 1, 1, 1, ''),
(45, 4, 'Admin/Model/index', '模型管理', 'iconfont icon-box-empty', 1, 0, 0, 1, 3, ''),
(46, 45, 'Admin/Model/add', '新增', '', 1, 0, 0, 1, 1, ''),
(47, 45, 'Admin/Model/edit', '编辑', '', 1, 0, 0, 1, 1, ''),
(48, 45, 'Admin/Model/del', '删除', '', 1, 0, 0, 1, 1, ''),
(49, 4, 'Admin/ModelField/index', '字段管理', '', 1, 0, 1, 1, 4, ''),
(50, 49, 'Admin/ModelField/add', '新增', '', 1, 0, 0, 1, 1, ''),
(51, 49, 'Admin/ModelField/edit', '编辑', '', 1, 0, 0, 1, 1, ''),
(52, 49, 'Admin/ModelField/del', '删除', '', 1, 0, 0, 1, 1, ''),
(61, 4, 'Admin/Config/group', '系统设置', 'iconfont icon-shezhi', 1, 0, 0, 1, 1, ''),
(57, 6, 'Admin/User/index', '用户管理', 'iconfont icon-account', 1, 0, 0, 1, 1, ''),
(58, 57, 'Admin/User/add', '新增', '', 1, 0, 0, 1, 1, ''),
(59, 57, 'Admin/User/edit', '编辑', '', 1, 0, 0, 1, 1, ''),
(60, 57, 'Admin/User/del', '删除', '', 1, 0, 0, 1, 1, ''),
(62, 5, 'Admin/Database/index?type=import', '还原数据库', 'iconfont icon-indentation-left', 1, 1, 0, 1, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `gms_config`
--

CREATE TABLE IF NOT EXISTS `gms_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置标题',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` text NOT NULL COMMENT '配置参数',
  `remark` varchar(100) NOT NULL COMMENT '说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` int(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- 转存表中的数据 `gms_config`
--

INSERT INTO `gms_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, 'Gms管理系统', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, 'Gms管理系统', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'Gms管理系统', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭|1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字|1:字符|2:文本|3:数组|4:枚举|5:编辑器', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '000-1', 9),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '用于系统配置中批量更改的分组', 1379228036, 1384418383, 1, '1:基本|2:内容|3:用户|4:系统', 4),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩|1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通|4:一般|9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '1', 10),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace信息', 4, '0:关闭|1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1),
(58, 'ACTION_TYPE', 3, '行为类型', 3, '', '行为的类型', 0, 0, 1, '1:系统|2:用户', 0),
(59, 'USER_STATUS_TYPE', 3, '用户状态类型', 3, '', '用户状态类型', 0, 0, 1, '0:禁用|1:启用', 0),
(60, 'USERGROUP_STATUS_TYPE', 3, '用户组状态', 3, '', '用户组状态', 0, 0, 1, '0:禁用|1:启用|2:暂停使用|3:废弃', 0),
(61, 'ADMIN_QQ', 1, '管理员QQ', 4, '管理员的QQ号码', '', 0, 0, 1, '912524639', 0),
(62, 'LEFT_MENU_STYLE', 4, '左侧导航风格', 4, '1:Metro|2:列表', '', 0, 0, 1, '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `gms_message`
--

CREATE TABLE IF NOT EXISTS `gms_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_from_id` varchar(30) NOT NULL DEFAULT '0',
  `send_to_id` varchar(30) NOT NULL DEFAULT '0',
  `outbox` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '发件箱',
  `inbox` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '收件箱',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_time` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msgtoid` (`send_to_id`,`inbox`),
  KEY `replyid` (`replyid`),
  KEY `folder` (`send_from_id`,`inbox`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `gms_message`
--

INSERT INTO `gms_message` (`id`, `send_from_id`, `send_to_id`, `outbox`, `inbox`, `status`, `message_time`, `subject`, `content`, `replyid`) VALUES
(1, '123', 'admin', 1, 1, 1, 1445351465, '1', 'fffff', 0),
(2, 'admin', '123', 1, 1, 1, 1445352160, '2', 'asd', 0),
(3, 'admin', 'admin', 1, 1, 1, 1445352225, '3', 'asdasd', 0),
(4, 'admin', 'ghj001', 1, 1, 0, 1445354533, '1111', 'asdasd', 0);

-- --------------------------------------------------------

--
-- 表的结构 `gms_model`
--

CREATE TABLE IF NOT EXISTS `gms_model` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` char(30) NOT NULL COMMENT '标识',
  `title` char(30) NOT NULL COMMENT '名称',
  `table_name` varchar(50) NOT NULL COMMENT '表名',
  `is_extend` varchar(10) NOT NULL DEFAULT '0' COMMENT '允许子模型',
  `extend` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `list_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '列表类型',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` tinyint(2) NOT NULL DEFAULT '1',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `gms_model`
--

INSERT INTO `gms_model` (`id`, `name`, `title`, `table_name`, `is_extend`, `extend`, `list_type`, `create_time`, `update_time`, `status`, `sort`, `engine_type`) VALUES
(1, 'Config', '配置管理', 'config', '0', 0, 0, 1444220333, 1444220363, 1, 1, 'MyISAM'),
(2, 'Action', '行为管理', 'action', '0', 0, 0, 1444370327, 1444370358, 1, 1, 'MyISAM'),
(3, 'ActionLog', '日志管理', 'action_log', '0', 0, 0, 1444382543, 1444382567, 1, 1, 'MyISAM'),
(4, 'User', '用户管理', 'user', '0', 0, 0, 1444385741, 1444385783, 1, 1, 'MyISAM'),
(5, 'AuthGroup', '用户组管理', 'auth_group', '0', 0, 1, 1444387156, 1444387187, 1, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `gms_model_field`
--

CREATE TABLE IF NOT EXISTS `gms_model_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `field` varchar(100) NOT NULL COMMENT '字段定义',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `extra` text NOT NULL COMMENT '参数',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `sort_l` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '列表',
  `sort_s` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '搜索',
  `sort_a` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '新增',
  `sort_e` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '修改',
  `l_width` varchar(10) NOT NULL DEFAULT '100' COMMENT '列表宽度',
  `field_group` varchar(5) NOT NULL DEFAULT '1' COMMENT '字段分组',
  `validate_rule` text NOT NULL COMMENT '验证规则',
  `auto_rule` text NOT NULL COMMENT '完成规则',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型字段表' AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `gms_model_field`
--

INSERT INTO `gms_model_field` (`id`, `model_id`, `name`, `title`, `type`, `field`, `value`, `remark`, `extra`, `status`, `sort_l`, `sort_s`, `sort_a`, `sort_e`, `l_width`, `field_group`, `validate_rule`, `auto_rule`, `create_time`, `update_time`) VALUES
(1, 1, 'name', '配置名称', 'string', 'varchar(30) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 1, 1, 1, 1, '100', '1', '', '', 1444220333, 1444220333),
(2, 1, 'type', '配置类型', 'select', 'tinyint(3) unsigned NOT NULL ', '0', '', 'a:6:{s:4:"type";s:1:"3";s:6:"option";s:27:"CONFIG_TYPE_LIST|type|title";s:9:"form_type";s:1:"1";s:8:"multiple";s:1:"0";s:8:"editable";s:5:"false";s:8:"required";s:1:"0";}', 1, 2, 2, 2, 2, '100', '1', '', '', 1444220333, 1444277770),
(3, 1, 'title', '配置标题', 'string', 'varchar(50) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 3, 3, 3, 3, '100', '1', '', '', 1444220333, 1444220333),
(4, 1, 'group', '配置分组', 'select', 'tinyint(3) unsigned NOT NULL ', '0', '', 'a:6:{s:4:"type";s:1:"3";s:6:"option";s:29:"CONFIG_GROUP_LIST|group|title";s:9:"form_type";s:1:"1";s:8:"multiple";s:1:"0";s:8:"editable";s:5:"false";s:8:"required";s:1:"0";}', 1, 4, 4, 4, 4, '100', '1', '', '', 1444220333, 1444277788),
(5, 1, 'extra', '配置参数', 'textarea', 'text NOT NULL', '', '', 'a:2:{s:5:"width";s:5:"300px";s:6:"height";s:4:"80px";}', 1, 0, 0, 5, 5, '100', '1', '', '', 1444220333, 1444226651),
(6, 1, 'remark', '说明', 'textarea', 'varchar(100) NOT NULL ', '', '', 'a:2:{s:5:"width";s:5:"300px";s:6:"height";s:4:"80px";}', 1, 6, 6, 6, 6, '100', '1', '', '', 1444220333, 1444226670),
(7, 1, 'create_time', '创建时间', 'datetime', 'int(11) unsigned NOT NULL ', '0', '', 'a:2:{s:9:"from_type";s:11:"datetimebox";s:8:"required";s:1:"0";}', 1, 0, 0, 0, 0, '100', '1', '', '', 1444220333, 1444226381),
(8, 1, 'update_time', '更新时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', 'a:2:{s:9:"from_type";s:11:"datetimebox";s:8:"required";s:1:"0";}', 1, 0, 0, 0, 0, '100', '1', '', '', 1444220333, 1444226404),
(9, 1, 'status', '状态', 'select', 'int(3) unsigned NOT NULL ', '1', '', 'a:6:{s:4:"type";s:1:"1";s:6:"option";s:17:"1:启用|0:禁用";s:9:"form_type";s:1:"1";s:8:"multiple";s:1:"0";s:8:"editable";s:5:"false";s:8:"required";s:1:"0";}', 1, 9, 9, 9, 9, '100', '1', '', '', 1444220333, 1444277796),
(10, 1, 'value', '配置值', 'textarea', 'text NOT NULL', '', '', 'a:2:{s:5:"width";s:5:"400px";s:6:"height";s:4:"80px";}', 1, 0, 0, 10, 10, '100', '1', '', '', 1444220333, 1444226499),
(11, 1, 'sort', '排序', 'num', 'int(4) unsigned NOT NULL ', '0', '', 'a:9:{s:8:"required";s:1:"0";s:8:"unsifned";s:1:"0";s:3:"min";s:1:"0";s:3:"max";s:3:"999";s:9:"precision";s:1:"0";s:16:"decimalSeparator";s:1:".";s:14:"groupSeparator";s:1:",";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";}', 1, 11, 11, 11, 11, '100', '1', '', '', 1444220333, 1444226171),
(12, 2, 'name', '标识', 'string', 'char(30) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 1, 1, 1, 1, '140', '1', '', '', 1444370327, 1444370832),
(13, 2, 'title', '标题', 'string', 'char(80) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 2, 2, 2, 2, '140', '1', '', '', 1444370327, 1444370402),
(14, 2, 'remark', '描述', 'textarea', 'char(140) NOT NULL ', '', '', 'a:2:{s:5:"width";s:5:"300px";s:6:"height";s:4:"80px";}', 1, 3, 3, 3, 3, '220', '1', '', '', 1444370327, 1444382480),
(15, 2, 'rule', '行为规则', 'textarea', 'text NOT NULL', '', '', 'a:2:{s:5:"width";s:5:"300px";s:6:"height";s:4:"80px";}', 1, 0, 0, 4, 4, '100', '1', '', '', 1444370327, 1444370434),
(16, 2, 'log', '日志规则', 'textarea', 'text NOT NULL', '', '', 'a:2:{s:5:"width";s:5:"300px";s:6:"height";s:4:"80px";}', 1, 0, 0, 5, 5, '100', '1', '', '', 1444370327, 1444370447),
(17, 2, 'type', '类型', 'select', 'tinyint(2) unsigned NOT NULL ', '1', '', 'a:6:{s:4:"type";s:1:"3";s:6:"option";s:22:"ACTION_TYPE|type|title";s:9:"form_type";s:1:"1";s:8:"multiple";s:1:"0";s:8:"editable";s:5:"false";s:8:"required";s:1:"0";}', 1, 6, 6, 6, 6, '60', '1', '', '', 1444370327, 1444370619),
(18, 2, 'status', '状态', 'select', 'tinyint(2) NOT NULL ', '0', '', 'a:6:{s:4:"type";s:1:"1";s:6:"option";s:17:"0:禁用|1:启用";s:9:"form_type";s:1:"1";s:8:"multiple";s:1:"0";s:8:"editable";s:5:"false";s:8:"required";s:1:"0";}', 1, 7, 7, 7, 7, '60', '1', '', '', 1444370327, 1444370612),
(19, 2, 'update_time', '修改时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', 'a:2:{s:9:"from_type";s:7:"datebox";s:8:"required";s:1:"0";}', 1, 8, 8, 0, 0, '100', '1', '', '', 1444370327, 1444370654),
(20, 3, 'action_id', '行为id', 'string', 'int(10) unsigned NOT NULL ', '0', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 1, 1, 1, 1, '100', '1', '', '', 1444382543, 1444382543),
(21, 3, 'user_id', '执行用户id', 'string', 'int(10) unsigned NOT NULL ', '0', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 2, 2, 2, 2, '100', '1', '', '', 1444382543, 1444382543),
(22, 3, 'action_ip', '执行行为者ip', 'string', 'bigint(20) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 3, 3, 3, 3, '100', '1', '', '', 1444382543, 1444382543),
(23, 3, 'model', '触发行为的表', 'string', 'varchar(50) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 4, 4, 4, 4, '100', '1', '', '', 1444382543, 1444382543),
(24, 3, 'record_id', '触发行为的数据id', 'string', 'int(10) unsigned NOT NULL ', '0', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 5, 5, 5, 5, '100', '1', '', '', 1444382543, 1444382543),
(25, 3, 'remark', '日志备注', 'string', 'varchar(255) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 6, 6, 6, 6, '100', '1', '', '', 1444382543, 1444382543),
(26, 3, 'status', '状态', 'string', 'tinyint(2) NOT NULL ', '1', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 7, 7, 7, 7, '100', '1', '', '', 1444382543, 1444382543),
(27, 3, 'create_time', '执行行为的时间', 'string', 'int(10) unsigned NOT NULL ', '0', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 8, 8, 8, 8, '100', '1', '', '', 1444382543, 1444382543),
(28, 4, 'username', '用户名', 'string', 'varchar(64) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 1, 1, 1, 1, '150', '1', '', '', 1444385742, 1444386210),
(29, 4, 'nickname', '昵称/姓名', 'string', 'varchar(50) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 2, 2, 2, 2, '150', '1', '', '', 1444385742, 1444386216),
(30, 4, 'password', '密码', 'string', 'char(32) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 0, 0, 3, 3, '100', '1', '', '', 1444385742, 1444385809),
(31, 4, 'last_login_time', '上次登录时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', 'a:2:{s:9:"from_type";s:7:"datebox";s:8:"required";s:1:"0";}', 1, 4, 4, 0, 0, '110', '1', '', '', 1444385742, 1444386229),
(32, 4, 'last_login_ip', '上次登录IP', 'string', 'varchar(40) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 5, 5, 0, 0, '100', '1', '', '', 1444385742, 1444385844),
(33, 4, 'email', '邮箱', 'string', 'varchar(50) NOT NULL ', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 6, 6, 6, 6, '150', '1', '', '', 1444385742, 1444386244),
(34, 4, 'remark', '备注', 'textarea', 'varchar(255) NOT NULL ', '', '', 'a:2:{s:5:"width";s:5:"300px";s:6:"height";s:4:"80px";}', 1, 0, 7, 7, 7, '100', '1', '', '', 1444385742, 1444385884),
(35, 4, 'create_time', '创建时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', 'a:2:{s:9:"from_type";s:7:"datebox";s:8:"required";s:1:"0";}', 1, 8, 8, 0, 0, '110', '1', '', '', 1444385742, 1444385925),
(36, 4, 'update_time', '更新时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', 'a:2:{s:9:"from_type";s:7:"datebox";s:8:"required";s:1:"0";}', 1, 9, 9, 0, 0, '110', '1', '', '', 1444385742, 1444385919),
(37, 4, 'status', '状态', 'select', 'tinyint(2) NOT NULL ', '0', '', 'a:6:{s:4:"type";s:1:"3";s:6:"option";s:27:"USER_STATUS_TYPE|type|title";s:9:"form_type";s:1:"1";s:8:"multiple";s:1:"0";s:8:"editable";s:5:"false";s:8:"required";s:1:"0";}', 1, 10, 10, 10, 10, '60', '1', '', '', 1444385742, 1444386261),
(38, 4, 'info', '信息', 'textarea', 'text NOT NULL', '', '', 'a:2:{s:5:"width";s:5:"300px";s:6:"height";s:4:"80px";}', 1, 0, 0, 11, 11, '100', '1', '', '', 1444385742, 1444386107),
(39, 5, 'title', '用户组标题', 'string', 'varchar(80) NOT NULL', '', '', 'a:1:{s:8:"required";s:1:"0";}', 1, 1, 1, 1, 1, '120', '1', '', '', 1444387156, 1444387226),
(40, 5, 'status', '用户组状态', 'select', 'tinyint(2) NOT NULL ', '1', '', 'a:6:{s:4:"type";s:1:"3";s:6:"option";s:34:"USERGROUP_STATUS_TYPE|status|title";s:9:"form_type";s:1:"1";s:8:"multiple";s:1:"0";s:8:"editable";s:5:"false";s:8:"required";s:1:"0";}', 1, 2, 2, 2, 2, '100', '1', '', '', 1444387156, 1444393458),
(41, 5, 'rules', '用户权限', 'select', 'text NOT NULL', '', '', 'a:6:{s:4:"type";s:1:"4";s:6:"option";s:36:"Admin/Function/get_auth_rule|id|text";s:9:"form_type";s:1:"2";s:8:"multiple";s:1:"1";s:8:"editable";s:5:"false";s:8:"required";s:1:"0";}', 1, 0, 0, 3, 3, '100', '1', '', '', 1444387156, 1444387814),
(42, 5, 'sort', '排序', 'num', 'int(10) UNSIGNED NOT NULL', '1', '', 'a:9:{s:8:"required";s:1:"0";s:8:"unsifned";s:1:"1";s:3:"min";s:0:"";s:3:"max";s:0:"";s:9:"precision";s:1:"0";s:16:"decimalSeparator";s:1:".";s:14:"groupSeparator";s:1:",";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";}', 1, 4, 4, 4, 4, '100', '1', '', '', 1444387943, 1444387953);

-- --------------------------------------------------------

--
-- 表的结构 `gms_user`
--

CREATE TABLE IF NOT EXISTS `gms_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `nickname` varchar(50) NOT NULL COMMENT '昵称/姓名',
  `password` char(32) NOT NULL COMMENT '密码',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `last_login_ip` varchar(40) NOT NULL COMMENT '上次登录IP',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `point` tinyint(8) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `vip` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'vip等级',
  `overduedate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'vip到期时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `info` text NOT NULL COMMENT '信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `gms_user`
--

INSERT INTO `gms_user` (`id`, `username`, `nickname`, `password`, `last_login_time`, `last_login_ip`, `email`, `remark`, `amount`, `point`, `vip`, `overduedate`, `create_time`, `update_time`, `status`, `info`) VALUES
(1, 'admin', '超级管理员', '21232f297a57a5a743894a0e4a801fc3', 1443594705, '127.0.0.1', '912524639@qq.com', '备注信息', '0.00', 0, 0, 0, 1443594693, 1444457859, 1, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
