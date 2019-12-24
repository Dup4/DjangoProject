function del(nodeId) {
    alert(nodeId)
}

/*分类-停用*/
function member_stop(obj, id) {
    var confirmTip;
    if ($(obj).attr('title') == '启用') {
        confirmTip = '确认要停用吗？';
    } else {
        confirmTip = '确认要启用吗？';
    }
    layer.confirm(confirmTip, function (index) {
        if ($(obj).attr('title') == '启用') {
            //发异步把用户状态进行更改
            $(obj).attr('title', '停用')
            $(obj).find('i').html('&#xe62f;');
            $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
            layer.msg('已停用!', {
                icon: 5,
                time: 1000
            });
        } else {
            $(obj).attr('title', '启用')
            $(obj).find('i').html('&#xe601;');

            $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
            layer.msg('已启用!', {
                icon: 6,
                time: 1000
            });
        }
    });
}

//自定义的render渲染输出多列表格
let layout = [
    {
        name: '菜单名称',
        treeNodes: true,
        headerClass: 'value_col',
        colClass: 'value_col',
        style: 'width: 60%'
    },
    {
        name: '操作',
        headerClass: 'td-manage',
        colClass: 'td-manage',
        style: 'width: 20%',
        render: function (row) {
            return '<a title="添加子类" onclick="WeAdminShow(\'添加\',\'./category-add.html\')" href="javascript:;"><i class="layui-icon">&#xe654;</i></a>' +
                '<a title="编辑" onclick="WeAdminShow(\'编辑\',\'./category-edit.html\')" href="javascript:;"><i class="layui-icon">&#xe642;</i></a>' +
                '<a title="删除" onclick="del(' + row.id + ')" href="javascript:;">\<i class="layui-icon">&#xe640;</i></a>';
            //return '<a class="layui-btn layui-btn-danger layui-btn-mini" onclick="del(' + row.id + ')"><i class="layui-icon">&#xe640;</i> 删除</a>'; //列渲染
        }
    },
];
layui.extend({
    admin: '/static/background/js/admin',
    treeGird: '/static/background/lib/layui/lay/treeGird' // {/}的意思即代表采用自有路径，即不跟随 base 路径
});
layui.use(['treeGird', 'jquery', 'admin', 'layer'], function () {
    let layer = layui.layer,
        $ = layui.jquery,
        admin = layui.admin,
        treeGird = layui.treeGird;

    let tree1 = layui.treeGird({
        elem: '#demo', //传入元素选择器
        spreadable: true, //设置是否全展开，默认不展开
        nodes: [
            {
                "id": "1",
                "name": "文字",
                "children": [
                    {
                        "id": "11",
                        "name": "师大新闻"
                    },
                    {
                        "id": "12",
                        "name": "学科建设"
                    }
                ]
            },
            {
                "id": "2",
                "name": "图片",
                "children": [
                    {
                        "id": "21",
                        "name": "杭师人物"
                    }, {
                        "id": "22",
                        "name": "图说杭师"
                    }
                ]
            }
        ],
        layout: layout
    });
    $('#collapse').on('click', function () {
        layui.collapse(tree1);
    });

    $('#expand').on('click', function () {
        layui.expand(tree1);
    });
});