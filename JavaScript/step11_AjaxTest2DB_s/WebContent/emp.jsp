<%@ page contentType="text/html"%>
<%@ page import="java.sql.*, util.DBUtil" %>

<%!
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "SELECT empno,ename,job,sal,hiredate,deptno FROM emp WHERE job=?";
%>
<table border="1" style="border-collapse:separate border-spacing:0px" bordercolor="black" width="100%">
<%
    String str = request.getParameter("str");
	try{
        con = DBUtil.getConnection();
        pstmt = con.prepareStatement(sql);  
        pstmt.setString(1, str);
        rs = pstmt.executeQuery();    
        while(rs.next()){
%>
        <tr align="center">
            <td width="10%"><%=rs.getString("empno")%></td>
            <td width="15%"><%=rs.getString("ename")%></td>
            <td width="20%"><%=rs.getString("job")%></td>
            <td width="15%"><%=rs.getString("sal")%></td>
            <td width="20%"><%=rs.getString("hiredate").substring(0,10)%></td>
            <td width="20%"><%=rs.getString("deptno")%></td>
        </tr>
<%
        }//end while
    }catch(Exception e){
        e.printStackTrace();
    }finally{
        DBUtil.close(con, pstmt, rs);
    }
%>
</table>