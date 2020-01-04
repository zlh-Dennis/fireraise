function addBankcard() {
	var addBankcard_number = $("#addBankcard_number").val();
	var addBankcard_name = $("#addBankcard_name").val();
	var addBankcard_password = $("#addBankcard_password").val();
	var userId = $("#userId").val();

	if (addBankcard_number == null || addBankcard_number == "") {
		$("#warnning").html('请输入银行卡号');
		return;
	} else if (addBankcard_name == null || addBankcard_name == "") {
		$("#warnning").html('请输入银行卡名');
		return;
	} else if (addBankcard_password == null || addBankcard_password == "") {
		$("#warnning").html('请输入银行卡密码');
		return;
	}

	// 获取网络连接对象
	var xmlhttp = new XMLHttpRequest();
	// 设置请求方式，请求路径，是否异步
	xmlhttp.open("POST", "/fireraise/addBankcard?" + "addBankcard_number="
			+ addBankcard_number + "&addBankcard_name=" + addBankcard_name
			+ "&addBankcard_password=" + addBankcard_password + "&userId="
			+ userId, true);

	xmlhttp.send();

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			var text = xmlhttp.responseText;

			if ("success" == text) {
				$("#warnning").html("银行卡添加成功");
				document.getElementById("addBankcard_div").style.display = 'none';
				$("#bankcard").load(location.href + " #bankcard");// 注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
				$("#recharge_div").load(location.href + " #recharge_div");// 注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
				$("#withdraw_div").load(location.href + " #withdraw_div");// 注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
			} else if ("fail" == text)
				$("#warnning").html("银行卡添加失败,请稍后进行");
		}
	}

}

function recharge() {
	var recharge_bankcard = $('#recharge_bankcard option:selected').val();// 选中的值
	var recharge_money = $("#recharge_money").val();
	var recharge_password = $("#recharge_password").val();
	var userId = $("#userId").val();

	if (recharge_bankcard == null || recharge_bankcard == "") {
		$("#warnning").html('请选择银行卡');
		return;
	} else if (recharge_money == null || recharge_money == "") {
		$("#warnning").html('请输入充值金额');
		return;
	} else if (recharge_password == null || recharge_password == "") {
		$("#warnning").html('请输入银行卡密码');
		return;
	}

	// 获取网络连接对象
	var xmlhttp = new XMLHttpRequest();
	// 设置请求方式，请求路径，是否异步
	xmlhttp.open("POST", "/fireraise/recharge?" + "recharge_bankcard="
			+ recharge_bankcard + "&recharge_money=" + recharge_money
			+ "&recharge_password=" + recharge_password + "&userId=" + userId,
			true);

	xmlhttp.send();

	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			var text = xmlhttp.responseText;

			if ("success" == text) {
				location.reload();
				/*
				 * $("#warnning").html("充值成功");
				 * document.getElementById("recharge_div").style.display =
				 * 'none'; $("#bankcard").load(location.href + "
				 * #bankcard");//注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
				 * $("#recharge_div").load(location.href + "
				 * #recharge_div");//注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
				 * $("#withdraw_div").load(location.href + "
				 * #withdraw_div");//注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
				 * $("#account").load(location.href + "
				 * #account");//注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
				 */} else if ("password error" == text) {
				$("#warnning").html("充值失败,密码错误");
			} else if ("money error" == text) {
				$("#warnning").html("充值失败,银行卡金额不足");
			} else if ("fail" == text) {
				$("#warnning").html("充值失败,请稍后再试");
			}
		}

	}

}

function withdraw() {
	var withdraw_bankcard = $('#withdraw_bankcard option:selected').val();// 选中的值
	var withdraw_money = $("#withdraw_money").val();
	var withdraw_password = $("#withdraw_password").val();
	var userId = $("#userId").val();

	if (withdraw_bankcard == null || withdraw_bankcard == "") {
		$("#warnning").html('请选择银行卡');
		return;
	} else if (withdraw_money == null || withdraw_money == "") {
		$("#warnning").html('请输入充值金额');
		return;
	} else if (withdraw_password == null || withdraw_password == "") {
		$("#warnning").html('请输入银行卡密码');
		return;
	}

	// 获取网络连接对象
	var xmlhttp = new XMLHttpRequest();
	// 设置请求方式，请求路径，是否异步
	xmlhttp.open("POST", "/fireraise/withdraw?" + "withdraw_bankcard="
			+ withdraw_bankcard + "&withdraw_money=" + withdraw_money
			+ "&withdraw_password=" + withdraw_password + "&userId=" + userId,
			true);

	xmlhttp.send();

	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			var text = xmlhttp.responseText;

			if ("success" == text) {
				location.reload();
				/*
				 * $("#warnning").html("充值成功");
				 * document.getElementById("recharge_div").style.display =
				 * 'none'; $("#bankcard").load(location.href + "
				 * #bankcard");//注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
				 * $("#recharge_div").load(location.href + "
				 * #recharge_div");//注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
				 * $("#withdraw_div").load(location.href + "
				 * #withdraw_div");//注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
				 * $("#account").load(location.href + "
				 * #account");//注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
				 */
				} else if ("password error" == text) {
				$("#warnning").html("充值失败,密码错误");
			} else if ("money error" == text) {
				$("#warnning").html("充值失败,账户金额不足");
			} else if ("fail" == text) {
				$("#warnning").html("充值失败,请稍后再试");
			}
		}
	}
}

function change_bankcard(obj){
	// 获取网络连接对象
	var xmlhttp = new XMLHttpRequest();
	// 设置请求方式，请求路径，是否异步
	xmlhttp.open("GET", "/fireraise/change_bankcard?" + "bankcardId=" + obj, true);
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			bankcard = $.parseJSON(xmlhttp.responseText);
			
			document.getElementById("bankcard_head").removeAttribute("style");
			document.getElementById("bankcard_body").removeAttribute("style");
			
			$('#bankcard_number').html(bankcard.number);
			$('#bankcard_name').html(bankcard.name);
			$('#bankcard_money').html(bankcard.money);
			if(bankcard.state == true)	{
				$('#bankcard_state').html('正常');
				document.getElementById("bankcard_forzen").removeAttribute("style");
				$('#bankcardId').val(bankcard.id);
			}
			else if(bankcard.state == false)	{
				$("#bankcard_state").html('冻结');
				document.getElementById("bankcard_forzen").style.display = 'none';
			}
		}
	}
}

function forzen(bankcardId){
	// 获取网络连接对象
	var xmlhttp = new XMLHttpRequest();
	// 设置请求方式，请求路径，是否异步
	xmlhttp.open("GET", "/fireraise/forzen_bankcard?" + "bankcardId=" + bankcardId, true);
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
			var text = xmlhttp.responseText;
			
			if(text == 'success'){
				$("#warnning").html("冻结银行卡成功");
				change_bankcard(bankcardId);
			} else 
				$("#warnning").html("冻结银行卡失败，请稍后再试");
		}
	}
}