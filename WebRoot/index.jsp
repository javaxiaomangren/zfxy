<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<%@ page import="com.windy.zfxy.edu.domain.*"%>
<%@ page import="com.windy.zfxy.edu.proxy.*"%>
<%@ page import="com.windy.zfxy.utils.*"%>
<%@ page import="java.util.*"%>
<%
	PageBean<EduInfo> xnxw =EduInfoProxy.getInstance().getInfoByType(9, 1, "xnxw") ;
	PageBean<EduInfo> xytz =EduInfoProxy.getInstance().getInfoByType(9, 1, "yntz") ;
	PageBean<EduInfo> tpxw =EduInfoProxy.getInstance().getInfoByType(5, 1, "tpxw") ;
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>哈尔滨师范大学政法学院</title>
<link href="css/menu.css" type="text/css" rel="stylesheet">
<link href="css/main.css" type="text/css" rel="stylesheet">
<style type="text/css">
#eLore {
 position:relative;
 width:960px; height:264px;
}
#eLore_wrap {
 position:relative;
 margin:0 auto;
 overflow:hidden;
 width:862px; height:263px;
 z-index:5;
 background:url(images/1.jpg) no-repeat;
}
#eLore .eLore_img {
 position:absolute; top:0;
 overflow:hidden;
}
#eLore .eLore_out {
 position:absolute;
 right:0; top:0;
 overflow:hidden;
}
</style>
<!--[if IE]>
<style type="text/css">
*[id="focus_bigpic"]{filter:progid:DXImageTransform.Microsoft.GradientWipe(duration=2,gradientSize=1,wipestyle=1,motion=forward);}
 .news_kuang{margin-top:-2px;}
</style>
<![endif]-->
<script type="text/javascript" src="js/leftkuang.js"></script>
<script type="text/javascript">              
var waitting = 1;              
var secondLeft = waitting;              
var timer;                              
var sourceObj;              
var number;              
function getObject(objectId)           
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
<script type="text/javascript">
var myFocus={
	$:function(id){return document.getElementById(id);},
	$$:function(tag,obj){return (typeof obj=='object'?obj:this.$(obj)).getElementsByTagName(tag);},
	style:function(obj,style){return (+[1,])?window.getComputedStyle(obj,null)[style]:obj.currentStyle[style];},//getStyle简化版
	easeOut:function(t,b,c,d){return -c*((t=t/d-1)*t*t*t - 1) + b;},
	move:function(obj,prop,val,type,spd,fn){//运动函数，spd为运动需要的时间，时间越大速度越小
		var t=0,b=parseInt(this.style(obj,prop)),c=val-b,d=spd||50,st=type,m=c>0?'ceil':'floor';
		if(obj[prop+'Timer']) clearInterval(obj[prop+'Timer']);
		obj[prop+'Timer']=setInterval(function(){
			if(t<d){obj.style[prop]=Math[m](myFocus[st](++t,b,c,d))+'px';}
			else {clearInterval(obj[prop+'Timer']);fn&&fn.call(obj);}
		},10);return this;
	},
	addList:function(obj,cla,x){//生成HMTL,cla为列表的class,其中封装有:cla='txt'(生成alt文字),cla='num'(生成按钮数字),cla='thumb'(生成小图)
		var s=[],n=x||this.$$('li',this.$$('ul',obj)[0]).length,num=cla.length;
		for(var j=0;j<num;j++){
			s.push('<ul class='+cla[j]+'>');
			for(var i=0;i<n;i++){s.push('<li>'+(cla[j]=='num'?(i+1):(cla[j]=='txt'?this.$$('li',obj)[i].innerHTML.replace(/\<img.*?\>/i,this.$$('img',obj)[i].alt):(cla[j]=='thumb'?'<img src='+(this.$$('img',obj)[i].getAttribute("thumb")||this.$$('img',obj)[i].src)+' />':'')))+'<span></span></li>')};
			s.push('</ul>');
		}; obj.innerHTML+=s.join('');
	},
	setting:function(par){
		if(window.attachEvent){window.attachEvent('onload',function(){myFocus[par.style](par)});}
　　		else{window.addEventListener('load',function(){myFocus[par.style](par)},false);}
	},
	mF_liuzg:function(par){
		var box=this.$(par.id),boxH=box.offsetHeight,t=par.time*1000;
		this.addList(box,['txt-bg','txt','num']);
		var pic=this.$$('li',this.$$('ul', box)[0]),n=pic.length;
		var c=boxH%par.chip?8:par.chip,h=boxH/c,pics=[];
		for(var i=0;i<c;i++){
			pics.push('<li><p>')
			for(var j=0;j<n;j++) pics.push(pic[j].innerHTML);
			pics.push('</p></li>')
		}
		this.$$('ul', box)[0].innerHTML=pics.join('');
		var ul=this.$$('ul',box),txt=this.$$('li',ul[2]),btn=this.$$('li',ul[3]),pic=this.$$('li',ul[0]);
		for(var i=0;i<c;i++){//初始化样式设置
			this.$$('p',pic[i])[0].style.top=-i*h+'px';
			pic[i].style.height=h+'px';
			this.$$('p',pic[i])[0].style.height=boxH*c+'px';
		}
		var index = 0;//开始显示的序号
		box.removeChild(this.$$('div',box)[0]);
		var run = function(idx) {
			var tt=par.type==4?Math.round(1+(Math.random()*(3-1))):par.type;//效果选择
			btn[index].className = '';
			txt[index].style.display='none';
            if(index==n-1) index=-1;
			var N=idx!=undefined?idx:index+1;
			var spd=tt==2?20:(tt==1?80:Math.round(20+(Math.random()*(80-20))));
			for(var i=0;i<c;i++){
				if(tt==3) spd=Math.round(20+(Math.random()*(80-20)));
				myFocus.move(myFocus.$$('p',pic[i])[0],'top',-N*c*h-i*h,'easeOut',spd);
				spd=tt==2?spd+10:(tt==1?spd-10:spd);
			}
			btn[N].className = 'current';
			txt[N].style.display='block';
            index = N;
        }
		run(index);
		var auto=setInterval(function(){run()},t);
		for (var j=0;j<n;j++){
			btn[j].j=j;
			btn[j].onclick=function(){if(!this.className) run(this.j)}
		}
		box.onmouseover=function(){clearInterval(auto);}
    	box.onmouseout=function(){auto=setInterval(function(){run()},t);}
		for(var i=0,lk=this.$$('a',box),ln=lk.length;i<ln;i++) lk[i].onfocus=function(){this.blur();}//去除虚线框
	}
};
myFocus.setting({
	style:'mF_liuzg',//style为风格样式，
	id:'myFocus',//焦点图ID
	chip:8,//图片切片数量，能被焦点图的高整除才有效，默认为8片
	type:4,//切片效果，1为甩头，2为甩尾，3为凌乱，4为随机效果
	time:6//每帧图片时间间隔
});
</script>
</head>

