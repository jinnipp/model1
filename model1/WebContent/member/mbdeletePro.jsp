<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.*" %>
<%@ include file="../session/sessionChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Model1</title>
</head>
<body>
	<%
		String m_passwd = request.getParameter("m_passwd");
		MemberDao md = MemberDao.getInstance();
		int chk = md.passwdChk(m_no, m_passwd);
		if (chk == 1) {
			int result = md.delete(Integer.parseInt(m_no));
			if (result > 0) {
				session.invalidate();
	%>
	<script type="text/javascript">
		alert("탈퇴 완료");
		location.href = "../decorators/main.jsp";
	</script>
	<%
		}
		} else {
	%>
	<script type="text/javascript">
		alert("비밀번호를 확인해주세요.");
		history.go(-1);
	</script>
	<%
		}
	%>

</body>
</html>