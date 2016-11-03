<%@ page contentType="text/html; charset=UTF-8" 
	import="java.text.*,org.json.JSONObject,java.util.ArrayList,java.io.PrintWriter"
	import="java.util.HashMap,java.util.List,java.sql.*,java.util.Map,java.io.IOException"%>
<%@ page import="java.sql.*" %> 
<% 
  Class.forName("com.mysql.jdbc.Driver").newInstance(); 
  String URL = "jdbc:mysql://localhost:3306/test?useUnicodeEncoding='UTF-8'"; 
  String sqlusername = "root"; 
  String password = "dx10010409"; 
  Connection conn = DriverManager.getConnection(URL,sqlusername,password); 
  Statement stmt = conn.createStatement(); 
%> 
<%
	String username=(String)session.getAttribute("username");
	System.out.print(username);
	String id=(String)session.getAttribute("id");
	System.out.print(id);
	session.setAttribute("username",username);
	session.setAttribute("id",id);
%>
<html>
<head>
	<meta content="text/html" charset="utf-8">
	<title>Learner管理平台</title>
	<link rel="stylesheet" href="css/style.css">
	<scripe src="js/style.js"></script>
	<script src="js/jquery-1.2.6.min.js"></script>
	
	<style type="text/css">
	#PARENT{
width:80px;
padding-left:3px;
}
	#nav {
	width:70px;
	line-height: 44px; 
	list-style-type: none;
	text-align:left;

	}

	#nav a {
	width: 240px; 
	display: block;
	padding-left:20px;

	}

	#nav li {
	background:#CCC; 
	border-bottom:#FFF 1px solid; 
	float:left;

	}

	#nav li a:hover{
	background:#CC0000;
	}

	#nav a:link {
	color:#666; text-decoration:none;
	}
	#nav a:visited {
	color:#666;text-decoration:none;
	}
	#nav a:hover {
	color:#FFF;text-decoration:none;font-weight:bold;
	}


	#nav li ul {
	
	list-style:none;
	text-align:left;
	}
#nav li ul li{ 
padding-left:50px;
background: #EBEBEB;
}

#nav li ul a{
         padding-left:20px;
         width:160px;

}



#nav li ul a:link {
color:#666; text-decoration:none;
}
#nav li ul a:visited {
color:#666;text-decoration:none;
}
#nav li ul a:hover {
color:#F3F3F3;
text-decoration:none;
font-weight:normal;
background:#CC0000;
}