<body>
<div class="mainBody">
<!--头部开始 -->
	<div class="head">
    	<div style="float:left;"><img src="images/logo.png" width="546" height="109"/></div>
        <div style="float:right; width:309px; border:none; height:111px; overflow:hidden; margin-right:3px;">
    	<div style="width:309px; height:33px;padding-top:77px;">
        	<form id="form1" name="form1" method="post" action="?">
                  <label>
                  	<div style="background:url(images/zuo.jpg) no-repeat; width:179px; height:33px; padding-left:7px; padding-top:7px; float:left;">
                    	<input name="k" type="text" id="k" value="" width="174" height="18" style="width:174px; height:18px; font-size:14px;"/>
                    </div>
                  </label>
                  <label>
                  <div style=" background:url(images/zhong.jpg) no-repeat; height:33px; width:74px; float:left; padding-top:6px; padding-left:0px;">
                  	<select name="seachid" id="seachid" style="width:62px; height:20px; font-size:12px; color:#A80018; font-weight:bold;">
                    	<option value="1">百度</option>
	                    <option value="2">谷歌</option>
    	                <option value="3">搜狗</option>
        	            <option value="4">搜搜</option>
            	      </select></div>
                </label>
                  <label>
                  <div style=" background:url(images/you.jpg) no-repeat; width:44px; height:33px; float:right; padding-top:7px; padding-left:5px;">
                  	<input type="button" name="button" id="button" value="" onclick="subs();" style="background:url(images/anniu.jpg) no-repeat;width:21px;height:21px;"/></div>
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
  <dd class="ok" onmouseover="javascript:ShowMenu(this,0);"><a href="index.jsp"><span>首页</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,1);"><a href="second/survy.jsp"><span>学院概况</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,2);"><a href="second/teaching.jsp"><span>教学科研</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,3);"><a href="second/discipline.jsp"><span>学科学位</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,4);"><a href="second/organization.jsp"><span>学生工作</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,5);"><a href="second/examInformation.jsp"><span>就业指导</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,6);"><a href="second/course.jsp"><span>精品课程</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,7);"><a href="second/secondDegree.jsp"><span>继续教育</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,8);"><a href="second/orgBuild.jsp"><span>党建工作</span></a></dd>
  <dd onmouseover="javascript:ShowMenu(this,9);"><a href="second/download.jsp"><span>下载平台</span></a></dd>
 </dl>
 
 <ol></ol>
 
 <!-- ol 0 End -->
 
 <ol class="no">
  <li onmouseover="javascript:ShowSpan(this,9);"><a href="second/survy.jsp">学院简介</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,5);"><a href="secong2/survy2.jsp">机构设置</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,6);"><a href="secong2/survy3.jsp">院系领导</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,7);"><a href="secong2/survy4.jsp">师资队伍</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,8);"><a href="secong2/survy5.jsp">校友风采</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
 </ol>
 
 <!-- ol 1 End -->
 
 <ol class="no">
  <li onmouseover="javascript:ShowSpan(this,2);"><a href="second/teaching.jsp">教学工作</a>
   <span class="no">
   	<h1><a href="second/teaching.jsp"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,1);"><a href="second/science.jsp">科研工作</a>
   <span class="no">
    <h1><a href="second/science.jsp">科研项目</a></h1>
    <h1><a href="second/science2.jsp">获奖项目</a></h1>
    <h1><a href="second/science3.jsp">学术专著</a></h1>
   </span>
  </li>
 </ol>
 <ol class="no">
  <li onmouseover="javascript:ShowSpan(this,0);"><a href="second/discipline.jsp">学科建设</a>
   <span class="no">
    <h1><a href="second/discipline.jsp">重点学科</a></h1>
    <h1><a href="second/discipline3.jsp">研究基地</a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,1);"><a href="second/degree.jsp">学位建设</a>
   <span class="no">
    <h1><a href="second/degree.jsp">本科专业建设</a></h1>
    <h1><a href="second/degree2.jsp">硕士授权点</a></h1>
    <h1><a href="second/degree3.jsp">搏士授权点</a></h1>
    <h1><a href="second/degree4.jsp">博士后交流站</a></h1>
   </span>
  </li>
 </ol>
 <ol class="no">
     <li onmouseover="javascript:ShowSpan(this,0);"><a href="second/organization.jsp">学生组织</a>
       <span class="no">
        <h1><a href="second/organization.jsp">学生团工委</a></h1>
        <h1><a href="secong2/organization2.jsp">学生会</a></h1>
        <h1><a href="secong2/organization3.jsp">社团联合会</a></h1>
        <h1><a href="secong2/organization4.jsp">艺术团</a></h1>
        <h1><a href="secong2/organization5.jsp">网络中心</a></h1>
        <h1><a href="secong2/organization6.jsp">学生工作助理中心</a></h1>
        <h1><a href="secong2/organization7.jsp">舍委会</a></h1>
       </span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,8);"><a href="second/studentActivities.jsp">学生活动</a>
       <span class="no"></span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,9);"><a href="second/sizheng.jsp">思政教育</a>
       <span class="no"></span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,10);"><a href="second/gonggao.jsp">公告平台</a>
       <span class="no"></span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,11);"><a href="second/honour.jsp">荣誉奖励</a>
       <span class="no"></span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,12);"><a href="second/studentServe.jsp">学生服务</a>
       <span class="no"></span>
      </li>
      <li onmouseover="javascript:ShowSpan(this,13);"><a href="second/youth.jsp">青春飞扬</a>
       <span class="no"></span>
      </li>
  </ol>
  <ol class="no">
  	<li onmouseover="javascript:ShowSpan(this,5);"><a href="second/examInformation.jsp">考研信息</a>
       <span class="no"><h1><a href="javascript:void(0);"></a></h1>
       </span>
      </li>
       <li onmouseover="javascript:ShowSpan(this,6);"><a href="second/graduate.jsp">毕业手续</a>
       <span class="no"><h1><a href="javascript:void(0);"></a></h1>
       </span>
      </li>
       <li onmouseover="javascript:ShowSpan(this,7);"><a href="second/jobInformation.jsp">招聘信息</a>
       <span class="no"><h1><a href="javascript:void(0);"></a></h1>
       </span>
      </li>
 </ol>
 <ol class="no"></ol>
 <ol class="no">
 	<li onmouseover="javascript:ShowSpan(this,5);"><a href="second/secondDegree.jsp">函授</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,5);"><a href="second/selfExam.jsp">自考</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,5);"><a href="second/secondDegree2.jsp">二学历</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
 
 </ol>
 <ol class="no">
  <li onmouseover="javascript:ShowSpan(this,5);"><a href="second/orgBuild.jsp">组织建设</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,6);"><a href="second/rule.jsp">章程条例</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,7);"><a href="second/studyTrends.jsp">学习动态</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,8);"><a href="second/creatAndBuilding.jsp" title="争先创优与学习型党组织建设">争先创优与学习型党</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
 </ol>
 <ol class="no">
 	<li onmouseover="javascript:ShowSpan(this,5);"><a href="second/download.jsp">本科生</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
 <li onmouseover="javascript:ShowSpan(this,5);"><a href="second/postgraduate.jsp">研究生</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
  <li onmouseover="javascript:ShowSpan(this,5);"><a href="second/teacher.jsp">教师</a>
   <span class="no">
   	<h1><a href="javascript:void(0);"></a></h1>
   </span>
  </li>
 </ol>
