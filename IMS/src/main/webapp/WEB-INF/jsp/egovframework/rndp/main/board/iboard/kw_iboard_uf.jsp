<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"	src="<c:url value='/se/js/HuskyEZCreator.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/script.js'/>"></script><!-- 반응형 JS -->

<script type="text/javascript">
var msgChk = "";
function fn_update(){
	var frm = document.frm;	
	oEditors.getById["content"].exec("UPDATE_IR_FIELD", []);
	if (frm.subject.value == ""){
		alert("제목을 입력하세요.");
		frm.subject.focus();
		return false;
	}

	if (frm.id.value == ""){
		alert("아이디를 입력하세요.");
		frm.id.focus();
		return false;
	}

	if (frm.name.value == ""){
		alert("이름을 입력하세요.");
		frm.name.focus();
		return false;
	}

	if (frm.password.value == ""){
		alert("비밀번호를 입력하세요.");
		frm.password.focus();
		return false;
	}
	if(confirm("저장하시겠습니까?")){
		frm.submit();
	}
}

function getFileExtension( fileExtName ){
    var lastIndex = -1;
    lastIndex = fileExtName.lastIndexOf('.');
    var extension = "";
	if ( lastIndex != -1 ){
    	extension = fileExtName.substring( lastIndex+1, fileExtName.len );
	} else {
    	extension = "";
	}
	return extension;
}

// function fileChk(obj, cnt, fileId){
// 	$.ajax({
//         url: "<c:url value='/fileSizeCheck.do'/>",
//         type: "POST",
//         dataType : "json", 
//         contentType: false,
//         processData: false,
//         data: function() {
//             var data = new FormData();
//             data.append("fileSize", $('#fileSize').val());
//             data.append(fileId, $("#"+fileId).get(0).files[0]);
//             return data;
//         }(),
//         success: function(msg) {
//             msgChk = msg.result.fileName;
            

//         },
//         error: function (e) { 
// 			alert('에러발생'); 
// 		}    
//     });
// 	var docName = obj.value.substring(obj.value.lastIndexOf("\\")+1);
// 	setTimeout("fileExtCheck('"+docName+"', '"+cnt+"');",1000*2);
// }

function fileExtCheck(obj, cnt, fileId){   
	var docName = obj.value.substring(obj.value.lastIndexOf("\\")+1);	
	var prefixList = ['gif','GIF', 'jpeg', 'JPEG', 'bmp', 'BMP', 'jpg', 'JPG', 'png', 'PNG', 'TIFF', 'tiff', 'TIF', 'tif'];
	var fielExt = getFileExtension(docName);
    for (var i = 0; i < prefixList.length; i++){
    	if (fielExt == prefixList[i]) {
        	return true;
        }
    } 
    alert("확장자가  "+fielExt+"인 파일은 첨부할 수 없습니다."); 
    document.getElementById("filename"+cnt).select();
   	document.selection.clear();
    return false;
}

function fileKeyDelete(key, cnt){
	$('#fileKey').val(key)
	$.ajax({
		type: "post",                                           //포스트 방식
	 	dataType : "json",                                      //dataType
	  	url: "/fileKeyDelete.do",         						//url
	  	data: $('#frm').serialize(),				
	  	success: function(msg){									//응답이 성공 상태 코드를 반환하면 호출	
		  	if(msg.result.result == "success"){
		  		$('#'+key).remove();
		  		$('#filename_'+cnt).attr("name", "filename_0_"+cnt)
		  	}
		},
		error: function (e) { 
			alert('에러발생'); 
		}                         
		
	});
}
</script>

