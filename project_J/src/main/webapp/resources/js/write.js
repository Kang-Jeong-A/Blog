window.addEventListener("wheel", { passive: false });

$(function() {

  $("#contactForm input,#contactForm textarea").jqBootstrapValidation({
    preventSubmit: true,
    submitError: function($form, event, errors) {
      // additional error messages or events
    }});

  $("a[data-toggle=\"tab\"]").click(function(e) {
    e.preventDefault();
    $(this).tab("show");
  });
});

/* When clicking on Full hide fail/success boxes */
$('#name').focus(function() {
  $('#success').html('');
});



//페이지 정보 담긴 폼
var list_page_form = $("#list_page_form");

//글을 클릭하면 form에 담긴 페이지 정보를 함께 넘겨주고 글 상세로 이동 
$(".content a").on("click", function(event){
	event.preventDefault();
	
	list_page_form.append("<input type='text' name='w_no' value='" + $(this).attr("href")+ "'>");
	list_page_form.attr("action", "/blog/Content");
	list_page_form.submit();
});

//글쓰기 클릭
$(".wrtBtn").on("click", function(event){
	event.preventDefault();
	
	list_page_form.attr("action", "/blog/Write");
	list_page_form.submit();
});

//수정버튼 클릭  
$(".modifyBtn").on("click", function(event){
	event.preventDefault();

	//list_page_form.append("<input type='text' name='w_no' value='" + $(this).attr("href")+ "'>");
	list_page_form.attr("action", "/blog/Modify");
	list_page_form.submit();
});

//삭제버튼 클릭
$(".deleteBtn").on("click", function(event){
	event.preventDefault();
	
	if(confirm("삭제하시겠습니까?")){
		//list_page_form.append("<input type='text' name='w_no' value='" + $(this).attr("href")+ "'>");
		list_page_form.attr("method", "post");
		list_page_form.attr("action", "/blog/Delete");
		list_page_form.submit();
	};
});

//글쓰기, 수정 취소 버튼과 목록버튼 클릭하면 보던 페이지 목록으로
function cancleListbtn(int){
	location.href="BlogMain?thisPage=" +int ;
};



/* file */
$(document).ready(function(e){
	var formObj=$("form[role='form']");
		
	//var regex=new RegExp("(.*?)\.(jpg|jpeg|png|bmp|gif)$");
	var maxSize=10485760;    //10MB
		
		function checkExtension(fileName,fileSize){
			/*if(!(regex.test(fileName))){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}*/
			if(fileSize>=maxSize){
				alert("파일 사이즈는 10MB를 초과할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		/*var uploadResult=$(".uploadResult ul");
		function showUploadResult(uploadResultArr){
			var str="";
			
			$(uploadResultArr).each(function(i, obj){
				str+="<li>"+obj.fileName+"</li>";
			});
			uploadResult.append(str);
		}*/

});