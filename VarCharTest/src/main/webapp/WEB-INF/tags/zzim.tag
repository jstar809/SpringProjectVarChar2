<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
 <!-- 찜 목록 -->
      <div class="cartOpenner"><strong>Cart</strong></div>
      <div class="cartContainer">
<c:choose>
   <c:when test="${userId!=null}">
        <h2 class="cartTitle">${userId} 님</h2>
       </c:when>
       <c:otherwise>
			<h2 class="cartTitle">Cart</h2>
       </c:otherwise>
</c:choose>
<!-- ------------------------------------------------------------------------ -->
          <hr />
<!-- 여기서 부터 장바구니 리스트 -->
        <div class="scrollAttach">
        
          <c:forEach var="c" items="${sdatas}">
          <!-- 상담 예약이면 0으로변환 -->
          <c:choose>
             <c:when test="${c.cprice!=2147483647}">
                <c:set var="total" value="${total + c.cprice}"/>
             </c:when>
             <c:otherwise>
                <c:set var="total" value="${total + 0}"/>
             </c:otherwise>
          </c:choose>
         
         
             <div class="cartItem">
            <div class="itemPhoto" style="background: url('${c.cimg}') no-repeat center center; background-size:contain;"></div>
            <div class="itemInfo">
              <a href="detail.do?cnum=${c.cnum}" class="itemTitle">${c.ctitle}</a>
               
              <span>연식 : ${c.cyear}</span>
              <span>연료 : ${c.cfuel}</span>
              <span>주행거리 : ${c.ckm}km</span>
              <span>지역 : ${c.ccity}</span>
              <span>가격 : 
              <c:choose>
                 <c:when test="${c.cprice==2147483647}">
                    상담예약
                 </c:when>
                 <c:otherwise>
                 ${c.cprice}만원
                 </c:otherwise>
              </c:choose>
              </span>
              <a href="storeR.do?cnum=${c.cnum}" class="deleteItem">[삭제]</a> 
            </div>
          </div>
          <hr />
          </c:forEach>
         <!-- 상품 리스트 끝============================ -->
         
         
            <div class="cartBottom">
          <div class="totalPrice">
            <span>총 상품 금액</span>
            <strong>${total}만원</strong>
          </div>
          <div class="cartBtn">
            <c:if test="${userId != null}">
               <c:if test="${loginType==null}">
               <button class="cartMypageBtn" onclick="location.href='mypage.do';">
                  My Page
               </button>
               </c:if>
            </c:if>
            <c:if test="${userId == null}">
            <div class="nonLoginCartBtns">
               <button class="cartLoginBtn" onclick="location.href='login.jsp';">
                  Login
               </button>
               <button class="cartSignupBtn" onclick="location.href='signup.jsp';">
                  Sign up
               </button>   
            </div>   
            </c:if>
            <button class="cartCloser">Close Cart</button>
            </div>
           </div>
          
          
        </div>
        <!-- 
      <div class="cartBtn">
      
      <button class="cartCloser">Close Cart</button>
         </div>
         -->
   
      </div>