<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="guestbook.model.GuestBookBean" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- null, length üũ�� ���� jstl function ��� -->
<%--
 	GuestBookBean [] list=(GuestBookBean[])request.getAttribute("list");
 --%>
<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
	<tr>
        <td bgcolor="#336699">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">�� ȣ</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">�� ��</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">�� �� ��</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">�� �� ��</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">�� ȸ ��</span></b></font></p>
        </td>
    </tr>
<%--
	if(list==null || list.length==0){
--%>
	<c:choose>
<%-- 		<c:when test="${requestScope.list == null || fn:length(requestScope.list) == 0 }"> --%>
		<%-- DB�� ���� �˻��� �����Ͱ� ArrayList�� ���� -> request����
    		������ ���� ������ ArrayList ���ο� GuestBookBean ��ü ���� ���� Ȯ�� �ڵ�
    		requestScop.list��  list ������ �ڵ�
    		empty list �ڵ� : list�� null�� ��� true��ȯ --%>

			<c:when test="${empty list || fn:length(list) == 0 }" >
			<tr>
		        <td colspan="5">
		            <p align="center"><b><span style="font-size:9pt;">��ϵ� ������ �����ϴ�.</span></b></p>
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
		<!--  ArrayList�� GuestBookBean ��ü�� �ϳ��ϳ� data ��� ������ �ݺ� �����ؼ� ��� -->
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
<span style="font-size:9pt;">&lt;<a href="write.html">�۾���</a>&gt;</span></div>