<!-- 보드 내용시작 -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td>
			<form name="frm" id="frm" method="post" enctype="multipart/form-data" action="<c:url value='/jsp/boardUpdate.do'/>">
				<%-- <input type="hidden" name="menuKey" value="${key}" /> 
				<input type="hidden" name="mngKey" value="${boardmng.key }"/>
				<input type="hidden" name="boardKey" value="${boardUser.boardKey}" /> 
				<input type="hidden" name="type" value="${boardmng.type }" /> <!-- 파일결로 구분을 위해서 추가 -->
				
				 --%>
				<input type="hidden" name="menuKey" value="${key}" /> 
				<input type="hidden" name="mngKey" value="${boardmng.key }"/>
				<input type="hidden" name="boardKey" value="${boardUser.boardKey}" /> 
				<input type="hidden" name="depth" value="${boardUser.depth }" />
				<input type="hidden" name="groupKey" value="${groupKey}" />
				<input type="hidden" name="type" value="${boardmng.type }" /> <!-- 파일결로 구분을 위해서 추가 -->
				<input type="hidden" name="fileSize" id="fileSize" value="${boardmng.fileSize }" />
				<input type="hidden" name="fileNumber" id="fileNumber" value="${boardmng.fileNumber }" />
				<input type="hidden" name="fileFlag" id="fileFlag" value="${boardmng.fileFlag }" />
				
				<!-- 신규 파일 삭제 필요 -->
				<input type="hidden" name="fileKey" id="fileKey" value="" />
				<!-- 동영상 -->
				<input type="hidden" name="imgFlag" id="imgFlag" value="T" />
				<input type="hidden" name="smartStr" id="smartStr" value="${boardUser.smartStr }"/>
				
				
				<table cellspacing="0" cellpadding="0" width="100%" border="0" class="board_view">
					<tr>
						<th width="100" scope="row">제목</th>
						<td colspan="3">
							<c:if test="${boardUser.boardKey == 0 }">
							<font color="red"><b>공지</b></font>&nbsp;										
							<input type="checkbox" name="pubflag" value="${boardUser.pubflag}" border="0" <c:if test="${boardUser.pubflag == 'T' }">checked</c:if>/> &nbsp;
							</c:if> 
							<input type="text" id="subject" name="subject" maxlength="100" size="70" class="box"  value="${boardUser.subject}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">아이디</th>
						<td width="250">
							<input type="text" id="id" name="id" value="${user.id}" size="20" maxlength="20" class="box" value="${boardUser.id}" <c:if test="${boardmng.writePermit != 'E'}">readonly</c:if> />
						</td>
						<th width="100" scope="row">성명</th>
						<td>
							<input type="text" id="name" name="name" value="${user.name }" size="20" maxlength="50" class="box" value="${boardUser.name}" <c:if test="${boardmng.writePermit != 'E'}">readonly</c:if> />
						</td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td>
							<input type="password" id="password" name="password" maxlength="10" size="20" class="box" value="${boardUser.password}"/>
						</td>
						<th scope="row">E-mail</th>
						<td>
							<input type="text" id="email" name="email" value="" maxlength="100" size="20" class="box" value="${boardUser.email}" />
						</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th class="line_right" scope="row">년도</th> -->
<!-- 						 <td class="td_view" colspan="3"> -->
<%-- 						 	<input type="text" id="year" name="year" value="${boardUser.year}" maxlength="100" size="20" class="box" />년 --%>
<!-- 						 </td> -->
<!-- 					</tr> -->
					<c:if test="${boardmng.secretFlag == 'T'}">
					<tr>
						<th scope="row">비공개</th>
						<td colspan="3">
							<input type="radio" id="share" name="share" value="F" border="0" <c:if test="${boardUser.share == 'F' }">checked</c:if>/>설정
							<input type="radio" id="share" name="share" value="T" border="0" <c:if test="${boardUser.share == 'T' }">checked</c:if> />해제
						</td>
					</tr>
					</c:if>
					<c:if test="${boardmng.fileFlag == 'T' }">
					<c:set var="fileKeyNm" value=""/>
					<c:forEach items="${fileList}" var="fileList" varStatus="i">	
						<tr id="${fileList.fileKey}">
							<c:choose>
							<c:when test="${i.first}">
								<th class="line_right" scope="row">메인이미지파일</th>
								<td class="td_view" colspan="3">
									<font color="red">${fileList.filename}</font>
									<c:if test="${i.index != 0 }">
										<a href="#none;" onClick="fileKeyDelete('${fileList.fileKey}', '${i.index}');">
										<img src="./images_in/btn/btn_del_s.gif" align="absmiddle"> 
										</a>
									</c:if>
								</td>
							</c:when>
							<c:otherwise>
								<th class="line_right" scope="row">이전파일<c:out value="${i.index + 1}" /></th>
								<td class="td_view" colspan="3">
									<font color="red">${fileList.filename}</font>
									<c:if test="${i.index != 0 }">
										<a href="#none;" onClick="fileKeyDelete('${fileList.fileKey}', '${i.index}');">
										<img src="./images_in/btn/btn_del_s.gif" align="absmiddle"> 
										</a>
									</c:if>
								</td>
							</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
					<c:forEach begin="0" end="${boardmng.fileNumber-1}" varStatus="j">
						<c:choose>
						<c:when test="${j.first}">
							<tr>
								<th class="line_right" scope="row">메인이미지파일</th>
							 	<td class="td_view" colspan="3">
							 		<c:set var="fileKeyNm" value="0"/>
							 		<c:forEach items="${fileList}" var="fileList" varStatus="i">	
										<c:if test="${j.index == i.index }">
											<c:set var="fileKeyNm" value="${fileList.fileKey}"/>
										</c:if>
									</c:forEach>
								 	<input type='file' name='filename_${fileKeyNm}_${j.index}' id='filename_${j.index}' maxLength='100' size='45' class='' onChange="fileExtCheck(this,'${j.index}','filename_${fileKeyNm}_${j.index}');"/>(용량 : ${boardmng.fileSize } MB)
							 	</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th class="line_right" scope="row">첨부파일${j.index+1}</th>
							 	<td class="td_view" colspan="3">
							 		<c:set var="fileKeyNm" value="0"/>
							 		<c:forEach items="${fileList}" var="fileList" varStatus="i">	
										<c:if test="${j.index == i.index }">
											<c:set var="fileKeyNm" value="${fileList.fileKey}"/>
										</c:if>
									</c:forEach>
								 	<input type='file' name='filename_${fileKeyNm}_${j.index}' id='filename_${j.index}' maxLength='100' size='45' class='' onChange="fileExtCheck(this,'${j.index}','filename_${fileKeyNm}_${j.index}');"/>(용량 : ${boardmng.fileSize } MB)
							 	</td>
							</tr>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					</c:if>
					<tr>
						<td colspan="4" align="center" scope="row"><textarea id="content" name="content" cols="100%" rows="15" style="font-size: 13px; width: 100%">${boardUser.content }</textarea></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td colspan="4" align="center" scope="row"> -->
