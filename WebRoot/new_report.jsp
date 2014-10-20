<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection"/>
<jsp:directive.page import="com.rfidcer.dao.BaseDao"/>
<jsp:directive.page import="java.sql.PreparedStatement"/>
<jsp:directive.page import="java.sql.ResultSet"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="site_media/css/css.css" type="text/css" rel="stylesheet" />
    <link href="site_media/css/themes/base/jquery.ui.all.css" rel="stylesheet" media="screen">
		<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="site_media/js/jquery.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="site_media/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="site_media/js/ui/jquery.ui.core.js" charset="UTF-8"></script>
<script type="text/javascript" src="site_media/js/ui/jquery.ui.widget.js" charset="UTF-8"></script>
<script type="text/javascript" src="site_media/js/ui/i18n/jquery.ui.datepicker-zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="site_media/js/ui/jquery.ui.datepicker.js" charset="UTF-8"></script>
<title>水质检测</title>
<style type="text/css">
html,body{margin:0;padding:0;font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;overflow:hidden;background-color: #3969ab;height: 100%}
.w_content{border: 1px solid white;padding: 10px;width:100%;padding-left:22px;}
.r_top{width: 100%;height: 50px;margin: 20px 0 20px 0;}
.r_top input{float: left;margin-left: 50px;width: 160px;height: 50px;text-align: center;font-weight: bold;font-size: 18px;}
.r_con{width:100%;height: auto;margin: auto;margin-bottom: 30px;padding:0px;}
.r_con table{border:0;text-align: center;height:100%; width: 100%;color: black;font-weight: bold;font-size: 20px;cellspacing:0px;cellpadding:0px;color:black;}
.r_con table tr th{height: 85px;border:2px solid black;color:black;font-size: 30px;}
.r_con table tr td{line-height:35px;height: 65px;color:black;border:2px solid black;font-size: 25px;}

.r_con table tr td{background-color:expression((this.parentElement.sectionRowIndex%2==0)?'#efffa7':'#fff');}
.back{float: right;margin-right:60%;}
.maspan{color: black;padding-left: 50px;font-size: 18px;font-weight: bold;}
.r_con1{width: 100%;height: auto;}
.r_con1 table{width: 100%;height: auto;}
.r_con1 talbe tr td{width: 100px;height: 30px;border: 1px solid red;}
.r_con2{width: 100%;height: auto;margin-bottom: 20px;margin-top: 50px;}
.r_con2 input{float: left;margin-left: 100px;width: 150px;height: 50px;margin-bottom: 20px;font-size: 18px;}
.r_con1 table tr{color: white;}
.bg_rep1{background:white;}
.bg_rep2{background:white;}
.bg_rep3{background:white;}
.bg_rep{background:white;}
.bg_rep4{background:white}
</style>
</head>
<body>

	<div class="w_div">
	<span style="position: absolute;top:50px;left:90%;"><font style="font-size:24px;display:block;text-align:right;" color="#FFFF99"><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></font></span>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td height="87" align="center" background="site_media/img/01.jpg"><img src="site_media/img/0023.png" width="601" height="48" />
			</td>
			</tr>
			<tr>
			<td height="2" background="site_media/img/03.jpg"><img src="site_media/img/03.jpg" width="4" height="4" />
			</td>
			</tr>
		</table>
		<div class="p_con">
			
				
				<div class="container-fluid" style="width: 99%">
    <div class="row">
      <div class="col-md-2" style="box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
         <div id="divLT" class="row" style="text-align:center;line-height:40px;height:20px;
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
             <div><font  style="font-size:20px" color='white'>实时数据</font></div>
         </div>
		 <div class="row">
            <div id="divL" class="col-md-12" line-height:40px;height:800px;
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
               <font  style="font-size:20px" color='white'><marquee onmouseover=this.stop() onmouseout=this.start() style="margin-left: 10px" scrollamount="5" height="100%" direction="up"><div id="runText"></div></marquee></font>
            </div>
         </div>
         <div class="row" >
             <div id="divLD1" style="text-align:center;line-height:60px;height:20px;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
               <div id="sjzl"><div onclick="javascript:location.href='/water/aa.jsp?index=1'"><font  style="font-size:20px" color='white'>数据总览</font></div></div>
               </div>
         </div>
         <div class="row">
             <div id="divLD2" style="text-align:center;line-height:60px;height:20px;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
               <div onclick="javascript:location.href='/water/aa.jsp'"><font  style="font-size:20px" color='white'>首页</font></div>
               </div>
         </div>
      </div>

      <div class="col-md-8" style="box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
         <div class="row"><!--startprint-->
            <div style="overflow:auto;height:100%;font-family: 'Helvetica Neue'; border:#ccc solid 1px;margin-right: 10px" id="dituContent"></div>
         <!--endprint--></div>
         <div id="can" class="row"">
         	<table width="100%" height="100%">
         		<tr>
         			<td style="text-align:center;line-height:60px;height:20px;font-size:22px;color:white;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #494;"
               onclick="today(1)">今日</td>
         			<td style="text-align:center;line-height:60px;height:20px;font-size:22px;color:white;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #494;"
               onclick="today(2)">本周</td>
         			<td style="text-align:center;line-height:60px;height:20px;font-size:22px;color:white;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #494;"
               onclick="today(3)">本月</td>
               		<td style="text-align:center;line-height:60px;height:20px;font-size:22px;color:white;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #494;" 
               onclick="doPrint()">日志</td>
         			<td style="text-align:center;line-height:60px;height:20px;font-size:22px;color:white;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #494;" 
               onclick="doPrint()">打印</td>
         		</tr>
         	</table>
         </div>
   </div>
	
    <div class="col-md-2" style="box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
         <div id="divRT" class="row" style="height:20px;text-align:center;line-height:40px;
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
             <div><font  style="font-size:20px" color='white'>显示标记</font></div>
         </div>
		 <div class="row">
            <div id="divR" class="col-md-12" style="height:700px;
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
               <font  style="font-size:20px" color='yellow'><div style="overflow:auto;height: 95%;margin-top: 10px;" id="Call"></div></font>
            </div>
         </div>
         <div class="row">
         	<div id="divRC"><div style="margin-top: 10px;" id="datepicker"></div></div>
         </div>
         <div class="row">
             <div id="divRD2" style="height:20px;text-align:center;line-height:60px;background-image:url('/water/site_media/img/button.png');
               box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
               <div onclick="javascript:location.href='/water/chartAllArea.jsp?corpAll=1'"><font  style="font-size:20px" color='white'>趋势数据</font></div>
               </div>
         </div>
      </div>
</div>
   </div>
			</div>
	</div>
	<script type="text/javascript">
	// 获取窗口宽度
	if (window.innerHeight)
		Wheight = window.innerHeight; 
	else if ((document.body) && (document.body.clientHeight))
		Wheight = document.body.clientHeight;
	//alert(winWidth+";"+winHeight);
//Wheight=document.body.clientHeight;
var h=parseInt(Wheight)*0.4;
$('#dituContent').css('height',parseInt(Wheight)*0.77);
//$('#dituContent').css('width',parseInt(document.body.clientWidth)*0.70);
$('#divL').css('height',parseInt(Wheight)*0.66);
$('#divLT').css('height',parseInt(Wheight)*0.05);
$('#divLD1').css('height',parseInt(Wheight)*0.07);
$('#divLD2').css('height',parseInt(Wheight)*0.07);
$('#divR').css('height',parseInt(Wheight)*0.72-280);
$('#divRT').css('height',parseInt(Wheight)*0.05);
$('#divRD2').css('height',parseInt(Wheight)*0.07);
$('#can').css('height',parseInt(Wheight)*0.08);
$('#divRC').css('height',280);

urlsq=1;

runText=$.ajax({url:"/water/GetCurrentDataAll",async:false});
$("#runText").html(runText.responseText);

function today(data){
	table=$.ajax({url:"/water/day_data.jsp?data="+data+"&corpId=",async:false});
	urlsq=data;
	$("#dituContent").html(table.responseText);
}
today(1);
$(function() {
	$( "#datepicker" ).datepicker({  
        dateFormat:'yy-mm-dd', 
        onSelect : function(dateText, inst){
        	table=$.ajax({url:"/water/date_data.jsp?data=1&time="+dateText+"&corpId=",async:false});
        	urlsq=dateText;
        	$("#dituContent").html(table.responseText);
        }
    });
});
dd=$.ajax({url:"/water/GetCalls",async:false});
dd=dd.responseText;
var stmp="";
var ddiv='<div style="text-align:center;line-height:40px;height:40px;box-shadow: inset 1px -1px 1px white, inset -1px 1px 1px white;">'
var i=0;
for(i=0;i<dd.split(';').length;i++){
	stmp+=ddiv+dd.split(';')[i]+'</div><br>';
}
$('#Call').html(stmp);
function doPrint() { 
	bdhtml=window.document.body.innerHTML; 
	sprnstr="<!--startprint-->"; 
	eprnstr="<!--endprint-->"; 
	prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
	prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
	//$('#r_con table tr td').css('height',30);
	//window.document.body.innerHTML=prnhtml; 
	//a=$.ajax({url:"/water/print.jsp",data:{print:urlsq},async:false})
	window.open("/water/print.jsp?data="+urlsq);
}
</script>
</body>
</html>