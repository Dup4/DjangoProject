layui.extend({
    admin: '/static/background/js/admin'
});
layui.use(['form', 'layer', 'admin'], function () {
    var form = layui.form,
        $ = layui.jquery,
        layer = layui.layer;
    form.render();
    //自定义验证规则
    form.verify({
        nikename: function (value) {
            if (value.length < 5) {
                return '昵称至少得5个字符啊';
            }
        }
        , pass: [/(.+){6,12}$/, '密码必须6到12位']
        , repass: function (value) {
            if ($('#L_pass').val() != $('#L_repass').val()) {
                return '两次密码不一致';
            }
        }
    });

    //监听提交
    form.on('submit(add)', function (data) {
        let name = $("input[name='name']").val();
        let user_operation = $("input[name='user']").is(':checked');
        let article_operation = $("input[name='article']").is(':checked');
        let token = $('input[name=csrfmiddlewaretoken]').val();
        let desc = $("#desc").val();

        if (user_operation === true) {
            user_operation = 1
        } else {
            user_operation = 0
        }

        if (article_operation === true) {
            article_operation = 1
        } else {
            article_operation = 0
        }

        //发异步，把数据提交给php
        $.ajax({
            type: "POST",
            url: '/admin/addRole/',
            dataType: 'json',
            data: {
                name: name,
                user_operation: user_operation,
                article_operation: article_operation,
                desc: desc,
                csrfmiddlewaretoken: token
            },
            success: function (data) {
                if (data.code === 0) {
                    layer.alert("添加角色成功", {
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