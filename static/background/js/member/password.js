layui.extend({
    admin: '/static/background/js/admin'
});
layui.use(['form', 'jquery', 'admin', 'layer'], function () {
    let form = layui.form,
        $ = layui.jquery,
        layer = layui.layer;

    //自定义验证规则
    form.verify({
        pass: [/(.+){6,12}$/, '密码必须6到12位'],
        repass: function (value) {
            if ($('#L_pass1').val() != $('#L_repass2').val()) {
                return '两次密码不一致';
            }
        }
    });

    //页面初始化加载
    $(function () {
        setTimeout(function () {
            frameVal();
        }, 100);
    });

    function frameVal() {
        let dataId = $('input[name="dataId"]').val();
        $.ajax({
            type: "GET",
            url: '/member/getOneMember/',
            dataType: 'json',
            data: {
                id: dataId
            },
            success: function (data) {
                if (data.code === 0) {
                    let username = data.data.username; //用户名
                    $('input[name="username"]').val(username);
                    form.render();
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
    form.on('submit(save)', function (data) {
        console.log(data);
        //发异步，把数据提交给php
        let id = $('input[name="dataId"]').val();
        let old_password = $('input[name="oldpass"]').val();
        let new_password = $('input[name="newpass"]').val();
        let token = $('input[name=csrfmiddlewaretoken]').val();
        $.ajax({
            type: "POST",
            url: '/member/changePassword/',
            dataType: 'json',
            data: {
                id: id,
                old_password: old_password,
                new_password: new_password,
                csrfmiddlewaretoken: token
            },
            success: function (data) {
                if (data.code === 0) {
                    layer.alert("修改成功", {
                        icon: 6
                    }, function () {
                        // 获得frame索引
                        let index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
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