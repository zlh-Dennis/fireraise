<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>火焰筹 | 项目申请页面</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var type = '${requestScope.type}';
		if(type == "true")
			alert("申请成功，等待管理员审核");
		if(type == "false")
			alert("申请失败，请稍后再试");
		if(type == "null")
			alert(type);
	}
</script>
</head>
<body>

	<div style="position: relative">
		<div class="center-block" style="width: 50%; left: 20%">
			<div class="modal-header">
				<h3 style="display: inline">项目申请</h3>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h5 id="warnning" style="display: inline; color: red">  </h5>
			</div>
			<br>

			<form name="apply" method="post" action="../fireraise/apply" 
				class="form-horizontal" enctype="multipart/form-data">
			
				<div class="form-group">
					<label for="app_name" class="col-sm-2 control-label">项目名</label>
					<div class="col-sm-10">
						<input name="app_name" style="width:90%" type="text" 
							class="form-control" id="app_name" placeholder="请输入项目名">
					</div>
				</div>

				<div class="form-group">
					<label for="app_target" class="col-sm-2 control-label">目标金额</label>
					<div class="col-sm-10">
						<input name="app_target" style="width:90%" type="number" 
							class="form-control" id="app_target" placeholder="请输入目标金额(整数)">
					</div>
				</div>

				<div class="form-group">
					<label for="register_email" class="col-sm-2 control-label">描述</label>
					<div class="col-sm-10">
						<textarea id="area" class="limit-textarea" rows="5" cols="69" name="app_text" placeholder="请在此处输入文字描述"></textarea>
						<p>	<span id="text-count" class="state">0</span>/1500字 </p>
					</div>
				</div>
				<script type="text/javascript">
					/*字数限制*/
					$("#area").on("input propertychange", function() {
						var $this = $(this), _val = $this.val(), count = "";
						if (_val.length > 1500) {
							$this.val(_val.substring(0, 1500));
						}
						count = 1500 - $this.val().length;
						$("#text-count").text(count);
					});
				</script>

				<div class="form-group">
					<label for="register_phone" class="col-sm-2 control-label">描述图片</label>
					<div class="col-sm-10">
						<input class="input1 input2 input6" type="file" name="app_picture1"	onchange="showImg1(this)"> 
					<img width="280px" id="getImg1">
					</div>
				</div>
				<script type="text/javascript">
					function showImg1(cell) {
						document.getElementById('getImg1').src = window.URL.createObjectURL(cell.files[0]);
					}
				</script>
				
				<div class="form-group">
					<label for="register_phone" class="col-sm-2 control-label">描述图片</label>
					<div class="col-sm-10">
						<input class="input1 input2 input6" type="file" name="app_picture2"	onchange="showImg2(this)"> 
					<img width="280px" id="getImg2">
					</div>
				</div>
				<script type="text/javascript">
					function showImg2(cell) {
						document.getElementById('getImg2').src = window.URL.createObjectURL(cell.files[0]);
					}
				</script>
				
				<div class="form-group">
					<label for="register_phone" class="col-sm-2 control-label">描述图片</label>
					<div class="col-sm-10">
						<input class="input1 input2 input6" type="file" name="app_picture3"	onchange="showImg3(this)"> 
					<img width="280px" id="getImg3">
					</div>
				</div>
				<script type="text/javascript">
					function showImg3(cell) {
						document.getElementById('getImg3').src = window.URL.createObjectURL(cell.files[0]);
					}
				</script>
				
				<input style="display:none" id="submit" type="submit">
			</form>

			<div class="modal-footer">
				<button class="btn btn-default" onclick="$('#submit').click()">注册</button>
			</div>
			
		</div>
	</div>
	
</body>
</html>