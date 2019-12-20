layui.extend({
    admin: '/static/js/admin'
});
layui.use(['form', 'jquery'], function () {
    var form = layui.form,
        $ = layui.jquery;

    //自定义验证规则
    form.verify({
        nikename: function (value) {
            if (value.length < 5) {
                return '昵称至少得5个字符';
            }
        },
        pass: [/(.+){6,12}$/, '密码必须6到12位'],
        repass: function (value) {
            if ($('#L_pass').val() != $('#L_repass').val()) {
                return '两次密码不一致';
            }
        }
    });
    //失去焦点时判断值为空不验证，一旦填写必须验证
    $('input[name="email"]').blur(function () {
        //这里是失去焦点时的事件
        if ($('input[name="email"]').val()) {
            $('input[name="email"]').attr('lay-verify', 'email');
        } else {
            $('input[name="email"]').removeAttr('lay-verify');
        }
    });

    form.on('submit(addUser)', function (data) {
        let username = $("#L_username").val();
        let name = $("#L_name").val();
        let sex = $("input[name=sex]:checked").val();
        if (sex === "男") {
            sex = 0;
        } else {
            sex = 1;
        }
        let tel = $("#L_phone").val();
        let email = $("#L_email").val();
        let address = $("#L_address").val();
        let password = $("#L_pass").val();
        let token = $('input[name=csrfmiddlewaretoken]').val();
        $.ajax({
            type: "POST",
            url: '/member/addUser/',
            dataType: 'json',
            data: {
                username: username,
                password: password,
                name: name,
                sex: sex,
                tel: tel,
                email: email,
                address: address,
                csrfmiddlewaretoken: token
            },
            success: function (data) {
                if (data.status === 200) {
                    layer.alert("添加成功", {
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
    })
});