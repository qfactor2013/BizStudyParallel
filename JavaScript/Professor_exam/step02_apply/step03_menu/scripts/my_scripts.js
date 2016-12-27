$(document).ready(function(){
 
	var v = false;    
	var $f,  $m;
	
	$("button#vegOn").click(function(){
 		if (v == false){
 		 	$f = $(".fish").parent().parent().remove();	
			$(".meat").after("<li class='tofu'>두부</li>");
			$m = $(".meat").remove();
			$(".tofu").parent().parent().addClass("veg_leaf");
			v = true;
		}// end if
	});//end veg button


	//??? 메뉴 초기화 구성 함수
	/* 나뭇잎 이미지 제거 및 tofu[두부] 삭제
	*/
	$("button#restoreMe").click(function(){});
});
