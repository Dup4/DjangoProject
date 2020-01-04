layui.extend({
    admin: '/static/background/js/admin'
});

layui.use(['table', 'jquery', 'form', 'admin'], function () {
    let table = layui.table,
        $ = layui.jquery,
        form = layui.form,
        admin = layui.admin;

    let tableIns = table.render({
        id: 'table',
        elem: '#memberList',
        cellMinWidth: 80,
        url: '/member/listMember',
        cols: [
            [{
                type: 'checkbox'
            }, {
                field: 'id', title: 'ID', sort: true
            }, {
                field: 'name', title: '姓名', sort: true
            }, {
                field: 'sex', title: '性别', sort: true
            }, {
                field: 'email', title: '邮箱'
            }, {
                field: 'address', title: '地址', templet: '#recommendTpl', unresize: true
            }, {
                field: 'date', title: '加入时间', templet: '#topTpl', unresize: true
            }, {
                field: 'operate', title: '操作', toolbar: '#operateTpl', unresize: true
            }]
        ],
        event: true,
        page: true,
        toolbar: true,
        loading: true
    });
    /*
     *数据表格中form表单元素是动态插入,所以需要更新渲染下
     * http://www.layui.com/doc/modules/form.html#render
     * */
    $(function () {
        form.render();
    });
    form.on('submit(sreach)', function (data) {
        // tableIns.reload({
        //     where: { //设定异步数据接口的额外参数，任意设
        //         usernmae: $("input[name='username']").val()
        //     }, page: {
        //         curr: 1
        //     }
        // });
        return false;
    });

    /*用户-删除*/
    window.member_del = function (obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            let token = $('input[name=csrfmiddlewaretoken]').val();
            $.ajax({
                type: "POST",
                url: '/member/delUser/',
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
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {
                icon: 1,
                time: 1000
            });
        });
    };

    window.delAll = function (argument) {
        let data = table.checkStatus('table').data;
        let id_arr = Array();
        for (let index = 0; index < data.length; ++index) {
            id_arr.push(data[index].id)
        }
        layer.confirm('确认要删除吗？' + id_arr, function (index) {
            //捉到所有被选中的，发异步进行删除
            let token = $('input[name=csrfmiddlewaretoken]').val();
            $.ajax({
                type: "POST",
                url: '/member/delAllUser/',
                traditional: true,
                dataType: 'json',
                data: {
                    id: id_arr,
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
    };

    layui.laytpl.config({
        open: '<%',
        close: '%>'
    });
});