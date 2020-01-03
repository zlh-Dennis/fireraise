var returncode;
var first_username;

function sendCode() {
	var second = 60;
	if (null == $("#forget_email").val() || $("#forget_email").val() == "") {
		$("#warnning").html("请输入邮箱");
    	return;
	}
	if (!isEmailAvailable($("#forget_email").val())){
		$("#warnning").html("邮箱格式错误，请重新输入");
    	return;
	}
	first_username = $("#forget_email").val();
	
	// 获取网络连接对象
	var xmlhttp = new XMLHttpRequest();
	// 设置请求方式，请求路径，是否异步
	xmlhttp.open("GET", "/fireraise/sendCode?" + "username=" + $("#forget_email").val(), true);
	xmlhttp.send();

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			var text = xmlhttp.responseText;
			
			if(text == "Username Error"){
				$("#warnning").html("此邮箱尚未进行注册");
				return;
			} else if(text == "fail"){
				$("#warnning").html("验证码发送失败，请稍后重试");
				return;
			} else {
				returncode = text;
				$("#warnning").html("验证码已发送到您的邮箱，请注意查收");
				var secondInterval = setInterval(function() {
					if (second <= 0) {
						$("#btnCode").attr("disabled", false);
						$("#btnCode").val("发送验证码");
						second = 60;
						// 关闭定时器
						clearInterval(secondInterval);
						secondInterval = undefined;
					} else {
						$("#btnCode").attr("disabled", true);
						$("#btnCode").val(second + "秒后重发");
						second--;
					}
				},1000);
			}
		}
	}
}

function repassword() {
	var username = $('#forget_email').val();
	var password = $('#forget_password').val();
	var repassword = $('#forget_repassword').val();
	var code = $('#forget_code').val();
	
	if(null == username || username == ""){
		$("#warnning").html("请输入邮箱");
		return;
	}
	if(null == password || password == ""){
		$("#warnning").html("请输入密码");
		return;
	}
	if(username != first_username){
		$("#warnning").html("邮箱已更改,请重新发送验证码");
		return;
	}
	if(repassword != password){
		$("#warnning").html("两次密码不一致，请重新输入");
		return;
	}
	if(null == code || code == ""){
		$("#warnning").html("请输入验证码");
		return;
	}
	if(code != returncode){
		$("#warnning").html("验证码错误,请重新输入");
		return;
	}
	
	// 获取网络连接对象
	var xmlhttp = new XMLHttpRequest();
	// 设置请求方式，请求路径，是否异步
	xmlhttp.open("GET", "/fireraise/forgetPassword?" + "username=" + username + "&password=" + password, true);
	xmlhttp.send();

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			var text = xmlhttp.responseText;

			if ("true" == text){
				window.location.href="/fireraise/toLogin";
				return;
			}
			if ("false" == text){
				$("#warnning").html("密码修改失败,请稍后再试");
				return;
			}
		}
	}
	
}

// 验证邮箱格式
function isEmailAvailable(obj) {
	// var reg = new
	// RegExp("[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
	// //正则表达式
	var reg = new RegExp(
			"[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$"); // 正则表达式
	// var obj = $poneInput.val(); //要验证的对象
	if (reg.test(obj)) { // 正则验证通过，格式正确
		return true;
	} else {
		return false;
	}
}