<%@ page info="�Խ��� �����ϱ�" contentType="text/html;charset=euc-kr" %>
<!--<jsp:useBean id="resultContent" class="guestbook.model.GuestBookBean" scope="request" /><!-->
<HTML>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>

<BODY>

<form name=updateForm method=post action="guestbook.do" onSubmit='return checkValid()'>
    <input type="hidden" value="update" name="command">
    <input type='hidden' name='num' value="<%--=resultContent.getNum()--%>${requestScope.resultContent.num }">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#336699">
            <p align="center"><font color="white" size="3"><b>
            <%--= resultContent.getNum()--%>${requestScope.resultContent.num }�� �Խù� �����ϱ�</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">�ۼ���</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="author" size="30"
		 value="<%--=resultContent.getAuthor()--%>${requestScope.resultContent.author }"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">���ڸ���</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<input type=text name="email" size="30"
		 value="<%--resultContent.getEmail()--%>${requestScope.resultContent.email }"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">�� ��</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="title" size="50"
		 value="<%--=resultContent.getTitle()--%>${requestScope.resultContent.title }"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">�� ��</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="content" cols="50" rows="10"><%--=resultContent.getContent()--%>
		${requestScope.resultContent.content }
		</textarea></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">��й�ȣ</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;"><input type=password name="password" size="12"> 
            (��й�ȣ�� �¾ƾ� ������ �����մϴ�.)</span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">&nbsp;</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type="submit" value="�����ϱ�"> <input type="reset" value="�ٽþ���"></span></b></td>
    </tr>
</table>
</form>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="guestbook.do">����Ʈ�� ���ư���</a>&gt;</span></div>


</BODY>
</HTML>