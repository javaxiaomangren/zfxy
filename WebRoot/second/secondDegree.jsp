<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@ page import="com.windy.zfxy.edu.domain.*"%>
<%@ page import="com.windy.zfxy.edu.proxy.*"%>
<%@ page import="com.windy.zfxy.utils.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>哈尔滨师范大学政法学院</title>
<link href="../css/menu.css" type="text/css" rel="stylesheet">
<link href="../css/main.css" type="text/css" rel="stylesheet">
<link href="../css/second.css" type="text/css" rel="stylesheet">
<link href="../css/third.css" type="text/css" rel="stylesheet">
<script type="text/javascript">              
		function nTabs(thisObj,Num){
			if(thisObj.className == "active")return;
			var tabObj = thisObj.parentNode.id;
			var tabList = document.getElementById(tabObj).getElementsByTagName("li");
			for(i=0; i <tabList.length; i++){
			  if (i == Num){
			      thisObj.className = "active"; 
				  document.getElementById(tabObj+"_Content"+i).style.display = "block";
			  }else{
			      tabList[i].className = "normal"; 
			      document.getElementById(tabObj+"_Content"+i).style.display = "none";
			  }
			} 
        }
var waitting = 1;              
var secondLeft = waitting;              
var timer;                              
var sourceObj;              
var number;              
function getObject(objectId)//获取id的函数               
    {              
        if(document.getElementById && document.getElementById(objectId)) {              
        // W3C DOM              
        return document.getElementById(objectId);              
        } else if (document.all && document.all(objectId)) {              
        // MSIE 4 DOM              
        return document.all(objectId);              
        } else if (document.layers && document.layers[objectId]) {              
        // NN 4 DOM.. note: this won't find nested layers              
        return document.layers[objectId];              
        } else {              
        return false;              
        }              
    }              
function SetTimer()//主导航时间延迟的函数              
    {              
        for(j=1; j <=13; j++){              
            if (j == number){              
                if(getObject("mm"+j)!=false){              
                    getObject("mm"+ number).className = "menuhover";              
                    getObject("mb"+ number).className = "";              
                }              
            }              
            else{              
                 if(getObject("mm"+j)!=false){               
                    getObject("mm"+ j).className = "";              
                    getObject("mb"+ j).className = "hide";               
                }              
            }              
        }              
    }              
function CheckTime()//设置时间延迟后              
    {              
        secondLeft--;              
        if ( secondLeft == 0 )              
        {              
        clearInterval(timer);                                      
        SetTimer();                      
        }              
    }              
function showM(thisobj,Num)//主导航鼠标滑过函数,带时间延迟              
    {              
        number = Num;              
        sourceObj = thisobj;              
        secondLeft = 1;              
        timer = setTimeout('CheckTime()',100);              
    }              
function OnMouseLeft()//主导航鼠标移出函数,清除时间函数              
    {              
        clearInterval(timer);              
    }  
	
</script>
<script language="javascript">
<!--//
function ShowMenu(obj,n){
 var dd = obj.parentNode.getElementsByTagName("dd");
 for(var i=0;i<dd.length;i++){dd[i].className = "";}
 dd[n].className = "ok";
 var ol = document.getElementById("menu").getElementsByTagName("ol");
 for(var i=0;i<ol.length;i++){ol[i].className = "no";}
 ol[n].className = "";
}
function ShowSpan(obj,n){
 var span = obj.parentNode.getElementsByTagName("span");
 for(var i=0;i<span.length;i++){span[i].className = "no";}
 try{span[n].className = "";}catch(e){}
 var li = obj.parentNode.getElementsByTagName("li")
 try{li[n].className = "ok";}catch(e){}
 for(var i=0;i<li.length;i++){
  if(i!=n){li[i].className = "";}
  li[i].onmouseout = function(){this.className = "ol";}
 }
}
function ShowUl(obj,n){
 var ul = obj.parentNode.getElementsByTagName("ul");
 var h1 = obj.parentNode.getElementsByTagName("h1");
 for(var i=0; i<h1.length;i++){
  h1[i].innerHTML = h1[i].innerHTML.replace("-","+");
  h1[i].className = "";
 }
 if(ul[n].className == "no"){ 
  ul[n].className = "";
  obj.className = "ok";
  obj.innerHTML = obj.innerHTML.replace("+","-");
 }else{
  ul[n].className = "no";
  return;
 }
 for(var i=0; i<ul.length;i++){if(i!=n){ ul[i].className = "no";}}
}
//-->
</script>
<SCRIPT src="../js/jquery.min.js" type=text/javascript></SCRIPT>
<SCRIPT type=text/javascript>
$(document).ready(function() {
	
	/*	2nd example	*/
	$("#menu2 li").prepend("<span></span>"); //Throws an empty span tag right before the a tag
	
	$("#menu2 li").each(function() { //For each list item...
		var linkText = $(this).find("a").html(); //Find the text inside of the a tag
		$(this).find("span").show().html(linkText); //Add the text in the span tag
	}); 
	
	$("#menu2 li").hover(function() {	//On hover...
		$(this).find("span").stop().animate({ 
			marginTop: "-73" //Find the span tag and move it up 40 pixels
		}, 250);
	} , function() { //On hover out...
		$(this).find("span").stop().animate({
			marginTop: "0" //Move the span back to its original state (0px)
		}, 250);
	});	
});
</SCRIPT>
</head>

