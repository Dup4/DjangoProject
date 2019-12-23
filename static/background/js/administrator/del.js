/*
 * @Author: https://github.com/WangEn
 * @Author: https://gitee.com/lovetime/
 * @Date:   2018-03-27
 * @lastModify 2018-3-28
 * +----------------------------------------------------------------------
 * | WeAdmin 表格table中多个删除等操作公用js
 * | 有改用时直接复制到对应页面也不影响使用
 * +----------------------------------------------------------------------
 */
layui.extend({
    admin: '/static/background/js/admin'
});
layui.use(['laydate', 'jquery', 'admin'], function () {
    var laydate = layui.laydate,
        $ = layui.jquery,
        admin = layui.admin;
    //执行一个laydate实例
    laydate.render({
        elem: '#start' //指定元素
    });
    //执行一个laydate实例
    laydate.render({
        elem: '#end' //指定元素
    });

    /*用户-删除*/
    window.member_del = function (obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发请求删除数据
            let token = $('input[name=csrfmiddlewaretoken]').val();
            $.ajax({
                type: "POST",
                url: '/admin/delUser/',
                dataType: 'json',
                data: {
                    id: id,
                    csrfmiddlewaretoken: token
                },
                success: function (data) {
                    if (data.code === 0) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {
                            icon: 1,
                            time: 1000
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
        });
    };

    window.delAll = function (argument) {
         let data = tableCheck.getData();
        let id_arr = Array();
        $.each(data, function (i, item) {
            id_arr.push(parseInt(item))
        });
        layer.confirm('确认要删除吗？' + data, function (index) {
            //捉到所有被选中的，发异步进行删除
            let token = $('input[name=csrfmiddlewaretoken]').val();
            $.ajax({
                type: "POST",
                url: '/admin/delAllUser/',
                traditional:true,
                dataType: 'json',
                data: {
                    id: data,
                    csrfmiddlewaretoken: token
                },
                success: function (data) {
                    if (data.code === 0) {
                        layer.msg('删除成功', {
                            icon: 1
                        });
                        $(".layui-form-checked").not('.header').parents('tr').remove();
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
        });
    }

});