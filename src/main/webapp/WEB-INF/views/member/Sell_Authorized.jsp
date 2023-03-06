<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8"/>
        
        
        
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <title>쿠팡입점</title>

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
    <form action="Sell_AuthorizedAction.do" name="data" method="post">
    
        <table width="1000px">
        	<tr>
                <td>
                    <label for="member_info">멤버정보
                </td>
                <td>
                    <h5>이메일 : ${email } </h5>
                    <h5>이름 : ${name } </h5>
                    <h5>idx : ${member_idx } </h5>
                    <input type="hidden" name="member_idx" value="${member_idx }"/>
                </td>
            </tr>
            <tr>
            <tr>
                <td>
                    <label for="buisness_num">사업자등록번호
                </td>
                <td>
                    <input type="text" name="buisness_num" id="buisness_num" size="20px" placeholder="'-'없이 입력"> 
                </td>
            </tr>
            <tr>
                <td>
                    <label for="one_rep_co_rep">대표구성
                </td>
                <td>
                    <input type="radio" name="one_rep_co_rep" value="1인대표">1인대표
                    <input type="radio" name="one_rep_co_rep" value="공동대표">공동대표
                    <div id='result'></div>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="rep_name">대표자 명
                </td>
                <td>
                    <input type="text" name="rep_name" id="rep_name" size="20px" placeholder="대표자명"> 
                </td>
            </tr>
            <tr>
                <td>
                    <label for="company_name">상호 
                </td>
                <td>
                    <input type="text" name="company_name" id="company_name" size="20px" placeholder="상호">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="office_zipcode">사업장 우편번호 
                </td>
                <td>
                	
                    <input type="text" class="office_zipcode" name="office_zipcode" size="10" placeholder="우편번호">
                    
                </td>
            </tr>
            <tr>
                <td>
                	<input type="hidden" name="office_address" value=""/>
                    
                </td>
                
                <td>
                    <input type="text" name="office_address1" size="60" placeholder="기본주소"> 
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    <input type="text" name="office_address2" size="60" placeholder="상세주소">   
                </td>
            </tr>
            <tr>
                <td>
                    <label for="ebuis_report_num">통신판매업신고번호 
                </td>
                <td>
                    <input type="text" name="ebuis_report_num" id="ebuis_report_num" size="20px" placeholder="통신판매업신고번호">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="shop_manager_name">입점 담당자 명  
                </td>
                <td>
                    <input type="text" name="shop_manager_name" id="shop_manager_name" size="20px">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="bank_account">정산계좌 
                </td>
                <td>
                    <div>
	                    <select id="whichBank" name="whichBank">
	                        <option value="" ></option>
	                        <option value="국민은행">국민은행</option>
	                        <option value="국민은행">신한은행</option>
	                        <option value="국민은행">하나은행</option>
	                    </select>
                    </div>
                    <div id="output"></div>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    
                   <input type="text" name="accountHolder" id="accountHolder" placeholder="예금주" size="10px">
                   <input type="text" name="bank_account" id="bank_account" size="20px" placeholder="'-'없이 계좌번호 입력">
                   
                   
                </td>
            </tr>
            
        </table>
        <input type="button" id="goback" value="뒤로가기">

        <input type="submit" id="submit" value="제출하기">
    </form>
</body>
</html>
