<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ page  import="com.windy.zfxy.user.domain.*" %>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%
	UserInfo userinfo  =(UserInfo) request.getAttribute("userinfo") ;
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="css/common.css" type="text/css" />
        <script type="text/javascript" src="js/validate.js"></script>
        	<script type="text/javascript" src="<%=request.getContextPath() %>/fckeditor/fckeditor.js"></script>
    <script type="text/javascript">
    function checkAdd(){
    	var flag = false  ;
	 	if(document.userForm.name.value==""){
	 		alert("姓名不能为空");
	 		return flag;
	 	}else if(document.userForm.name.value.length>16){
	 			alert("姓名长度小于16");
	 			document.userForm.name.value="" ;
	 			return flag ;
	 	}
	 else{
	 		flag = true ;
	 }
	 	return flag ;
    }
    </script>
</head>
<body>
<div id="man_zone">
<form action="usm.do?service=modify" method="post" id="userForm">
	<input type="hidden" name="id" value="<%=userinfo.getId()==0 ? "":userinfo.getId() %>">
	<input type="hidden" name="category" value="<%=userinfo.getCategory().equals("")? "":userinfo.getCategory() %>">
  <table width="99%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
    <tr>
      <td width="18%" class="left_title_2"><span class="left-title">姓名:</span></td>
      <td width="82%">&nbsp;
      	<input type="text" name="name" id="name" value="<%=userinfo.getName()==null||userinfo.getName().equals("")? "": userinfo.getName()%>" >
      <span class="registerInfo">&nbsp;*必填</span></td>
    </tr>
    <tr>
     <td class="left_title_2"><span class="left-title">简介:</span></td>
  	   <td>
  	   <textarea cols="60" rows="6"  name="detail" style="border: 0px;">
  	   <%=userinfo.getDetail()==null||userinfo.getDetail() .equals("")?"":userinfo.getDetail() %></textarea>
  	  </td>
    </tr>
    <tr>
      <td class="left_title_1">上传照片:&nbsp;</td>
      <td>
  		 <FCK:editor instanceName="head">
					<jsp:attribute name="height">300</jsp:attribute>
					<jsp:attribute name="width">230</jsp:attribute>
					<jsp:attribute name="basePath">/fckeditor/</jsp:attribute>
					<jsp:attribute name="toolbarSet">photo</jsp:attribute>
					<jsp:attribute name="value"><img width="200" height="250" src="<%=userinfo.getHead()%>"></jsp:attribute>
		</FCK:editor>	
		</td>
    </tr>
    <tr>
      <td class="left_title_2">&nbsp;</td>
      <td>
      			&nbsp;<input type="submit" value="保存" onclick="return checkAdd()" >&nbsp;&nbsp;&nbsp;&nbsp;
      			<input type="button" value="取消" onclick="return window.history.back()"/>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>