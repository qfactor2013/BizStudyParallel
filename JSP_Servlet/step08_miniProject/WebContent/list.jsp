<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="guestbook.model.GuestBookBean" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
 	GuestBookBean [] list=(GuestBookBean[])request.getAttribute("list");
 --%>
<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
	<tr>
        <td bgcolor="#336699">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">번 호</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">제 목</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">작 성 자</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">작 성 일</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">조 회 수</span></b></font></p>
        </td>
    </tr>
<%--
	if(list==null || list.length==0){
--%>
	<c:choose><c:when test="${requestScope.list == null || fn:length(requestScope.list) == 0 }">
	<tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">등록된 방명록이 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
<%--
	}else{
		GuestBookBean gBookContent = null;
		for(int i = 0; i <list.length ; i++){
			 gBookContent = list[i];
--%>
		<c:otherwise>
			<c:forEach items="${requestScope.list }" var="data">
		    <tr>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            <%--=gBookContent.getNum()--%>${data.num }</span></p>
		        </td>
		        <td bgcolor="">
					<p><span style="font-size:9pt;">
					<a href="guestbook.do?command=read&num=<%--=gBookContent.getNum()--%>${data.num}">
					<%--=gBookContent.getTitle() --%>${data.title }</a></span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
						<a href="mailto:<%--= gBookContent.getEmail()--%>${data.email }">
						<%--=gBookContent.getAuthor()--%>${data.email }</a>
					</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            <%--= gBookContent.getWriteday()--%>${data.writeday }</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            <%--= gBookContent.getReadnum() --%>${data.readnum }</span></p>
		        </td>
		    </tr>
		    </c:forEach>
		<%--
			} 
				}
		--%>
		</c:otherwise>
 	</c:choose>
    <tr>
        <td bgcolor="">
            <p align="center"><span style="font-size:9pt;"></span></p>
        </td>
        <td bgcolor="">
			<p><span style="font-size:9pt;"><a href="ReadAContent.jsp?num= "></a></span></p>
        </td>
        <td bgcolor="">
            <p align="center"><span style="font-size:9pt;">
				<a href="mailto:"></a>
			</span></p>
        </td>
        <td bgcolor="">
            <p align="center"><span style="font-size:9pt;"></span></p>
        </td>
        <td bgcolor="">
            <p align="center"><span style="font-size:9pt;"></span></p>
        </td>
    </tr>

</table>
<hr>
<div align=right>
<span style="font-size:9pt;">&lt;<a href="write.html">글쓰기</a>&gt;</span></div>