<body>
<div class="mainBody">
<!--头部开始 -->
	<div class="head">
    	<div style="float:left;"><img src="../images/logo.png" width="546" height="109"/></div>
        <div style="float:right; width:309px; border:none; height:111px; overflow:hidden; margin-right:3px;">
    	<div style="width:309px; height:33px;padding-top:77px;">
        	<form id="form1" name="form1" method="post" action="?">
                  <label>
                  	<div style="background:url(../images/zuo.jpg) no-repeat; width:179px; height:33px; padding-left:7px; padding-top:7px; float:left;">
                    	<input name="k" type="text" id="k" value="" width="174" height="18" style="width:174px; height:18px; font-size:14px;"/>
                    </div>
                  </label>
                  <label>
                  <div style=" background:url(../images/zhong.jpg) no-repeat; height:33px; width:74px; float:left; padding-top:6px; padding-left:0px;">
                  	<select name="seachid" id="seachid" style="width:62px; height:20px; font-size:12px; color:#A80018; font-weight:bold;">
                    	<option value="1">百度</option>
	                    <option value="2">谷歌</option>
    	                <option value="3">搜狗</option>
        	            <option value="4">搜搜</option>
            	      </select></div>
                </label>
                  <label>
                  <div style=" background:url(../images/you.jpg) no-repeat; width:44px; height:33px; float:right; padding-top:7px; padding-left:5px;">
                  	<input type="button" name="button" id="button" value="" onclick="subs();" style="background:url(../images/anniu.jpg) no-repeat;width:21px;height:21px;"/></div>
                  </label>
                </form>
                <script>
                function encode(txts)
                {
                        mytxts=txts.replace(/[^\u0000-\u00FF]/g,function($0){return escape($0).replace(/(%u)(\w{4})/gi,"&#x$2;")});
                        return mytxts;
                }
                //alert(rdurl);
                function subs() 
                {
                        var myid=document.getElementById("seachid").options[document.getElementById("seachid").selectedIndex].value;
                        var txts=document.form1.k.value;
                        var mytxts,urls,rdurl;
                        switch(myid)
                        {
                        case "1":
                        urls="http://www.baidu.com/baidu?&tn=kering&word="+encode(txts);
                        break
                        case "2":
                        urls="http://www.google.com.hk/search?client=aff-cs-360se&forid=1&ie=utf-8&oe=UTF-8&q="+encode(txts);
                        break
                        case "3":
                        urls="http://www.gougou.com/search?search="+txts;
                        break
                        case "4":
                        urls="http://www.soso.com/q?w=s"+encode(txts);
                        break
                }
                        //alert(urls);
                window.location.href=urls;
                }
                </script></div>
        </div>
    </div>
