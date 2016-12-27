$(document).ready(function(){
 
	var v = false;   
	var $f,  $m; //$ 표기하는 권장 변수 : 문서의 구조 일부를 보유하고 있는 변수 선언 시
	
	$("button#vegOn").click(function(){
 		if (v == false){
 		 	$f = $(".fish").parent().parent().remove();	//삭제하면서 해당 값 변수에 저장
			$(".meat").after("<li class='tofu'>두부</li>");
			$m = $(".meat").remove();
			$(".tofu").parent().parent().addClass("veg_leaf");
			v = true;
		}// end if
	});//end veg button


	//??? 메뉴 초기화 구성 함수
	/* 나뭇잎 이미지 제거 및 tofu[두부] 삭제
	*/
	$("button#restoreMe").click(function(){
		if (v){
		$(".menu_entrees li").first().before($f);
		$(".tofu").parent().parent().removeClass("veg_leaf");
		/*
		 *  .tofu, $m도 하나 이상을 가지고 있음
		 *  each는 제이쿼리의 foreach문
		 *  그러니까 .tofu 랑 $m 이랑 같은 인덱스에 같을 넣어주기 위해 필요
		 *  each 파라미터로 반복증가값 index와 element(.tofu 지만 this로 사용하면 되므로 인자값불필요)
		 *  즉 파라미터로 1개만 있으면 된다.
		 */
		$(".tofu").each(function(i) {
			$(this).after($m[i]);
		});
		$(".tofu").remove();
		v = false;
		}
	});
});
