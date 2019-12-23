layui.extend({
    admin: '/static/background/js/admin'
});
layui.use(['form', 'jquery', 'admin', 'layer'], function () {
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
                    let name = data.data.name;
                    let sex = data.data.sex; //性别
                    let phone = data.data.tel; //电话
                    let email = data.data.email; //邮箱
                    let address = data.data.address; //地址
                    $('input[name="username"]').val(username);
                    $('input[name="name"]').val(name);
                    $('input[name="sex"][value="' + sex + '"]').attr("checked", true);
                    $('input[name="phone"]').val(phone);
                    $('input[name="email"]').val(email);
                    $('input[name="address"]').val(address);
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
        let id = $('input[name="dataId"]').val();
        let username = $('input[name="username"]').val();
        let name = $('input[name="name"]').val();
        let sex = $("input[name=sex]:checked").val();
        if (sex === "男") {
            sex = 0;
        } else {
            sex = 1;
        }
        let tel = $('input[name="phone"]').val();
        let email = $('input[name="email"]').val();
        let address = $('input[name="address"]').val();
        let token = $('input[name=csrfmiddlewaretoken]').val();
        $.ajax({
            type: "POST",
            url: '/member/updateUser/',
            dataType: 'json',
            data: {
                id: id,
                username: username,
                name: name,
                sex: sex,
                tel: tel,
                email: email,
                address: address,
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