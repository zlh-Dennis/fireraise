// 判断有没有本地Cookie设置记住密码
window.onload = function() {
	$("#login_username").val(getCookie("username"));	// 自动填充用户名
	if(getCookie("remember") == "true"){
		$("#remember").prop("checked", true);	// 自动选中“记住密码”
		$("#login_password").val(getCookie("password"));	// 自动填充密码
	}
}

// 获取键为 cname 的 cookie 值
function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i].trim();
		if (c.indexOf(name) == 0)
			return c.substring(name.length, c.length);
	}
	return "";
}

function login(){
	var username = $("#login_username").val();
	var password = $("#login_password").val();
	if($("input[name='remember']:checked").val() == null || $("input[name='remember']:checked").val() == "")
		var remember = "false";
	else var remember = $("input[name='remember']:checked").val();
	var source = $("#source").val();
	
	//获取网络连接对象
    var xmlhttp = new XMLHttpRequest();
    //设置请求方式，请求路径，是否异步
    xmlhttp.open("GET", "/fireraise/login?username=" + username + "&password=" + password + "&remember=" + remember + "&source=" + source, true);
    xmlhttp.send();
    
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            var text = xmlhttp.responseText;
            
            if(text == "Login Success"){
            	window.location.href="/fireraise/start";
            	return;
            } else if(text == "Password Error"){
            	$("#warnning").html("密码错误");
            	return;
            } else if(text == "Username Error"){
            	$("#warnning").html("用户名不存在");
            	return;
            } else if(text == "manager"){
            	window.location.href="/fireraise/toManager.done";
            } else if(text == "email error"){
            	$("#warnning").html("邮箱未激活，请查找注册邮箱中的激活邮件");
            	return;
            } else{
            	window.location.href="/fireraise" + text;
            }
            
        }
    }
}