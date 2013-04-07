	<%@ page language="java" pageEncoding="UTF-8"%>
	<%@ page  import="java.util.*" %>
	<%@ page  import="com.windy.zfxy.edu.domain.*" %>
	<%@ page  import="com.windy.zfxy.utils.*" %>
	<%
		PageBean<EduInfo> pageInfo = new PageBean<EduInfo> () ;
		EduInfo eduinfo = null ;
		List<EduInfo> list = new ArrayList<EduInfo>() ;
		pageInfo =(PageBean<EduInfo>) request.getAttribute("result") ;
	%>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	  <head>
	    <base href="<%=basePath%>">
	    <title>用户信息列表</title>
	 <style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	.STYLE1 {font-size: 12px}
	.STYLE3 {font-size: 12px; font-weight: bold; }
	.STYLE4 {
		color: #03515d;
		font-size: 12px;
	}
	-->
	</style>
	
	<script type="text/javascript">
	var  highlightcolor='#c1ebff';
	var  clickcolor='#51b2f6';
	function  changeto(){
		source=event.srcElement;
		if  (source.tagName=="TR"||source.tagName=="TABLE")
			return;
		while(source.tagName!="TD")
			source=source.parentElement;
		source=source.parentElement;
		cs  =  source.children;
	//alert(cs.length);
		if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
			for(i=0;i<cs.length;i++){
				cs[i].style.backgroundColor=highlightcolor;
			}
	}
	
	function  changeback(){
		if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
			return
		if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
			//source.style.backgroundColor=originalcolor
			for(i=0;i<cs.length;i++){
				cs[i].style.backgroundColor="";
			}
	}
	
	function  clickto(){
		source=event.srcElement;
		if  (source.tagName=="TR"||source.tagName=="TABLE")
			return;
		while(source.tagName!="TD")
			source=source.parentElement;
		source=source.parentElement;
		cs  =  source.children;
		//alert(cs.length);
		if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
			for(i=0;i<cs.length;i++){
				cs[i].style.backgroundColor=clickcolor;
			}
			else
				for(i=0;i<cs.length;i++){
					cs[i].style.backgroundColor="";
				}
	}
		function doFind(){
				if(document.getElementById("keyword").value==""){
						alert('请输入用户名进行查询') ;
						return false ;
				}else{
					with(document.getElementById("findForm")){
						action= "<%=request.getContextPath()%>/usm.do?service=find";
						submit() ;
					}
				}
		}
		function isEmpty(){
			if(document.getElementById("keyword").value==""){
				alert('请输入用户名进行查询') ;
				return;
			}
		}
	function toPage(pageNow){
		var type =  document.getElementById("type").value ;
		if(pageNow==0){
			alert("已经是首页了") ;
		}else if(pageNow==-1){
				alert("已经是最后一页了") ;
		}else{
			window.self.location = "<%=request.getContextPath()%>/edu.do?service=display&type="+type+"&pageNow="+pageNow;	
		}
	}
	function goPageX(x){
		var turn = document.getElementById("turn").value ;
		var type =  document.getElementById("type").value ;
		if(turn==""){
			alert("未输入数据");
			return false;
		}else if(isNaN(turn)==true){
			alert("只能是数字");
			document.getElementById("turn").value="" ;
			return false;
		}else if(turn<0||turn==0||turn>x){
			alert("最小值为1，最大值为"+x) ;
			return false;
		}else{
			window.self.location = "<%=request.getContextPath()%>/edu.do?service=display&type="+type+"&pageNow="+turn;	
		}
	}
