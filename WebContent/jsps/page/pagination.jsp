<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/mantou/jsps/css/mantou.css" type="text/css" rel="stylesheet" />

<c:choose>
			<c:when test="${currentPage.getTotalPages() < 15 }">
				<c:set var="begin" value="1" />
				<c:set var="end" value="${currentPage.getTotalPages() }" />
			</c:when>
			<c:otherwise>
				<c:set var="begin" value="${currentPage.pageCode - 7 }" />
				<c:set var="end" value="${currentPage.pageCode + 7 }" />
				<c:if test="${begin < 1 }">
					<c:set var="begin" value="1" />
					<c:set var="end" value="15" />
				</c:if>
				<c:if test="${end > currentPage.getTotalPages() }">
					<c:set var="begin" value="${currentPage.getTotalPages()-14 }" />
					<c:set var="end" value="${currentPage.getTotalPages()}" />
				</c:if>
			</c:otherwise>
		</c:choose>


		<div id="m_page">
			<ul>
				<li class="m_page_code"><a 
					href="${currentPage.url }&pageCode=1">首页</a></li>
				<c:forEach begin="${begin }" end="${end }" var="i">
					<c:choose>
						<c:when test="${i eq currentPage.pageCode }">
							<li class="m_page_code"><span>${i }</span></li>
						</c:when>
						<c:otherwise>
							<li class="m_page_code"><a
								href="${currentPage.url }&pageCode=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage.pageCode < currentPage.getTotalPages() }">
					<li class="m_page_code"><a
						href="${currentPage.url }&pageCode=${ currentPage.pageCode+1}">下一页</a></li>
				</c:if>
				
				<li class="m_page_jump"><span>本版共 ${currentPage.getTotalPages()} 页 &nbsp; 到 第</span>
				<input type="text"
					id="gotoPageCode" value="${currentPage.pageCode}" /><span>页</span><a
					href="javascript:jump();">确定</a>
					</li>
			</ul>
			<%-- <div class="m_page_jump">
				本版共 ${currentPage.getTotalPages()} 页 &nbsp; 到 第<input type="text"
					id="gotoPageCode" value="${currentPage.pageCode}" />页 <a
					href="javascript:jump();">确定</a>
					<a name="anchor_bottom"> </a>
			</div> --%>
			
		</div>
		
		