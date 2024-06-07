
/* 티켓 search 활성화 */
function ticketchange(){
		$("#journeySearch").css("display","none");
	    $("#ticketSearch").css("display","block");
	    $("#recommendSelect_j").css("display","none");
	    $("#dynamicCal").css("display","none");
	    $("#staticCal").css("display","block")	
		$("#kidadult").css("display","block")
		$("#sub_idx").val(2);
}
/* 여행 search 활성화 */
function journeychange(){
		$("#journeySearch").css("display","block");
		$("#sub_idx").val(1);
	    $("#ticketSearch").css("display","none");
	    $("#recommendSelect_t").css("display","none");
}

function recommend_t(){
	$("#recommendSelect_t").css("display","block");
}
function recommend_j(){
	$("#recommendSelect_j").css("display","block");
}
function dynamicCalReset(){
	$("#dynamicCal").css("display","none");	
	$("#staticCal").css("display","block")	
	$("#kidadult").css("display","block")
	$("#searchIcon").css("display","block");
}
function personnel(){
	$(".personnel-selector-layer").css("display","block")
}
function del(){
	$(".personnel-selector-layer").css("display","none")
}
function sysdateLoad(){
	date = new Date;
	
    var year = date.getFullYear();

    var month = ("0"+(date.getMonth()+1)).slice(-2); 
    
    var today = month + '/' + ("0" + date.getDate()).slice(-2) + '/' +year ; 
    
    var tomorrow = month + '/' + (date.getDate()+1) + '/' +year;
    
    document.getElementById("inputDate").value = today + ' - ' + tomorrow;
    
}  
$(function() {
  $('input[name="daterange"]').daterangepicker({
    opens: 'right'
  }, function(start, end, label) {
    /*  console.log("A new date selection was made: " + start.format('YY-MM-DD') + ' to ' + end.format('YY-MM-DD'));  */
     $.ajax({
	      type: 'POST', 
	      url: '/dateSave', 
	      data: JSON.stringify({
	          ji_duetime1 : start.format('YY/MM/DD'),
	          ji_duetime2 : end.format('YY/MM/DD')
	        }),
	      contentType: "application/json",	  	 
	      success: function(response) {
	        console.log('서버에 전송 완료');
	      },
	      error: function(xhr, status, error) {
	        console.error('서버 전송 에러:', error);
	     }
	 });
  });
  $(".wizard-search-btn").click(function(){
		  if($("#sub_idx").val()==101){
		     if(jSearchBox.value==""){
			  console.log("왜 2번");
			  alert("내용을 입력해주세요.");
			  return false
			  }
		  }
		  else{
			 if(tSearchBox.value==""){
			  
			 alert("안돼");
			 return false			  
		  }
	    }
	});
});
var countA=2;
var countK=0;

var countUp=function(){
    countA=countA+1;
    document.querySelector("#ji_adult").innerText=countA;
};
var countDown=function(){
    if(countA>0){
        countA=countA-1;        
        document.querySelector("#ji_adult").innerText=countA;
        
    }
};
var countUp2=function(){
    countK=countK+1;
    document.querySelector("#ji_kid").innerText=countK;
};
var countDown2=function(){
    if(countK>0){
        countK=countK-1;        
        document.querySelector("#ji_kid").innerText=countK;
        
    }
};
function resultPerson(){
    $.ajax({
        type: 'GET',
        url: '/personnel', 
        data: {
        	ji_adult: countA,
        	ji_kid: countK
        }, 
        success: function(response) { 
            console.log(response);
            
            $("#result").text('성인 ' + countA + ', ' + '아동 ' + countK);
            $(".personnel-selector-layer").css("display","none");
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(textStatus + ': ' + errorThrown);
        }
    });
}
/* $(function(){
	$('#searchIcon').submit(function(){
		if(jSearchBox.value==""){
			
			alter("검색어가 없습니다.");
			jSearchBox.focus();
			return false;
		}
	});
}); */