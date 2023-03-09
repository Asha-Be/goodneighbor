function writeSave(){
 //script.js		   
	if($("#board_writer").val()==''){
	   alert("이름을 입력 하세요 ");
	   $("#board_writer").focus();
	   return false;
   }
   if($("#board_subject").val()==''){
	   alert("글제목을 입력 하세요 ");
	   $("#board_subject").focus();
	   return false;
   }
   if($("#board_content").val()==''){
	   alert("글내용을 입력 하세요 ");
	   $("#board_content").focus();
	   return false;
   }
   if($("#board_pw").val()==''){
	   alert("암호을 입력 하세요 ");
	   $("#board_pw").focus();
		   return false;
	}

     return true;

}//writeSave() end


/*
function writeSave(){
	 
	if(document.writeform.writer.value==""){
	  alert("작성자를 입력하십시요.");
	  document.writeform.writer.focus();
	  return false;
	}
	if(document.writeform.subject.value==""){
	  alert("제목을 입력하십시요.");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.content.value==""){
	  alert("내용을 입력하십시요.");
	  document.writeform.content.focus();
	  return false;
	}
        
	if(document.writeform.pw.value==""){
	  alert(" 비밀번호를 입력하십시요.");
	  document.writeform.pw.focus();
	  return false;
	}
	
	return true;
	//document.writeform.submit();
 }//writeSave()end
 */
 // 회원가입 입력 여부 체크
 function memberCheck(){
 	if($('#id').val()==''){
 	alert("ID를 입력 하세요");
 	$('#id').focus();
 	return false;
    }
    
    //name
   if($('#name').val()==''){
 	alert("이름을 입력 하세요");
 	$('#name').focus();
 	return false;
    }
    
    //email
    if($('#email').val()==''){
 	alert("이메일을 입력 하세요");
 	$('#email').focus();
 	return false;
    }
    
    //tel1 tel2 tel3
     if($('#tel').val() ==''|| $('#tel2').val()=='' || $('#tel3').val()=='') {
    	alert("전화번호를 정확히 입력 하세요");
    	$('#tel').focus();
    	return false;
    }
    
    	return true;
    	
    }//memberCheck()-end
        
     function pwCheck(){
     if($('#board_pw').val()==''){
 	alert("암호를 입력 하세요");
 	$('#board_pw').focus();
 	return false;
    }
     
     if($('#board_pw2').val()==''){
 	alert("암호를 입력 하세요");
 	$('#board_pw2').focus();
 	return false;
    }
     
      if($('#board_pw').val() !=$('#pw2').val()){
      alert("암호와 암호확인이 다릅니다");
 	$('#pw2').val('');
 	$('#board_pw').val('').focus();
 	return false;
 	}
 }
 function pwCheck(){
	if( $("#board_pw").val()==''){
		alert("암호는 필수 입력입니다.");
		$("#board_pw").focus();
		return false;
	}

}