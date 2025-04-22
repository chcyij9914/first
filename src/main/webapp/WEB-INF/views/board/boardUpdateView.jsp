<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
    <c:set var="currentPage" value="${ requestScope.currentPage }"/>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>first</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h1 align="center">${ board.boardNum } 번 게시글 수정(원글, 댓글, 대댓글) 페이지</h1>
<br>

<%-- 원글 수정 폼 : 첨부파일 수정 기능 포함 --%>
<c:if test="${ board.boardLev eq 1 }">
<h1 align="center">${ board.boardNum } 번 게시글 수정(원글) 페이지</h1>
<!-- form에서 파일이 첨부되어서 전송될 경우에는 반드시 enctype="multipart.form-data" 속성을 추가해야 함
		전송방식은 post로 지정함
 -->
<form action="boriginupdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="boardNum" value="${ board.boardNum }">
	<input type="hidden" name="boardOriginalFileName" value="${ boardOriginalFileName }">
	<input type="hidden" name="boardRenameFileName" value="${ boardRenameFileName }">
	 <input type="hidden" name="page" value="${ currentPage }">

<table align="center" width="700" border="1" cellspacing="0" cellpadding="5">
	<tr><th width="120">제 목</th>
				<td><input type="text" name="boardTitle" size="70" value="${board.boardTitle }"></td></tr>
	<tr><th>작성자</th>
				<td><input type="text" name="boardWriter" readonly value="${ board.boardWriter }"></td></tr>
	<tr><th>첨부파일</th>
	<td>
			<c:if test="${ !empty board.boardOriginalFileName }">
					${ board.boardOriginalFileName } &nbsp; 
					<input rtpe="checkbox" name="deleteFlag" value="yes"> 파일 삭제 <br>
					변경 : <input type="file" name="ofile"> 
			</c:if>
			<c:if test="${ empty board.boardOriginalFileName }">
					첨부파일 없음 <br>
					추가 : <input type="file" name="ofile">
			</c:if>
			<input type="file" name="ofile">
			<%-- name 속성의 이름은 property명과 다르게 지정함 
					파일 업로드 실패시 파일명만 문자열로 command 객체에 저장되지않게 하기 위함
			--%>
	</td></tr>
	<tr><th>내 용</th>
			<td><textarea name="boardContent" rows="5" cols="70">${ board.boardContent }</textarea></td></tr>
	<tr><th colspan="2">
		<input type="submit" value="수정하기"> &nbsp;
		<input type="reset" value="수정취소"> &nbsp;
		<input type="button" value="이전 페이지로 이동" onclick="history.go(-1); return false;"> &nbsp;
		<input type="button" value="목록" onclick="location.href='blist.do?page=${ currentPage }'; return false;"> &nbsp;
	</th></tr>
</table>
</form>
</c:if>

<%-- 댓글/대댓글 폼 : 첨부파일 수정 기능 없음 --%>
<c:if test="${ board.boardLev gt 1 }"> <%-- gt (greater than) :  > 연산자임 --%>
<h1 align="center">${ board.boardNum } 번 게시글 수정(댓글, 대댓글) 페이지</h1>
<br>
<form action="breplyupdate.do" method="post" >
	 <input type="hidden" name="boardNum" value="${ board.boardNum }">
	 <input type="hidden" name="page" value="${ currentPage }">
	 
<table align="center" width="700" border="1" cellspacing="0" cellpadding="5">
	<tr><th width="120">제 목</th>
				<td><input type="text" name="boardTitle" size="70" value="${board.boardTitle }"></td></tr>
	<tr><th>작성자</th>
				<td><input type="text" name="boardWriter" readonly value="${ board.boardWriter }"></td></tr>
	<tr><th>내 용</th>
			<td><textarea name="boardContent" rows="5" cols="70">${ board.boardContent }</textarea></td></tr>
	<tr><th colspan="2">
		<input type="submit" value="수정하기"> &nbsp;
		<input type="reset" value="수정취소"> &nbsp;
		<input type="button" value="이전 페이지로 이동" onclick="history.go(-1); return false;"> &nbsp;
		<input type="button" value="목록" onclick="location.href='blist.do?page=${ currentPage }'; return false;"> &nbsp;
	</th></tr>
</table>
</form>
</c:if>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>