<div id="menu">
 <dl>
  <dd class="ok" onmouseover="javascript:ShowMenu(this,0);"><a href="../index.jsp"><span>首页</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,1);"><a href="../second/survy.jsp"><span>学院概况</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,2);"><a href="../second/teaching.jsp"><span>教学科研</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,3);"><a href="../second/discipline.jsp"><span>学科学位</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,4);"><a href="../second/organization.jsp"><span>学生工作</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,5);"><a href="../second/examInformation.jsp"><span>就业指导</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,6);"><a href="../second/course.jsp"><span>精品课程</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,7);"><a href="../second/secondDegree.jsp"><span>继续教育</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,8);"><a href="../second/orgBuild.jsp"><span>党建工作</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,9);"><a href="../second/download.jsp"><span>下载平台</span></a></dd>
 </dl>
 
 <ol></ol>
 
 <!-- ol 0 End -->
 
 <ol class="no">
  <li onmouseover="javascript:ShowSpan(this,9);"><a href="../second/survy.jsp">学院简介</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,5);"><a href="../secong2/survy2.jsp">机构设置</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,6);"><a href="../secong2/survy3.jsp">院系领导</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,7);"><a href="../secong2/survy4.jsp">师资队伍</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,8);"><a href="../secong2/survy5.jsp">校友风采</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
 </ol>
 
 <!-- ol 1 End -->
 
 <ol class="no">
  <li onmouseover="javascript:ShowSpan(this,2);"><a href="../second/teaching.jsp">教学工作</a>
   <span class="no">
   	<h1><a href="#"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,1);"><a href="../second/science.jsp">科研工作</a>
   <span class="no">
    <h1><a href="science.jsp">科研项目</a></h1>
    <h1><a href="../secong2/science2.jsp">获奖项目</a></h1>
    <h1><a href="../secong2/science3.jsp">学术专著</a></h1>
   </span>
  </li>
 </ol>
 <ol class="no">
  <li onmouseover="javascript:ShowSpan(this,0);"><a href="../second/discipline.jsp">学科建设</a>
   <span class="no">
    <h1><a href="../second/discipline.jsp">重点学科</a></h1>
    <h1><a href="../secong2/discipline3.jsp">研究基地</a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,1);"><a href="../second/degree.jsp">学位建设</a>
   <span class="no">
    <h1><a href="../second/degree.jsp">本科专业建设</a></h1>
    <h1><a href="../secong2/degree2.jsp">硕士授权点</a></h1>
    <h1><a href="../secong2/degree3.jsp">博士授权点</a></h1>
    <h1><a href="../secong2/degree4.jsp">博士后交流站</a></h1>
   </span>
  </li>
 </ol>
 <ol class="no">
     <li onmouseover="javascript:ShowSpan(this,0);"><a href="../second/organization.jsp">学生组织</a>
       <span class="no">
        <h1><a href="../second/organization.jsp">学生团工委</a></h1>
        <h1><a href="../secong2/organization2.jsp">学生会</a></h1>
        <h1><a href="../secong2/organization3.jsp">社团联合会</a></h1>
        <h1><a href="../secong2/organization4.jsp">艺术团</a></h1>
        <h1><a href="../secong2/organization5.jsp">网络中心</a></h1>
        <h1><a href="../secong2/organization6.jsp">学生工作助理中心</a></h1>
        <h1><a href="../secong2/organization7.jsp">舍委会</a></h1>
       </span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,8);"><a href="../second/studentActivities.jsp">学生活动</a>
       <span class="no"></span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,9);"><a href="../second/sizheng.jsp">思政教育</a>
       <span class="no"></span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,10);"><a href="../second/gonggao.jsp">公告平台</a>
       <span class="no"></span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,11);"><a href="../second/honour.jsp">荣誉奖励</a>
       <span class="no"></span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,12);"><a href="../second/studentServe.jsp">学生服务</a>
       <span class="no"></span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,13);"><a href="../second/youth.jsp">青春飞扬</a>
       <span class="no"></span>
      </li>
  </ol>
  <ol class="no">
  	<li onmouseover="javascript:ShowSpan(this,5);"><a href="../second/examInformation.jsp">考研信息</a>
       <span class="no"><h1><a href="javascript:void(0);"></a></h1>
       </span>
      </li>
       <li onmouseover="javascript:ShowSpan(this,6);"><a href="../second/graduate.jsp">毕业手续</a>
       <span class="no"><h1><a href="javascript:void(0);"></a></h1>
       </span>
      </li>
       <li onmouseover="javascript:ShowSpan(this,7);"><a href="../second/jobInformation.jsp">招聘信息</a>
       <span class="no"><h1><a href="javascript:void(0);"></a></h1>
       </span>
      </li>
 </ol>
 <ol class="no"></ol>
 <ol class="no">
 	<li onmouseover="javascript:ShowSpan(this,5);"><a href="../second/secondDegree.jsp">函授</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,5);"><a href="../second/selfExam.jsp">自考</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,5);"><a href="../second/secondDegree2.jsp">二学历</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
 
 </ol>
 <ol class="no">
  <li onmouseover="javascript:ShowSpan(this,5);"><a href="../second/orgBuild.jsp">组织建设</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,6);"><a href="../second/rule.jsp">章程条例</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,7);"><a href="../second/studyTrends.jsp">学习动态</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,8);"><a href="../second/creatAndBuilding.jsp" title="争先创优与学习型党组织建设">争先创优与学习型党</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
 </ol>
 <ol class="no">
 	<li onmouseover="javascript:ShowSpan(this,5);"><a href="../second/download.jsp">本科生</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
 <li onmouseover="javascript:ShowSpan(this,5);"><a href="../second/postgraduate.jsp">研究生</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,5);"><a href="../second/teacher.jsp">教师</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
 </ol>
