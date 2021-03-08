<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<%@ include file="BlogHeader.jsp"%>

  
<section id="contact">
    <div class="container">
      <h4 class="text-center text-uppercase text-secondary mb-0">글 수정</h4>
      <hr class="star-dark mb-5">
      <div class="row">
        <div class="writeContainer">
          <form name="sentMessage" id="contactForm" novalidate="novalidate" action="Modify" method="post" enctype="multipart/form-data">
          	<input type="hidden" name="account" value="">
			<input type="hidden" name="thisPage" value="${paging.thisPage}" readonly>
			<input type="hidden" name="pageSize" value="${paging.pageSize}" readonly>
			<input type="text" name="w_no" value="<c:out value='${content.w_no}' />">
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>제목</label>
                <input class="form-control" name="title" id="title" type="text" value="${content.title}" placeholder="제목" required="required" data-validation-required-message="제목을 입력해주세요.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>내용</label>
                <textarea class="form-control" name="content" id="content" rows="10" placeholder="내용" required="required" data-validation-required-message="내용을 입력해주세요.">${content.content}</textarea>
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <br>
            
            <div>
            	<input type="file">
            </div>
            <br>
            <br>
            <br>
            
            <div id="success"></div>
            <div class="form-group btnDiv">
              <button type="submit" class="writebtn">수정</button>
              <button type="button" class="writebtn" onclick="cancleListbtn(${content.w_no})">취소</button>
            </div>
          </form>
          
        </div>
      </div>
    </div>
  </section>

  <%@ include file="Footer.jsp"%>