<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script src="resources/js/Login.js"></script>
 -->
<%@ include file="Header.jsp"%>
<p><c:out value="${error}"/></p>
<p><c:out value="${logout}"/></p>
    <div class="login_container">
        <div class="row">
			<div class="col-md-5 mx-auto">
			<div id="first">
				<div class="myform form ">
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<h1>Login</h1>
						 </div>
					</div>
                   <form action="Login" name="login" method="post">
                           <div class="form-group">
                              <label for="exampleInputEmail1">아이디</label>
                              <input type="text" name="account"  class="form-control" id="account" aria-describedby="emailHelp">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">비밀번호</label>
                              <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp">
                           </div>
                           <div class="col-md-12 text-center ">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">로그인</button>
                           </div>
                           <div class="col-md-12 ">
                              <div class="login-or">
                                 <hr class="hr-or">
                                 <span class="span-or">or</span>
                              </div>
                           </div>
                           <div class="form-group">
                              <p class="text-center">계정을 잊으셨나요? <a href="#">찾기</a></p>
                           </div>
                           <div class="form-group">
                              <p class="text-center">계정이 없으신가요? <a href="Join" id="signup">가입하기</a></p>
                           </div>
                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
				</div>
			</div>
                     
			</div>
		</div>
      </div>   
         
<%@ include file="Footer.jsp"%>