</div>
<div style="margin-top:-2px;"><img  src="images/menu_bottom.jpg" width="960" height="10"/></div>
<div><img src="images/photo_top.png" width="960" height="5" /></div>
<!--图片滚动 -->
<div class="rollBox">
     <div id="eLore">
 <div id="eLore_wrap"></div>
</div>
<div id="debug"></div>
<script type="text/javascript">
//<[CDATA[
var eLore_wrap = document.getElementById('eLore_wrap');
var iImg = 0;
var iA = 0;
<!--此处动态添加图片-->
var aImg = [
  <%
      PageBean<EduInfo> daohang =EduInfoProxy.getInstance().getInfoByType(100, 1, "dhltp") ;
          if(daohang==null||daohang.getResult()==null||daohang.getResult().size()==0){
  %>
	 'images/13.jpg',
	 'images/1.jpg',
	 'images/2.jpg',
	 'images/3.jpg',
	 'images/4.jpg',
	<%
		}else{ 
		List<EduInfo> list = daohang.getResult() ;
		for(int i=0 ;i<list.size() ; i++){
		 EduInfo 	photo = list.get(i) ;
	%>
			 '<%=photo.getPhotoPath() %>',
     <%} }%>
 ];
<!--End-->
var iImgWidth = 862, iImgHeight = 263;
var iDivWidth = iImgWidth/10;
eLore_wrap.style.width = 10*(Math.floor(iImgWidth/10)) + 'px';
eLore_wrap.style.height = iImgHeight + 'px';
eLore_createD();
function eLore_createD() {
 if (iImg==10) {
  eLore_wrap.innerHTML = '';
  iImg = 0;
 }
 if (iImg==0) {
  var oDivOut = document.createElement('div');
  oDivOut.className = 'eLore_out';
  oDivOut.style.width = iDivWidth + 'px';
  oDivOut.style.height = iImgHeight + 'px';
  oDivOut.style.background = 'url(' + aImg[iA] + ') -' + parseInt(8.5*iDivWidth) + 'px top no-repeat';
  eLore_wrap.appendChild(oDivOut);
 }
 var oDiv = document.createElement('div');
 oDiv.className = 'eLore_img';
 oDiv.style.right = iImg*iDivWidth +'px';
 oDiv.style.width = 1.5*iDivWidth + 'px';
 oDiv.style.height = iImgHeight + 'px';
 oDiv.style.background = 'url(' + aImg[iA] + ') -' + 9*iDivWidth + 'px top no-repeat';
 eLore_wrap.appendChild(oDiv);
 iImg++;
 eLore_move();
}
function eLore_move(){
 var oDiv = eLore_wrap.getElementsByTagName('div');
 for (var i=1; i<oDiv.length; i++) {
  var iBgpx = parseInt(oDiv[i].style.backgroundPosition);
  if (iBgpx<i*iDivWidth-(iImgWidth-0.5*iDivWidth)) {
   var iMovePx = Math.floor((iImgWidth-0.5*iDivWidth-i*iDivWidth+iBgpx)/15);
   oDiv[i].style.backgroundPosition = iBgpx - iMovePx + 'px top';
  } else {
   oDiv[i].style.backgroundPosition = ((i+0.5)*iDivWidth-iImgWidth) + 'px top';
  }
 }
 //document.getElementById('debug').innerText = eLore_wrap.innerHTML;
 if (iImg<10) {
  setTimeout('eLore_createD()','60');
 } else if (parseInt(oDiv[10].style.backgroundPosition)<0.5*iDivWidth) {
  setTimeout('eLore_move()','60');
 } else {
  iA = ++iA==aImg.length-1 ? 0 : iA;
  setTimeout('eLore_createD()','4000');
 }
}
//]]>
</script>
    </div>

