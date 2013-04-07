<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="com.windy.zfxy.user.domain.*" %>
<%@ page  import="com.windy.zfxy.utils.*" %>
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
    <title>修改用户</title>
</head>
<body>
<div id="man_zone">
<form action="usm.do?service=modify" method="post" id="userForm">
<input type="hidden" name="category" value="student">
<input type="hidden" name="id" value="<%=userinfo.getId()==0 ? "":userinfo.getId() %>">
       <table width="99%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
    <tr>
      <td width="18%" class="left_title_1"><span class="left-title">姓名:</span></td>
      <td width="82%">&nbsp;<input type="text" value="<%=userinfo.getName()==null||userinfo.getName().equals("")? "": userinfo.getName()%>" name="name" id="name" onblur="chkUser()"/>
      <span class="registerInfo">&nbsp;*必填</span></td>
    </tr>
    <tr>
      <td class="left_title_2"><span class="left-title">密码:</span></td>
      <td>&nbsp;<input type="text" value="<%=userinfo.getPassword()==null||userinfo.getPassword().equals("")? "":userinfo.getPassword() %>" name="password" id="password" onblur="chkPass()"/>
      			<span  class="registerInfo">&nbsp;*必填</span></td>
    </tr>
    <tr>
      <td class="left_title_1"><span class="left-title">Email:</span></td>
      <td>&nbsp;<input type="text" value="<%=userinfo.getEmail()==null||userinfo.getEmail().equals("")?"":userinfo.getEmail() %>" name="email" id="email" onblur=" chkEmail()"/>
     <span class="registerInfo">&nbsp;*必填</span> </td>
    </tr>
    <tr>
       <td class="left_title_2"><span class="left-title">Tel:</span></td>
  	   <td>&nbsp;<input type="text" value="<%=userinfo.getTel() ==null||userinfo.getTel() .equals("")?"":userinfo.getTel() %>" name="tel" id="tel" onblur="chkphono()"/>
  	   <span class="registerInfo">&nbsp;*必填</span></td>
    </tr>
     <tr>
       <td class="left_title_1"><span class="left-title">性别:</span></td>
  	   <td>&nbsp;
			<input type="radio" name="sex" value="男" <%=userinfo.getSex()!=null&&userinfo.getSex().trim().equals("男")?"checked":"" %> />男&nbsp;&nbsp;
			<input type="radio" name="sex" value="女" <%=userinfo.getSex()!=null&&userinfo.getSex().trim().equals("女")?"checked":"" %>  />女&nbsp;&nbsp;
			<span class="registerInfo">&nbsp;*必填</span>
		</td>
    </tr>
     <tr>
       <td class="left_title_1"><span class="left-title">在校职位:</span></td>
  	   <td>&nbsp;<input type="text" name="position"  value="<%=userinfo.getPosition()==null||userinfo.getPosition().equals("")?"":userinfo.getPosition() %>"/>
  	   	<span class="registerTip">&nbsp;如:学生会主席、普通学生、普通教师、教授、院长...</span></td>
    </tr>
    <tr>
     <td class="left_title_2"><span class="left-title">简介:</span></td>
  	   <td>
  	   <input type="text" width="100%" height="40" size="100" name="detail" style="border: 0px;"
  	    value="<%=userinfo.getDetail()==null||userinfo.getDetail() .equals("")?"":userinfo.getDetail() %>" />
			<span  class="registerTip">&nbsp;*输入100字以内的简介</span></td>
    </tr>
    <tr>
      <td class="left_title_1">&nbsp;</td>
      <td>
      			&nbsp;<input type="submit" value="保存"  />&nbsp;&nbsp;&nbsp;&nbsp;
      			<input type="button" value="取消" onclick="return window.history.back()"/>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>