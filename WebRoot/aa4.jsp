<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" autoFlush="false" buffer="256kb"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="com.rfidcer.dao.BaseDao" />
<jsp:directive.page import="java.sql.PreparedStatement" />
<jsp:directive.page import="java.sql.ResultSet" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<script type="text/javascript" src="site_media/js/jquery.min.js"></script>
		<script type="text/javascript" src="site_media/js/json2.js"></script>
		<link href="site_media/css/css.css" type="text/css" rel="stylesheet" />
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<style type="text/css">
		 * {margin:0;padding:0}
body {background-color: #1F5183;margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;}
.p_con{width: 100%;height:840px; background: #3969A9;}
/*background: url(site_media/img/004.jpg);background-repeat: no-repeat;*/
.p_content{width: 100%;height: 840px;background-position: 0px 30px;}
.p_top{width: 90%;height: 65px;position: absolute;top: 110px;left: 150px;} 


.p_left{width: 100%;height: auto;float: left;margin-top: 6%;margin-left: 0%;}
.p_corp_1{float: left;background: url(site_media/img/b001.png);background-repeat:no-repeat;background-position: 50% 50%;width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px;margin-right:70px;}
.p_corp_2{float: left;background: url(site_media/img/b002.png);background-repeat: no-repeat;background-position: 50% 50%;width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px; margin-right:70px;}
.p_star{float: left;background: url(site_media/img/b002.png);background-repeat: no-repeat;background-position: 50% 50%; width: 18%;height: 63px;text-align: center;color:white;text-decoration: none;padding-top: 30px;font-weight: bold;font-size: 22px; margin-right:70px;}

.p_right{width: 680px;height:auto;color: white;position: absolute;top:230px;left:62%;font-size:15px;}
.line003{border-bottom: 1px solid #607495;border-right: 1px solid #607495;color: #539FDF;font-family: "微软雅黑","Arial Unicode MS";font-size: 20px;height: 50px;font-weight: bold;width:110px;}
.line001 {border-right-width: 1px;border-bottom-width: 1px;border-right-style: solid;border-bottom-style: solid;border-right-color: #607495;border-bottom-color: #607495;font-size: 20px;color:#FFF; padding-top:12px;padding-bottom:12px;}
.line002 {font-size: 14px;color: #FFF;border-bottom-width: 1px;border-bottom-style: solid;border-bottom-color: #607495;}
.f20px {font-family: "微软雅黑", "Arial Unicode MS";font-size: 20px;color: #FFF;font-weight: bold;}
.line005 {border-top-width: 1px;border-right-width: 1px;border-top-style: solid;border-right-style: solid;border-top-color: #62A1D6;border-right-color: #62A1D6;border-left-width: 1px;border-left-style: solid;border-left-color: #62A1D6;}
.p_bottom{width: 530px;height: 65px;position: absolute;top:220px;left: 60%;}
.orc{padding:2px;}
</style>
	</head>

	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="87" align="center" background="site_media/img/01.jpg">
					<img src="site_media/img/0023.png" width="401" height="48" />
				</td>
			</tr>
			<tr>
				<td height="2" background="site_media/img/03.jpg">
					<img src="site_media/img/03.jpg" width="4" height="4" />
				</td>
			</tr>
		</table>
		<div class="p_con">
			<div class="p_content">
				<div class="p_top" id="p_top">
				<!--javascript:location.href='aa.jsp-->
					<a href="javascript:location.href='aa.jsp'" id="p_corp"class="p_corp_1">自来水公司分布图</a>
					<a href="javascript:getSecond();"id="p_star" class="p_corp_2">上海行政区分布图</a>
					<a href="report.jsp?corpId=" id="toReport" class="p_corp_2">水质报表</a>
					<a href="chartAllArea.jsp?corpAll=1" id="toChart" class="p_corp_2">水质趋势图</a>	
				
				</div>
				
				<div class="p_left">
				</div>
				<div class="p_right">
					<table  border='0' cellspacing='0' cellpadding='1' width='100%'>
						<tr>
							<td class='line005'>
								<table width='100%' border='0' cellspacing='0' cellpadding='0'>
									<tr>
										<td height='50' colspan='6'
											background='site_media/img/005.jpg'>
											<table width='100%' border='0' cellpadding='0'
												cellspacing='0' class='f20px'>
												<tr>
													<td width='50' align='center'>
														<img src='site_media/img/009.png' alt='' width='11'
															height='11' />
													</td>
													<td>
														水质主要参数总体均值
													</td>
													<td width='100' align='center'> 
														
													</td>
												</tr>
											</table>
										</td>
										<td background='site_media/img/005.jpg' height='50'
											colspan='6'></td>
									</tr>
									<tr>
										<td align='center' background='site_media/img/006_1.jpg' style="width:600px;"
											class='line003'>
											所属自来水公司
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											浊度<br/>(NTU)
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											PH值
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											余氯<br/> (mg/L) 
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											电导率<br/>(ms/mV)
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											溶解氧<br/>(mg/L)
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											ORP<br/>(mV)
										</td>
										<td align='center' background='site_media/img/006_1.jpg'
											class='line003'>
											水温<br/>(C)
										</td>
									</tr>
									<%
										Connection con = BaseDao.getConnection();
										String sql = "select corp_name,status_day,ph,turbidity,rc,d_oxygen,conductivity,orp,device_watercorp.id,C from current_corp_param"
+" right join device_watercorp on (device_watercorp.id=current_corp_param.id)";
										PreparedStatement psta = con.prepareStatement(sql);
										ResultSet rs = psta.executeQuery();
										while (rs.next()) {
									%>
									<tr>
										<td align='center' background='site_media/img/007.png'
											class='line001' onclick="location.href='report.jsp?corpId=<%=rs.getString("id") %>&sub=1'">
											<%=rs.getString(1)%>
											
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble(4)%>-->
											<%=rs.getDouble(4) > 0.5 ? "<font color='#f6f457'>"
								+ rs.getDouble(4) + "</font>"
								: "<font color='white'>" + rs.getDouble(4)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<%=rs.getDouble(3) >= 6.5 && rs.getDouble(3) <= 8.5 ? "<font color='white'>"
								+ rs.getDouble(3) + "</font>"
								: "<font color='#f6f457'>" + rs.getDouble(3)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble(5) %>-->
											<%=rs.getDouble(5) > 0.5||rs.getDouble(5)<0.3 ? "<font color='#f6f457'>"
								+ rs.getDouble(5) + "</font>"
								: "<font color='white'>" + rs.getDouble(5)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble(7) %>-->
											<%=rs.getDouble(7) > 1250 || rs.getDouble(7)<125? "<font color='#f6f457'>"
								+ rs.getDouble(7) + "</font>"
								: "<font color='white'>" + rs.getDouble(7)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble(6)%>-->
											<%=rs.getDouble(6)<6? "<font color='#f6f457'>"
								+ rs.getDouble(6) + "</font>"
								: "<font color='white'>" + rs.getDouble(6)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<!--<%=rs.getDouble(8)%>-->
											<%=rs.getDouble(8)<150||rs.getDouble(8)>550? "<font color='#f6f457'>"
								+ rs.getDouble(8) + "</font>"
								: "<font color='white'>" + rs.getDouble(8)
										+ "</font>"%>
										</td>
										<td align='center' background='site_media/img/007.png'
											class='line001'>
											<%= rs.getDouble("C") %>
										</td>
									</tr>
									<%
									}
									con.close();%>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<script type="text/javascript">
        getAllDevice();
       
	function getSecond(){
	   $("#p_corp").removeClass('p_corp_1');
        $("#p_corp").addClass('p_corp_2');
     
	   $("#p_star").removeClass('p_corp_2');
        $("#p_star").addClass('p_corp_1');
        
        $("#toReport").attr("href","report.jsp?areaId=31");
        $("#toChart").attr("href","chartAllArea.jsp?areaAll=1");
        getForErea();
	    getMap();
	}
	function getMap(){
	$(".p_left").empty();
       	$(".p_left").append("<img src='site_media/img/004A.jpg' width='61%' height='85%' border='0' usemap='#Map' style='z-index:0;'/><map name='Map' id='Map'>"
		  	+"<area shape='poly' coords='412,107,424,131,432,146,431,159,423,171,428,181,435,189,439,202,445,212,452,220,449,229,445,237,430,238,420,244,424,247,432,247,440,249,453,254,460,263,454,273,441,277,431,283,421,288,407,279,386,267,363,267,337,273,314,267,302,256,290,249,281,236,274,219,267,207,259,198,260,186,299,147,321,131,344,116,361,109,361,111' href='report.jsp?areaId=310113' title='嘉定区' class='1'/>"
		    +"<area shape='poly' coords='363,269,361,277,368,286,373,295,381,305,387,309,398,308,408,316,416,327,422,338,411,342,398,347,388,354,379,362,368,367,354,370,342,368,336,361,325,354,313,357,305,365,299,375,289,385,277,391,263,385,253,380,241,378,235,385,237,394,246,404,249,412,249,420,240,424,226,420,218,418,220,431,226,438,224,450,220,469,215,489,208,502,197,505,183,499,177,497,167,506,162,517,157,528,141,523,131,519,127,514,122,505,127,494,131,479,130,465,124,457,109,454,97,454,84,458,73,460,62,461,50,458,48,450,50,439,54,425,58,414,57,401,51,392,41,388,32,386,28,377,31,367,49,358,65,361,75,364,86,356,94,352,105,355,117,357,131,358,143,359,155,355,165,349,174,354,183,359,192,361,194,348,197,342,210,345,218,346,219,323,216,307,216,290,217,277,215,268,210,263,215,257,230,251,239,247,260,253,277,253,291,252,303,261,317,270,330,276,350,273,361,269' href='report.jsp?areaId=310117' title='青浦区' class='2'/>"
		    +"<area shape='poly' coords='421,339,436,352,454,379,458,402,437,429,430,461,422,482,454,485,457,513,448,540,451,550,409,545,390,545,380,551,355,548,342,534,315,540,287,546,267,538,232,557,225,538,216,531,197,554,179,560,165,553,154,541,159,526,168,508,177,500,190,503,198,507,209,502,218,481,223,463,226,448,226,439,221,429,220,420,234,424,246,423,250,410,240,395,237,383,245,378,257,383,278,393,299,375,314,359,328,355,338,364,347,371,363,370,379,361,394,349,413,341,420,340' href='report.jsp?areaId=310116'  title='松江区' />"
		    +"<area shape='poly' coords='452,550,479,600,485,616,509,624,526,634,547,652,513,673,493,697,470,726,441,746,420,746,402,751,374,767,358,755,360,730,364,719,346,701,326,688,323,668,307,676,284,685,260,682,243,678,229,655,249,624,230,617,213,608,199,605,166,623,156,638,139,625,125,625,107,630,103,621,108,607,132,589,129,575,119,567,125,547,126,529,127,523,122,509,137,525,153,526,157,539,160,550,172,558,187,560,199,550,209,540,217,533,227,547,233,557,266,540,280,543,287,548,315,541,339,534,355,547,383,550,390,545,426,548' href='report.jsp?areaId=310115' title='金山区' class='3'/>"
		    +"<area shape='poly' coords='548,652,577,642,609,631,637,623,671,615,703,611,718,607,738,603,756,603,771,600,793,603,815,606,832,608,831,525,814,504,785,488,749,470,728,469,702,471,676,464,644,463,631,470,606,468,582,460,564,454,537,462,473,485,455,485,457,514,448,542,458,561,473,590,485,617,505,623,521,632,548,651' href='report.jsp?areaId=310118' title='奉贤区' />"
		    +"<area shape='poly' coords='834,606,855,605,883,598,902,596,926,592,948,580,959,555,952,528,941,477,928,462,842,351,782,368,764,355,741,360,738,350,732,342,712,359,692,354,690,336,599,329,599,340,610,353,605,362,596,364,615,368,633,378,618,396,631,401,616,419,626,431,622,444,636,456,647,463,672,464,697,470,727,470,749,472,763,477,784,487,807,502,825,513,832,523,834,603,834,603' href='report.jsp?areaId=310104' title='南汇区' />"
		    +" <area shape='poly' coords='601,365,616,369,629,377,621,394,630,403,617,419,625,433,622,444,643,463,629,470,613,469,567,455,471,487,456,486,423,482,432,458,435,437,439,429,457,408,457,385,403,309,387,309,369,285,365,268,385,268,411,286,431,284,435,297,428,314,439,322,463,319,473,322,524,380,545,372,564,361,592,363,601,366' href='report.jsp?areaId=310111' title='闵行区' />"
		    +"<area shape='poly' coords='837,350,812,358,785,368,766,354,743,360,733,343,714,359,694,354,691,337,602,330,599,341,610,356,601,365,574,362,553,367,544,353,545,333,555,317,570,308,577,296,572,276,588,268,605,263,622,254,622,237,616,213,581,199,573,187,577,172,600,175,619,185,637,187,658,199,678,211,692,219,709,221,727,230,754,252,788,289,820,324,838,350,838,350' href='report.jsp?areaId=310114' title='浦东新区'/>"
		    +"<area shape='poly' coords='576,171,570,184,576,195,561,206,559,226,542,219,529,225,505,231,493,250,473,239,447,237,455,222,441,199,435,185,426,169,432,159,434,146,414,107,415,99,435,100,450,102,478,112,512,132,539,146,557,158,567,158,576,172' href='report.jsp?areaId=310112' title='宝山区' />"
		    +"<area shape='poly' coords='546,320,542,333,543,351,544,364,551,369,534,378,524,379,506,356,488,335,482,325,497,321,507,312,511,306,525,302,538,313,546,321' href='report.jsp?areaId=310104' title='徐汇区'/><area shape='poly' coords='482,325,469,319,440,323,430,315,432,303,437,292,434,283,440,279,452,290,467,290,487,290,496,291,504,286,511,301,504,312,495,321,483,325' href='report.jsp?areaId=310105' title='长宁区'/>"
		    +"<area shape='poly' coords='553,320,528,302,538,292,546,289,562,312,548,320' href='report.jsp?areaId=310103' title='卢湾区' /><area shape='poly' coords='529,302,521,302,511,307,507,286,510,272,519,268,530,273,535,279,538,292,530,302' href='report.jsp?areaId=310106' title='静安区'/>"
		    +"<area shape='poly' coords='564,310,576,298,574,277,565,273,555,274,536,278,539,291,545,289,561,309' href='report.jsp?areaId=310102' title='黄浦区' /><area shape='poly' coords='498,290,453,289,443,278,455,273,461,263,455,251,439,249,423,244,432,237,447,237,474,238,490,249,498,246,513,249,522,260,502,287' href='report.jsp?areaId=310107' title='普陀区'/><area shape='poly' coords='562,272,536,276' href='report.jsp?areaId=310113' title='5'/>"
		    +"<area shape='poly' coords='560,274,537,276,517,268,523,259,512,248,500,245,506,233,517,229,525,227,538,241,538,251,549,251,562,266,562,274' href='report.jsp?areaId=310113' /><area shape='poly' coords='573,275,564,274,563,267,551,251,540,251,541,243,528,226,544,221,556,229,565,236,574,241,583,252,594,267,576,275' href='report.jsp?areaId=310109' title='虹口区'/><area shape='poly' coords='597,266,613,258,623,252,620,229,617,213,579,199,572,199,565,205,560,226,571,242,587,259,596,265' href='report.jsp?areaId=310110' title='杨浦区'/><area shape='poly' coords='831,184' href='report.jsp?areaId=310113' title='7'/>"
		 	+"<area shape='poly' coords='829,184,821,176,812,170,800,170,780,166,767,163,752,159,730,153,716,147,695,142,685,145,667,139,645,131,624,121,599,114,579,108,567,100,542,90,530,81,529,74,522,72,513,69,508,70,496,70,492,61,475,49,478,38,492,34,509,27,531,26,551,26,572,32,588,46,598,54,618,55,634,71,645,71,662,87,679,91,704,97,736,108,762,115,783,125,809,129,830,136,844,142,852,148,849,165,846,176,832,184' href='report.jsp?areaId=310230' title='崇明岛'/>"   
		 	+" </map>");
	}
	function getForErea(){
				var content="<table width='100%' border='0' cellspacing='0' cellpadding='1'><tr><td class='line005'><table width='100%' border='0' cellspacing='0' cellpadding='0'><tr> <td height='50' colspan='6' background='site_media/img/005.jpg'><table width='100%' border='0' cellpadding='0' cellspacing='0' class='f20px'> <tr><td width='50' align='center'><img src='site_media/img/009.png' alt='' width='11' height='11' /></td> <td>水质主要参数总体均值</td> <td width='100' align='center'></td></tr> </table></td><td background='site_media/img/005.jpg' height='50' colspan='6'></td></tr>";
			content+="<tr><td align='center' background='site_media/img/006_1.jpg' class='line003' style='width:300px;'>所属行政区</td><td align='center' background='site_media/img/006_1.jpg' class='line003'>浊度<br/>(NTU)</td><td align='center' background='site_media/img/006_1.jpg' class='line003'>PH值 </td><td align='center' background='site_media/img/006_1.jpg' class='line003'>余氯<br/> (mg/L)</td><td align='center' background='site_media/img/006_1.jpg' class='line003'>电导率<br/>(ms/mV)</td><td  align='center' background='site_media/img/006_1.jpg' class='line003'>溶解氧<br/>(mg/L)</td><td  align='center' background='site_media/img/006_1.jpg' class='line003'>ORP<br/>(mV)</td><td  align='center' background='site_media/img/006_1.jpg' class='line003'>水温<br/>(C)</td></tr>"; 
  
				$(".p_right").empty();

				<%
			 con=BaseDao.getConnection();
			 sql=
			"select a.area_name,b.* from current_area_param as b right join device_area as a on (a.id=b.id)";
			 psta =con.prepareStatement(sql);
			 rs=psta.executeQuery();
			while(rs.next()){
			if(rs.getString("area_name").trim().equalsIgnoreCase("上海市")){
				continue;
			}
			 //System.out.println(rs.getString(9));%>
					content+="<tr onclick="+'"'+"location.href='report.jsp?areaId=<%=rs.getString(9) %>';"+'"'+"><td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getString(1)%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(4) > 0.5 ? "<font color='#f6f457'>"+ rs.getDouble(4) + "</font>": "<font color='white'>" + rs.getDouble(4)+ "</font>"%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(3) >= 5 && rs.getDouble(3) <= 9 ? "<font color='white'>"+rs.getDouble(3) + "</font>": "<font color='#f6f457'>" + rs.getDouble(3)+ "</font>"%>"
					+"</td><td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(5) > 0.5||rs.getDouble(5)<0.3 ? "<font color='#f6f457'>"+ rs.getDouble(5) + "</font>": "<font color='white'>" + rs.getDouble(5)+ "</font>"%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(7) > 1250 || rs.getDouble(7)<125? "<font color='#f6f457'>"+ rs.getDouble(7) + "</font>": "<font color='white'>" + rs.getDouble(7)+ "</font>"%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(6)<6? "<font color='#f6f457'>"+ rs.getDouble(6) + "</font>": "<font color='white'>" + rs.getDouble(6)+ "</font>"%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%=rs.getDouble(8)<150||rs.getDouble(8)>550? "<font color='#f6f457'>"+ rs.getDouble(8) + "</font>": "<font color='white'>" + rs.getDouble(8)+ "</font>"%></td>"
					+"<td align='center' background='site_media/img/007.png' class='line001 orc'><%= rs.getDouble("C") %></td></tr>";
				<%}%>	
				
				content+="</table></td></tr></table>";
				$(".p_right").append(content);
	}
	
	function getAllDevice(){
	$(".p_left").empty();
       	$(".p_left").append("<img src='site_media/img/try7.jpg'	width='55%'  height='78%' border='0' usemap='#Map' style='z-index:0;margin-top:35px;margin-left:70px;'/>"
		    +"<div class='mapicon' id='mapicon'> </div>");
				$("#mapicon").empty();
				var st;
				var id;
				var left;
				var top;
				var mapdiv;
				<%
					sql=
					"select device_device.id as id,device_info,device_watercorp.corp_name,device_watersubcorp.sub_corp_name,ph,turbidity,rc,d_oxygen,conductivity,x_pos,y_pos,device_device.status_id,orp,device_watersubcorp.id as subcorpid from device_device "
					+"inner join device_watercorp on (device_watercorp.id=device_device.corp_id) "
					+"inner join device_watersubcorp on (device_watersubcorp.id=device_device.sub_corp_id) "
					+"inner join hardsocket_water_param on (hardsocket_water_param.device_id=device_device.id and hardsocket_water_param.send_time=(select max(send_time) from hardsocket_water_param where device_id=device_device.id)) ";
					psta=con.prepareStatement(sql);
					rs=psta.executeQuery(sql);
					while(rs.next()){
					int x=0;
				%>
				var y = document.getElementById('<%=rs.getString("subcorpid")%>');if(!y) {
					if(<%=!rs.getString("orp").equalsIgnoreCase("FFFF")&&rs.getString("conductivity").equalsIgnoreCase("FFFF")&&rs.getString("d_oxygen").equalsIgnoreCase("FFFF")&&rs.getString("rc").equalsIgnoreCase("FFFF")&&rs.getString("turbidity").equalsIgnoreCase("FFFF")&&rs.getString("ph").equalsIgnoreCase("FFFF")&&rs.getDouble("d_oxygen")>=6&&rs.getDouble("conductivity")>=125&&rs.getDouble("conductivity")<=1250&&rs.getDouble("rc")>=0.3&&rs.getDouble("rc")<=0.5&&rs.getDouble("ph")>=6.5&&rs.getDouble("ph")<=8.5&&rs.getDouble("orp")>=150&&rs.getDouble("orp")<=500&&rs.getDouble("turbidity")<=0.5%>){
						var img="<img src='site_media/img/icongreen.png' id='<%=rs.getString("subcorpid")%>' style='width:40px;height:45px;'/>";
						$("#mapicon").append(img);
						$("#<%=rs.getString("subcorpid")%>").css("top","<%=rs.getString("y_pos")%>px"); 
					 	$("#<%=rs.getString("subcorpid")%>").css("left","<%=rs.getString("x_pos")%>px");
					}else{
						var img="<img src='site_media/img/iconred.png'  id='<%=rs.getString("subcorpid")%>'/>";
						$("#mapicon").append(img);
						$("#<%=rs.getString("subcorpid")%>").css("top","<%=rs.getString("y_pos")%>px"); 
					 	$("#<%=rs.getString("subcorpid")%>").css("left","<%=rs.getString("x_pos")%>px");
					}
					
					 }
				<%x=x+1;}
				con.close();%>
	}
$("#mapicon img").live("mouseout",function(){
	$(".mapdiv").remove();
});


$("#mapicon img").live("mouseover",function(){
	var id=$(this).attr("id");
	var left=$(this).offset().left;
	var top=$(this).offset().top;
	$.ajax({
		url:"/water/getDetail.do?id="+id+"&ts=<%=new Date().getTime()%>",
		type:"GET",
		dataType:"json",
		success:function(data){
		
			var mapdiv=" <div class='mapdiv' style='top:"+(top-85)+"px;left:"+(left+25)+"px;' id='mapdiv'><table border='1' cellpadding='0' cellspacing='0'>"
			+"<tr><td colspan='6'>"+data["corp"]
			//+data["subcorp"]+","+data["deviceid"]+"</td></tr>"
			+data["subcorp"]+"</td></tr>"
			+"<tr class='a'><td>PH</td><td>电导率(ms/mV)</td><td>溶解氧(mg/L)</td><td>余氯(mg/L)</td><td>浊度(NTU)</td><td>ORP<br/>(mV)</td></tr>"
			+"<tr class='b'><td>"+data["ph"]+"</td><td>"+data["conductivity"]+"</td><td>"+data["d_oxygen"]+"</td><td>"+data["rc"]+"</td><td>"+data["turbidity"]+"</td><td>"+data["orp"]+"</td></tr>"
			+"</table></div>";
			$("body").append(mapdiv);
			if(data["ph"]<5||data["ph"]>9){
				//$(".a td:eq(0)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(0)").attr("style", "border:1px solid red;color:red");
			}
			if(data["conductivity"]<125||data["conductivity"]>1250){
				//$(".a td:eq(1)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(1)").attr("style", "border:1px solid red;color:red");
			}
			if(data["d_oxygen"]<6){
				//$(".a td:eq(2)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(2)").attr("style", "border:1px solid red;color:red");
			}
			if(data["rc"]<0.3||data["rc"]>0.5){
				//$(".a td:eq(3)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(3)").attr("style", "border:1px solid red;color:red");
			}
			if(data["turbidity"]>0.5){
				//$(".a td:eq(4)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(4)").attr("style", "border:1px solid red;color:red");
			}
			if(data["orp"]<150||data["orp"]>500){
				//$(".a td:eq(5)").attr("style", "border:1px solid red;color:red");
				$(".b td:eq(5)").attr("style", "border:1px solid red;color:red");
			}
		
	},error: function(xhr,status,errMsg){   
		alert(errMsg.code+"<br/>"+errMsg.msg+status);   
    }  
	});
});

$("#mapicon img").live("click",function(){
	var id=$(this).attr("id");
	location.href="chartsub.jsp?table=hour_subcorp_param&id="+id;
});
	
	
	
</script>
	</body>
</html>

