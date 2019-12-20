layui.extend({
    admin: '{/}./static/js/admin'
});
layui.use(['form'], function () {
    var form = layui.form,
        $ = layui.jquery;
    form.on('submit(login)', function (data) {
        let username = $("input[name=username]").val();
        let password = $("input[name=password]").val();
        let token = $('input[name=csrfmiddlewaretoken]').val();
        $.ajax({
            type: "POST",
            url: '/admin/login/',
            dataType: 'json',
            data: {
                username: username,
                password: password,
                csrfmiddlewaretoken: token
            },
            success: function (data) {
                if (data.status === 200) {

                    location.href = '/index'
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