<div style="margin-top:-2px;"><img src="images/kuang_photo_bottom.png" width="960" height="40"/></div>
<div class="news">
	<div class="news_left">
    	<div class="news_left_top" id="myTab1">
	    	<div  class="active" id="new" onclick="nTabs(this,0);"><a href="javascript:void(0)">学院新闻</a></div>
    	    <div  class="normal" id="notice" onclick="nTabs(this,1);"><a href="javascript:void(0)">院内通知</a></div>
        </div>
        <div class="more"><a href="second/news.jsp">more</a></div>
        <div class="news_left_bottom">
        	 		<div id="myTab1_Content0">
                    		<table width="430">
                    		 	<%
     								if(xnxw==null||xnxw.getResult()==null||xnxw.getResult().size()==0){
     							%>
     							   <tr>
	                                    <td width="80%">暂时没有信息</td>
	                                    <td class="date">&nbsp;</td>
                        	        </tr>
     							<%}else{ 
     								List<EduInfo> list = xnxw.getResult() ;
     							%>
     							  <%
 									for(int i=0; i<list.size() ; i++){
 										EduInfo	edu = (EduInfo)list.get(i) ;
 										
         						 %>
                                <tr>
                                    <td width="80%"><a href="third/newsContent.jsp?id=<%=edu.getId() %>"><%=edu.getTitle().equals("")==true?"":ShortString.shotTitle(edu.getTitle(),16) %></a></td>
                                    <td class="date"><%=edu.getAddDate().equals("")==true?"":edu.getAddDate() %></td>
                                </tr>
         					<%}} %>		
                            </table>
                     </div>
                     <div id="myTab1_Content1" class="none">
                           <table width="430">
                               	<%
     								if(xytz==null||xytz.getResult()==null||xytz.getResult().size()==0){
     							%>
     							   <tr>
	                                    <td width="80%">暂时没有信息</td>
	                                    <td class="date">&nbsp;</td>
                        	        </tr>
     							<%}else{ 
     									List<EduInfo> 	list = xytz.getResult() ;
     							%>
     							  <%
 									for(int i=0; i<list.size() ; i++){
 									EduInfo	edu = (EduInfo)list.get(i) ;
         						 %>
                                <tr>
                                    <td width="80%"><a href="third/newsContent.jsp?id=<%=edu.getId() %>"><%=edu.getTitle().equals("")==true?"":ShortString.shotTitle(edu.getTitle(),15)%></a></td>
                                    <td class="date"><%=edu.getAddDate().equals("")==true?"":edu.getAddDate() %></td>
                                </tr>
         					<%}} %>		
                            </table>
                     </div>
        </div>
    </div>
    <div class="news_right">
    	<div style="padding:1px;">
        	<img src="images/photo_new.jpg" width="406" height="44"  />
        </div>
   	  <div class="news_kuang" style="padding-left:1px;">
        	<div id="myFocus" class="mF_liuzg">
                <div class="loading"><span>正在载入图片……</span></div><!--载入画面-->
                <ul class="pic"><!--内容列表-->
					 <%
						if(tpxw!=null||tpxw.getResult()!=null||tpxw.getResult().size()!=0){
							List<EduInfo> list = tpxw.getResult() ;
     				%>
						<% for(int i=0;i<list.size() ;i++){
              					EduInfo edu = list.get(i) ;
              		%>
				   <li><a href="third/newsContent.jsp?id=<%=edu.getId() %>"><img src="<%=edu.getPhotoPath() %>"
							alt="<%=ShortString.shotTitle(edu.getTitle() ,13)%>"  /></a></li>
               <!--    
					<li><a href="#"><img src="images/wall6.jpg" alt="英国乡村" /></a></li>
                    <li><a href="#"><img src="images/wall7.jpg" alt="中国风光" /></a></li>
                    <li><a href="#"><img src="images/wall8.jpg" alt="春来叶绿" /></a></li>
				-->
			<%}} %>
                </ul>
            </div>
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
<div><img src="images/s.jpg" width="960" height="5" /></div>
<div class="copyright">
	版权所有&copy&nbsp;哈尔滨师范大学政法学院网络中心&nbsp;&nbsp;2011版<br />
哈尔滨市利民经济开发区师大南路1号 邮编：150025<br />
Powered by Simrobot Studio
</div>
</div>
</body>
</html>
