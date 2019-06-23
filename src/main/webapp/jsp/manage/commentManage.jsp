<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新闻管理系统后台</title>
    <jsp:include page="${path}/jsp/common/resources.jsp"></jsp:include>
    <link rel="stylesheet" href="${path}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/static/manager/userManage.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%--    头部--%>
    <jsp:include page="${path}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${path}/jsp/common/menu5.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div style="margin-left: 30px;margin-top: 20px;"><h3>评论管理：评论列表</h3></div>
            <div class="add-content">
                <div class="add-content-input">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>用户名</th>
                            <th>新闻名</th>
                            <th>评论类容</th>
                            <th>评论时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageInfo.list}" var="obj">
                            <tr>
                                <td>${obj.id}</td>
                                <td>${obj.user.username}</td>
                                <td>${obj.news.name}</td>
                                <td>${obj.content}</td>
                                <td><fmt:formatDate value="${obj.comdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                <td><a class="btn btn-warning" href="${path}/manage/deleteComment?id=${obj.id}">删除</a></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="7">
                                <p style="float: left;margin-left: 200px;">
                                    <span>每页显示<b>5</b>条记录，</span>
                                    共<b>${pageInfo.total}</b>条,
                                    当前<b>${pageInfo.pageNum}</b>页,总<b>${pageInfo.pages}</b>页
                                </p>
                                <p class="page">
                                    <a href="${path}/manage/commentManage?pageNo=${pageInfo.firstPage}">第一页</a>
                                    <c:if test="${pageInfo.hasPreviousPage}">
                                        <a href="${path}/manage/commentManage?pageNo=${pageInfo.pageNum-1}">上一页</a>
                                    </c:if>
                                    <c:if test="${pageInfo.hasNextPage}">
                                        <a href="${path}/manage/commentManage?pageNo=${pageInfo.pageNum+1}">下一页</a>
                                    </c:if>
                                    <a href="${path}/manage/commentManage?pageNo=${pageInfo.lastPage}">最后页</a>
                                </p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        layui.com

        - 底部固定区域
    </div>
</div>
<script src="${path}/static/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</body>
</html>
