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