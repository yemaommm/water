<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

    <% String data=request.getParameter("data"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="site_media/css/themes/base/jquery.ui.all.css" rel="stylesheet" media="screen">
		<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="site_media/js/jquery.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="site_media/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="site_media/js/ui/jquery.ui.core.js" charset="UTF-8"></script>
<script type="text/javascript" src="site_media/js/ui/jquery.ui.widget.js" charset="UTF-8"></script>
<script type="text/javascript" src="site_media/js/ui/i18n/jquery.ui.datepicker-zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="site_media/js/ui/jquery.ui.datepicker.js" charset="UTF-8"></script>
<style type="text/css">
html,body{margin:0;padding:0;font-family: "Helvetica Neue";overflow:hidden;background-color: #3969ab;}
.w_content{border: 1px solid white;padding: 10px;width:100%;padding-left:22px;}
.r_top{width: 100%;height: 50px;margin: 20px 0 20px 0;}
.r_top input{float: left;margin-left: 50px;width: 160px;height: 50px;text-align: center;font-weight: bold;font-size: 18px;}
.r_con{width:100%;height: auto;margin: auto;margin-bottom: 30px;padding:0px;}
.r_con table{border:0;text-align: center;width: 100%;color: black;font-weight: bold;font-size: 20px;cellspacing:0px;cellpadding:0px;color:black;}
.r_con table tr th{height: 55px;border:2px solid black;color:black;font-size: 30px;}
.r_con table tr td{line-height:25px;height: 40px;color:black;border:2px solid black;font-size: 20px;}

.r_con table tr td{background-color:expression((this.parentElement.sectionRowIndex%2==0)?'#efffa7':'#fff');}
.bg_rep1{background:white;}
.bg_rep2{background:white;}
.bg_rep3{background:white;}
.bg_rep{background:white;}
.bg_rep4{background:white}
</style>
<title>水质检测</title>
</head>
<body>
<div style="text-align: center;font-size: 18px">市生活饮用水卫生监督预警控制平台</div>
<div id="dx"></div>
</body>
<script type="text/javascript">
function today(data){
	table=$.ajax({url:"/water/day_data.jsp?data="+data+"&corpId=",async:false});
	$("#dx").html(table.responseText);
}
function dateday(data){
	table=$.ajax({url:"/water/date_data.jsp?data=1&time="+data+"&corpId=",async:false});
	$("#dx").html(table.responseText);
}
<% if(data.length()==1){ %>
	today('<%=data %>');
<% }else if(data.length()==10){ %>
	dateday('<%=data %>');
<% } %>
window.print();
</script>
</html>