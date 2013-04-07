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
	<script type="text/javascript">
		function isEmpty(){
			if(document.upload.filename.value==""){
				alert("请输入文件名称") ;
				return  false ;
			}
			else  if(document.upload.fileRrl.value=""){
				alert("请选择文件");
				return false ; 
			}
		}
	</script>
  </head>
<body>
<div id="man_zone">
<form action="edu.do?service=upload"   method="post" name="upload">
<input type="hidden" name="category" value="<%=request.getParameter("category") %>">
  <table width="99%" border="0" align="center"  cellpadding="3" cellspacing="1" class="table_style">
    <tr>
      <td width="12%" class="left_title_1" height="30"><span class="left-title">文件名称</span></td>
      <td width="31%"><input type="text" name="title" id="filename"size="40" /></td>
      <td><span class="registerTip">&nbsp;*请填写文件名，文件上传使用了命名重定向</span></td>
    </tr>
     <tr>
      <td  class="left_title_2"><span >上传人</span></td>
      		<td ><input type="text" name="author"size="20" />
      		<span class="registerTip">&nbsp;*不填视为作者匿名</span></td>
      		<td  class="left_title_1">&nbsp;</td>
	  </tr>
    <tr>
     <td  class="left_title_1"><span >审核</span></td>
      		<td ><input type="radio" name="audited" id="radio"  value="是" checked/>是
      			<input type="radio" name="audited" id="radio" value="否" />否
      		<span class="registerTip">&nbsp;*默认通过，可以前台页面显示下载</span></td>
      		<td >&nbsp;</td>
	  </tr>
    <tr>
      <td class="left_title_2">选择文件</td>
      <td colspan="2">
		<script type="text/javascript">
			var oFCKeditor = new FCKeditor( 'fileUrl' ) ;
			oFCKeditor.BasePath	= "<%=request.getContextPath() %>/fckeditor/" ;
			oFCKeditor.Height	="50" ;
			oFCKeditor.ToolbarSet="file" ;
			oFCKeditor.Create() ;
  		</script> 
		</td>
   		<tr>
      <td >&nbsp;</td>
      <td colspan="2" height="120">&nbsp;
      <input type="submit" value="上传" onclick="return isEmpty()">&nbsp;&nbsp;
      <input type="button" value="取消" onclick="window.history.back()"></td>
    </tr>
  </table>
  </form>
</div>
</body>
</html>