<!-- 							<table width="100%" cellspacing="0" cellpadding="0" border="0" class="captcha"> -->
<!-- 								<tr valign="top"> -->
<!-- 									<td width="150" valign="top"> -->
<%-- 									 <img src="<c:url value='/jcaptcha'/>" id="captchaImg" name="captchaImg" alt="캡차이미지" /> --%>
<!-- 									</td> -->
<!-- 									<td valign="middle"> -->
<!-- 										<p>왼쪽 이미지를 보이는 대로 입력해주세요.</p> -->
<!-- 										<input type="text" name="j_captcha" title="그림문자 입력" maxlength="5" style="width: 100px" class="input_txt2" value="" /> -->
										
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 							</table> -->
<!-- 						</td> -->
<!-- 					</tr> -->
				</table>
			</form>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<table cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr height="35">
					<td align="right">						
						<input type="image" src="/images_main/v_ok.gif" onClick="javascript:fn_update();" /> <!--확인 btn-->
						<a href="javascript:insert_reset();"><img src="/images_main/v_cancle.gif" border="0" /></a> <!--취소 btn-->
						<a href="<c:url value='/webMenu.do'/>?key=${key}&pageGb=r&groupKey=${groupKey}"><img src="/images_main/v_list.gif" border="0" /></a> <!--목록 btn-->
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
		
<script type="text/javascript">
	var imagepath = "../smartImage";
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "<c:url value='/se/SEditorSkin.html'/>",
		fCreator: "createSEditorInIFrame"
	});
	
	function insertIMG(irid,fileame){
		var sHTML = "<img src='" + imagepath + "/" + fileame + "' border='0'>";
		oEditors.getById[irid].exec("PASTE_HTML", [sHTML]);
	}

// 	function insertIMG(irid, filename, videoFlag, smartKey) {
// 		var imgFlag = document.frm.imgFlag.value;
		
// 		if(videoFlag == 'T'){
// 			var sHTML = "<br/><embed width='640' height='360' src='" + filename  + "' type='application/x-shockwave-flash' allowscriptaccess='always' allowfullscreen='true' WindowlessVideo='1' style='z-index: 10'></embed><br/>";
// 			oEditors.getById[irid].exec("PASTE_HTML", [ sHTML ]);		
// 		}else{
// 			var sHTML = "<img src='" + filename + "' border='0' ><br/>";
// 			oEditors.getById[irid].exec("PASTE_HTML", [ sHTML ]);	
// 		}
		
// 		if(document.frm.smartStr.value == ""){
// 			document.frm.smartStr.value = smartKey;
// 		}else{
// 			document.frm.smartStr.value +=","+smartKey;
// 		}
// 	}
</script> 


<!-- 보드 내용 끝 -->

			