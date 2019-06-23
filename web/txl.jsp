<%--
  Created by IntelliJ IDEA.
  User: wangyu
  Date: 2018/12/8
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<script type="text/html" id="barDemo">

    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'/txl1'
            ,toolbar: '#toolbarDemo'
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}

                ,{field: 'inuser', title:'联系人', width:120, edit: 'text'}

                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}

            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);

                   /* console.log("ss");
                    $.ajax({
                        //tyep:设置提交方式（get|post）
                        type:"post",
                        //url:提交到那个servlet，这里写它的路径
                        url:"/sss",
                        //data:定义数据,以键值对的方式放在大括号里
                        data:{key_a:data},

                        //statusCode:状态码，用于定义执行时提示的状态
                        statusCode:{
                            404:function(){
                                alert("404");
                            },
                            500:function(){
                                alert("500");
                            }
                        },
                        //success:当ajax完成操作并且不出现异常执行它，自定义参数massage是用于存放servlet响应的数据，Status为ajax执行的状态
                        success:function(massge,Status) {
                            //提示状态
                            alert("删除成功");
                            //将h1的值替换为servlet返回的值
                            //$("h1").text(massge);
                        }
                    });console.log("ss2");*/
            });
            }
            else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
    });


    //它在这里
    function lixl(){
        //首先使用val()方法获取id为text文本框的内容
        //并赋予给value变量
        var value = $("#text").val();
        //定义ajax()
        $.ajax({
            //tyep:设置提交方式（get|post）
            type:"post",
            //url:提交到那个servlet，这里写它的路径
            url:"/sss",
            //data:定义数据,以键值对的方式放在大括号里
            data:{key_a:value},

            //statusCode:状态码，用于定义执行时提示的状态
            statusCode:{
                404:function(){
                    alert("404");
                },
                500:function(){
                    alert("500");
                }
            },
            //success:当ajax完成操作并且不出现异常执行它，自定义参数massage是用于存放servlet响应的数据，Status为ajax执行的状态
            success:function(massge,Status){
                //提示状态

                //将h1的值替换为servlet返回的值
                $("h1").text(massge);
            }
        });
    }

</script>
<a href=add.jsp><button class="layui-btn">添加联系人</button></a>
</body>
</html>