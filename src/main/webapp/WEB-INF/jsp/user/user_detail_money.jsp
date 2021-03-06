<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人中心</title>
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"> 
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
 	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/nav.css">
 	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/myrecord.css">		
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"> 
 	<script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js" ></script>
    <script src="<%=basePath%>js/changecolor.js" ></script>

  </head>
<body onload="load()">
	<c:import url="../top.jsp"></c:import>
<div class="container">
    <div class="jumbotron">
        <img src="<%=basePath%>img/personaltop.jpg">
    </div>
    <div class="row">
	    <div class="col-xs-11 col-xs-offset-1">
	    	<div class="col-xs-3"  >
	            <ul class="nav nav-tabs nav-stacked text-center" id="sidebarMenu">
	                <li id="li1"><a href="<%=basePath%>user/detail/projects">我献出的爱心</a></li>
	                <li id="li3" class="active"><a href="<%=basePath%>user/detail/money">我的捐款记录</a></li>
	            	<li id="li4"><a href="<%=basePath%>user/detail/myinfo">修改个人信息</a></li>
	            </ul>
	        </div>
	        <div class="col-xs-9">
	        	<div class="row">
		        	<div class="content col-xs-10 col-xs-offset-1">
						<div class="title">
							 <span class="listtitle h2">
							 	我的捐款记录
							 	<span class="badge">共${requestScope.person_money }元</span>
							 </span>	
						</div>
					</div>
	        	</div>
	        	<div class="row col-xs-8 col-xs-offset-2">
	        	<c:forEach items="${requestScope.person_record}" begin="0" end="9" var="record">
	        		<div class="proj_content">   
		        		 <div class="content">    
			        		 <i class="greenspot beBig"></i>  
			        		 <!-- 项目名 -->      
			        		 <p class="name" style="margin-bottom:0;">参与的项目名称：<span>${record.proByProId.pro_Title}</span></p>
			        		 <!-- 捐款钱数 -->
			        		 <p class="text-muted">该次捐款钱数：<span class="text-red">${record.mon_Number }</span> 元</p>
			        		  <!-- 捐款时间 -->       
			        		 <p class="text-muted">${record.do_Time }</p>  
		        		 </div>  
	        		 </div>
	        	</c:forEach>	        	
	        	</div>	        	
			</div>
	    </div>
        
    </div>
</div>
<footer>
    <div class="layout partner">
		<div class="hd"><h2>联系我们</h2></div>
		<div class="style123">
		<p>公益项目咨询：gongyi@qq.com|公益项目合作：gongyi@qq.com</p>
		<p>主办：徐富豪(20142203780) ，王小婷(20142203777)，王春晓(20142203648)</p>
		<p>班级：1403,1404</p>
		<p><a>意见反馈</a>|<a>网友投诉</a></p>
		
		</div>
		<div class="bd"></div><br>
		<div class="text-center">@版权归徐富豪 ，王小婷，王春晓所有</div>
	</div>
</footer> 
</body>

</html>
