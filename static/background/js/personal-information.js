layui.extend({
    admin: '/static/background/js/admin'
});
layui.use(['form', 'layer', 'admin'], function () {
    let form = layui.form,
        $ = layui.jquery,
        layer = layui.layer;

    //自定义验证规则

    //页面初始化加载
    $(function () {
        setTimeout(function () {
            frameVal();
        }, 100);
    });

    function frameVal() {
        $.ajax({
            type: "GET",
            url: '/admin/getMy/',
            dataType: 'json',
            data: {
            },
            success: function (data) {
                if (data.code === 0) {
                    let username = data.data.username;
                    let name = data.data.name;
                    let phone = data.data.tel; //电话
                    let email = data.data.email; //邮箱
                    let role = data.data.role;
                    $('input[name="username"]').val(username);
                    $('input[name="name"]').val(name);
                    $('input[name="phone"]').val(phone);
                    $('input[name="email"]').val(email);
                    $.ajax({
                        type: "GET",
                        url: '/admin/getAllRole/',
                        dataType: 'json',
                        data: {},
                        success: function (data) {
                            if (data.code === 0) {
                                data = data.data;
                                let select = $('#role');
                                select.empty();
                                select.append(new Option("请选择角色"));
                                for (let index = 0; index < data.length; ++index) {
                                    let opt = new Option(data[index].name, data[index].id);
                                    select.append(opt);
                                }
                                select.find('option[value="1"]').attr("disabled","disabled");
                                select.val(role);
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
    form.on('submit(edit)', function (data) {
        let name = $('input[name="name"]').val();
        let tel = $('input[name="phone"]').val();
        let email = $('input[name="email"]').val();
        let token = $('input[name=csrfmiddlewaretoken]').val();
        $.ajax({
            type: "POST",
            url: '/admin/updateMy/',
            dataType: 'json',
            data: {
                name: name,
                tel: tel,
                email: email,
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