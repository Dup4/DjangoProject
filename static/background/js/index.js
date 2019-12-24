layui.config({
    base: '/static/background/js/'
    , version: '101100'
}).extend({ //设定模块别名
    admin: 'admin'
    , menu: 'menu'
});
layui.use(['jquery', 'admin', 'menu'], function () {
    let $ = layui.jquery,
        admin = layui.admin,
        menu = layui.menu;
    $(function () {
        menu.getMenu('/static/background/json/menu.json');
    });

    window.logout = function () {
        let token = $('input[name=csrfmiddlewaretoken]').val();
        $.ajax({
            type: "POST",
            url: '/admin/logout/',
            dataType: 'json',
            data: {
                csrfmiddlewaretoken: token
            },
            success: function (data) {
                if (data.code === 0) {
                    // location.href = '/login'
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
    }
});