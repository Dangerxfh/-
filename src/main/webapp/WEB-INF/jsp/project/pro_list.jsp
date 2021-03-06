<%@ page language="java" import="java.util.*" pageEncoding="UTf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>项目列表</title> 
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
 	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/nav.css">
 	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/listinfo.css">		
 	<script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js" ></script>
    <script src="<%=basePath%>js/downgundong.js"></script>
    <script type="text/javascript">
    function selectchange(index){
   			window.location.href="<%=basePath%>project/list/"+index+"/1";
    }
    $(function(){
    	/* 设置下拉菜单选中项为地址中的活动状态参数 */
        $("#selector").val('${requestScope.type}');
    });
	</script>
  </head>
  
  <body>
  	<c:import url="../top.jsp"/>
    <div class="container">
	    <div class="row col-xs-10 col-xs-offset-1">
	    	<div class="row">
	    		<ol class="breadcrumb" style="background: none;">
				    <li><a href="#" class="text-a">首页</a></li>
				    <li><a href="project.list/all/1">项目列表</a></li>
				</ol>
	    	</div>
	    	<div class="row rowtop">	
	   			<div class="news">
					<ul class="list">
						<li>腾讯公益大数据揭秘：看看哪里爱心最爆棚？</li>
						<li>垃圾分类从鼓励到强制，你准备好了吗？，你准备好了吗？你准备好了吗？重要的事情说三遍</li>
						<li>爱无国度，救助来自第三世界的人们，他们需要你的帮助！</li>
						<li>世界地球日 讲好我们的地球故事</li>
						<li>99公益日 一起爱！</li>
					</ul>
				</div>
				<div class="pull-right select1">
	    		项目状态:
		    	<select onchange="selectchange(this.options[this.options.selectedIndex].value)" id="selector">
		    		    <option value="all" selected="selected">全部</option>
		    			<option value="donate">募捐中</option>
		    			<option value="execute">执行中</option>
		    			<option value="end">结束</option>
		    	</select>
	    		</div>
	    	</div>
	    	<div class="row">			
				<c:forEach items="${pageProjectList}" var="project">
					<div class="media">	
					<br>				 
				        <a class="pull-left fixedimg" href="project/detail/${project.id }">
				            <img class="media-object" src="img/${project.id }.jpg">
				        </a>
				        <div class="media-body">
							<div class="leftmedia">
								
								<!-- 活动标题 -->
					        	<span class="media-heading h4"><a class="text-a" href="project/detail/${project.id }">${project.pro_Title }</a></span>
					     		<div class="descript">
					            	<span class="text-muted">项目简介&nbsp;|&nbsp;</span>
					            	<!-- 项目简介 -->
					        		<span id="pro_des">${fn:substring(project.pro_Des,0,80) }。。。。。。</span>
								</div>
								<br>
								<div class="meta">									
										<span class="text-muted">筹款目标&nbsp;|&nbsp;</span>
										<span>${project.pro_TargetNumber }元</span>
																	
										<span class="text-muted text-sponsor">执 行 方&nbsp;|&nbsp;</span>
										<span>${project.pro_Sponsor}</span> 
								</div>
							</div>
							<div class="rightmedia">
								<div class="">
								
									<p>		
										<!-- 项目状态 -->							
										<span class="text-muted">项目状态:&nbsp;</span>
										<span>${sessionScope.pro_status[project.pro_Status]}</span>
										<br>
									</p>
									<p class="left">
										<!-- 已筹元数或件数 -->
										<span class="text-muted">已筹:&nbsp;</span>
										<span class="text-red">${project.pro_CurNumber}元</span>
									</p>
									<p class="right text-right">
										<!-- 捐款 人次-->
										<span class="text-red">${project.pro_CurPeoples }</span>
										<span class="text-muted">人次捐款</span> 
									</p>
									<!-- 进度条 -->
									<div class="progress progress-striped active" style="height: 10px;">
									       <div class="progress-bar progress-bar-success" style="width:${project.pro_CurNumber>=project.pro_TargetNumber?100:project.pro_CurNumber*100/project.pro_TargetNumber}%"></div>
									</div>
									<!-- 进度条数字 -->
									<span class="text-muted number"><fmt:formatNumber  type="number" value="${project.pro_CurNumber>=project.pro_TargetNumber?100:project.pro_CurNumber*100/project.pro_TargetNumber}" maxFractionDigits="0"/>%</span> 
								   
									<c:if test="${project.pro_Status=='donate'}">	
										<a class="btn btn-success btn-sm" href="project/detail/${project.id }">我要参与</a> 
								   	</c:if>
								   	<c:if test="${project.pro_Status=='execute'}">
								   		<button class="btn btn-info btn-sm" disabled="disabled">执行中</button>
								   	</c:if>
								   	<c:if test="${project.pro_Status=='end'}">
								   		<button class="btn btn-danger btn-sm" disabled="disabled">已结束</button>
								   	</c:if>
								</div>
							</div>
				        </div>				        
    				</div>
				</c:forEach>
    				
    				<!-- 分页导航 -->
    				<ul class="pager">
					    <li><a href="project/list/${requestScope.type }/${requestScope.page-1==0?1:requestScope.page-1}">«上一页</a></li>
					    <li><a href="project/list/${requestScope.type }/${requestScope.page+1>page_sum?page_sum:requestScope.page+1}">下一页»</a></li>
					</ul>
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
