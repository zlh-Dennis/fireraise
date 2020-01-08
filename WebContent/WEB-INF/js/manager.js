function audit(id, state){
	alert("审核发起");
	
	//获取网络连接对象
    var xmlhttp = new XMLHttpRequest();
    //设置请求方式，请求路径，是否异步
    xmlhttp.open("GET", "/fireraise/manager_audit?applicantId=" + id + "&state=" + state, true);
    xmlhttp.send();
    
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            var text = xmlhttp.responseText;
            
            if(text == 'success'){
            	alert("审核完成");
            	location.reload(true);
            } else {
            	alert("审核失败,请重试");
            	location.reload(true);
            }
        }
    }
}