<?php
return array(
    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__STATIC__' => __ROOT__ . '/Public/Static',
        '__IMG__'    => __ROOT__ . '/Public/User/images',
        '__CSS__'    => __ROOT__ . '/Public/User/css',
        '__JS__'     => __ROOT__ . '/Public/User/js',
    ),
	'AUTH_USER_INDEX'=>'User/Index/index',
	'AUTH_USER_GATEWAY'=>'User/Public/login',
	
	'LANG_SWITCH_ON' => true,   // 开启语言包功能
	'LANG_AUTO_DETECT' => true, // 自动侦测语言 开启多语言功能后有效
	'LANG_LIST'        => 'zh-cn', // 允许切换的语言列表 用逗号分隔
	'VAR_LANGUAGE'     => 'l', // 默认语言切换变量
	
    /* 后台错误页面模板 */
    //'TMPL_ACTION_ERROR'     => 'Public/error', // 默认错误跳转对应的模板文件
    //'TMPL_ACTION_SUCCESS'   =>  'Public/success', // 默认成功跳转对应的模板文件
);