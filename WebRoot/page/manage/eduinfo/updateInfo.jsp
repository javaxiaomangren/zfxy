<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.windy.zfxy.edu.domain.*"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%
	EduInfo eduinfo = (EduInfo) request.getAttribute("result");
%>
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
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/fckeditor/fckeditor.js"></script>
	</head>
	<body>
		<div id="man_zone">
			<form action="edu.do?service=modify" method="post">
				<input type="hidden" name="id" value="<%=eduinfo.getId()%>">
				<input type="hidden" name="category"
					value="<%=eduinfo.getCategory() == null ? "" : eduinfo
					.getCategory()%>">
				<input type="hidden" name="photopath"
					<%=eduinfo.getPhotoPath() == null ? "" : eduinfo.getPhotoPath()%>>
				<input type="hidden" name="isphoto"
					value="<%=eduinfo.getIsPhoto() == null ? "" : eduinfo.getIsPhoto()%>">
				<table width="99%" border="0" align="center" cellpadding="3"
					cellspacing="1" class="table_style">
					<tr>
						<td width="12%" class="left_title_1" height="20">
							<span class="left-title">标题名称</span>
						</td>
						<td width="31%">
							<input type="text" name="title" size="40"
								value="<%=eduinfo.getTitle() == null ? "" : eduinfo.getTitle()%>" />
						</td>
						<td colspan="3" class="left_title_2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="left_title_2">
							<span>作者</span>
						</td>
						<td>
							<input type="text" name="author" size="20"
								value="<%=eduinfo.getAuther() == null ? "" : eduinfo.getAuther()%>" />
							<span class="registerTip">&nbsp;*不填视为作者匿名</span>
						</td>
						<td width="10%" class="left_title_1">
							新闻来源
						</td>
						<td width="16%">
							<input type="text" name="resource" id="resource"
								value="<%=eduinfo.getNewsResource() == null ? "" : eduinfo.getNewsResource()%>" />
						</td>
					</tr>
					<tr>
						<td class="left_title_1">
							<span>审核</span>
						</td>
						<td>
							<input type="radio" name="audited" id="radio" value="是"
								<%=eduinfo.getAudited() != null&& eduinfo.getAudited().equals("是") ? "checked" : ""%> />是
							<input type="radio" name="audited" id="radio" value="否"
								<%=eduinfo.getAudited() != null	&& eduinfo.getAudited().equals("否") ? "checked" : ""%> />否
							<span class="registerTip">*默认通过，可以在前台显示</span>
						</td>
						<td>
							&nbsp;
						</td>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="left_title_2">
							描述
						</td>
						<td colspan="4">
							<FCK:editor instanceName="content">
								<jsp:attribute name="height">400</jsp:attribute>
								<jsp:attribute name="width">600</jsp:attribute>
								<jsp:attribute name="basePath">/fckeditor/</jsp:attribute>
								<jsp:attribute name="value"><%=eduinfo.getContent()%></jsp:attribute>
							</FCK:editor>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td colspan="4">
							&nbsp;
							<input type="submit" value="保存">
							&nbsp;&nbsp;
							<input type="button" value="取消" onclick="window.history.back()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>
