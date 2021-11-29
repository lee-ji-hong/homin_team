<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<button onclick="cancelPay()">환불하기</button>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"></script><!-- jQuery CDN --->
<script>
  function cancelPay() {
    jQuery.ajax({
      "url": "${root}cancle", // 예: http://www.myservice.com/payments/cancel
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "imp_uid": "{imp_166086036421}", // 예: ORD20180131-0000011
      }),
      "dataType": "json"
    });
  }
</script>