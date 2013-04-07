<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" href="css/common.css" type="text/css" /> 
	<script type="text/javascript" src="<%=request.getContextPath() %>/fckeditor/fckeditor.js"></script>
  </head>
<body>
<div id="man_zone">
<form action="edu.do?service=add"  method="post">
<input type="hidden" name="category" value="<%=request.getParameter("type") %>">
<input type="hidden" name="photopath">
<input type="hidden" name="isphoto">
  <table width="99%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
    <tr>
      <td width="12%" class="left_title_1" height="20"><span class="left-title">标题名称</span></td>
      <td width="31%"><input type="text" name="title"size="40" /></td>
      <td colspan="3" class="left_title_2" >&nbsp;</td>
    </tr>
     <tr>
      <td  class="left_title_2"><span >作者</span></td>
      		<td ><input type="text" name="author"size="20" />
      		<span class="registerTip">&nbsp;*不填视为作者匿名</span></td>
      		<td width="10%"  class="left_title_1">新闻来源</td>
      		<td width="16%" ><input type="text" name="resource" id="resource"  /></td>
    </tr>
    <tr>
     <td  class="left_title_1"><span >审核</span></td>
      		<td ><input type="radio" name="audited" id="radio"  value="是" checked/>是
      			<input type="radio" name="audited" id="radio" value="否" />否
      		<span class="registerTip">&nbsp;*默认通过，可以在前台显示</span></td>
      		<td >&nbsp;</td>
	  <td colspan="2" >&nbsp;</td>
    </tr>
    <tr>
      <td class="left_title_2">描述</td>
      <td colspan="4">
		<script type="text/javascript">
			var oFCKeditor = new FCKeditor( 'content' ) ;
			oFCKeditor.BasePath	= "<%=request.getContextPath() %>/fckeditor/" ;
			oFCKeditor.Height	="400" ;
		//	oFCKeditor.Width="500" ;
		//	oFCKeditor.Value="invoking with javascript" ;
			oFCKeditor.ToolbarSet="zfxy" ;
			oFCKeditor.Create() ;
  		</script> 
		</td>
    </tr>
    <tr>
      <td >&nbsp;</td>
      <td colspan="4">&nbsp;
      <input type="submit" value="保存">&nbsp;&nbsp;
      <input type="button" value="取消" onclick="window.history.back()"></td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
