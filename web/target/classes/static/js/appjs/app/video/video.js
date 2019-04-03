var prefix = "/app/video"
$(function () {
    load();
    $('#exampleTable').bootstrapTable('hideColumn', 'recommended');

});

function load() {
    $('#exampleTable')
        .bootstrapTable(
            {
                method: 'get', // 服务器数据的请求方式 get or post
                url: prefix + "/list", // 服务器数据的加载地址
                //	showRefresh : true,
                //	showToggle : true,
                //	showColumns : true,
                iconSize: 'outline',
                toolbar: '#exampleToolbar',
                striped: true, // 设置为true会有隔行变色效果
                dataType: "json", // 服务器返回的数据类型
                pagination: true, // 设置为true会在底部显示分页条
                // queryParamsType : "limit",
                // //设置为limit则会发送符合RESTFull格式的参数
                singleSelect: false, // 设置为true将禁止多选
                // contentType : "application/x-www-form-urlencoded",
                // //发送到服务器的数据编码类型
                pageSize: 10, // 如果设置了分页，每页数据条数
                pageNumber: 1, // 如果设置了分布，首页页码
                //search : true, // 是否显示搜索框
                showColumns: false, // 是否显示内容下拉框（选择显示的列）
                sidePagination: "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
                queryParams: function (params) {
                    return {
                        //说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
                        limit: params.limit,
                        offset: params.offset,
                        // name:$('#searchName').val(),
                        // username:$('#searchName').val()
                        userId:
                            $('#userId').val(),
                        theme:
                            '%' + $('#searchName').val() + '%',
                        status: $('#status').val()
                    };
                },
                // //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 如果
                // queryParamsType = 'limit' ,返回参数必须包含
                // limit, offset, search, sort, order 否则, 需要包含:
                // pageSize, pageNumber, searchText, sortName,
                // sortOrder.
                // 返回false将会终止请求
                columns: [
                    {
                        field: 'userId',
                        title: '用户ID'
                    },
                    {
                        field: 'theme',
                        title: '视频主题'
                    },
                    {
                        field: 'releaseTime',
                        title: '发布时间'
                    },
                    {
                        field: 'permissions',
                        title: '私密性',
                        formatter: function (value, row, index) {
                            if (value == "0") {
                                return "公开"
                            }
                            return "私密"
                        }
                    },
                    {
                        field: 'fileid',
                        title: '视频',
                        formatter: function (value, row, index) {

                            return "<a href='javascript:void(0)' onclick='videoPlayer(" + row.id + ")'>点击查看</a>"
                        }
                    },
                    {
                        field: 'praises',
                        title: '点赞'
                    },
                    {
                        field: 'comments',
                        title: '评论数量'
                    },
                    {
                        field: 'share',
                        title: '转发数量'
                    },
                    {
                        field: 'status',
                        title: '状态',
                        formatter: function (value, row, index) {
                            if (value == "0") {
                                return "待审核"
                            } else if (value == "1") {
                                return "已发布"
                            } else if (value == "2") {
                                return "已下架"
                            } else if (value == "3") {
                                return "已推荐"
                            } else {
                                return "被举报"
                            }
                        }
                    },
                    {
                        field: 'remarks',
                        title: '备注',
                        formatter: function (value, row, index) {
                            if (value == "" || value == null) {
                                return "无"
                            }
                            return value
                        }
                    },
                    {
                        field: 'recommended',
                        title: '是否推荐'
                    },
                    {
                        title: '操作',
                        field: 'id',
                        align: 'center',
                        formatter: function (value, row, index) {

                            var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="下架视频"  mce_href="#" onclick="shelvesVideos(\''
                                + row.id
                                + '\')"><i class="fa fa-remove">下架视频</i></a> ';
                            var f = '<a class="btn btn-success btn-sm" href="#" title="推荐视频"  mce_href="#" onclick="recommend(\''
                                + row.id
                                + '\')"><i class="fa fa-key">推荐视频</i></a> ';
                            var g = '<a class="btn btn-success btn-sm" style="background: gold" href="#" title="审核通过"  mce_href="#" onclick="pass(\''
                                + row.id
                                + '\')"><i class="fa fa-chrome">审核通过</i></a> ';
                            var h = '<a class="btn btn-success btn-sm" style="background: green" href="#" title="恢复视频"  mce_href="#" onclick="restore(\''
                                + row.id
                                + '\')"><i class="fa fa-firefox">恢复视频</i></a> ';

                            if (row.status == "0") {
                                return g
                            } else if (row.status == "1") {
                                return d + f
                            } else if (row.status == "2") {
                                return h
                            } else if (row.status == "3") {
                                return h
                            } else if (row.status == "4") {
                                return h
                            }
                        }
                    }]
            });
}

function reLoad() {
    $('#exampleTable').bootstrapTable('refresh');
}


function videoPlayer(id) {
    layer.open({
        type: 2,
        title: '播放视频',
        maxmin: true,
        shadeClose: false, // 点击遮罩关闭层
        area: ['800px', '520px'],
        content: prefix + '/videoPlayer/' + id // iframe的url
    });
}

function shelvesVideos(id) {
    layer.open({
        type: 2,
        title: '下架视频',
        maxmin: true,
        shadeClose: false, // 点击遮罩关闭层
        area: ['500px', '320px'],
        content: prefix + '/shelvesVideos/' + id // iframe的url
    });
}

function pass(id) {
    layer.confirm("确认审核通过该视频吗？", {
        btn: ['确定', '取消']
        // 按钮
    }, function () {
        $.ajax({
            type: 'POST',
            data: {
                "id": id,
                status: "1"
            },
            url: prefix + '/update',
            success: function (r) {
                if (r.code == 0) {
                    layer.msg(r.msg);
                    reLoad();
                } else {
                    layer.msg(r.msg);
                }
            }
        });
    }, function () {

    });
}

function recommend(id) {
    layer.confirm("确认推荐该视频吗？", {
        btn: ['确定', '取消']
        // 按钮
    }, function () {
        $.ajax({
            type: 'POST',
            data: {
                "id": id,
                status: "3",
                recommended: 1,
                reTime: new Date()
            },
            url: prefix + '/update',
            success: function (r) {
                if (r.code == 0) {
                    layer.msg(r.msg);
                    reLoad();
                } else {
                    layer.msg(r.msg);
                }
            }
        });
    }, function () {

    });
}

function restore(id) {
    layer.confirm("确认恢复该视频吗？", {
        btn: ['确定', '取消']
        // 按钮
    }, function () {
        $.ajax({
            type: 'POST',
            data: {
                "id": id,
                status: "1",
                recommended: 0,
                remarks: "无"
            },
            url: prefix + '/update',
            success: function (r) {
                if (r.code == 0) {
                    layer.msg(r.msg);
                    reLoad();
                } else {
                    layer.msg(r.msg);
                }
            }
        });
    }, function () {

    });
}
