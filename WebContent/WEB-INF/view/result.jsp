<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果页</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<script src="resources/js/bootstrap.js"></script>
<style>
#db-nav{
background-color: #f6f6f1;
position:relative;
}
.nav{
width:100%;
min-width:1040px;
overflow:hidden;
zoom:1;
margin-bottom:40px;
}
#db-nav .nav-wrap{
border-color: #e9e9e2;
}
.nav  .nav-wrap{
border-bottom:1px solid #e5ebe4;
}
div{
display:block;
}
.nav .nav-primary {
    width: 1040px;
    margin: 0 auto;
    overflow: visible !important;
    position: relative;
    padding: 10px 0 5px;
    zoom: 1;
}
.nav .nav-logo {
    float: left;
    height: 56px;
    width: 145px;
    margin: 0 13px 0 0;
}
.nav-search {
    margin-left: 145px;
    overflow: visible !important;
    position: relative;
    zoom: 1;
    padding: 10px 0 15px 0;
}
form {
    margin: 0;
    padding: 0;
    border: 0px;
	display:block;
}
.nav-search fieldset {
    border: none;
    padding: 0;
    margin: 0;
    position: static;
}
.nav-search .inp {
    float: left;
    width: 470px;
    height: 34px;
    text-align: center;
    margin-right: -3px;
    cursor: text;
    background-color: #FFFAF0;
}
.nav-search .inp-btn {
    position: relative;
    left: -1px;
    width: 37px;
    height: 34px;
    zoom: 1;
    overflow: hidden;
}
#wrapper {
    width: 1040px;
    margin:0 auto;
}
#content{
	min-height:420px;
}
.clearfix{
	display:block;
	zoom:1;
	
}
.clearfix:after {
    content: ".";
    display: block;
    height: 0;
    clear: both;
    visibility: hidden;
}
.breadcrumb > li + li:before {
    color: #CCCCCC;
    content: "/ ";
    padding: 0 5px;
}
.search_list .article{
	width:675px;
	float:left;
	padding-right:40px;
}
.greyinput{
	color:#ccc;
}
.rr{
	float:right;
}
a:link{
	color:#3377aa;
	text-decoration: none;
}
a:focus{
	background-color:transparent;
}
a:visited{
	color:#666699;
	text-decoration: none;
}
a{
	cursor: pointer;
}
.pro-list{
	margin-top:5px;
}
ul{
	list-style:none;
	margin:0;
	padding:0;
}
.pro-item, .site-item {
    overflow: hidden;
    zoom: 1;
    border-top: 1px dashed #ddd;
    padding: 20px 0 10px;
}
li{
	display:list-item;
}
.pro-item .pic{
	float:left;
	margin-right:20px;
}
.pro-item .info, .site-item .info {
    overflow: hidden;
    zoom: 1;
    color: #666;
}
.pro-item .pub {
    margin: 6px 0 8px;
}
p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}
.paginator {
    color: #aaa;
    line-height: 150%;
    text-align: center;
}
.paginator .prev {
    margin-right: 20px;
}
.paginator .thispage {
    color: #fff;
    background: #83BF73;
}
.paginator a, .thispage, .break {
    padding: 0px 4px;
    margin: 2px;
}
.paginator{
	line-height:150%;
	text-align:center;
}
.paginator .break {
    color: #999;
}
.paginator .next {
    margin-left: 20px;
}
link{
	display:none;
}
</style>
</head>
<body>
	<div style="position:relative;">
		<div style="height:100%;with:100%; background-color: #FFFAF0;">
			<!-- 搜索栏部分开始 -->
			<div class="nav" id="db-nav" style="height:50px;">
				<div class="nav-wrap">
					<div class="nav-primary">
						<div class="nav-logo">
							<a href="resources/img/img01.jpg">火焰筹</a>
						</div>
						<div class="nav-search">
							<form action="#" method="get">
								<fieldset>
									<legend>Search:</legend>
									<label for="/"></label>
									<div class="inp">
										<input id="inp-query" name="search-text" size="22" maxlength="50" placeholder="项目名、项目编号、申请人员姓名"  
											autocomplete="off">
									</div>
									<div class="inp-btn">
										<input type="submit" value="搜索">
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 搜索栏部分结束 -->
			<!-- 搜索结果显示部分开始 -->
			<div id="wrapper">
				<div id="content">
					<h1>项目查询结果:</h1>
					<div class="search_list clearfix">
						<div class="article">
							<div class="pro_list">
								<div class="clearfix">
									<span class="rr greyinput">
									综合排序&nbsp;&nbsp;
									<a href="#">按申请时间排序</a>
									<a href="#">按进度递减排序</a>
									</span>
									::after 
								</div>
								<ul class="pro-list">
								<!-- 项目列表 -->
									<li class="pro-item">
										<div class="pic">
											<img style="height:240px;width:180px;" src="resources/img/img02.jpg">
										</div>
										<div class="info">
											<h2>
												<a href="/" title="项目名" onclick="">项目名</a>
											</h2>
											<div class="pub">
												<ul class="breadcrumb">
    												<li class="active"class="active">申请人</li>
    												<li class="active">申请时间</li>
    												<li class="active">十一月</li>
												</ul>	
											</div>
											<p>项目简介</p>
										</div>
									</li>
									<li class="pro-item">
										<div class="pic">
											<img style="height:240px;width:180px;" src="resources/img/img02.jpg">
										</div>
										<div class="info">
											<h2>
												<a href="/" title="项目名" onclick="">项目名</a>
											</h2>
											<div class="pub">
												<ul class="breadcrumb">
    												<li class="active"class="active">申请人</li>
    												<li class="active">申请时间</li>
    												<li class="active">十一月</li>
												</ul>	
											</div>
											<p>项目简介</p>
										</div>
									</li>
									<li class="pro-item">
										<div class="pic">
											<img style="height:240px;width:180px;" src="resources/img/img02.jpg">
										</div>
										<div class="info">
											<h2>
												<a href="/" title="项目名" onclick="">项目名</a>
											</h2>
											<div class="pub">
												<ul class="breadcrumb">
    												<li class="active"class="active">申请人</li>
    												<li class="active">申请时间</li>
    												<li class="active">十一月</li>
												</ul>	
											</div>
											<p>项目简介</p>
										</div>
									</li>
									<li class="pro-item">
										<div class="pic">
											<img style="height:240px;width:180px;" src="resources/img/img02.jpg">
										</div>
										<div class="info">
											<h2>
												<a href="/" title="项目名" onclick="">项目名</a>
											</h2>
											<div class="pub">
												<ul class="breadcrumb">
    												<li class="active"class="active">申请人</li>
    												<li class="active">申请时间</li>
    												<li class="active">十一月</li>
												</ul>	
											</div>
											<p>项目简介</p>
										</div>
									</li>
									<li class="pro-item">
										<div class="pic">
											<img style="height:240px;width:180px;" src="resources/img/img02.jpg">
										</div>
										<div class="info">
											<h2>
												<a href="/" title="项目名" onclick="">项目名</a>
											</h2>
											<div class="pub">
												<ul class="breadcrumb">
    												<li class="active"class="active">申请人</li>
    												<li class="active">申请时间</li>
    												<li class="active">十一月</li>
												</ul>	
											</div>
											<p>项目简介</p>
										</div>
									</li>
								</ul>
								<!-- 分页页码部分 -->
								<div class="paginator">
									<span class="prev"> 
									《前页
									</span>
									<span class="thispage">1</span>
									<a href="">2</a>
									<a href="">3</a>
									<a href="">4</a>
									<a href="">5</a>
									<a href="">6</a>
									<a href="">7</a>
									<a href="">8</a>
									<a href="">9</a>
									<span class="break">...</span>
									<a href="">300</a>
									<span class="next">
										<link rel="next" href="">
										<a href="">后页》</a>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
		</div>
	</div>

</body>
</html>