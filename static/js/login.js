layui.extend({
    admin: '/static/js/admin'
});
layui.use(['form', 'admin'], function () {
    var form = layui.form
        , admin = layui.admin;
    // layer.msg('玩命卖萌中', function(){
    //   //关闭后的操作
    //   });
    //监听提交
    form.on('submit(login)', function (data) {
        // alert(888)
        layer.msg(JSON.stringify(data.field), function () {
            location.href = '/index'
        });
        return false;
    });
});