<%--
  Created by IntelliJ IDEA.
  User: wangyu
  Date: 2018/12/11
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><a href=URL target=aa>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    </head>
    <title>电子邮箱系统</title>
<body >
<table border="1" style="width:100% ;height:100%">
    <tr>
        <td colspan="2">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">

            </fieldset>

            <ul class="layui-nav">
                <li class="layui-nav-item"><a href=a.jsp>首页</a></li>
                <li class="layui-nav-item"><a href=txl.jsp target=aa>通讯录</a></li>
                <li class="layui-nav-item"><a href=app.jsp target=aa>应用中心</a></li>
                <li class="layui-nav-item"><a href=json.jsp target=aa>收件箱</a></li>
                <li class="layui-nav-item"><a href=write.jsp target=aa>写信</a></li>

            </ul>
            <a   align="right" >
                <%
                    out.print("当前用户:");
                    HttpSession ww=request.getSession();
                    Object name=ww.getAttribute("NAME");
                    out.println(name);
                %>
            </a>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">

                <script src="layui/layui.js" charset="utf-8"></script>
                <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
                <script>
                    layui.use('element', function(){
                        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

                        //监听导航点击
                        element.on('nav(demo)', function(elem){
                            //console.log(elem)
                            layer.msg(elem.text());
                        });
                    });
                </script>
        </td>
    <tr>

        <th rowspan = "1"  height="100%"  width="15%" >
            <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px,width:100px,height="100%";">
            <li class="layui-nav-item"><a  href=RedFlagMail.jsp target=aa>红旗邮件</a></li>
            <li class="layui-nav-item"><a href=emails  target=aa>代办邮件</a></li>
            <li class="layui-nav-item"><a href=sent.jsp target=aa>已发送</a></li>
            <li class="layui-nav-item"><a href=deleted.jsp target=aa>已删除</a></li>
            <li class="layui-nav-item"><a href=drafts.jsp target=aa>草稿箱</a></li>
            <li class="layui-nav-item"><a href=spam.jsp target=aa>垃圾邮件</a></li>
            <li class="layui-nav-item"><a href=back.jsp target=aa>backup</a></li>
            <li class="layui-nav-item"><a href=other.jsp target=aa>其他文件夹</a></li>
            <li class="layui-nav-item"><a href=core.jsp target=aa>邮箱中心</a></li>

        <td>

            <iframe width=100% height=100% name=aa frameborder=0 src="write.jsp"></iframe>

        </td>

        </th>
        </ul>

</table>
</body>
</html>