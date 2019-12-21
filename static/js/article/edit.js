layui.extend({
    admin: '/static/js/admin'
});
layui.use(['form', 'layer', 'layedit', 'jquery', 'layer'], function () {
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

    //页面初始化加载
    $(function () {
        setTimeout(function () {
            frameVal();
        }, 100);
    });

    function frameVal() {
        let dataId = $('input[name="dataId"]').val();
        // let index = parent.layer.getFrameIndex(window.name);
        $.ajax({
            type: "GET",
            url: '/article/getOneArticle/',
            dataType: 'json',
            data: {
                id: dataId
            },
            success: function (data) {
                if (data.code === 0) {
                    $("input[name='title']").val(data.data.title);
                    layedit.setContent(index, data.data.content);
                } else {
                    layer.msg(data.message)
                }
            },
            err: function () {
                layui.use('layer', function () {
                    layer.msg("服务器请求失败")
                });
            }
        });
    }

    //监听提交
    form.on('submit(submit)', function (data) {
        console.log(data);
        let dataId = $('input[name="dataId"]').val();
        let title = $("input[name='title']").val();
        let classify = $("input[name='classify']").val();
        let content = layedit.getContent(index);
        let token = $('input[name=csrfmiddlewaretoken]').val();
        $.ajax({
            type: "POST",
            url: '/article/updateArticle/',
            dataType: 'json',
            data: {
                id: dataId,
                title: title,
                classify: classify,
                content: content,
                csrfmiddlewaretoken: token
            },
            success: function (data) {
                if (data.code === 0) {
                    layer.alert("修改文章成功", {
                        icon: 6
                    }, function () {
                        // 获得frame索引
                        let index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        parent.location.reload();
                    });
                } else {
                    layer.msg(data.message)
                }
            },
            err: function () {
                layer.msg("服务器请求失败")
            }
        });
        return false;
    });
});