<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Roupang</title>
<style type="text/css">
.info_th{
   width: 150px;
}
.date_form{
   width: 150px;
   border-radius: 7px;
   border:solid 1px #dee2e6;
}
.insert_input{
   width: 400px;
}
.td_none{
   border: none;
}
</style>
<script>

</script>
</head>
<body>
   <div class="container">
      <div class="row" id="row">
         <a href="./ticketView">상품(티켓)보기</a>
            <div class="col-1 mt-2 ms-3" style="width: 110px;">
               <select class="form-select" style="width: 100px;"
                  name="top_category" id="category1" onchange="setSelectBox(this)">
                  <option value="">분류</option>
                  <c:forEach items="${cate }" var="top" varStatus="loop">
                     <option value="${top.idx }">${top.title }</option>
                  </c:forEach>
               </select>
            </div>
            <div class="col-1 mt-2" style="width: 110px;">
               <select class="form-select" style="width: 100px;"
                  name="mid_category" id="category2" onchange="setSelectBox(this)" disabled>
                  <option value="">분류</option>
               </select>
            </div>
         
         <form method="POST" id=""form_product"" class="mt-3">
            <div class="col-12" id="simple_list">
               <table class="table" style="border:1px;">
                     <colgroup>
                        <col width="11%" />
                        <col width="40%" />
                        <col width="40%" />
                     </colgroup>
                     <thead>
                        <tr>
                           <th> 선택 </th>
                           <th> 이미지 </th>
                           <th> 상품명 </th>
                        </tr>
                     </thead>
                     <tbody id="product_list" style="border:none"></tbody>
                  </table>
                  <button class="btn btn-primary" type="button" value="all" onclick="btnclick(this)">상품추가</button>
                  <button class="btn btn-primary" type="button" value="edit" onclick="btnclick(this)">상품수정</button>
                  <button class="btn btn-primary" type="submit" id="delete_all" onclick="btnclick(this)">상품삭제</button>
            </div>
            <div class="product_intro col-12" style="display:none;"></div>
         </form>
         <form method="POST" id="form" enctype="multipart/form-data">
            
            <input type="text" class="form-control ms-3 mb-3" style="width: 200px;"
               id="company_name" name="company_name" value="함덕제주비치호텔"/>
            <div class="col-12 ms-3" id="detail_list" style="width:100%; display:none; padding: 0px;">
               <table style="border:1px;">
                  <colgroup>
                     <col width="15%" />
                     <col width="*%" />
                     <col width="20%" />
                     <col width="15%" />
                  </colgroup>
                  <thead>
                     <tr>
                        <th>선택</th>
                        <th>상품상세명</th>
                        <th>요금</th>
                        <th>할인율</th>
                     </tr>
                  </thead>
                  <tbody id="product_info_list">
                  </tbody>
               </table>
               <button class="btn btn-primary mt-2" type="button" value="info" onclick="btnclick(this)">상품상세추가</button>
               <button class="btn btn-primary mt-2" type="submit" id="info_delete" onclick="btnclick(this)">상품삭제</button>
            </div>
         
            <div class="col-5" id="product_info" style="display:none;">
               <table class="table" id="briefinfo">
               </table>
            </div>
            <div class="col-5" id="product_info_detail" style="display:none; margin: 0px">
               <table id="detailinfo">
               </table>
               <button class="btn-primary" type="submit" id="submit">등록하기</button>
               <button class="btn-primary" type="reset">다시작성</button>
            </div>
         </form>
      </div>
   </div>
</body>
</html>