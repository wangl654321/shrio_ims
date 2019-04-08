// 展示提示框
function showTips(content){
    $("#op-tips-content").html(content);
    $("#op-tips-dialog").modal("show");
}

// 重置角色表单
function resetRoleForm(title,button){
    $(".role-form input[type='text']").val("");
    $(".role-form-title").html(title);
    $(".role-submit").html('<i class="ace-icon fa fa-check"></i>'+button);
}

// 根据角色获取相应权限
function getPermsByRoleId(roleId,doSuccess){
    $.ajax({
        url:"showRolePerms.html",
        data:{roleId:roleId},
        type:"POST",
        dataType:"json",
        success:function(data){
            doSuccess(data);
        }
    });
}

//查看角色权限
$(".role-list").on("click",".show-role-perms",function(){
    var roleId=$(this).parents("tr").find(".roleId").html();
    var rpTd=$(this).parent();
    getPermsByRoleId(roleId,function(data){
        rpTd.html("");
        for(var i in data){
            var role=data[i].name+"<br/>";
            rpTd.append(role);
        }
    });
});

//添加角色框体
$(".show-add-form").click(function(){
    resetRoleForm("添加新角色","添加");
    allPermTree();
});


// 更新角色框体
$(".role-list").on("click",".show-update-form",function(){
    allPermTree();
    resetRoleForm("更新角色信息","更新");
    var roleId=$(this).parents("tr").find(".roleId").html();
    $("input[name='id']").val(roleId);
    $.ajax({
        url:"getRole.html",
        data:{roleId:roleId},
        type:"POST",
        dataType:"json",
        success:function(data){
            $("input[name='name']").val(data.name);
            $("input[name='description']").val(data.description);
            $("input[name='code']").val(data.code);
        }
    });
    getPermsByRoleId(roleId,function(data){

        for(var i in data){
            // alert(data[i].id);
            zTree = $.fn.zTree.getZTreeObj("permTree");//treeDemo界面中加载ztree的div
            var node = zTree.getNodeByParam("id",data[i].id);
            zTree.cancelSelectedNode();//先取消所有的选中状态
            zTree.checkNode(node, true );
            // zTree.selectNode(node,true);//将指定ID的节点选中
            zTree.expandNode(node, true, false);//将指定ID节点展开
            // $('.role-form input[name="permIds"][value="'+data[i].id+'"]').prop("checked",true);
        }
    });
});

//添加、更新动作
$(".role-submit").click(function(){
    var treeIds=onCheck();
    $("#permTree").append('<input type="hidden" name="permIds" value="'+treeIds+'"/>');
    if($(this).html().indexOf("添加")>0){
        $.ajax({
            url:"add.html",
            type:"POST",
            data:$(".role-form").serialize(),
            dataType:"json",
            success:function(data){
                $("#role-form-div").modal("hide");
                showTips("添加成功！");
                var newTr='<tr>' +
                    '<td class="center"><label class="pos-rel"><input type="checkbox" class="ace" name="roleIds" value="'+data.id+'"/> <span class="lbl"></span> </label> </td>'+
                    '<td class="roleId">'+data.id+'</td>'+
                    '<td class="name">'+data.name+'</td>'+
                    '<td class="description">'+data.description+'</td>'+
                    '<td class="code">'+data.code+'</td>'+
                    '<td><a href="javascript:void(0);" class="show-role-perms">点击查看</a></td>'+
                    '<td>' +
                    '<div class="hidden-sm hidden-xs btn-group">'+
                    '<button class="btn btn-xs btn-info show-update-form" data-toggle="modal" data-target="#role-form-div"><i class="ace-icon fa fa-pencil bigger-120"></i> </button>'+
                    '<button class="btn btn-xs btn-danger delete-this-role"><i class="ace-icon fa fa-trash-o bigger-120"></i> </button>'+
                    '</div>'+
                    '<div class="hidden-md hidden-lg"><div class="inline pos-rel">'+
                    '<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto"> <i class="ace-icon fa fa-cog icon-only bigger-110"></i></button>'+
                    '<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">'+

                    '<li>'+
                    '<a href="javascript:void(0);" class="tooltip-success show-update-form" data-toggle="modal" data-target="#role-form-div" data-rel="tooltip" title="编辑">'+
                    '<span class="green"> <i class="ace-icon fa fa-pencil-square-o bigger-120"></i> </span>'+
                    '</a>'+
                    '</li>'+

                    '<li>'+
                    '<a href="javascript:void(0);" class="tooltip-error delete-this-role" data-rel="tooltip" title="删除">'+
                    '<span class="red"> <i class="ace-icon fa fa-trash-o bigger-120"></i> </span>'+
                    '</a> </li> </ul> </div> </div> </td> </tr>';
                $(".role-list>tbody").append(newTr);
            },
            error:function(){
                showTips("添加失败！");
            }
        });
    }else{
        //更新角色信息
        $.ajax({
            url:"update.html",
            data:$(".role-form").serialize(),
            type:"POST",
            success:function(){
                $("#role-form-div").modal("hide");
                showTips("更新成功！");
                $(".close-tip").click(function () {
                        setTimeout(function(){window.location.reload()},220);
                    }
                )
            },
            error:function(){
                showTips("更新失败！");
            }
        });
    }
});

