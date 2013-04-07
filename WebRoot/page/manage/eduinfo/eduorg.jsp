<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>机构设置</title>
	<link rel="stylesheet" href="css/common.css" type="text/css" /> 
  </head>

<body>
<div id="man_zone">
  <table width="99%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
    <tr>
      <td width="12%" class="left_title_1" height="20"><span class="left-title">标题</span></td>
      <td width="88%"><input type="text" name="title"size="40" value="政学政法学院机构设置"/></td>
    </tr>
     <tr>
      <td  class="left_title_2"><span >作者</span></td>
      		<td ><input type="text" name="author"size="20" />
      		<span class="registerTip">&nbsp;*不填视为作者匿名</span></td>
    </tr>
    <tr>
     <td  class="left_title_1"><span >审核</span></td>
      		<td ><input type="radio" name="audited" id="radio" checked/>是
      			<input type="radio" name="audited" id="radio"/>否
      		<span class="registerTip">&nbsp;*默认通过，可以在前台显示</span></td>
    </tr>
    <tr>
      <td class="left_title_2">机构设置</td>
      <td><textarea rows="20" cols="100" name="jigou"></textarea></td>
    </tr>
    <tr>
      <td >&nbsp;</td>
      <td>&nbsp;
      <input type="submit" value="保存">&nbsp;&nbsp;
      <input type="button" value="取消" onclick="window.history.back()"></td>
    </tr>
  </table>
</div>
</body>
</html>
