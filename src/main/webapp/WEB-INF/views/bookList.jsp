<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>JSP Template with Bootstrap and JSTL</title>
    <!-- Bootstrap 4 CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<!-- Include Navbar -->
<jsp:include page="/WEB-INF/views/includes/navbar.jsp" />

<!-- Main content -->
<div class="container mt-4">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <c:if test="${empty cus}">
                    <div class="row justify-content-center" style="margin-top: 100px;">
                        <div class="col-md-4">
                            <h2 class="text-center">로그인</h2>
                            <form action="${contextPath}/login" method="post">
                                <div class="form-group">
                                    <label for="username">사용자 이름</label>
                                    <input type="text" class="form-control" id="username" placeholder="사용자 이름을 입력하세요" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">비밀번호</label>
                                    <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요" required>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">로그인</button>
                            </form>
                        </div>
                    </div>
                    </c:if>
                    <c:if test="${not empty cus}">
                        <div class="row justify-content-center" style="margin-top: 100px;">
                            <div class="col-md-4 text-center">
                                <h2>환영합니다, ${cus.username}님!</h2>
                                <form action="${contextPath}/logout" method="POST">
                                    <button type="submit" class="btn btn-danger">로그아웃</button>
                                </form>
                            </div>
                        </div>
                    </c:if>
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Price</th>
                            <th>Author</th>
                            <th>Pages</th>
                            <th>createdAt</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- JSTL c:forEach로 리스트 반복 -->
                        <c:forEach var="book" items="${list}">
                            <tr>
                                <td>${book.id}</td>
                                <td><a href="${contextPath}/bookView/${book.id}">${book.title}</a></td>
                                <td>${book.price}</td>
                                <td>${book.author}</td>
                                <td>${book.page}</td>
                                <td>${book.createdAt}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include Footer -->
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
<!-- jQuery and Bootstrap 4 JS via CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
