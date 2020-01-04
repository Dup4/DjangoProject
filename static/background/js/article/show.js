layui.extend({
    admin: '/static/background/js/admin'
});
layui.use(['form', 'layer', 'layedit', 'jquery', 'layer'], function () {
    let form = layui.form,
        layer = layui.layer,
        $ = layui.jquery;
    layedit = layui.layedit;
    layedit.set({
        uploadImage: {
            url: '/article/uploadImage/' //接口url
            , type: 'POST'
        }
    });
    let index = layedit.build('demo', {});

    //页面初始化加载
    $(function () {
        setTimeout(function () {
            frameVal();
        }, 100);
    });

    function frameVal() {
        let dataId = $('input[name="dataId"]').val();
        // let index = parent.layer.getFrameIndex(window.name);
        $.ajax({
            type: "GET",
            url: '/article/getOneArticle/',
            dataType: 'json',
            data: {
                id: dataId
            },
            success: function (data) {
                if (data.code === 0) {
                    $("#content").html(data.data.content);
                    $("input[name='title']").val(data.data.title);
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
});