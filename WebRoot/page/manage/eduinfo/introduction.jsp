<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>学院简介</title>
	<link rel="stylesheet" href="css/common.css" type="text/css" /> 
	<script type="text/javascript" src="<%=request.getContextPath() %>/fckeditor/fckeditor.js"></script>
  </head>

<body>
<div id="man_zone">
<form action="edu.do?service=add"  method="post">
<input type="hidden" name="category" value="introduction">
  <table width="99%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
    <tr>
      <td width="12%" class="left_title_1" height="20"><span class="left-title">标 题:</span></td>
      <td><input type="text" name="title"size="40" value="哈尔滨师范大学政法学院简介"/></td>
    </tr>
     <tr>
      <td  class="left_title_2"><span >作 者:</span></td>
      		<td ><input type="text" name="author"size="20" />
      		<span class="registerTip">&nbsp;*不填视为作者匿名</span></td>
    </tr>
    <tr>
     <td  class="left_title_1"><span >审核:</span></td>
      		<td ><input type="radio" name="audited" id="radio" checked/>是
      			<input type="radio" name="audited" id="radio"/>否
      		<span class="registerTip">&nbsp;*默认通过，可以在前台显示</span></td>
    </tr>
    <tr>
    <td  class="left_title_2" width="12%">详细内容</td>
      <td class="left_title_2">
        <script type="text/javascript">
			var oFCKeditor = new FCKeditor( 'content' ) ;
			oFCKeditor.BasePath	= "<%=request.getContextPath() %>/fckeditor/" ;
			oFCKeditor.Height	="400" ;
			oFCKeditor.ToolbarSet="zfxy" ;
			oFCKeditor.Create() ;
  		</script> 
       </td>
      </tr>
    <tr>
      <td >&nbsp;</td>
      <td>&nbsp;&nbsp;
        <input type="submit" value="保存">
&nbsp;        <input type="button" value="取消" onClick="window.history.back()"></td>
      </tr>
  </table>
  </form>
</div>
</body>
</html>
