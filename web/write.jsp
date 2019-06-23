<%@ page contentType="text/html; charset=utf8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "_//W3C//DTD HTML 4.01 Transitional//EN">
<!DOCTYPE HTML PUBLIC "_//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>写信</title>
<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>
<body>
<form action="write1.jsp" method="get">
  <div class="layui-form-item">
    <label class="layui-form-label">收件人</label>
    <div class="layui-input-block">
      <input type="text" name="inuser" lay-verify="title" autocomplete="off" placeholder="请输入收件人姓名" class="layui-input">
    </div>
  </div>
 <div class="layui-form-item">
    <label class="layui-form-label">请输入主题</label>
    <div class="layui-input-block">
      <input type="text" name="zhu" lay-verify="title" autocomplete="off" placeholder="请输入主题" class="layui-input">
    </div>
  </div>
<div class="layui-form-item">
    <label class="layui-form-label">请输入正文</label>
    <div class="layui-input-block">
      <input type="text" name="xin" lay-verify="title" autocomplete="off" placeholder="请输入正文" class="layui-input">
    </div>
  </div>




	<div class="layui-upload">

  <div class="layui-upload-list">
    <table class="layui-table">
      <thead>
        <tr><th>文件名</th>
        <th>大小</th>
        <th>状态</th>
        <th>操作</th>
      </tr></thead>
      <tbody id="demoList"></tbody>
    </table>
  </div>
        <button type="button" class="layui-btn layui-btn-normal" id="testList">选择文件</button>
        <button type="button"   class="layui-btn" id="testListAction">开始上传</button>
</div> 


 
          
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
 
  //多文件列表示例
  var demoListView = $('#demoList')
  ,uploadListIns = upload.render({
    elem: '#testList'
    ,url: '../servlet/UploadHandleServlet'
    ,accept: 'file'
    ,multiple: true
    ,auto: false
    ,bindAction: '#testListAction'
    ,choose: function(obj){   
      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
      //读取本地文件
      obj.preview(function(index, file, result){
        var tr = $(['<tr id="upload-'+ index +'">'
          ,'<td>'+ file.name +'</td>'
          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
          ,'<td>等待上传</td>'
          ,'<td>'
            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
          ,'</td>'
        ,'</tr>'].join(''));
        
        //单个重传
        tr.find('.demo-reload').on('click', function(){
          obj.upload(index, file);
        });
        
        //删除
        tr.find('.demo-delete').on('click', function(){
          delete files[index]; //删除对应的文件
          tr.remove();
          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
        });
        
        demoListView.append(tr);
      });
    }
    ,done: function(res, index, upload){
      if(res.code == 0){ //上传成功
        var tr = demoListView.find('tr#upload-'+ index)
        ,tds = tr.children();
        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
        tds.eq(3).html(''); //清空操作
        return delete this.files[index]; //删除文件队列已经上传成功的文件
      }
      this.error(index, upload);
    }
    ,error: function(index, upload){
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
    }
  });
  

  
});
</script>
<br><br><br>
<input type="submit"  class="layui-btn" value="发送"/>
</form><br><br><br>
<%--<form action="${pageContext.request.contextPath}/servlet/UploadHandleServlet" enctype="multipart/form-data" method="post">

    <input type="file" name="file1" value="添加附件"><br/>
    <input type="file" name="file2"><br/>
    <input type="file" name="file3"><br/>
    <input type="submit" class="layui-btn" value="提交">
</form>--%>
</body>
</html>