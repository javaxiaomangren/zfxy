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
</head>
<body>
<div id="man_zone">
  <table width="99%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
    <tr>
      <td width="18%" class="left_title_1"><span class="left-title">姓名:</span></td>
      <td width="82%">&nbsp;</td>
    </tr>
    <tr>
      <td class="left_title_2">密码:</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="left_title_1">性别:</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="left_title_2">职位:</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="left_title_1">联系电话:</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="left_title_2">邮件:</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="left_title_1">简介:</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</div>
</body>
</html>
    