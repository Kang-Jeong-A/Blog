<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link href="resources/css/Blog.css" rel="stylesheet">

<!-- 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 -->
<%@ include file="BlogHeader.jsp"%>


            <section id="bloghome" class="bloghome">
                <div class="blogoverlay"></div>
                <div class="blogcontainer">
                    <div class="row">
                        <div class="main_home text-center">
                            <div class="col-md-12">
                                <div class="hello">
                                    <div class="slid_item">
                                        <div class="home_text ">
                                            <h2 id="BlogName"><a href="" class="text-yellow">${blogVO.account}님의 블로그</a></h2>
                                        </div>
                                    </div><!-- End off slid item -->

                                </div>
                            </div>

                        </div>

                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->
        
	  <div class="container">
        <div class="blogmenu">
        	<a class="blogBt" href="BlogSetting">블로그 관리</a>
        	<a class="blogBt wrtBtn" href="#">글쓰기</a>
        </div>
      </div>

<!-- 글 목록 -->        
<div class="container">
	<div class="row">
        <div class="col-md-12 content">     
		
		<c:forEach items="${list}" var="blogList" begin="${paging.startNum}" end="${paging.endNum}">
			<%-- 사진 있으면 썸네일 출력 --%>
			<c:if test="${fileList.filType == true}">
				<img src="">
			</c:if>
			
			<h3>${blogList.w_no}번 | <a href="${blogList.w_no}" class="contentLink">${blogList.title}</a></h3>

			<c:set var="contentPre" value="${fn:substring(blogList.content, 0, 99)}"></c:set> <%-- content 100자까지만 불러오기--%>
 			<c:choose>
				<c:when test="${fn:contains(blogList.content, '<br>')}"> <%-- contentPre에 <br> 포함되어 있으면 그전까지 출력 --%>
					<p>${fn:substringBefore(contentPre, '<br>')}</p>
		        </c:when>
		        <c:otherwise>
		        	<p>${contentPre}</p>
		        </c:otherwise>
	        </c:choose>  
	        <hr/>
        </c:forEach>
        
        </div>
	</div>
</div>


  <!-- 페이지단 -->
  <ul class="list_pagination">
	    <li class="page-item ${paging.prePage < 1 ? 'disabled' : ''}">
	    	<a class="page-link" href="BlogMain?thisPage=${paging.prePage}">이전</a>
	    </li>
	
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
	    <li class="page-item ${paging.thisPage == page ? 'active' : ''}">
	    	<a class="page-link" href="BlogMain?thisPage=${page}"> ${page}</a>
	    </li>
	</c:forEach>
	
	    <li class="page-item ${paging.nextPage > paging.pageCount ? 'disabled' : ''}">
	    	<a class="page-link" href="BlogMain?thisPage=${paging.nextPage}">다음</a>
	    </li>
  </ul>
  
  <form id="list_page_form" method="get">
  	<input type="hidden" name="thisPage" value="${paging.thisPage}" readonly>
  	<input type="hidden" name="pageSize" value="${paging.pageSize}" readonly>
  </form>

<%@ include file="Footer.jsp"%>