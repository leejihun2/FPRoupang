<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6076fe794faf6e2a97f29c6ebfadce5&libraries=services"></script>
<style type="text/css">
.modal-dialog{
    overflow: hidden;
    position: fixed;
    top: 0;
    right: 0;
    width: 600px;
    height: 100%;
    margin-top: 0;
    margin-right: 0;
    padding: 0;
    border-left: 2px solid #000;
    background-color: #fff;
    min-height: 100%;
}
.modal-content{
    height: 100%;
}
.modal-body{
    max-height: calc(100vh - 150px);
    overflow-y: auto;
}
/* 바디에 스크롤 막는 방법 */
.not_scroll{
    position: fixed;
    overflow: hidden;
    width: 100%;
    height: 100%
}
.not_scroll .cont {
    position: relative;
    top: 0;
}
</style>
<script>
$(function(){
    $(".bnt_close").on("click", function(){
        $("html, body").removeClass("not_scroll");
    });
})
</script>
<div class="modal-header">
    <button type="button" class="bnt_close" data-dismiss="modal" aria-label="Close">메뉴닫기</button>
    <div>
        <h4 class="modal-title" id="myModalLabel">${title}</h4>
    </div>
</div>
<div class="modal-body">
    컨텐츠 
</div>
<div class="modal-footer">
  가격
</div>