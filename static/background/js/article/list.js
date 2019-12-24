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
        elem: '#articleList',
        cellMinWidth: 80,
        url: '/article/listArticle',
        cols: [
            [{
                type: 'checkbox'
            }, {
                field: 'id', title: 'ID', sort: true
            }, {
                field: 'title', title: '标题', templet: '#usernameTpl'
            }, {
                field: 'date', title: '发布时间', sort: true
            }, {
                field: 'category', title: '分类', sort: true
            }, {
                field: 'recommend', title: '推荐', templet: '#recommendTpl', unresize: true
            }, {
                field: 'top', title: '置顶', templet: '#topTpl', unresize: true
            }, {
                field: 'operate', title: '操作', toolbar: '#operateTpl', unresize: true
            }]
        ],
        data: [{
            "id": "1",
            "title": "WeAdmin的第一个版本在不断地抽空完善学习中",
            "date": "2018-02-03",
            "category": "官方动态",
            "recommend": "checked",
            "top": "checked"
        }, {
            "id": "2",
            "title": "WeAdmin的测试数据一二三四五六七",
            "date": "2018-02-03",
            "category": "新闻资讯",
            "recommend": "",
            "top": "checked"
        }],
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
        //         keyword: $("input[name='keyword']").val()
        //     }, page: {
        //         curr: 1
        //     }
        // });
        return false;
    });

    $('.demoTable .layui-btn').on('click', function () {
        let type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    /*用户-删除*/
    window.member_del = function (obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            let token = $('input[name=csrfmiddlewaretoken]').val();
            $.ajax({
                type: "POST",
                url: '/article/delArticle/',
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
                url: '/article/delAllArticle/',
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

    window.Recommend = function (obj, id) {
        let token = $('input[name=csrfmiddlewaretoken]').val();
        $.ajax({
            type: "POST",
            url: '/article/recommend/',
            traditional: true,
            dataType: 'json',
            data: {
                id: id,
                csrfmiddlewaretoken: token
            },
            success: function (data) {
                if (data.code === 0) {
                    layer.msg('修改成功', {
                        icon: 1
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
    };

    window.RecommendAll = function (argument) {
        let data = table.checkStatus('table').data;
        let id_arr = Array();
        for (let index = 0; index < data.length; ++index) {
            id_arr.push(data[index].id)
        }
        $(".layui-form-checked").not('.header').parents('tr');
        layer.confirm('确认要推荐吗？' + id_arr, function (index) {
            //捉到所有被选中的，发异步进行删除
            let token = $('input[name=csrfmiddlewaretoken]').val();
            $.ajax({
                type: "POST",
                url: '/article/recommendAllArticle/',
                traditional: true,
                dataType: 'json',
                data: {
                    id: id_arr,
                    csrfmiddlewaretoken: token
                },
                success: function (data) {
                    if (data.code === 0) {
                        layer.msg('推荐成功', {
                            icon: 1
                        });
                        location.reload()
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

    window.TopAll = function () {

    }

    window.Top = function (obj, id) {
        let token = $('input[name=csrfmiddlewaretoken]').val();
        $.ajax({
            type: "POST",
            url: '/article/top/',
            traditional: true,
            dataType: 'json',
            data: {
                id: id,
                csrfmiddlewaretoken: token
            },
            success: function (data) {
                if (data.code === 0) {
                    layer.msg('修改成功', {
                        icon: 1
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
    };

    layui.laytpl.config({
        open: '<%',
        close: '%>'
    });
});