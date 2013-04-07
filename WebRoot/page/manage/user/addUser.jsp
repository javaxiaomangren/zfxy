<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <script type="text/javascript">
    function checkAdd(){
    	var flag = false  ;
	 	if(document.userForm.name.value==""){
	 		alert("用户名不能为空");
	 		return flag;
	 	}else if(document.userForm.name.value.length>16){
	 			alert("用户名长度小于16");
	 			document.userForm.name.value="" ;
	 			return flag ;
	 	}
	 	else if (document.getElementById("password").value.length <6) {
					alert("输入的密码不能小于6位字符");
					document.getElementById("password").value="" ;
					  userForm.rePwd.value="";
					return flag ;
		} 
		 else if(userForm.rePwd.value==""){
				   alert("再次输入密码");
				   return flag ; 
		 } 
	  else if(userForm.password.value!=userForm.rePwd.value){ 
       		  alert("两次输入密码不一致，请重新输入!"); 
	    	 	  userForm.password.value=""; 
	   		  	  userForm.rePwd.value="";
	       		  return flag; 
	  }
	else if(userForm.email.value==""){ 
	   alert("填写邮件");
		return flag ; 
	}
	else if(userForm.tel.value==""){ 
	   alert("填写电话");
		return flag ; 
	}
	 else{
	 		flag = true ;
	 }
	 	return flag ;
    }
    </script>
    <title>添加用户</title>
</head>
<body>
<div id="man_zone">
<form action="usm.do?service=add" method="post" id="userForm" name="userForm">
<input type="hidden" name="category" value="student">
  <table width="99%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
    <tr>
      <td width="18%" class="left_title_1"><span class="left-title">姓名:</span></td>
      <td width="82%">&nbsp;<input type="text" name="name" id="name" />
      <span class="registerInfo">&nbsp;*必填</span></td>
    </tr>
    <tr>
      <td class="left_title_2"><span class="left-title">密码:</span></td>
      <td>&nbsp;<input type="password" name="password" id="password" />
      			<span  class="registerInfo">&nbsp;*必填</span></td>
    </tr>
    <tr>
      <td class="left_title_1"><span class="left-title">再次输入密码:</span></td>
      <td>&nbsp;<input type="password" name="rePwd" id="rePwd" />
      			<span  class="registerInfo">&nbsp;*必填</span></td>
    </tr>
    <tr>
      <td class="left_title_2"><span class="left-title">Email:</span></td>
      <td>&nbsp;<input type="text" name="email" id="email" onblur=" chkEmail()" />
    <span class="registerInfo">&nbsp;*必填</span>  </td>
    </tr>
    <tr>
       <td class="left_title_1"><span class="left-title">Tel:</span></td>
  	   <td>&nbsp;<input type="text" name="tel" id="tel" onblur="chkphono()" />
  	   <span class="registerInfo">&nbsp;*必填</span></td>
    </tr>
     <tr>
       <td class="left_title_2"><span class="left-title">性别:</span></td>
  	   <td>&nbsp;
			<input type="radio" name="sex" value="男" checked="checked" />男&nbsp;&nbsp;
			<input type="radio" name="sex" value="女"  />女&nbsp;&nbsp;
			<span class="registerInfo">&nbsp;*必填</span>
		</td>
    </tr>
     <tr>
       <td class="left_title_1"><span class="left-title">在校职位:</span></td>
  	   <td>&nbsp;<input type="text" name="position"/>
  	   	<span class="registerTip">&nbsp;如:学生会主席、普通学生、普通教师、教授、院长...</span></td>
    </tr>
    <tr>
     <td class="left_title_2"><span class="left-title">简介:</span></td>
  	   <td>
  	   <input type="text" width="100%" height="40" size="100" name="detail" style="border: 0px;" />
			<span  class="registerTip">&nbsp;*输入100字以内的简介</span></td>
    </tr>
    <tr>
      <td class="left_title_1">&nbsp;</td>
      <td>
      			&nbsp;<input type="submit" value="添加" onclick="return checkAdd()" >&nbsp;&nbsp;&nbsp;&nbsp;
      			<input type="button" value="取消" onclick="return window.history.back()"/>
      </td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>