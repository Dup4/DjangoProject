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
        console.log(data);
        let username = $("input[name='username']").val();
        let name = $("input[name='name']").val();
        let tel = $("input[name='phone']").val();
        let email = $("input[name='email']").val();
        let password = $("input[name='pass']").val();
        let role = $("#role").val();
        let token = $('input[name=csrfmiddlewaretoken]').val();
        //发异步，把数据提交给php
        $.ajax({
            type: "POST",
            url: '/admin/addUser/',
            dataType: 'json',
            data: {
                username: username,
                password: password,
                name: name,
                tel: tel,
                email: email,
                role: role,
                csrfmiddlewaretoken: token
            },
            success: function (data) {
                if (data.code === 0) {
                    layer.alert("添加管理员成功", {
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