<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="javax.xml.*" %>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="org.w3c.dom.*" %>





<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	
	
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    <title><spring:message code="title.sample" /></title>
    
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    
    
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 
	 
 	<script src="http://code.jquery.com/jquery-1.11.2.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.8.3.js"> </script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  	
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

	<script type="text/javascript" src="js/jquery.ajax-cross-origin.min.js"></script>
	  
	 <script type="text/javaScript" src="http://code.jquery.com/jquery-3.4.1.min.js" />  
	<!-- <script src="../js/jquery-3.4.1.min.js"></script> -->
	
	<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script> 

    <script type="text/javaScript" language="javascript" defer="defer">
    
    
	    //onload
	    $(document).ready(function () {
	    	

	    	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	  
/*  
			var Base64 = {
				    // private property
				    _keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
				 
				    // public method for encoding
				    encode : function (input) {
				        var output = "";
				        var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
				        var i = 0;
				 
				        input = Base64._utf8_encode(input);
				 
				        while (i < input.length) {
				 
				            chr1 = input.charCodeAt(i++);
				            chr2 = input.charCodeAt(i++);
				            chr3 = input.charCodeAt(i++);
				 
				            enc1 = chr1 >> 2;
				            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
				            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
				            enc4 = chr3 & 63;
				 
				            if (isNaN(chr2)) {
				                enc3 = enc4 = 64;
				            } else if (isNaN(chr3)) {
				                enc4 = 64;
				            }
				 
				            output = output +
				            this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
				            this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);
				 
				        }
				 
				        return output;
				    },
				 
				    // public method for decoding
				    decode : function (input) {
				        var output = "";
				        var chr1, chr2, chr3;
				        var enc1, enc2, enc3, enc4;
				        var i = 0;
				 
				        input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
				 
				        while (i < input.length) {
				 
				            enc1 = this._keyStr.indexOf(input.charAt(i++));
				            enc2 = this._keyStr.indexOf(input.charAt(i++));
				            enc3 = this._keyStr.indexOf(input.charAt(i++));
				            enc4 = this._keyStr.indexOf(input.charAt(i++));
				 
				            chr1 = (enc1 << 2) | (enc2 >> 4);
				            chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
				            chr3 = ((enc3 & 3) << 6) | enc4;
				 
				            output = output + String.fromCharCode(chr1);
				 
				            if (enc3 != 64) {
				                output = output + String.fromCharCode(chr2);
				            }
				            if (enc4 != 64) {
				                output = output + String.fromCharCode(chr3);
				            }
				 
				        }
				 
				        output = Base64._utf8_decode(output);
				 
				        return output;
				 
				    },
				 
				    // private method for UTF-8 encoding
				    _utf8_encode : function (string) {
				        string = string.replace(/\r\n/g,"\n");
				        var utftext = "";
				 
				        for (var n = 0; n < string.length; n++) {
				 
				            var c = string.charCodeAt(n);
				 
				            if (c < 128) {
				                utftext += String.fromCharCode(c);
				            }
				            else if((c > 127) && (c < 2048)) {
				                utftext += String.fromCharCode((c >> 6) | 192);
				                utftext += String.fromCharCode((c & 63) | 128);
				            }
				            else {
				                utftext += String.fromCharCode((c >> 12) | 224);
				                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				                utftext += String.fromCharCode((c & 63) | 128);
				            }
				 
				        }
				 
				        return utftext;
				    },
				 
				    // private method for UTF-8 decoding
				    _utf8_decode : function (utftext) {
				        var string = "";
				        var i = 0;
				        var c = c1 = c2 = 0;
				 
				        while ( i < utftext.length ) {
				 
				            c = utftext.charCodeAt(i);
				 
				            if (c < 128) {
				                string += String.fromCharCode(c);
				                i++;
				            }
				            else if((c > 191) && (c < 224)) {
				                c2 = utftext.charCodeAt(i+1);
				                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				                i += 2;
				            }
				            else {
				                c2 = utftext.charCodeAt(i+1);
				                c3 = utftext.charCodeAt(i+2);
				                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
				                i += 3;
				            }
				 
				        }
				 
				        return string;
				    }
				}


			
			alert(Base64.encode("admin:81010a1f-e729-4883-8aa4-287528dbe983")); // 인코딩되어 7JWI64WV7ZWY7IS47JqU 출력됨 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	    	
	    	
	    	$("#p1").text("테스트입니다.");
	    	
	    	//const jsonObj = JSON.parse(obj1.ResponseDataAsJson1);  // form의 값을 넣은 오브젝트를 JSON형식으로 변환
	    	
	    	var json_data = 
	    		JSON.stringify({"RequestDataAsJson":"{\"userName\":\"Test.Broker\",\"password\":\"GZxeH25+hpLu5MA6WyUing==\"}"
	    			           ,"Requestor":{"UserId":0
	    			        	    		 ,"UserName":null
	    			        	    		 ,"FullName":""
	    			        	    		 ,"Email":null
	    			        	    		 ,"OrganizationID":0
	    			        	    		 ,"OriginationChannel":3
	    			        	    		 ,"SecurityProfileID":0
	    			        	    		 ,"SecurityProfile":null
	    			        	    		 ,"IPAddress":""}
	    					   ,"RequestTime":"2020-01-27T11:57:14.4370423-08:00"}); 
	    	

			$.ajax({                                                  
				url         : 'https://devByteInterface.amwestfunding.com/api/ByteLogin/GetLoginProfile' ,
				headers     : { "Authorization": "Basic YWRtaW46ODEwMTBhMWYtZTcyOS00ODgzLThhYTQtMjg3NTI4ZGJlOTgz","Content-Type": "application/json"},
				type        : 'POST',
				dataType    : 'json',
				data        : json_data ,
				

				success     : function (result) {
					alert("성공");
				    
				},
				error       : function (result) {
					alert("실패");
					
				}
			});
		
			
			
			



	 		function drawGrid(jsonData) { 
	 			
	 		
				var rows = jsonData.SttsApiTbl.row;	// ArcData위치에 해당하는 변수명은 각 API마다 url의 Service명과 동일하게 변합니다.
				
				
				
				if(rows) {
					var html = '';
					$.each(rows, function(idx, row) {
						html += '<tr>';
						html += '	<td style="border: 2px solid gray; text-align: center;">' + row.ITEM_NAME2 + '</td>';
						html += '	<td style="border: 2px solid gray; text-align: center;">' + row.DATA_VALUE + '</td>';
						html += '</tr>';
					});
					$('#grid').append(html);
				}
			}  	    	
	    	
	    	
	 		
	 		


	 		
	    });
    
    

	    
	    
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
	    
    	//function
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample.do'/>";
           	document.listForm.submit();
        }
        

        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }	    	
    	
 
           
        
    </script>
</head>



<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
        	<!-- 타이틀 -->
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><spring:message code="list.sample" /></li>
        		</ul>
        	</div>
        	
        	
	        <p id = "p1">
			
			</p>
			    
			<!-- <script>  
  				$("#p1").text("안녕");
			</script>   -->
        	
        	
        	
        	<!-- // 타이틀 -->
        	<div id="search">
        		<ul>
        			<li>
        			    <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchCondition" cssClass="use">
        					<form:option value="1" label="Name" />
        					<form:option value="0" label="ID" />
        				</form:select>
        			</li>
        			<li><label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <form:input path="searchKeyword" cssClass="txt"/>
                    </li>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:fn_egov_selectList();"><spring:message code="button.search" /></a>
        	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li>
                </ul>
        	</div>
        	<!-- List -->
        	<div id="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블">
        			<caption style="visibility:hidden">카테고리ID, 케테고리명, 사용여부, Description, 등록자 표시하는 테이블</caption>
        			<colgroup>
        				<col width="40"/>
        				<col width="100"/>
        				<col width="150"/>
        				<col width="80"/>
        				<col width="?"/>
        				<col width="60"/>
        			</colgroup>
        			<tr>
        				<th align="center">No</th>
        				<th align="center"><spring:message code="title.sample.id" /></th>
        				<th align="center"><spring:message code="title.sample.name" /></th>
        				<th align="center"><spring:message code="title.sample.useYn" /></th>
        				<th align="center"><spring:message code="title.sample.description" /></th>
        				<th align="center"><spring:message code="title.sample.regUser" /></th>
        			</tr>
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr>
            				<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
            				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.id}"/>')"><c:out value="${result.id}"/></a></td>
            				<td align="left" class="listtd"><c:out value="${result.name}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.useYn}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.description}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.regUser}"/>&nbsp;</td>
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- /List -->
        	<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	<div id="sysbtn">
        	  <ul>
        	      <li>
        	          <span class="btn_blue_l">
        	              <a href="javascript:fn_egov_addView();"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li>
              </ul>
         
        	</div>
        	
        </div>
        
        
       <!--  <input type = "button" onclick = "javascript:ajax()" value = "제출" /> -->
    	
    	
    	<div><table id = "boardList" border = "1"></table></div>
    	
    	
    	
    	
<!-- 		<table id="listTable">
		
		</table>         -->
        
        
        
		<table style="border: 2px solid gray; width: 700px; text-align: center;">
			<colgroup>
				<col width="50%">
				<col width="">
			</colgroup>
			<thead>
				<tr>
					<th style="border: 2px solid gray; text-align: center;">지역</th>
					<th style="border: 2px solid gray; text-align: center;">부담지수</th>
				</tr>
			</thead>
			<tbody id="grid">
			</tbody>
			
			
			
			
			
			
<%-- 			<c:forEach var="result" items="${data}" varStatus="status">
      			<tr>
     				<td align="left" class="listtd"><c:out value="${result.ITM_NM}"/>&nbsp;</td>
      				<td align="center" class="listtd"><c:out value="${result.DTA_VAL}"/>&nbsp;</td>
      			</tr>
  			</c:forEach> --%>
			
		</table>        
		        

        
    </form:form>
</body>
</html>
