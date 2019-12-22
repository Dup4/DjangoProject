// // 基于准备好的dom，初始化echarts实例
// jQuery(
//     function ($) {
//
//         // let myChart = echarts.init(document.getElementById('main'));
//
//         let myChart = echarts.init($("#main"));
//
//         // 指定图表的配置项和数据
//         let option = {
//             title: {
//                 text: '访客量'
//             },
//             tooltip: {
//                 trigger: 'axis'
//             },
//             legend: {
//                 data: ['访客量']
//             },
//             grid: {
//                 left: '3%',
//                 right: '4%',
//                 bottom: '3%',
//                 containLabel: true
//             },
//             toolbox: {
//                 feature: {
//                     saveAsImage: {}
//                 }
//             },
//             xAxis: {
//                 type: 'category',
//                 boundaryGap: false,
//                 data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
//             },
//             yAxis: {
//                 type: 'value'
//             },
//             series: [
//                 {
//                     name: '访客量',
//                     type: 'line',
//                     stack: '总量',
//                     data: [120, 132, 101, 134, 90, 230, 210]
//                 }
//             ]
//         };
//
//
// // 使用刚指定的配置项和数据显示图表。
//         myChart.setOption(option);
//     }
// );
// let myChart = echarts.init(document.getElementById('main'));
// console.log(document.getElementById('main'));
// console.log($("#main").get(0));’
layui.extend({
    admin: '/static/js/admin'
});

layui.use(['form', 'jquery', 'admin', 'layer'], function () {
    let $ = layui.jquery,
        layer = layui.layer;

    //自定义验证规则

    //页面初始化加载
    $(function () {
        setTimeout(function () {
            frameVal();
        }, 100);
    });

    function frameVal() {
        let myChart = echarts.init($("#main").get(0));
        $.ajax({
            type: "GET",
            url: '/echarts/getData/',
            dataType: 'json',
            data: {},
            success: function (data) {
                if (data.code === 0) {
                    data = data.data;
                    console.log(data[0]);
                    let date = Array();
                    let number = Array();
                    for (let index = 0; index < data.length; ++index) {
                        date.push(data[index].date);
                        number.push(data[index].number);
                    }
                    let option = {
                        title: {
                            text: '访客量'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['访客量']
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        toolbox: {
                            feature: {
                                saveAsImage: {}
                            }
                        },
                        xAxis: {
                            type: 'category',
                            boundaryGap: false,
                            data: date
                        },
                        yAxis: {
                            type: 'value'
                        },
                        series: [
                            {
                                name: '访客量',
                                type: 'line',
                                stack: '总量',
                                data: number
                            }
                        ]
                    };


            // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
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
