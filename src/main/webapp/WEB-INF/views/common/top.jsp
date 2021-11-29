<%@ page contentType="text/html; charset=UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<meta
  name="viewport"
  content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no"
/>
<c:url var="root" value="/" />
<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/board2.css"
/>
<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/board.css"
/>
<link
  rel="stylesheet"
  type="text/css"
  href="${pageContext.request.contextPath}/resources/css/reset.css"
/>

<script>
  function loginForm() {
    alert("먼저 로그인해주세요");
    location.href = "${root}index?formpath=login";
  }
</script>
<div id="wrap" style="width: 1200px">
  <section class="info_section">
    <div>
      <ul class="info_list">
        <c:choose>
          <c:when test="${empty sessionScope.id }">
            <li>
              <a href="${root}index?formpath=login "> 로그인 </a>
            </li>
            <li>|</li>
            <li>
              <a href="${root}index?formpath=servicecenter&list=faq"
                >고객센터</a
              >
            </li>
            <li>|</li>
          </c:when>
          <c:otherwise>
            <li>
              <a href="${root}logout ">로그아웃</a>
            </li>
            <li>|</li>
            <li>
              <a href="${root}index?formpath=servicecenter&list=faq"
                >고객센터</a
              >
            </li>
            <li>|</li>
            <li>
              <a href="${root }index?formpath=mypage"
                >${sessionScope.nickname }님
                <img
                  src="${pageContext.request.contextPath}/resources/image/account_circle.png"
                />
              </a>
            </li>
            <li>
              <a href="">
                <img
                  src="${pageContext.request.contextPath}/resources/image/cart2.png"
                />
              </a>
            </li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
    <div>
      <ul class="info_list">
        <li>
          <a href="">
            <img
              src="${pageContext.request.contextPath}/resources/image/search2.png"
            />
          </a>
        </li>
      </ul>
    </div>
  </section>

  <header class="header">
    <h1 class="logo">
      <a href="${root}index?formpath=home ">
        <img
          src="${pageContext.request.contextPath}/resources/image/logo2.png"
          style="height: 100px"
        />
      </a>
    </h1>

    <nav class="nav" style="display: none">
      <ul class="gnb">
        <li>
          <a href="index.html">인테리어</a
          ><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span>
        </li>
        <li>
          <a href="introudce.html">렌탈/케어</a
          ><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span>
        </li>
        <li>
          <a href="gallery.html">생활용품</a
          ><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span>
        </li>
        <li>
          <a href="board.html">문의사항</a
          ><span class="sub_menu_toggle_btn">하위 메뉴 토글 버튼</span>
        </li>
      </ul>
    </nav>
    <span class="menu_toggle_btn">전체 메뉴 토글 버튼</span>
  </header>
</div>
