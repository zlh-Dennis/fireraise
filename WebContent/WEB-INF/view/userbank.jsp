<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人账户</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<script src="resources/js/jquery-form.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/userbank.js"></script>
<script src="resources/js/json2.js"></script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById("recharge_div").style.display = 'none';
		document.getElementById("withdraw_div").style.display = 'none';
		document.getElementById("addBankcard_div").style.display = 'none';
		document.getElementById("bankcard_head").style.display = 'none';
		document.getElementById("bankcard_body").style.display = 'none';
	}
</script>
</head>
<body>

	<jsp:include page="head2.jsp"></jsp:include>
	
	<div id="account" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h5 id="warnning" style="display: inline; color: red">  </h5>
		<h1 class="page-header">账户管理   </h1>
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="form-group" style="display: inline-block; width:70%;">
					<input id="userId" style="display: none" type="text" value="${sessionScope.account.getId()}" />
					<div style="display: inline-block; width: 35%;">
						<h4>账户金额 : ${sessionScope.account.getMoney()} </h4>
					</div>
					<div style="display: inline-block;">
						<button id="recharge_btn" onclick="recharge_btn()" class="btn btn-default" > 充值 </button>
						<button id="withdraw_btn" onclick="withdraw_btn()" class="btn btn-default" > 提现 </button>
						<button id="addBankcard_btn" onclick="addBankcard_btn()" class="btn btn-default" > 添加银行卡 </button>
					</div>
					<script type="text/javascript">
						function withdraw_btn() {
							document.getElementById("withdraw_div").removeAttribute("style");
							document.getElementById("recharge_div").style.display = 'none';
							document.getElementById("addBankcard_div").style.display = 'none';
						}
						function recharge_btn() {
							document.getElementById("recharge_div").removeAttribute("style");
							document.getElementById("withdraw_div").style.display = 'none';
							document.getElementById("addBankcard_div").style.display = 'none';
						}
						function addBankcard_btn() {
							document.getElementById("addBankcard_div").removeAttribute("style");
							document.getElementById("withdraw_div").style.display = 'none';
							document.getElementById("recharge_div").style.display = 'none';
						}
					</script>
					
				</div>
			</div>
		</div>
		
		<div id="withdraw_div" class="panel panel-default">
			<div class="panel-body">
				<div class="form-inline" style="display: inline-block; width:100%;">
					
					<div style="display: inline-block;" class="form-group">
						<select id="withdraw_bankcard" class="form-control">
							<option value="0" disabled selected style='display: none;'>选择银行卡</option>
							<c:forEach items="${requestScope.bankcards}" var="bankcard">
								<option value="${bankcard.getId()}">${bankcard.getName()}</option>
							</c:forEach>
						</select>
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="form-group">
						<label for="withdraw_money">提现金额：</label>
						<input type="number" class="form-control" id="withdraw_money" placeholder="提现金额">
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="form-group">
						<label for="withdraw_password">账户密码：</label>
						<input type="text" class="form-control" id="withdraw_password" placeholder="账户密码">
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="form-group">
						<input type="button" onclick="withdraw()" class="form-control" value="点击提现">
					</div>
					
				</div>
			</div>
		</div>
		
		<div id="recharge_div" class="panel panel-default">
			<div class="panel-body">
				<div class="form-inline" style="display: inline-block; width:100%;">
				
					<div style="display: inline-block;" class="form-group">
						<select id="recharge_bankcard" class="form-control">
							<option value="0" disabled selected style='display: none;'>选择银行卡</option>
							<c:forEach items="${requestScope.bankcards}" var="bankcard">
								<option value="${bankcard.getId()}">${bankcard.getName()}</option>
							</c:forEach>
						</select>
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="form-group">
						<label for="recharge_money">充值金额：</label>
						<input type="number" class="form-control" id="recharge_money" placeholder="充值金额">
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="form-group">
						<label for="recharge_password">支付密码：</label>
						<input type="text" class="form-control" id="recharge_password" placeholder="支付密码">
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="form-group">
						<input type="button" onclick="recharge()" class="form-control" value="点击充值">
					</div>
					
				</div>
			</div>
		</div>
		
		<div id="addBankcard_div" class="panel panel-default">
			<div class="panel-body center-block">
				<div class="form-group" style="display: inline-block; width:100%;">
				
					<div class="form-horizontal">
						<div class="form-group">
							<label for="addBankcard_number" class="col-sm-2 control-label">银行卡号</label>
							<div class="col-sm-10">
								<input id="addBankcard_number" style="width:80%" type="text" 
									class="form-control" placeholder="请输入银行卡号">
							</div>
						</div>
						
						<div class="form-group">
							<label for="addBankcard_name" class="col-sm-2 control-label">银行名</label>
							<div class="col-sm-10">
								<input id="addBankcard_name" style="width:80%" type="text" 
									class="form-control" placeholder="请输入银行卡名">
							</div>
						</div>
						
						<div class="form-group">
							<label for="addBankcard_password" class="col-sm-2 control-label">银行卡密码</label>
							<div class="col-sm-10" style="display: inline">
								<input id="addBankcard_password" style="width:60%; display: inline" type="password" 
									class="form-control" placeholder="请输入银行卡支付密码">
								<input type="button" value="提交" class="btn btn-default" 
									onclick="addBankcard()" style="display: inline; width: 20%"/>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>

		<div id="bankcard" class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title" style="display: inline-block;">银行卡详情</div> &nbsp;&nbsp;&nbsp;
				<div id="bankcard2" style="display: inline-block;">
					<select id="select_bankcard" class=form-control name="select_bankcard">
						<option value="0" disabled selected style='display: none;'>选择银行卡</option>
						<c:forEach items="${requestScope.bankcards}" var="bankcard">
							<option value="${bankcard.getId()}">${bankcard.getName()}</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						$("#select_bankcard").change(function() {
							change_bankcard($(this).children('option:selected').val());
						})
					</script>
				</div>
			</div>
			<div class="panel-body">
				
				<input id="bankcardId" style="display: none" type="text" />
				<div class="table-responsive ">
					<table class="table table-striped table-bordered">
						<thead id="bankcard_head">
							<tr>
								<th style="text-align: center">银行卡名</th>
								<th style="text-align: center">银行卡号</th>
								<th style="text-align: center">状态</th>
								<th style="text-align: center">现有金额</th>
								<th style="text-align: center">操作</th>
							</tr>
						</thead>
						<tbody id="bankcard_body">
							<tr>
								<td id="bankcard_name" style="text-align: center"></td>
								<td id="bankcard_number" style="text-align: center"></td>
								<td id="bankcard_state" style="text-align: center"></td>
								<td id="bankcard_money" style="text-align: center"></td>
								<td id="bankcard_operation" style="text-align: center">
									<button class="btn btn-warning" id="bankcard_forzen" onclick="forzen($('#bankcardId').val())"> 冻结 </button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>