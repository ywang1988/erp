<%@ page import="com.erp.util.SystemConfig" %>
<%@ page import="com.erp.entity.StaffInfo" %><%--
  Created by IntelliJ IDEA.
  User: wang_
  Date: 2016-07-21
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String version = SystemConfig.getValue("project.version");
    StaffInfo staffInfo = (StaffInfo) session.getAttribute("staffinfo");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>用户查询</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/jquery-easyui-1.4.5/themes/<%= staffInfo.getStyle()%>/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/jquery-easyui-1.4.5/themes/icon.css">
    <script type="text/javascript" src="<%= request.getContextPath()%>/jquery-easyui-1.4.5/jquery.min.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath()%>/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>

    <script type="text/javascript" src="<%= request.getContextPath()%>/erp/sys/user/js/user.js?version=<%= version%>"></script>
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/common.js?version=<%= version%>"></script>

    <script>
        var root = '<%= request.getContextPath()%>';

        $(document).ready(function () {
            $("#user-query").datagrid('hideColumn', "staffId");
            $("#user-query").datagrid('hideColumn', "password");
            $("#user-query").datagrid('hideColumn', "styleId");
        });
    </script>

</head>
<body>

<table id="user-query" class="easyui-datagrid" title="物料明细" style="width:100%;height:100%"
       data-options="
				iconCls: 'icon-search',
				singleSelect: false,
				url:'<%= request.getContextPath()%>/UserServlet?param=user-query',
				method: 'post',
				toolbar: [
				    '-',
				    {
				        text: '查询',
				        iconCls: 'icon-search',
				        handler: function () {
                            queryUser();
				        }
				    },
				    '-',
				    {
				        text: '添加',
				        iconCls: 'icon-add',
				        handler: function () {
                            openUserDialog('add');
				        }
				    },
				    '-',
				    {
				        text: '删除',
				        iconCls: 'icon-remove',
				        handler: function () {
                            deleteUser();
				        }
				    },
				    '-',
				    {
				        text: '修改',
				        iconCls: 'icon-edit',
				        handler: function () {
                            updateUser();
				        }
				    },
				    '-'
				]
			">
    <thead>
    <tr>

        <th data-options="field:'staffId',width:80"></th>
        <th data-options="field:'staffCode',width:100">登录名</th>
        <th data-options="field:'staffName',width:100">用户姓名</th>
        <th data-options="field:'password',width:100">密码</th>
        <th data-options="field:'telephone',width:100">手机号</th>
        <th data-options="field:'styleId',width:100"></th>
        <th data-options="field:'style',width:100">界面样式</th>
        <th data-options="field:'createDate',width:150">创建时间</th>
        <th data-options="field:'updateDate',width:150">更新时间</th>
        <th data-options="field:'lastLoginTime',width:150">最后登录时间</th>

    </tr>
    </thead>
</table>

<div id="user-dlg" class="easyui-dialog" title="用户增加" style="width:450px;height:300px;padding:10px"
     data-options="
				iconCls: 'icon-save',
				maximizable:true,
				collapsible:true,
				modal: true,
				closed: true,
				toolbar: [
				    '-',
				    {
				        text: '保存',
				        iconCls: 'icon-save',
				        handler: function () {
				            saveUserForm();
				        }
				    },
				    '-',
				    {
				        text: '取消',
				        iconCls: 'icon-undo',
				        handler: function () {
				            closeUserDialog();
				        }
				    },
				    '-'
				]
			">
    <form id="user-form" method="post" style="width:auto">
        <input type="hidden" id="staffId" />
        <table cellpadding="5">
            <tr>
                <td>登录名:</td>
                <td>
                    <input class="easyui-textbox" type="text" id="staffcode" name="staffcode" data-options="required:true,validType:['username', 'remote[\'staffId\']']">
                    </input>
                </td>
            </tr>
            <tr>
                <td>用户名:</td>
                <td><input class="easyui-textbox" type="text" id="staffname" name="staffname" data-options="required:true,validType:'name'">
                    </input>
                </td>
            </tr>
            <tr>
                <td>密码:</td>
                <td>
                    <input class="easyui-textbox" type="text" id="pwd" name="pwd" data-options="required:true,validType:['username','same[\'pwd-again\']']">
                    </input>
                </td>
            </tr>
            <tr>
                <td>确认密码:</td>
                <td>
                    <input class="easyui-textbox" type="text" id="pwd-again" name="pwd-again" data-options="required:true,validType:['username','same[\'pwd\']']">
                    </input>
                </td>
            </tr>
            <tr>
                <td>手机号码:</td>
                <td>
                    <input class="easyui-textbox" type="text" id="telphone" name="telphone" data-options="validType:'mobile'">
                    </input>
                </td>
            </tr>
            <tr>
                <td>界面样式:</td>
                <td>
                    <input class="easyui-combobox" id="styleid" name="styleid"
                           data-options="
                           required:true,
                           url: '<%= request.getContextPath()%>/StyleServlet?param=query-combo',
				           method: 'post',
				           valueField: 'styleId',
				           textField: 'style'
                           ">
                    </input>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
