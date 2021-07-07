<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h1>매칭 내역 관리</h1>
	<input type="button" value="로그아웃" onclick="location.href='/logout'">
	<hr>
	<input type="button" value="프로필 관리" onclick="location.href='/profile/main'">
	<input type="button" value="매칭 내역 관리" onclick="location.href='/match/matlist'">
	<input type="button" value="일정 관리" onclick="location.href='/mypage/calendar'">
	<div id="b_match">
		<h2>매칭 작성 내역</h2>
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>진행상태</th>
					<th>신청현황</th>
					<th>취소</th>
				</tr>
			</thead>
			<c:forEach items="${bmatlist}" var="blist">
				<tr>
					<td>${blist.b_num}</td>
					<td><c:out value="${blist.b_subject}" /></td>
					<td>${blist.b_state}</td>
					<td>
					<button onclick="window.open('match?b_num=${blist.b_num}', '신청 현황', 'width=430, height=500, location=no, status=no, scrollbars=yes');">신청 현황</button>
					</td>
					<td>취소버튼</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${pageMaker.prev}">
			<a href="/profile/matlist?pageNum=${pageMaker.startPage - 1}&amount=10">◀</a>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
                	<a href="/profile/matlist?pageNum=${num}&amount=10">${num}</a>
                </c:forEach>
		<c:if test="${pageMaker.next}">
			<a href="/profile/matlist?pageNum=${pageMaker.endPage + 1}&amount=10">▶</a>
		</c:if>

	</div>
	<hr>
	<div id="match">
	<h2>매칭 신청 내역</h2>
		<table>
			<thead>
				<tr>
					<th>매칭번호</th>
					<th>제목</th>
					<th>진행상태</th>
					<th>취소</th>
					<th>리뷰</th>
				</tr>
			</thead>
			<c:forEach items="${matlist}" var="mlist">
				<tr>
					<td>${mlist.matchVO.mat_num }</td>
					<td>${mlist.b_subject}</td>
					<td>${mlist.matchVO.mat_state }</td>
					<td>취소버튼</td>
					<td>
					<c:if test="${mlist.matchVO.mat_state eq 'C' }">
						<c:choose>
							<c:when test="${mlist.reviewVO.r_contents ne null}">
								<form method="get" action="/review/update">
									<input type="hidden" name="r_contents" value="${mlist.reviewVO.r_contents}">
									<input type="hidden" name="mat_num" value="${mlist.matchVO.mat_num}">
									<input type="hidden" name="r_w_m_id" value="${mlist.m_id}">
									<input type="hidden" name="r_mat_m_id" value="${mlist.matchVO.m_id}">
									<input type="submit" value="리뷰 수정">
								</form>
							</c:when>
							<c:otherwise>
								<form method="post" action="/review/insert">
									<input type="hidden" name="mat_num" value="${mlist.matchVO.mat_num}">
									<input type="hidden" name="r_w_m_id" value="${mlist.m_id}">
									<input type="hidden" name="r_mat_m_id" value="${mlist.matchVO.m_id}">
									<input type="submit" value="리뷰 작성">
								</form>
							</c:otherwise>
						</c:choose>
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<%-- <c:if test="${pageMaker.prev}">
			<a href="/profile/matlist?pageNum=${pageMaker.startPage - 1}&amount=10">[이전]</a>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
                	[<a href="/profile/matlist?pageNum=${num}&amount=10">${num}</a>]
                </c:forEach>
		<c:if test="${pageMaker.next}">
			<a href="/profile/matlist?pageNum=${pageMaker.endPage + 1}&amount=10">[다음]</a>
		</c:if> --%>
	</div>
</body>
</html>