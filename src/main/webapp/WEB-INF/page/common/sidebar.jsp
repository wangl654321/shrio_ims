<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<div id="sidebar" class="sidebar responsive ace-save-state sidebar-fixed sidebar-scroll">
    <script type="text/javascript">
        try {
            ace.settings.loadState('sidebar')
        } catch (e) {
        }
    </script>

    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>

        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div><!-- /.sidebar-shortcuts -->

    <ul class="nav nav-list">
        <li class="active">
            <a href="${path}/index" class="open-console">
                <i class="menu-icon fa fa-tachometer"></i>
                <span class="menu-text"> 首页 </span>
            </a>

            <b class="arrow"></b>
        </li>

        <c:forEach items="${navBar}" var="nav" varStatus="status">
            <c:choose>
                <c:when test="${fn:length(nav.childNavigations)!=0}">
                    <li class="" id="${nav.navId}">
                        <a href="javascript:void(0);" class="dropdown-toggle">
                            <i class="menu-icon fa ${nav.navIcon== null ? 'fa-desktop' : nav.navIcon}"></i>
                            <span class="menu-text">${nav.navigationName}</span>
                            <b class="arrow fa fa-angle-down"></b>
                        </a>

                        <b class="arrow"></b>

                        <ul class="submenu">
                            <c:forEach items="${nav.childNavigations}" var="perm" varStatus="submenu">
                                <li class="" id="${perm.id}" >
                                    <a href="javascript:void(0);">
                                        <i class="menu-icon fa fa-caret-right"></i>
                                            ${perm.name}
                                    </a>

                                    <b class="arrow"></b>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="" id="${nav.navId}">
                        <a href="javascript:void(0);">
                            <i class="menu-icon fa ${nav.navIcon== null ? 'fa-desktop' : nav.navIcon}"></i>
                            <span class="menu-text">${nav.navigationName}</span>
                        </a>

                        <b class="arrow"></b>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>


    </ul><!-- /.nav-list -->

    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state"
           data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>
</div>