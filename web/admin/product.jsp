<%@ page import="com.test.shopping.product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.test.shopping.product.ProductMgr" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/18
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //    String admin = (String)session.getAttribute("admin");
//    if(admin == null || !admin.equals("admin"))
//        response.sendRedirect("login.jsp");
%>
<%
    final int PAGE_SIZE = 2; //每页显示多少条记录
    final int PAGES_PER_TIME = 7;//每次显示多少个页码链接
    int pageNum = 1;

    String pageN = request.getParameter("pageNum");
    if(pageN != null && !pageN.trim().equals("")){
        try{
            pageNum = Integer.parseInt(pageN);
        }catch (NumberFormatException e){
            pageNum = 1;
        }
        if(pageNum <= 0)
            pageNum = 1;
    }

%>
<%
    List<Product> products = new ArrayList<Product>();
    int count = ProductMgr.getInstance().getProducts(products, pageNum, PAGE_SIZE, false);
    int totalPages = count % PAGE_SIZE == 0 ? count / PAGE_SIZE : count / PAGE_SIZE + 1;
    if(pageNum > totalPages)
        pageNum = totalPages;
//    System.out.print(totalPages);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link href="../code/css/bootstrap.min.css" rel="stylesheet">
    <script src="../code/js/jquery-3.0.0.min.js"></script>
    <script src="../code/js/bootstrap.min.js"></script>
    <style type="text/css">
        .navbar-header h3{
            margin-top: 10px;
            padding: 0;
        }
        a{color: black;}
        .middle{margin-top: 100px;}
        .panel-body {padding: 0;}
        .panel-body table tr td {padding-left: 15px}
        .panel-body .table {margin-bottom: 0;}
        div.panel{margin-bottom: 30px;}
        h1.title{margin-bottom: 20px;}
    </style>
    <script type="text/javascript">
        function checkDelete(){
            var ids = document.getElementsByName("id");
            if(document.formDelete.selectAll.checked) {
                for(var i = 0; i < ids.length; i++) {
                    ids[i].checked = "checked";
                }
            } else {
                for(var i = 0; i < ids.length; i++) {
                    ids[i].checked = "";
                }
            }
        }
    </script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <span><a href = "../index.jsp"><h3>网上购物商城</h3></a></span>
        </div>
        <ul class="nav navbar-nav navbar-right" style="margin-top:0;">
            <li>
                <a href = "#">
                    <span class="glyphicon glyphicon-user"> admin</span>
                </a>
            </li>
            <li>
                <a href="../logout.jsp">
                    <span class="glyphicon glyphicon-off"> 退出</span>
                </a>
            </li>
        </ul>
    </div>
</nav>

<div class="container middle">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">用户管理</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="admin.jsp"> 用户列表</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">类别管理</a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="category.jsp">类别列表</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="categoryAJax.jsp">类别列表AJAX</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">产品管理</a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="product.jsp">产品列表</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="productSearch.jsp">产品搜索</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">订单管理</a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="order.jsp">订单列表</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">统计分析</a>
                        </h4>
                    </div>
                    <div id="collapseFive" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="saleStatics.jsp">销量统计</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 col-md-9">
            <div class="well">
                <div class="col-md-3">
                    <h1 class="title">产品列表</h1>
                </div>
                <div class="col-md-6 col-md-offset-3">
                    <ul class="pagination pagination-right">
                        <%
                            int s = (pageNum - 1) / PAGES_PER_TIME * PAGES_PER_TIME + 1;
                            int e = s + PAGES_PER_TIME;
                            if(pageNum <= 1)
                                out.println("<li class = 'disabled'><a href='#'>Prev</a></li>");
                            else
                                out.println("<li><a href='product.jsp?pageNum="+(pageNum-1)+"'>Prev</a></li>");
                            for(int i = s; i < e; i++){
                                if(i == pageNum)
                                    out.println("<li class = 'active'><a href='product.jsp?pageNum="+i+"'>"+i+"</a></li>");
                                else if(i > totalPages)
                                    out.println(" <li class = 'disabled'><a href='#'>"+i+"</a></li>");
                                else{
                        %>
                        <li><a href="product.jsp?pageNum=<%= i%>"><%= i%></a></li>
                        <%
                                }
                            }
                            if(pageNum == totalPages)
                                out.println(" <li class = 'disabled'><a href='#'>Next</a></li>");
                            else{
                        %>
                        <li><a href="product.jsp?pageNum=<%= pageNum + 1%>">Next</a></li>
                        <%
                            }
                        %>
                    </ul>
                </div>
                <form action="productDeleteMultiple.jsp" name="formDelete" method="post">
                    <table class="table table-striped">
                        <tr>
                            <td colspan="8" style="text-align: center">
                                <a href = "productAdd.jsp">添加产品</a>
                            </td>
                        </tr>
                        <tr>
                            <td>选择</td>
                            <td>产品名称</td>
                            <td>产品描述</td>
                            <td>普通价格</td>
                            <td>会员价格</td>
                            <td>上架时间</td>
                            <td>所属类别</td>
                            <td>操作</td>
                        </tr>
                        <%
                            for(Product p : products){
                        %>
                        <tr>
                            <td>
                                <input type="checkbox" name="id" value="<%= p.getId()%>"/>
                            </td>
                            <td><%= p.getName()%></td>
                            <td><%= p.getDescr()%></td>
                            <td><%= p.getNromalprice()%></td>
                            <td><%= p.getMemberprice()%></td>
                            <td>
                                <%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(p.getPdate())%>
                            </td>
                            <td><%= p.getCategory().getName()%></td>
                            <td>
                                <a href="productDelete.jsp?id=<%=p.getId()%>" onclick="return confirm('真的要删?')">删</a>
                                <a target="detail" href="productModify.jsp?id=<%=p.getId()%>">改</a>
                                <a target="detail" href="productUpload.jsp?id=<%=p.getId()%>">上传</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                        <tr>
                            <td>
                                <input name="selectAll" type="checkbox" onclick="checkDelete()"/>
                            </td>
                            <td>
                                <input type="submit" class = "btn" value="Delete"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>