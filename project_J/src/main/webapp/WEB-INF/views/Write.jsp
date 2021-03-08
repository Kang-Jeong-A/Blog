<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<%@ include file="BlogHeader.jsp"%>

<style>
	.uploadList{
		width: 600px;
		height: 70px;
		background-color: lightgray;
		margin-top: 20px;
	}
</style>
  
<section id="contact">
    <div class="container">
      <h2 class="text-center text-uppercase text-secondary mb-0">글쓰기</h2>
      <hr class="star-dark mb-5">
      <div class="row">
        <div class="writeContainer">
          <form name="sentMessage" id="contactForm" novalidate="novalidate" action="Write" method="post" enctype="multipart/form-data">
          	<input type="hidden" name="account" value="">
          	<input type="text" name="thisPage" value="${paging.thisPage}" readonly>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>제목</label>
                <input class="form-control" name="title" id="title" type="text" placeholder="제목" required="required" data-validation-required-message="제목을 입력해주세요.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>내용</label>
                <textarea class="form-control" name="content" id="content" rows="10" placeholder="내용" required="required" data-validation-required-message="내용을 입력해주세요."></textarea>
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <br>
            <div class="uploadDiv">
            	<input type="file" name="uploadFile" accept=".jpg, .jpeg, .png, .bmp, .gif" multiple>
            	<div class="uploadList"></div>
            </div>
            
            <div class="uploadResult">
            	<ul>
            	
            	</ul>
            </div>
            <br>
            <br>
            <br>
            
            <!-- <div id="success"></div> -->
            <div class="form-group btnDiv">
              <button type="submit" class="writebtn">등록</button>
              <button type="button" class="writebtn" onclick="cancleListbtn(${paging.thisPage})">취소</button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          </form>
       </div>
      </div>
    </div>
  </section>

<script>

$(document).ready(function(e){
	var formObj=$("form[role='form']");
//첨부파일 등록과 초기화
var cloneObj=$(".uploadDiv").clone();
$("input[type='file']").change(function(e){
	var formData=new FormData();
	var inputFile=$("input[name='uploadFile']");
	var files=inputFile[0].files;
	console.log(files);
	
	for(var i=0; i<files.length; i++){
		if(!checkExtension(files[i].name, files[i].size)){
			return false;
		}
		formData.append("uploadFile", files[i]);
	}
	
$.ajax({
	url: '/Write',
	processData: false,
	contentType: false,
	data: formData,
		type: 'POST',
		dataType: 'json',
		success: function(result){
			console.log(result);
			showUploadResult(result); //글쓰기 화면에서 미리보기
			$(".uploadDiv").html(cloneObj.html());
		}
});  //ajax
});

//글쓰기 화면에서 미리보기
function showUploadResult(uploadResultArr){
	if(!uploadResultArr || uploadResultArr.length==0){
		return;
	}
var uploadUL=$(".uploadResult ul");
var str="";

$(uploadResultArr).each(function(i, obj){
	//image type
		var fileCallPath=encodeURIComponent(obj.uploadPath+"/thumb_"+obj.uuid+"_"+obj.fileName)
		str += "<li><div>";
		str += "<span>"+obj.fileName+"</span>";
		str += "<button type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
		str += "<img src='/display?fileName="+fileCallPath+"'>";
		str += "</div></li>";
});

	uploadResult.append(str);
}
});
</script>

  <%@ include file="Footer.jsp"%>