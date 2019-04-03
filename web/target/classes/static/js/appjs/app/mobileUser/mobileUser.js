var prefix = "/app/mobileUser"
$(function () {
    load();
    $('#exampleTable').bootstrapTable('hideColumn', 'status');
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
                        nickName:
                            '%' + $('#searchName').val() + '%',
                        phone:
                            $('#phone').val(),
                        userFrom: "app"
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
                        field: 'id',
                        title: '用户ID'
                    },
                    {
                        field: 'nickName',
                        title: '昵称'
                    },
                    {
                        field: 'sex',
                        title: '性别'
                    },
                    {
                        field: 'phone',
                        title: '手机号'
                    },

                    {
                        field: 'createDate',
                        title: '注册时间'
                    },
                    {
                        field: 'realFlag',
                        title: '是否实名'
                    },
                    {
                        field: 'businessCard',
                        title: '个人名片',
                        formatter: function (value, row, index) {
                            if (value != null && value != "") {
                                return "<a target='_blank' href='" + value + "'>点击查看</a>"
                            }
                            return "暂无"
                        }
                    },
                    {
                        field: 'status',
                        title: '状态'
                    },
                    {
                        field: 'fansCount',
                        title: '粉丝数量'
                    },
                    {
                        field: 'videoCount',
                        title: '作品数量'
                    },
                    {
                        field: 'praisesCount',
                        title: '获赞数量'
                    },
                    {
                        title: '操作',
                        field: 'id',
                        align: 'center',
                        formatter: function (value, row, index) {
                            var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="启用" onclick="start(\''
                                + row.id
                                + '\')"><i class="fa fa-edit">启用</i></a> ';
                            var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="禁用"  mce_href="#" onclick="stop(\''
                                + row.id
                                + '\')"><i class="fa fa-remove">禁用</i></a> ';
                            var f = '<a class="btn btn-success btn-sm" href="#" title="备用"  mce_href="#" onclick="realCheck(\''
                                + row.id
                                + '\')"><i class="fa fa-key">实名审核</i></a> ';
                            if (row.status == "0") {
                                if (row.realFlag == "0") {
                                    return e + f;
                                }
                                return e
                            }
                            if (row.realFlag == "0") {
                                return d + f;
                            }
                            return d


                        }
                    }]
            });
}

function reLoad() {
    $('#exampleTable').bootstrapTable('refresh');
}


function realCheck(id) {
    layer.open({
        type: 2,
        title: '实名审核',
        maxmin: true,
        shadeClose: false, // 点击遮罩关闭层
        area: ['800px', '520px'],
        content: prefix + '/edit/' + id // iframe的url
    });
}

function start(id) {
    layer.confirm('确定要修改选中的状态？', {
        btn: ['确定', '取消']
    }, function () {
        $.ajax({
            url: prefix + "/update",
            type: "post",
            data: {
                'id': id,
                status: "1"
            },
            success: function (r) {
                if (r.code == 0) {
                    layer.msg(r.msg);
                    reLoad();
                } else {
                    layer.msg(r.msg);
                }
            }
        });
    })
}

function stop(id) {
    layer.confirm('确定要修改选中的状态？', {
        btn: ['确定', '取消']
    }, function () {
        $.ajax({
            url: prefix + "/update",
            type: "post",
            data: {
                'id': id,
                status: "0"
            },
            success: function (r) {
                if (r.code == 0) {
                    layer.msg(r.msg);
                    reLoad();
                } else {
                    layer.msg(r.msg);
                }
            }
        });
    })
}

function resetPwd(id) {
}

