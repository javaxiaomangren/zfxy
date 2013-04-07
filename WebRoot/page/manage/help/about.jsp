<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Simrobot</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	SimRobot&nbsp;Studio<br/> 
	
			<p>&nbsp;&nbsp;&nbsp;&nbsp;(智能机器人足球仿真工作室)以学生为主要成员，主要宗旨是引导学生学习计算机编程技术，
		设计实现算法解决应用问题，提高学生理论和应用能力。工作室雏形创建于2004年，具有深厚的
		技术基础和辉煌的竞赛成绩，2004年之前曾先后获得第四届全国机器人足球锦标赛（11对11）全
		国冠军，FIRA奥地利维也纳世界机器人足球大赛（11对11）世界冠军，第五届全国机器人足球锦
		标赛（5对5）全国冠军，FIRA韩国釜山世界杯机器人足球大赛（5对5）世界冠军。2004年以后，
		多次在国家机器人足球比赛中取得优异成绩。另外，工作室成员曾参加全国软件人才设计大赛，并
		获得省级二等奖和国家级三等奖的优异成绩。</p>
		<p>  &nbsp;&nbsp;&nbsp;&nbsp; 目前实验室主要分为C++、J2EE、移动设备软件开发、嵌入式软件开发和多媒体软件开发五个方向，
    每个方向以小组的方式边学习边做应用开发。
  	 	 C++方向，主要任务是做仿真机器人足球的策略代码和windows下桌面应用程序开发。
  		J2EE方向，主要任务是基于Java框架开发Web应用程序。</p>
  	 <p> &nbsp;&nbsp;&nbsp;&nbsp;移动设备软件开发，主要任务是分析android系统，基于android框架做手机应用，
   			并由此拓展开发WM、Symbian、IPhone下的应用程序。</p>
  <p>&nbsp;&nbsp;&nbsp;&nbsp;  嵌入式软件开发，主要任务是基于已有的51实验箱和arm9开发板，尝试一些嵌入式设备的开发
    多媒体软件开发，主要任务是为其他小组的项目提供美工的技术支持，并且制作Flash、Flex的交互多媒体软件。
    从2011年下半年开始，SimRobot Studio将进入物联网技术的世界，探索传感器网络的相关理论和应用技术，紧跟技术浪潮，踏踏实实做人、认认真真做事，为学生成才搭建良好的技术平台。
	</p>
  </body>
</html>
