function registerValidate_member(){
    let id = document.registerForm.m_id;
    let passwd = document.registerForm.m_passwd;
	let repasswd = document.registerForm.m_passwd1;
    let name = document.registerForm.m_name;
    let phone = document.registerForm.m_phone;
    let email = document.registerForm.m_email;
    if(EngAndNum(id)){
        alert("아이디는 영문자와 숫자를 조합하여 입력해 주세요");
        console.log("id");
        return false;
    }
    if(PasswdCheak(passwd)){
        alert("비밀번호는 영문자와 숫자를 조합하여 8자리 이상으로 입력해 주세요.");
        console.log("passwd");
        return false;
    }
 
	if(passwd.value != repasswd.value){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요");
        console.log("repasswd");
        return false;
	}
    if(KoreanNameCheck(name)){
        alert("이름은 한글 또는 영문자로 입력해 주세요.");
        console.log("name");
        return false;
    }
    if(PhoneCheck(phone)){
        alert("전화번호를 다시 입력해 주세요(010-XXXX-XXXX).");
        console.log("phone");
        return false;
    }
    if(EmailCheck(email)){
        alert("이메일 주소를 다시 입력해 주세요.");
        console.log("email");
        return false;
    }
    alert("회원가입을 축하합니다.");
    return true;
}

function registerValidate_join(){
     
    let passwd = document.registerForm.m_passwd;	 
    let name = document.registerForm.m_name;
    let phone = document.registerForm.m_phone;
    let email = document.registerForm.m_email;

    if(PasswdCheak(passwd)){
        alert("비밀번호는 영문자와 숫자를 조합하여 8자리 이상으로 입력해 주세요.");
        console.log("passwd");
        return false;
    }
 
    if(KoreanNameCheck(name)){
        alert("이름은 한글 또는 영문자로 입력해 주세요.");
        console.log("name");
        return false;
    }
    if(PhoneCheck(phone)){
        alert("전화번호를 다시 입력해 주세요(010-XXXX-XXXX).");
        console.log("phone");
        return false;
    }
    if(EmailCheck(email)){
        alert("이메일 주소를 다시 입력해 주세요.");
        console.log("email");
        return false;
    }
    alert("회원가입을 축하합니다.");
    return true;	
}

function registerValidate_update(){
         
    let name = document.registerForm.m_name;
    let phone = document.registerForm.m_phone;
    let email = document.registerForm.m_email;
 
    if(KoreanNameCheck(name)){
        alert("이름은 한글 또는 영문자로 입력해 주세요.");
        console.log("name");
        return false;
    }
    if(PhoneCheck(phone)){
        alert("전화번호를 다시 입력해 주세요(010-XXXX-XXXX).");
        console.log("phone");
        return false;
    }
    if(EmailCheck(email)){
        alert("이메일 주소를 다시 입력해 주세요.");
        console.log("email");
        return false;
    }
    alert("수정완료 되었습니다.");
    return true;	
}


//아이디
function EngAndNum(inputObject){
    var regexp = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]+$/;
    if(regexp.test(inputObject.value)){
        return false;
    }else{
        return true;
    }
}
//비밀번호
function PasswdCheak(inputObject){
    var regexp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    if(regexp.test(inputObject.value)){
        return false;
    }else{
        return true;
    }
}
//이름
function KoreanNameCheck(inputObject){
    var regexp = /^[A-Za-z|가-힣]{2,}$/;
    if(regexp.test(inputObject.value)){
        return false;
    }else{
        return true;
    }
}
//연락처
function PhoneCheck(inputObject){
    var regexp = /^(01)([?:0|1|6-9])-\d{3,4}-\d{4}$/;
    if(regexp.test(inputObject.value)){
        return false;
    }else{
        return true;
    }
}
//이메일
function EmailCheck(inputObject){
    var regexp = /^[A-Za-z0-9._!?-]+@[A-Za-z.-]+\.[a-zA-Z]{2,4}$/;
    if(regexp.test(inputObject.value)){
        return false;
    }else{
        return true;
    }
}