/*==============================*/
#nav li:hover ul {
left: auto;
}
#nav li.sfhover ul {
left: auto;
}
#content {
clear: left; 
}
#nav ul.collapsed {
display: none;
}
</style>
</head>

	<body>
		<div class="a1">
			<div>
				<br />
				<span class="a2">立足校园 服务学子</span>
				<span class="a3"><%=(String)session.getAttribute("username")%> | <a href="admin_login.html">退出</a></span>
			</div>
		</div>
		<div class="a4">
			<br />
			<span>管理平台-Learner</span>
			
		</div>
		<div class="a5">
			<div>
				<br />
				<br />
				<span class="a6">管理平台</span>
				
			</div>
		</div>


		<div class="a8">
		
		 	<div class="a56">		 	
				<div id="PARENT">
					<ul id="nav">
						<li><a href="#Menu=ChildMenu1" onClick="DoMenu('ChildMenu1')">分类资源</a>
							<ul id="ChildMenu1" class="collapsed">
								<li><a href="admin2.jsp?page=1#Menu=ChildMenu1">课件</a></li>
								<li><a href="admin3.jsp?page=1#Menu=ChildMenu1">课后答案</a></li>
								<li><a href="admin4.jsp?page=1#Menu=ChildMenu1">实验报告</a></li>
								<li><a href="admin5.jsp?page=1#Menu=ChildMenu1">大作业</a></li>
								<li><a href="admin6.jsp?page=1#Menu=ChildMenu1">试题</a></li>
							</ul>
						</li>
						<li><a href="admin7.jsp?page=1#Menu=ChildMenu1">论坛管理</a>	</li>
						<li><a href="admin8.jsp?page=1#Menu=ChildMenu1">上传</a></li>
						<li><a href="admin9.jsp?page=1#Menu=ChildMenu1">流量统计</a></li>
					</ul>
				</div>
		 	</div>
			
			
			<div id="tabs">
				<div>
					<div class="a12">
						<br />
						<span class="a13">全部</span>
					</div>
					<div class="a15">
						<ul>	
						<%
							int intRowCount;  //总行数 
							int intPageCount; //总页数 
							int intPageSize;  //页面行数 
							int intPage;      //页码数 
							String strPage;   //页面传递参数 
							int i,k; 
							intPageSize = 5;  //定义每页显示3条记录 
							strPage= request.getParameter("page"); 
							System.out.print(page);
							intPage = 1; 
							String sqlQuery = "select count(id) from res order by id";      //count(jobid)就是计算总行数
							ResultSet rsCount = stmt.executeQuery(sqlQuery); 
							rsCount.next();    //游标指向第一行 
							intRowCount = rsCount.getInt(1); //取得总行数 
							System.out.print(intRowCount);
							intPageCount = intRowCount / intPageSize+1;//计算出总页数 
							i = (Integer.parseInt(strPage)-1)*intPageSize; 
						%>

						<%
							String resultQuery = "select * from res order by id desc";   
							ResultSet rs1=stmt.executeQuery(resultQuery); 
							for(int jjj=0;jjj<intPageSize*(Integer.parseInt(strPage)-1);jjj++){
							rs1.next();
							}
							if(intRowCount-intPageSize*(Integer.parseInt(strPage)-1)<intPageSize){
							for(int zzz=0;zzz<(intRowCount-intPageSize*(Integer.parseInt(strPage)-1));zzz++){
							rs1.next();
						%> 
							<li><br /><br /><span>&nbsp;&nbsp;&nbsp;<a href="">审核通过</a>  <a href="">编辑</a> <a href="">删除</a>&nbsp;&nbsp;&nbsp;[<%=rs1.getString("school")%>]</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>贡献人：<%=rs1.getString("username")%></span>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=rs1.getString("title")%></span></li>	

						<%				}
							}
							else{
							for(int kkk=0;kkk<intPageSize;kkk++){
							rs1.next();
						%> 				
							<li><br /><br /><span>&nbsp;&nbsp;&nbsp;<a href="">审核通过</a>  <a href="">编辑</a> <a href="">删除</a>&nbsp;&nbsp;&nbsp;[<%=rs1.getString("school")%>]</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>贡献人：<%=rs1.getString("username")%></span>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=rs1.getString("title")%></span></li>
						<%}
							}%>	
						</ul>
					</div>		
					<div class="a46">
						<ul class="pagination">
							<br />
							<li>第:[<%=Integer.parseInt(strPage)%>]页</li>
							<li><%if(Integer.parseInt(strPage) > 1){%><a href="admin.jsp?page=<%=Integer.parseInt(strPage)-1%>">上一页</a><%}else{%><a href="admin.jsp?page=<%=intPage%>">首页</a><%}%></li>
							<li><%if(Integer.parseInt(strPage) < intPageCount){%><a href="admin.jsp?page=<%=Integer.parseInt(strPage) + 1%>">下一页</a><%}else{%><a href="admin.jsp?page=<%=intPageCount%>">末页</a><%}%></li> 
						</ul>
					</div>
				</div>
			</div>		
		</div>

		<div class="a9">
			<br />
			<div class="a10">相关链接：<a href="http://www.scu.edu.cn/">四川大学官网</a>  | <a href="http://youth.scu.edu.cn/">四川大学团委</a> |  <a href="http://cs.scu.edu.cn/">计算机学院</a>  |  <a href="http://fyscu.com/">飞扬俱乐部</a></div><br />
			<div class="a11">Copyright@2016 Free Dom All rights reserved.</div>
		</div>
	</body>
</html>

<script type=text/javascript><!--
var LastLeftID = "";

function menuFix() {
var obj = document.getElementById("nav").getElementsByTagName("li");

for (var i=0; i<obj.length; i++) {
obj[i].onmouseover=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
}
obj[i].onMouseDown=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
}
obj[i].onMouseUp=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
}
obj[i].onmouseout=function() {
   this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
}
}
}

function DoMenu(emid)
{
var obj = document.getElementById(emid); 
obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
if((LastLeftID!="")&&(emid!=LastLeftID)) //¹Ø±ÕÉÏÒ»¸öMenu
{
document.getElementById(LastLeftID).className = "collapsed";
}
LastLeftID = emid;
}

function GetMenuID()
{

var MenuID="";
var _paramStr = new String(window.location.href);

var _sharpPos = _paramStr.indexOf("#");

if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
{
_paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
}
else
{
_paramStr = "";
}

if (_paramStr.length > 0)
{
var _paramArr = _paramStr.split("&");
if (_paramArr.length>0)
{
   var _paramKeyVal = _paramArr[0].split("=");
   if (_paramKeyVal.length>0)
   {
    MenuID = _paramKeyVal[1];
   }
}
/*
if (_paramArr.length>0)
{
   var _arr = new Array(_paramArr.length);
}

//È¡ËùÓÐ#ºóÃæµÄ£¬²Ëµ¥Ö»ÐèÓÃµ½Menu
//for (var i = 0; i < _paramArr.length; i++)
{
   var _paramKeyVal = _paramArr[i].split('=');
   
   if (_paramKeyVal.length>0)
   {
    _arr[_paramKeyVal[0]] = _paramKeyVal[1];
   } 
}
*/
}

if(MenuID!="")
{
DoMenu(MenuID)
}
}

GetMenuID(); //*ÕâÁ½¸öfunctionµÄË³ÐòÒª×¢ÒâÒ»ÏÂ£¬²»È»ÔÚFirefoxÀïGetMenuID()²»ÆðÐ§¹û
menuFix();
--></script>