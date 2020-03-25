<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax 간단 테스트</title>
 
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
 
<script type="text/javascript" language="javascript">
 
    $(document).ready(function(){
         
         
        $.ajax({
             
            type : "GET",
            url : "https://www.hf.go.kr/research/openapi/SttsApiTbl.do?STATBL_NM=%EC%A3%BC%ED%83%9D%EA%B7%9C%EB%AA%A8%EB%B3%84%20%EC%A3%BC%ED%83%9D%EA%B5%AC%EC%9E%85%EB%B6%80%EB%8B%B4%EC%A7%80%EC%88%98&Type=json",
	
            dataType : "json",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
                alert("통신데이터 값 : " + data) ;
                $("#dataArea").html(data) ;
            }
             
        });
         
 
    });
 
</script>
 
</head>
<body>
 
    <div id="dataArea"></div>
 
</body>
</html>

