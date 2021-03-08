<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<!-- 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script src="resources/js/Login.js"></script>
-->
<%@ include file="Header.jsp"%>

<body>
    <div class="login_container">
        <div class="row">
			<div class="col-md-5 mx-auto">
			  <div class="second">
			      <div class="myform form ">
                        <div class="logo mb-3">
                           <div class="col-md-12 text-center">
                              <h1>Signup</h1>
                           </div>
                        </div>
                        <form action="Join" name="registration" method="post">
                           <div class="form-group">
                              <label for="exampleInputEmail1">아이디</label>
                              <input type="text"  name="account" class="form-control" id="account" onkeyup="" aria-describedby="emailHelp" maxlength="10">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">닉네임</label>
                              <input type="text"  name="name" class="form-control" id="firstname" aria-describedby="emailHelp" maxlength="10">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">메일 주소</label>
                              <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">비밀번호</label>
                              <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" maxlength="15">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">비밀번호 확인</label>
                              <input type="password" name="password2" id="password2"  class="form-control" aria-describedby="emailHelp" maxlength="15">
                           </div>
                           <div class="col-md-12 text-center mb-3">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">가입하기</button>
                           </div>
                           <div class="col-md-12 ">
                              <div class="form-group">
                                 <p class="text-center">이미 가입하셨나요? <a href="Login" id="signin">로그인</a></p>
                              </div>
                           </div>
                           <input type="hidden" name="auth" value="ROLE_MEMBER">
                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                         </div>
                     </div>

			</div>
		</div>
      </div>
</body>
<%@ include file="Footer.jsp"%>