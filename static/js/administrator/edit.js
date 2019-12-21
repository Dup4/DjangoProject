layui.extend({
    admin: '/static/js/admin'
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
        let dataId = $('input[name="dataId"]').val();
        console.log(dataId);
        let index = parent.layer.getFrameIndex(window.name);
        parent.layui.jquery("#adminList tr").each(function () {
            if ($(this).attr('data-id') == dataId) {
                let tdArr = $(this).children('td');
                let username = $(this).children('input').val(); //用户名
                let name = tdArr.eq(2).text();
                let phone = tdArr.eq(3).text(); //电话
                let email = tdArr.eq(4).text(); //邮箱
                let role = tdArr.eq(5).text();
                console.log("role", role);
                $('input[name="username"]').val(username);
                $('input[name="name"]').val(name);
                $('input[name="phone"]').val(phone);
                $('input[name="email"]').val(email);
                $('#role option:contains(' + role + ')').each(function () {
                    if ($(this).text() == role) {
                        $(this).attr('selected', true);
                    }
                });
                form.render();
            }
        });
    }

    //监听提交
    form.on('submit(edit)', function (data) {
        let id = $('input[name="dataId"]').val();
        let name = $('input[name="name"]').val();
        let tel = $('input[name="phone"]').val();
        let email = $('input[name="email"]').val();
        let role = $("#role").val();
        let token = $('input[name=csrfmiddlewaretoken]').val();
        $.ajax({
            type: "POST",
            url: '/admin/updateUser/',
            dataType: 'json',
            data: {
                id: id,
                name: name,
                tel: tel,
                email: email,
                role: role,
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