<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="footer">
    <div class="footer-inner">
        <div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">${title}</span>
							&copy; 2016-<jsp:useBean id="now" class="java.util.Date" scope="page"/><fmt:formatDate
                                value="${now}" pattern="yyyy"/>
						</span>

            &nbsp; &nbsp;
            <span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-weixin green bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-github text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
        </div>
    </div>
</div>