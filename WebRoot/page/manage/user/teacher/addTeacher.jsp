<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="css/common.css" type="text/css" />
		<script type="text/javascript" src="js/validate.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/fckeditor/fckeditor.js"></script>
		<script type="text/javascript">
    function checkAdd(){
    	var flag = false  ;
	 	if(document.userForm.name.value==""){
	 		alert("姓名不能为空");
	 		return flag;
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
			<form action="usm.do?service=add" method="post" id="userForm"
				name="userForm">
					<input type="hidden" name="category" value="<%=request.getParameter("category")==null&&
									request.getParameter("category").equals("")?"nocate": request.getParameter("category")%>" />
				<table width="99%" border="0" align="center" cellpadding="3"
					cellspacing="1" class="table_style">
					<tr>
						<td width="18%" class="left_title_2">
							<span class="left-title">姓名:</span>
						</td>
						<td width="82%">
							&nbsp;
							<input type="text" name="name" id="name" />
							<span class="registerInfo">&nbsp;*必填</span>
						</td>
					</tr>
					<tr>
						<td class="left_title_2">
							<span class="left-title">简介:</span>
						</td>
						<td>
							<textarea cols="80" rows="10" name="detail" style="border: 0px;"></textarea>
						</td>
					</tr>
					<tr>
						<td class="left_title_1">
							上传照片:&nbsp;
						</td>
						<td>
							<script type="text/javascript">
								var oFCKeditor = new FCKeditor( 'head' ) ;
								oFCKeditor.BasePath	= "<%=request.getContextPath()%>/fckeditor/" ;
								oFCKeditor.Height	="200" ;
								oFCKeditor.Width="300" ;
							//	oFCKeditor.Value="invoking with javascript" ;
								oFCKeditor.ToolbarSet="photo" ;
								oFCKeditor.Create() ;
					  		</script>
						</td>
					</tr>
					<tr>
						<td class="left_title_1">
							&nbsp;
						</td>
						<td>
							&nbsp;
							<input type="submit" value="添加" onclick="return checkAdd()">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="取消"
								onclick="return window.history.back()" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>