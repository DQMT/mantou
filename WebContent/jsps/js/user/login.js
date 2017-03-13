

function inputfocus(){
	$(".error").text("");
}


function md5(){
    var hash=hex_md5(document.getElementById("passWord").value);
    document.getElementById("passWord").value=hash;
    alert(hash);
}    