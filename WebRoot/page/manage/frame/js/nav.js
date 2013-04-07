// 导航栏配置文件
var outlookbar=new outlook();
var t;
t=outlookbar.addtitle('用户管理','List1',1)
outlookbar.additem('信息列表',t,'../../../usm.do?service=display&type=student')
outlookbar.additem('添加用户',t,'../user/addUser.jsp')

t=outlookbar.addtitle('系统帮助','List1',1)
outlookbar.additem('查看帮助',t,'../help/help.jsp')
outlookbar.additem('关于Simrobot',t,'../help/about.jsp')

t=outlookbar.addtitle('学院概况','List2',1)
outlookbar.additem('学院简介',t,'../../../edu.do?service=display&type=introduction')
outlookbar.additem('机构设置',t,'../../../edu.do?service=display&type=jgsz')
outlookbar.additem('院系领导',t,'../../../usm.do?service=display&type=leader')
outlookbar.additem('师资队伍',t,'../../../usm.do?service=display&type=teacher')
outlookbar.additem('校友风采',t,'../../../usm.do?service=display&type=friend')

t=outlookbar.addtitle('学科建设','List2',1)
outlookbar.additem('重点学科',t,'../../../edu.do?service=display&type=zdxk')
outlookbar.additem('研究基地',t,'../../../edu.do?service=display&type=yjjd')

t=outlookbar.addtitle('学位建设','List2',1)
outlookbar.additem('本科专业建设',t,'../../../edu.do?service=display&type=bkxwjs')
outlookbar.additem('硕士授权点',t,'../../../edu.do?service=display&type=sssqd' )
outlookbar.additem('博士授权点',t,'../../../edu.do?service=display&type=bssqd')
outlookbar.additem('博士后流动站',t,'../../../edu.do?service=display&type=bshldz')

t=outlookbar.addtitle('党建工作','List2',1)
outlookbar.additem('组织建设',t,'../../../edu.do?service=display&type=dzzjs')
outlookbar.additem('章程条例',t,'../../../edu.do?service=display&type=dzctl')
outlookbar.additem('学习动态',t,'../../../edu.do?service=display&type=dxxdt')
outlookbar.additem('争先创优与学习型党建',t,'../../../edu.do?service=display&type=zxcydj')

t=outlookbar.addtitle('教学工作','List3',1)
outlookbar.additem('工作列表',t,'../../../edu.do?service=display&type=jxgz')

t=outlookbar.addtitle('科研工作','List3',1)
outlookbar.additem('科研项目',t,'../../../edu.do?service=display&type=kyxm')
outlookbar.additem('获奖项目',t,'../../../edu.do?service=display&type=hjxm')
outlookbar.additem('学术专著',t,'../../../edu.do?service=display&type=xszz')

t=outlookbar.addtitle('继续教育','List3',1)
outlookbar.additem('函授教育',t,'../../../edu.do?service=display&type=hsjy')
outlookbar.additem('自考',t,'../../../edu.do?service=display&type=zk')
outlookbar.additem('二学历',t,'../../../edu.do?service=display&type=exl')

t=outlookbar.addtitle('精品课程','List3',1)
outlookbar.additem('查看信息',t,'../../../edu.do?service=display&type=jpkc')

t=outlookbar.addtitle('学生组织','List4',1)
outlookbar.additem('学生团工委',t,'../../../edu.do?service=display&type=xstgw')
outlookbar.additem('学生会',t,'../../../edu.do?service=display&type=xsh')
outlookbar.additem('社团联合会',t,'../../../edu.do?service=display&type=stlhh')
outlookbar.additem('艺术团',t,'../../../edu.do?service=display&type=yst')
outlookbar.additem('网络中心',t,'../../../edu.do?service=display&type=wlzx')
outlookbar.additem('学生工作助理中心',t,'../../../edu.do?service=display&type=xsgzzlzx')
outlookbar.additem('舍委会',t,'../../../edu.do?service=display&type=swh')

t=outlookbar.addtitle('学生活动','List4',1)
outlookbar.additem('学生活动',t,'../../../edu.do?service=display&type=xshd')
outlookbar.additem('思政教育',t,'../../../edu.do?service=display&type=szjy')
outlookbar.additem('公告平台',t,'../../../edu.do?service=display&type=ggpt')
outlookbar.additem('荣誉奖励',t,'../../../edu.do?service=display&type=ryjl')
outlookbar.additem('学生服务',t,'../../../edu.do?service=display&type=xsfw')
outlookbar.additem('青春飞扬',t,'../../../edu.do?service=display&type=qcfy')

t=outlookbar.addtitle('下载平台','List4',1)
outlookbar.additem('本科生文件',t,'../../../edu.do?service=display&type=bksfile')
outlookbar.additem('研究生文件',t,'../../../edu.do?service=display&type=yjsfile')
outlookbar.additem('教师文件',t,'../../../edu.do?service=display&type=jsfile')

t=outlookbar.addtitle('就业指导','List5',1)
outlookbar.additem('考研信息',t,'../../../edu.do?service=display&type=kyxx')
outlookbar.additem('毕业手续',t,'../../../edu.do?service=display&type=bysx')
outlookbar.additem('招聘信息',t,'../../../edu.do?service=display&type=zpxx')


t=outlookbar.addtitle('校内新闻','List6',1)
outlookbar.additem('新闻列表',t,'../../../edu.do?service=display&type=xnxw')
outlookbar.additem('撰写最新文章',t,'../eduinfo/addInfo.jsp?type=xnxw')

t=outlookbar.addtitle('图片新闻','List6',1)
outlookbar.additem('新闻列表',t,'../../../edu.do?service=display&type=tpxw')
outlookbar.additem('添加新闻',t,'../eduinfo/addInfo.jsp?type=tpxw')
outlookbar.additem('添加导航栏图片',t,'../eduinfo/addLogo.jsp?type=dhltp')
outlookbar.additem('管理导航栏图片',t,'../../../edu.do?service=display&type=dhltp')

t=outlookbar.addtitle('院内通知','List6',1)
outlookbar.additem('通知列表',t,'../../../edu.do?service=display&type=yntz')
outlookbar.additem('撰写通知',t,'../eduinfo/addInfo.jsp?type=yntz')
