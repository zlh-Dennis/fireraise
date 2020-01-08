function register(){
	var username = $("#register_name").val();
	var phone = $("#register_phone").val();
	var email = $("#register_email").val();
	var password = $("#register_password").val();
	var repassword = $("#register_repassword").val();
	
	// 表单验证
	if(username == "") {$("#warnning").html("请输入真实姓名"); return;}
	if(phone == "") {$("#warnning").html("请输入手机号"); return;}
	if(isPhoneAvailable(phone) != true) {$("#warnning").html("手机号格式错误"); return;}
	if(email == "") {$("#warnning").html("请输入邮箱"); return;}
	if(isEmailAvailable(email) != true) {$("#warnning").html("邮箱格式错误"); return;}
	if(password == "") {$("#warnning").html("请输入密码"); return;}
	if(repassword == "") {$("#warnning").html("请输入确认密码"); return;}
	if(password.length < 4) {$("#warnning").html("密码最少四位"); return;}
	if(password != repassword) {$("#warnning").html("两次密码不一致"); return;}
	
	//获取网络连接对象
    var xmlhttp = new XMLHttpRequest();
    //设置请求方式，请求路径，是否异步
    xmlhttp.open("GET", "/fireraise/register?" + 
    		"username=" + username + "&password=" + password + "&phone=" + phone + "&email=" + email, 
    		true);
    xmlhttp.send();
    
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            var text = xmlhttp.responseText;
            
            if(text == "Register Success"){
            	window.location.href="/fireraise/start";
            	return;
            }
            if(text == "Register Fail"){
            	alert("网络错误，请稍后再试");
            	$("#warnning").html("");
            	return;
            }
            if(text == "Phone number already exists"){
            	$("#warnning").html("手机号已存在"); 
            	return;
            }
            if(text == "Email already exists"){
            	$("#warnning").html("此邮箱已存在"); 
            	return;
            }
            
        }
    }
}


//验证手机号格式
function isPhoneAvailable(obj) {
    var myreg = new RegExp("[1][3,4,5,7,8][0-9]{9}");
    if (myreg.test(obj)) {
        return true;
    } else {
        return false;
    }
}


//验证邮箱格式
function isEmailAvailable(obj) {
//    var reg = new RegExp("[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
    var reg = new RegExp("[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$"); //正则表达式
//    var obj = $poneInput.val(); //要验证的对象
    if (reg.test(obj)) { //正则验证通过，格式正确
        return true;
    } else {
        return false;
    }
}