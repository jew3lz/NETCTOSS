<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <ul id="menu">
                <li><a href="/NETCTOSS/login/toIndex" class="index_off"></a></li>
                <li><a href="/NETCTOSS/role/list/1" class="role_off"></a></li>
                <li><a href="/NETCTOSS/admin/list/-1/*/1" class="admin_off"></a></li>
                <li><a href="/NETCTOSS/fee/list/1" class="fee_off"></a></li>
                <li><a href="/NETCTOSS/account/account_list/*/*/*/-1/1" class="account_off"></a></li>
                <li><a href="/NETCTOSS/service/list/*/*/*/-1/1" class="service_off"></a></li>
                <li><a href="../bill/bill_list.html" class="bill_off"></a></li>
                <li><a href="../report/report_list.html" class="report_off"></a></li>
                <li><a href="../user/user_info.html" class="information_off"></a></li>
                <li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <form action="" method="" class="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>业务账号ID：</span></div>
                <div class="input_info"><input type="text" value="1" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>账务账号ID：</span></div>
                <div class="input_info"><input type="text" value="101" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>客户姓名：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="张三" /></div>
                <div class="text_info clearfix"><span>身份证号码：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="230111111111111111" /></div>
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info"><input type="text" value="192.168.0.23" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>OS 账号：</span></div>
                <div class="input_info"><input type="text" value="openlab1" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>状态：</span></div>
                <div class="input_info">
                    <select disabled>
                        <option>开通</option>
                        <option>暂停</option>
                        <option>删除</option>
                    </select>                        
                </div>
                <div class="text_info clearfix"><span>开通时间：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>资费 ID：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info"><input type="text" readonly class="width200 readonly" /></div>
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70 readonly" readonly>包 20 小时，20 小时以内 24.5 元，超出部分 0.03 元/分钟</textarea>
                </div>  
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="location.href='service_list.html';" />
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>NetCTOSS项目</span>
            <br />
            <span>版权所有(C)XXX.Inc </span>
        </div>
    </body>
</html>
