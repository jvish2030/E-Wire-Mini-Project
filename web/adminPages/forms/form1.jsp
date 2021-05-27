<%-- 
    Document   : form1
    Created on : May 18, 2021, 9:52:26 PM
    Author     : jatin
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="com.java.ConPool.DBUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="../include/header.jsp"/>
    <%
        int getid = 0;
        // getting SET of Key- value pair of Id and category
        Set CategorySet = DBUtils.getCategoriesSet();
        // Creating Iterators of CategorySet
        Iterator itr1 = CategorySet.iterator();//iterator to list category in addProduct from
        Iterator itr2 = CategorySet.iterator();//iterator to list category in addSubCategory from
        Iterator itr3 = CategorySet.iterator();//iterator to list category and SubCategories in MYCategories Accordian
    %>
    <!-- partial -->

    <div class="main-panel">

        <div class="content-wrapper">
            <jsp:include page="../../include/message.jsp"/>
            <div class="page-header">
                <h3 class="page-title"> Form elements </h3> 
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Forms</a></li>
                        <li class="breadcrumb-item active">Form elements</li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Add New Product</h4>
                            <form class="forms-sample" action="${pageContext.request.contextPath}/AdminOperation" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-5 col-md-6 " >
                                        <div class="form-group">
                                            <label for="productName">Name of Product</label>
                                            <input type="text" class="form-control text-secondary" name="productName" id="productName" placeholder="name">
                                        </div>
                                        <div class="form-group">
                                            <label for="productPrice">Product Price</label>
                                            <input type="text" class="form-control text-primary" name="productPrice" id="productPrice" placeholder="price">
                                        </div>
                                        <div class="form-group">
                                            <label for="productDiscount">Discount Price</label>
                                            <input type="text" class="form-control text-primary" name="productDiscount" id="productDiscount" placeholder="Discount">
                                        </div>

                                    </div>
                                    <div class="col-lg-5 offset-lg-1 col-md-6 " >
                                        <div class="form-group">
                                            <label for="productCategory" >Product Category</label>
                                            <select id="SelectCategory" class="form-control text-primary" name="SelectCategory" >
                                                <%while (itr1.hasNext()) {
                                                        Map.Entry CategoryEntry = (Map.Entry) itr1.next();
                                                        String category = (String) CategoryEntry.getValue();
                                                        int id = (int) CategoryEntry.getKey();
                                                %>
                                                <optgroup label="<%= category%>">
                                                    <%
                                                        for (String subcat : DBUtils.getSubCategories(id)) {
                                                    %>
                                                    <option class=" text-secondary" value="<%=subcat%>"><%=subcat%></option>
                                                    <%}%>

                                                </optgroup>
                                                <%}%>
                                            </select>       
                                        </div>
                                        <div class="form-group ">
                                            <label for="productPhoto" >Product Photo</label>                                                    
                                            <input  class="custom-control" type="file" name="productPhoto" id="productPhoto"/>                                                    
                                        </div>
                                        <div class="form-group ">
                                            <label for="productRemark" >Discount Remark</label>
                                            <input type="text" class="form-control text-primary" name="productRemark" id="productRemark" placeholder="Discount Remark">
                                        </div>

                                    </div>
                                    <div class="col-lg-11 offset-lg-0 col-md-6 " >
                                        <div class="form-group ">
                                            <label for="productDescription" >Description</label>
                                            <textarea class="form-control text-primary" id="productDescription" name="productDescription" placeholder="Description" rows="4" cols="50" ></textarea>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="operation" value="addProduct"/>
                                <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                <button class="btn btn-dark">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-5 col-md-6">
                                <!--form to ADD CATEGORY-->
                                <form name="myCategoryForm" action="${pageContext.request.contextPath}/AdminOperation" method="post" >
                                    <h4 class="card-title">Add New Category</h4>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label for="CategoryName">Add Category</label>
                                            <input type="text" class="form-control text-primary" name="CategoryName" id="CategoryName" placeholder="name">
                                        </div>
                                    </div>
                                    <input type="hidden" name="operation" value="addCategory"/>
                                    <button type="submit" class="btn btn-primary ">Submit</button>
                                </form>
                                <!--//form to ADD CATEGORY//-->
                                <br/> <hr/>
                                <!--form to ADD SUB CATEGORY-->
                                <form name="mySubCategoryForm" action="${pageContext.request.contextPath}/AdminOperation" method="post" >
                                    <h4 class="card-title">Add Sub Category</h4>
                                    <div class="form-group">
                                        <label for="SelectCategory">Select Category to Add Sub Category</label>
                                        <select class="form-control text-primary" name="SelectCategory" id="SelectCategory">
                                            <%while (itr2.hasNext()) {
                                                    Map.Entry CategoryEntry = (Map.Entry) itr2.next();
                                                    String category = (String) CategoryEntry.getValue();
                                                    int id1 = (int) CategoryEntry.getKey();
                                            %>
                                            <option class="text-primary" value="<%= id1%>"><%= category%></option>
                                            <%}%>
                                        </select>                                                                                                        
                                    </div>
                                    <div class="form-group">
                                        <label for="subCategory">Add Sub Category</label>
                                        <input type="text" name="subCategory" class="form-control text-primary" id="subCategory" placeholder="name">
                                    </div>
                                    <input type="hidden" name="operation" value="addSubCategory"/>
                                    <button type="submit" class="btn btn-primary mb-4">Submit</button>
                                </form>
                                <!--//form to ADD SUB CATEGORY//-->

                            </div>

                            <div class="col-lg-5 offset-lg-2 col-md-6">
                                <div class="container">
                                    <h3>My Categories</h3>
                                    <div id="accordion">
                                        <%
                                            while (itr3.hasNext()) {
                                                Map.Entry CategoryEntry = (Map.Entry) itr3.next();
                                                String s = (String) CategoryEntry.getValue();
                                                s = s.replaceAll(" ", "");
                                        %>
                                        <div class="card">
                                            <div class="card-header">
                                                <a class="card-link" data-toggle="collapse" href="#<%=s%>">
                                                    <%= CategoryEntry.getValue()%>
                                                </a>
                                            </div>
                                            <div id="<%=s%>" class="collapse" data-parent="#accordion">
                                                <div class="card-body">
                                                    <%
                                                        for (String s2 : DBUtils.getSubCategories((int) CategoryEntry.getKey())) {
                                                    %>
                                                    <p><%= s2%></p> 
                                                    <%}%>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </div>    


                            <footer class="footer">

                            </footer>
                            <!-- partial -->
                        </div>
                        <!-- main-panel ends -->
                    </div>
                    <!-- page-body-wrapper ends -->
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>