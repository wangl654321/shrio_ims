// 展示提示框
function showTips(content){
    $("#op-tips-content").html(content);
    $("#op-tips-dialog").modal("show");
}

//删除单条日志
$(".log-list").on("click",".delete-this-log",function(){
    var logTr=$(this).parents("tr");
    var logId=logTr.find(".logId").html();
    if(confirm('确认删除ID为['+logId+']的用户登录日志吗？')){
        $.ajax({
            url:"delete.html",
            data:{id:logId},
            type:"POST",
            success:function(){
                logTr.remove();
                showTips("删除成功！");
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

//批量删除日志
$(".delete-selected-confirm").click(function(){
    $("#delete-confirm-dialog").modal("hide");
    var cbs=$("input[name='logIds']:checked")
    if(cbs.length===0){
        showTips("您未选择日志！");
    }else{
        var logIds=new Array();
        $.each(cbs,function(i,cb){
            logIds[i]=cb.value;
        });

        $.ajax({
            url:"deleteMore.html",
            data:{ids:logIds},
            type:"POST",
            traditional:true,
            success:function(){
                cbs.parent().parent().parent().remove();
                showTips("删除所选成功！");
            }
        });
    }
});