</script>
	</head>
	
	<body>
	<form action="#" method="post" name="findForm" id="findForm">
	<input type="hidden" id="type" value="<%=(String)request.getAttribute("type") %>">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
	        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
	                <td width="95%" class="STYLE1"><span class="STYLE3">信息列表</span></td>
	              </tr>
	            </table></td>
	            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
	              <tr>
	                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
	                  <tr>
	                    <td class="STYLE1">
	                       		<!--  	<table width="100%">
					                      <tr><td>
					                      		 <div align="center"> <input type="text" name="keyword" id="keyword" /> </div>
					                      	</td><td> 
					                      	<div> <a href="javascript:void(0)" name="find" id="find" onclick="doFind()">
					                      	<img src="images/search.gif"  width="63" height="22" border="0"/></a></div></td>
					                      </tr>	
	                    		  </table>
	                    		  -->
	                    </td>
	                    <td class="STYLE1">&nbsp;	</td>
	                  </tr>
	                </table></td>
	                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
	                  <tr>
	                  <td class="STYLE1">&nbsp;
	                  </tr>
	                </table></td>
	                <td width="60">&nbsp;</td>
	                <td width="100"><table width="100%" border="0" cellpadding="0" cellspacing="0">
	                  <tr>
	                     <td class="STYLE1"><div align="center"><img src="images/22.gif" width="14" height="14" /></div></td>
	                    <td class="STYLE1"><div align="left">
	                    <a href="page/manage/eduinfo/addInfo.jsp?type=<%=(String)request.getAttribute("type")  %>">新增</a></div></td>
	                  </tr>
	                </table></td>
	              </tr>
	            </table></td>
	          </tr>
	        </table></td>
	        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
	      </tr>
	    </table></td>
	  </tr>
	  <tr>
	    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="8" background="images/tab_12.gif">&nbsp;</td>
	        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
	          <tr>
	           <td width="4%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
	           		<div align="center"><span class="STYLE1">序号</span></div></td>
	           <td width="30%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
	           		<div align="center"><span class="STYLE1">标题名称</span></div></td>
	           <td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
	           		<div align="center"><span class="STYLE1">录入时间</span></div></td>
	            <td width="15%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
	            	<div align="center"><span class="STYLE1">作者</span></div></td>
	            <td width="5%" height="22" background="images/bg.gif" bgcolor="#FFFFFF">
	            	<div align="center"><span class="STYLE1">审核</span></div></td>
	            <td width="10%" background="images/bg.gif" bgcolor="#FFFFFF">
	            	<div align="center"><span class="STYLE1">新闻来源</span></div></td>
	            <td width="20%" height="22" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE1">
	            	<div align="center">基本操作</div></td>
	          </tr>
	 	     	<%
	     		if(pageInfo.getResult()==null||pageInfo==null||pageInfo.getResult().size()==0){
	     	%>
	     	<tr>
	          	<td height="40" colspan="9" bgcolor="#FFFFFF">	<div align="center"><span class="STYLE1"> <%="没有信息" %></span></div></td>
	          </tr>
	          <%
	          }else{ 
	        	  list = pageInfo.getResult() ;		
	          %>
	          <%
	 				for(int i=0; i<list.size() ; i++){
	 					eduinfo = (EduInfo)list.get(i) ;
	          %>
	          <tr>
	             <td height="20" bgcolor="#FFFFFF">
	            	<div align="center" class="STYLE1"><div align="center"><%=i+1%></div></div></td>
	            <td height="20" bgcolor="#FFFFFF">
	            	<div align="center" class="STYLE1"><div align="center"><%=ShortString.shotTitle(eduinfo.getTitle() ,20)%></div></div></td>
	            <td height="20" bgcolor="#FFFFFF">
	            	<div align="center" class="STYLE1"><div align="center"><%=eduinfo.getAddDate()%></div></div></td>
	            <td height="20" bgcolor="#FFFFFF">
	            	<div align="center"><span class="STYLE1"><%=eduinfo.getAuther()%></span></div></td>
	            <td height="20" bgcolor="#FFFFFF">
	            	  <div align="center" class="STYLE1"><div align="center"><%=eduinfo.getAudited()%></div></div></td>
	            <td height="20" bgcolor="#FFFFFF">
	            <div align="center" class="STYLE1"><div align="center"><%=ShortString.shotTitle(eduinfo.getNewsResource() ,20)%></div></div></td>
	            <td height="20" bgcolor="#FFFFFF">
	              <div align="center"><span class="STYLE4">
	            	<img src="images/edt.gif" width="16" height="16" />  
	              	<a href="edu.do?service=find&id=<%=eduinfo.getId()%>">编辑</a>&nbsp; &nbsp;
	                <img src="images/del.gif" width="16" height="16" />
	                <a href="edu.do?service=delete&ids=<%=eduinfo.getId()%>"
	                 onclick="return window.confirm('确认删除吗？')">删除</a></span></div></td>
	          </tr>
	          <%} }%>
	        </table></td>
	        <td width="8" background="images/tab_15.gif">&nbsp;</td>
	      </tr>
	    </table></td>
	  </tr>
	  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;
            共有 <%=pageInfo.getRowCount() %>条记录，
            当前第 <%=pageInfo.getPageNow() %>/<%=pageInfo.getPageCount() %> 页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40" ><img src="images/first.gif" width="37" height="15" onclick="toPage(<%=pageInfo.getPageNow() == 1? 0:pageInfo.getPageNow()-1%>)"/></td>
                  <td width="45"><img src="images/back.gif" width="43" height="15" 
                  			onclick="toPage(<%=pageInfo.getPageNow() == 1? 0:pageInfo.getPageNow()-1%>)"/></td>
                  <td width="45"><img src="images/next.gif" width="43" height="15" 
                  			onclick="toPage(<%=pageInfo.getPageNow() == pageInfo.getPageCount()? -1:pageInfo.getPageNow()+1%>)"/></td>
                  <td width="40"><img src="images/last.gif" width="37" height="15" onclick="toPage(<%=pageInfo.getPageCount() ==pageInfo.getPageNow()? -1:pageInfo.getPageCount()%>)"/></td>
                  <td width="100"><div align="center"><span class="STYLE1">转到第
                    <input name="textfield" type="text" size="8" 
                    style="height:16px; width:25px; border:1px solid #999999;" 
                    id="turn" name="turnpage"/> 页 </span></div></td>
                  <td width="40"><img src="images/go.gif" width="37" height="15" onclick="goPageX(<%=pageInfo.getPageCount() %>)"/></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
	      </tr>
	    </table></td>
	  </tr>
	</table>
	</form>
	</body>
	</html>
	 	