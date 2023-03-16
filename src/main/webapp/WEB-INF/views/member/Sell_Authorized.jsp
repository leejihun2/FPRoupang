<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta charSet="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <meta name="next-head-count" content="2" />
    <meta charSet="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="csrf-token" content="jogZeNtZ-fo2pNeObBtP3lGvZilgWPxm4M2g" />
    <meta charSet="utf-8" />
    <meta name="google-site-verification" content="zaNrGtrOLMjglkziY2IvmL8dOXyCWHGArDHqFazJQVI" />
    <meta http-equiv="x-dns-prefetch-control" content="on" />
    <title>루팡!</title>
    <!-- 쿠팡 타이틀 이미지 -->
    <link rel="shortcut icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon" />
    <!-- 쿠팡 css폴더에서 링크드 -->
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/common.css" type="text/css">
    <link rel="stylesheet" href="./css/ddp.css" type="text/css">
    <link rel="stylesheet" href="./css/list.css" type="text/css">
    <link rel="stylesheet" href="./css/productReview.css" type="text/css">
    <link rel="stylesheet" href="./css/side.css" type="text/css">
    <link rel="stylesheet" href="./css/main.css" type="text/css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     
       
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <title>쿠팡입점</title>
<style>
input{
	background-color: #e2e2e2;
	border: 2px;
}
</style>
    </head>
<body>
   	<script type="text/javascript">
   	function sub(){
   		document.form.submit();
   		address1=document.form.office_address1.value;
   		address2=document.form.office_address2.value;
   		address=address1+address2;
   		document.form.office_address.value=address;

   	}
   	
   	</script>
   	<body style="background-color: white;">
	<div id="top">
        <%@include file="../top.jsp" %>
    </div>
    <section id="contents" class="contents home">
	<div class="w3-content w3-container w3-margin-top" style="height: 900px;">
    <form action="Sell_AuthorizedAction.do" name="data" method="post">
		
			<div class="w3-center w3-large w3-margin-top">
				<h3 style="float:left"><b>판매자 정보입력</b></h3>
			</div>
    
        <table class="table" width="1000px">
            <tr>
                <td>
                    <label for="business_num">사업자등록번호
                </td>
                <td>
                    <input type="text" style="background-color: #e2e2e2;" name="business_num" id="business_num" size="20px" placeholder="'-'없이 입력"> 
                </td>
            </tr>
            <tr>
                <td>
                    <label for="one_rep_co_rep">대표구성
                </td>
                <td>
                    <input type="radio" style="background-color: #e2e2e2;" name="one_rep_co_rep" value="1인대표">1인대표
                    <input type="radio" style="background-color: #e2e2e2;" name="one_rep_co_rep" value="공동대표">공동대표
                    <div id='result'></div>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="rep_name">대표자 명
                </td>
                <td>
                    <input type="text" style="background-color: #e2e2e2;" name="rep_name" id="rep_name" size="20px" placeholder="대표자명"> 
                </td>
            </tr>
            <tr>
                <td>
                    <label for="company_name">상호 
                </td>
                <td>
                    <input type="text" style="background-color: #e2e2e2;" name="company_name" id="company_name" size="20px" placeholder="상호">
                </td>
            </tr>
            <tr>
                <td style="border-bottom: none;">
                    <label for="office_zipcode">사업장 우편번호
                </td>
                <td>
                	
                    <input type="text" style="background-color: #e2e2e2;" class="office_zipcode" name="office_zipcode" size="10" placeholder="우편번호">
                    
                </td>
            </tr>
            <tr>
                <td style="border-bottom: none;">
  
                </td>
                
                <td>
                    <input type="text" style="background-color: #e2e2e2;" name="office_address1" size="60" placeholder="기본주소"> 
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="text" style="background-color: #e2e2e2;" name="office_address2" size="60" placeholder="상세주소">   
                </td>
            </tr>
            <tr>
                <td>
                    통신판매업신고번호
                </td>
                <td>
                    <input type="text" style="background-color: #e2e2e2;" name="ebuis_report_num" id="ebuis_report_num" size="20px" placeholder="통신판매업신고번호">
                </td>
            </tr>
            <tr>
                <td>
                   입점 담당자 명  
                </td>
                <td>
                    <input type="text" style="background-color: #e2e2e2;" name="shop_manager_name" id="shop_manager_name" size="20px">
                </td>
            </tr>
            <tr>
                <td>
                    정산계좌 
                </td>
                <td>
                    <div>
	                    <select id="whichBank" name="whichBank">
	                        <option value="" ></option>
	                        <option value="국민은행">국민은행</option>
	                        <option value="신한은행">신한은행</option>
	                        <option value="하나은행">하나은행</option>
	                    </select>
                    </div>
                    <div id="output"></div>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    
                   <input type="text" style="border: 1px;" background-color: #e2e2e2;" name="accountHolder" id="accountHolder" placeholder="예금주" size="10px">
                   <input type="text" style="background-color: #e2e2e2;" name="bank_account" id="bank_account" size="20px" placeholder="'-'없이 계좌번호 입력">
                   
                   
                </td>
            </tr>
            
        </table>
        <button type="button" id="goback" class="btn btn-outline-secondary">뒤로가기</button>

        <button type="submit" id="submit" class="btn btn-outline-secondary">제출하기</button>
    </form>
    </div>
	<div id="cartnav">
         <%@include file="../cartnav.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
        </div>
	</section>
	<div id="copyright">
         <%@include file="../copyright.jsp" %>  <!-- 원하는 파일 경로를 삽입하면 된다 -->
    </div>
</body>
</html>