//全选/取消全选出现的active阴影
var active_class = 'active';
$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
    var th_checked = this.checked;//checkbox inside "TH" table header

    $(this).closest('table').find('tbody > tr').each(function(){
        var row = this;
        if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
        else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
    });
});

//单行选中出现active阴影
$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
    var $row = $(this).closest('tr');
    if($row.is('.detail-row ')) return;
    if(this.checked) $row.addClass(active_class);
    else $row.removeClass(active_class);
});

//删除单个角色
$(".role-list").on("click",".delete-this-role",function(){
    var roleTr=$(this).parents("tr");
    var roleId=roleTr.find(".roleId").html();
    var name=roleTr.find(".name").html();
    if(confirm('确认删除['+name+']角色吗？')){
        //请求删除该角色
        $.ajax({
            url:"delete.html",
            data:{roleId:roleId},
            type:"POST",
            success:function(){
                roleTr.remove();
                showTips("删除成功！");
            },
            error:function(){
                showTips("删除失败！");
            }
        });
    }
});

//批量删除角色
$(".delete-selected-confirm").click(function(){
    $("#delete-confirm-dialog").modal("hide");
    var cbs=$("input[name='roleIds']:checked")
    if(cbs.length===0){
        showTips("没有选中任意项！");
    }else{
        var roleIds=new Array();
        $.each(cbs,function(i,perm){
            roleIds[i]=perm.value;
        });
        $.ajax({
            url:"deleteMore.html",
            data:{roleIds:roleIds},
            type:"POST",
            traditional:true,
            success:function(){
                cbs.parent().parent().parent().remove();
                showTips("删除所选成功！");
            },
            error:function(){
                showTips("删除所选失败！");
            }
        });
    }
});

// 生成菜单/权限树
var setting = {
    view: {
        // addHoverDom: addHoverDom,
        removeHoverDom: removeHoverDom,
        selectedMulti: false
    },
    check: {
        enable: true
    },
    data: {
        simpleData: {
            enable: true
        }
    },
    // edit: {
    //     enable: true
    // }
};

function allPermTree(){
    $.ajax({
        url:"permsTree.html",
        type:"POST",
        dataType:"json",
        success:function(result){
            $.fn.zTree.init($("#permTree"),setting,result);

            // 默认展开所有节点
            zTree = $.fn.zTree.getZTreeObj("permTree");//treeDemo界面中加载ztree的div
            zTree.expandAll(true);

        }
    });
};

var newCount = 1;
function addHoverDom(treeId, treeNode) {
    var sObj = $("#" + treeNode.tId + "_span");
    if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
        + "' title='add node' onfocus='this.blur();'></span>";
    sObj.after(addStr);
    var btn = $("#addBtn_"+treeNode.tId);
    if (btn) btn.bind("click", function(){
        var zTree = $.fn.zTree.getZTreeObj("permTree");
        zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
        return false;
    });
}
function removeHoverDom(treeId, treeNode) {
    $("#addBtn_"+treeNode.tId).unbind().remove();
}

//获取选中的权限
function onCheck() {
    var treeObj = $.fn.zTree.getZTreeObj("permTree"), nodes = treeObj.getCheckedNodes(true), v = "";
    for (var i = 0; i < nodes.length; i++) {
        if(i===nodes.length-1){
            v += nodes[i].id ;
        }else{
            v += nodes[i].id + ",";
        }
    }
    return v;
}