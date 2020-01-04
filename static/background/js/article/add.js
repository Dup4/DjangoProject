layui.use(['form', 'layer', 'layedit', 'jquery', 'upload'], function () {
    let form = layui.form,
        layer = layui.layer,
        $ = layui.jquery,
        layedit = layui.layedit,
        upload = layui.upload;
    layedit.set({
        uploadImage: {
            url: '/article/uploadImage/' //接口url
            , type: 'POST'
        }
    });
    let index = layedit.build('demo', {});
    let img_url = "";
    // 封面上传
    let uploadInst = upload.render({
        elem: '#test1', //绑定元素
        accept: 'images', //允许上传的文件类型
        multiple: true, //允许多文件上传
        auto: false, //选完文件后不要自动上传
        bindAction: '#upd', //指定一个按钮触发上传
        url: '/article/uploadImage/', //上传接口
        choose: function (obj) {
            // let files = obj.pushFile(); //将每次选择的文件追加到文件队列

            //图像预览，如果是多文件，会逐个添加。(不支持ie8/9)
            obj.preview(function (index, file, result) {
                let imgobj = new Image(); //创建新img对象
                imgobj.src = result; //指定数据源
                imgobj.className = 'thumb';
                imgobj.onclick = function (result) {
                    //单击预览
                    img_prev.src = this.src;
                    let w = $(window).width() - 42, h = $(window).height() - 42;
                    layer.open({
                        title: '预览',
                        type: 1,
                        area: [w, h], //宽高
                        content: $('#prevModal')
                    });

                };
                $("div_prev").html("");
                document.getElementById("div_prev").appendChild(imgobj);
            });
        },
        done: function (res) {
            //上传完毕回调
            img_url = res.data.src;

            let title = $("input[name='title']").val();
            let classify = $("#classify").val();
            let content = layedit.getContent(index);
            let token = $('input[name=csrfmiddlewaretoken]').val();
            $.ajax({
                type: "POST",
                url: '/article/addArticle/',
                dataType: 'json',
                data: {
                    title: title,
                    classify: classify,
                    content: content,
                    img_url: img_url,
                    csrfmiddlewaretoken: token
                },
                success: function (data) {
                    if (data.code === 0) {
                        layer.alert("添加文章成功", {
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
        },
        error: function () {
            //请求异常回调
        }
    });
    //监听提交
    form.on('submit(add)', function (data) {
        uploadInst.upload();
        return false;
    });
});