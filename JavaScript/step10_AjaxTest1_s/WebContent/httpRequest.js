
var httpRequest = null;
function getXMLHttpRequest() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e1) { return null; }
		}
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}
}

// Ajax 비동기 정통 코드
function sendRequest(url, params, callback, method) {
	//요청객체 생성 및 변수에 대입
	httpRequest = getXMLHttpRequest();
	//get이라는 단어를 대입
	var httpMethod = method;
	//만약 get 그리고 post 둘다 아니라면 get으로 초기화
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}

	//params가 null or 길이가 0인 데이터라면 null 로 대입
	//params가 null이 아니거나 길이가 0이 아니라면 둘 중 하나만 false인 경우 params를 대입
	//httpParams 변수에 쿼리 스트링 대입
	var httpParams = (params == null || params == '') ? null : params;

	// books.jsp 값은 httpUrl에 대입
	var httpUrl = url;

	/*
		get방식? post방식? 이냐에 따라서 open 함수와 send()함수의 parameter가 다름
		get : open함수 url에 웹쿼리스트링 조합/ send(null)
		post : open함수 url 요청하는 server 프로그램명만 send(webquery)
	*/
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}

	//open("GET", "books.jsp", true);
	httpRequest.open(httpMethod, httpUrl, true);

	//post 방식인 경우 필수 설정
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	//정상 응답 완료시 콜백함수 실행
	httpRequest.onreadystatechange = callback;
//web query이 없을 경우 null값 반영
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);
}
