<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="BlogHeader.jsp"%>

<div class="contentContainer">
	<div class="row">
        <div class="col-md-12 content">
			<h2>${content.title}</h2>
			<div class="dateDiv">
				<span class="writer">작성자</span>
				<span class="date"><fmt:timeZone value="KST"><fmt:formatDate value="${content.date}" pattern="yyyy-MM-dd HH:mm"/></fmt:timeZone></span>
				<c:if test="${content.updatedate != null}">
					<span class="date"><span class="dateTitle">수정</span> <fmt:timeZone value="KST"><fmt:formatDate value="${content.updatedate}" pattern="yyyy-MM-dd HH:mm"/></fmt:timeZone></span>
				</c:if>
			</div>
			    <div class="contentMenu">
				    <span><a class="modifyBtn" href="${content.w_no}">수정</a></span>
				    <span> | </span>
				    <span><a class="deleteBtn" href="${content.w_no}">삭제</a></span>
<!--			    <span><a onclick="return confirm('삭제하시겠습니까?');" href="Delete?w_no=${content.w_no}">삭제</a></span> -->
			    </div>
	        <hr/>

	        <img src="resources\ImgUpload\2020\01\24\8e30feb9-3bba-4998-8756-0171344b3981_test.PNG">

	        <c:if test="${file.fileType == true}">
	        	<c:forEach items="${fileList}" var="file">
	        		<img src="<c:url value='${file.uploadPath}\${file.uuid}_${file.fileName}'/>">
	        	</c:forEach>
	        </c:if>
	        <div class="contentDiv">${content.content}</div>
	        <hr>
	        
			<button class="listBtn" onclick="cancleListbtn(${paging.thisPage})">목록</button>
			
				<input type="hidden" value="${content.w_no}" readonly>
			  <!-- 페이지 정보 담은 form -->
			  <form id="list_page_form" method="get">
			  	<input type="hidden" name="thisPage" value="${paging.thisPage}" readonly>
			  	<input type="hidden" name="pageSize" value="${paging.pageSize}" readonly>
			  </form>
	    </div>
	</div>
</div>

<%@ include file="Footer.jsp"%>