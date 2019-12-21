layui.use(['form', 'layer', 'layedit', 'jquery'], function () {
    let form = layui.form,
        layer = layui.layer,
        $ = layui.jquery;
        layedit = layui.layedit;
    layedit.set({
        uploadImage: {
            url: '/article/uploadImage/' //接口url
            , type: 'POST'
        }
    });
    let index = layedit.build('demo', {});

    //监听提交
    form.on('submit(add)', function (data) {
        console.log(data);
        let title = $("input[name='title']").val();
        let classify = $("input[name='classify']").val();
        let content = layedit.getContent(index);
        let token = $('input[name=csrfmiddlewaretoken]').val();
        $.ajax({
            type: "POST",
            url: '/article/addArticle/',
            dataType: 'json',
            data: {
                title: title,
                classify: classify,
                content: content,
                csrfmiddlewaretoken: token
            },
            success: function (data) {
                if (data.code === 0) {
                    layer.alert("添加文章成功", {
                        icon: 6
                    }, function () {
                        // 获得frame索引
                        let index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        parent.location.reload();
                    });
                } else {
                    layui.use('layer', function () {
                        layer.msg(data.message)
                    });
                }
            },
            err: function () {
                layui.use('layer', function () {
                    layer.msg("服务器请求失败")
                });
            }
        });
        return false;
    });
});