// 展示提示框
function showTips(content){
    $("#op-tips-content").html(content);
    $("#op-tips-dialog").modal("show");
}

// 重置权限表单
function resetPermForm(title,button){
    $(".perm-form input[type='text']").val("");
    $(".perm-form input[type='checkbox']").prop("checked",false);

    $(".perm-form-title").html(title);
    $(".perm-submit").html('<i class="ace-icon fa fa-check"></i>'+button);
}

//添加权限框体
$(".show-add-form").click(function(){
    resetPermForm("添加新权限","添加");
});


// 更新权限框体
$(".perm-list").on("click",".show-update-form",function(){
    resetPermForm("更新权限信息","更新");

    var permId=$(this).parents("tr").find(".permId").html();
    $.ajax({
        url:"getPerm.html",
        data:{permId:permId},
        type:"POST",
        dataType:"json",
        success:function(data){
            $(".perm-form input[name='id']").val(permId);
            $(".perm-form input[name='name']").val(data.name);
            $(".perm-form input[name='url']").val(data.url);
            $(".perm-form input[name='code']").val(data.code);
            if(data.isNav===1){
                $(".perm-form input[type='checkbox'][name='isNav']").prop("checked",true);
            }
            $(".perm-form input[name='priority']").val(data.priority);
            $(".perm-form input[name='icon']").val(data.icon);
            $(".perm-form input[name='pId']").val(data.pId);
            if(data.state===1){
                $(".perm-form input[type='checkbox'][name='state']").prop("checked",true);
            }

        }
    });
});

//添加、更新动作
$(".perm-submit").click(function(){
    if($(this).html().indexOf("添加")>0){
        //请求添加新权限
        $.ajax({
            url:"add.html",
            type:"POST",
            data:$(".perm-form").serialize(),
            dataType:"json",
            success:function(data){
                $("#perm-form-div").modal("hide");
                showTips("添加成功！");
                $(".close-tip").click(function () {
                        setTimeout(function(){window.location.reload()},220);
                    }
                )
            },
            error:function(){
                showTips("添加失败！");
            }
        });
    }else{
        //请求更新权限
        $.ajax({
            url:"update.html",
            data:$(".perm-form").serialize(),
            type:"POST",
            success:function(){
                $("#perm-form-div").modal("hide");
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
$(".perm-list").on("click",".delete-this-perm",function(){
    var permTr=$(this).parents("tr");
    var permId=permTr.find(".permId").html();
    var name=permTr.find(".name").html();
    if(confirm('确认删除['+name+']权限吗？')){
        //请求删除该权限
        $.ajax({
            url:"delete.html",
            data:{permId:permId},
            type:"POST",
            success:function(){
                permTr.remove();
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
    var cbs=$("input[name='permIds']:checked")
    if(cbs.length===0){
        showTips("没有选中任意项！");
    }else{
        var permIds=new Array();
        $.each(cbs,function(i,cb){
            permIds[i]=cb.value;
        });
        $.ajax({
            url:"deleteMore.html",
            data:{permIds:permIds},
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