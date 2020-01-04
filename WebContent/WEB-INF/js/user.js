function forzen(id){
	//获取网络连接对象
    var xmlhttp = new XMLHttpRequest();
    //设置请求方式，请求路径，是否异步
    xmlhttp.open("GET", "/fireraise/user_forzen?applicantId=" + id, true);
    xmlhttp.send();
    
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            var text = xmlhttp.responseText;
            
            if(text == 'success'){
            	alert("申请冻结成功");
            	location.reload(true);
            } else {
            	alert("申请冻结失败,请重试");
            	location.reload(true);
            }
        }
    }
}