</div>
<div style="margin-top:-2px;"><img  src="../images/menu_bottom.jpg" width="960" height="10"/></div>
<div class="content">
	<div class="xgsm">
        <div id="menu2">
        <ul id="myTab1">
           <li class="active" onclick="nTabs(this,0);"><a href="secondDegree.jsp">函授</a></li>
           <li class="nomal" onclick="nTabs(this,1);"><a href="selfExam.jsp">自考</a></li>
           <li class="nomal" onclick="nTabs(this,2);"><a href="secondDegree2.jsp">二学历</a></li>
        </ul>
        <div class="cls"></div>
      </div>
     </div>
	<div class="content_right">
    	<div id="myTab1_Content0">
            	<div id="frameContent">
            	<%
	       			int pageNow = 1 ;
					if(request.getParameter("pageNow")!=null&&request.getParameter("pageNow").equals("")==false){
						pageNow = Integer.parseInt(request.getParameter("pageNow")) ;
					}
					PageBean<EduInfo> result =EduInfoProxy.getInstance().getInfoByType(20, pageNow, "hsjy") ;
 					List<EduInfo> list = result.getResult() ;
			   %>
				<table width="90%" border="0" cellspacing="2" cellpadding="2" 
						style="font-size: 14px;margin-top: 0px;font-weight: bold;" >
				  
				
			   	<%
     				if(result==null||result.getResult()==null||result.getResult().size()==0){
     			%>
     			  <tr>
     			   <td width="30%">&nbsp;</td>
				    <td width="60%" height="25" nowrap="nowrap" >暂时没有信息</td>
				    <td width="30%">&nbsp;</td>
				  </tr>
     			<%} else {%>
			   	<%
            		for(int i=0 ;i<list.size() ;i++){
            			EduInfo edu = list.get(i) ;
        		%>
        		<tr>
        		 <td width="2%">&nbsp;</td>
        			<td width="60%"  height="25" nowrap="nowrap">
        				<a href="../third/secondDegree_cont.jsp?id=<%=edu.getId() %>"><%=edu.getTitle().equals("")==true?"":ShortString.shotTitle(edu.getTitle(),20) %></a></td>
				    <td width="28%" ><%=edu.getAddDate().equals("")==true?"":edu.getAddDate() %></td>
        		</tr>
        		<%} }%>
        		</table>
            	<div>
			</div> 		
			
           </div>
           <div id="pageInfo">
				<% if(result.getPageNow()>1){ %>
							<a href="secondDegree.jsp?pageNow=<%=result.getPageNow()-1 %>">上一页</a>
					 <%} %>
					 	<% if(result.getPageCount()>1){%>
						 	<b>共<%=result.getPageCount() %>页</b>
					 		<b>,当前第<%=result.getPageNow() %>页</b>
                        <%}%>
					 <% if(result.getPageNow()<result.getPageCount()) {%>
					 			<a href="secondDegree.jsp?pageNow=<%=result.getPageNow()+1 %>">下一页</a>
					 <%} %></div> 	
        </div>
    </div>
</div>

<div class="copyright_top"></div>
<div class="linknet">
	<ul>
    	<li><a href="http://www.hrbnu.edu.cn/2011/?indexq.html" target="_blank">师大首页</a></li>
        <li><a href="http://news.hrbnu.edu.cn" target="_blank">师大新闻</a></li>
        <li><a href="http://news.hrbnu.edu.cn/news/XNTZ/XNTZ.html" target="_blank">师大公告</a></li>
        <li><a href="http://web.hrbnu.edu.cn/xcb" target="_blank">红色琴弦网</a></li>
        <li><a href="http://web.hrbnu.edu.cn/xcb/c3.aspx" target="_blank">《哈尔滨师大报》</a></li>
        <li><a href="http://web.hrbnu.edu.cn/tw" target="_blank">行知青年网</a></li>
        <li><a href="http://jwc.hrbnu.edu.cn/jwpt/web2010_default.aspx" target="_blank">教务平台</a></li>
        <li><a href="http://lib.hrbnu.edu.cn" target="_blank">图书资源</a></li>
        <li><a href="http://web.hrbnu.edu.cn/jbrx/book_write.asp" target="_blank">校长热线</a></li>
         <li><a href="http://mail.hrbnu.edu.cn" target="_blank">师大邮件</a></li>
    </ul>
</div>
<div><img src="../images/s.jpg" width="960" height="5" /></div>
<div class="copyright">
	版权所有&copy&nbsp;哈尔滨师范大学政法学院网络中心&nbsp;&nbsp;2011版<br />
哈尔滨市利民经济开发区师大南路1号 邮编：150025<br />
Powered by Simrobot Studio
</div>
</body>
</html>
