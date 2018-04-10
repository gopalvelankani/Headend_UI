
function showUser(str) {
    if (str == "") {
        document.getElementById("txtHint").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("txtHint").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("POST","GE1.php?q="+str,true);
        xmlhttp.send();
    }
}
function showUser1(str) {
    if (str == "") {
        document.getElementById("demo6").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("demo6").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("POST","GE1.php?q="+str,true);
        xmlhttp.send();
    }
}
function showUser2(str) {
    if (str == "") {
        document.getElementById("demo1").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("demo1").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("POST","GE1.php?q="+str,true);
        xmlhttp.send();
    }
}
function showUser3(str) {
    if (str == "") {
        document.getElementById("demo2").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("demo2").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("POST","GE1.php?q="+str,true);
        xmlhttp.send();
    }
}
function showUser4(str) {
    if (str == "") {
        document.getElementById("demo3").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("demo3").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("POST","GE1.php?q="+str,true);
        xmlhttp.send();
    }
}
function showUser5(str) {
    if (str == "") {
        document.getElementById("demo5").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("demo5").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("POST","GE1.php?q="+str,true);
        xmlhttp.send();
    }
}
function showUser6(str) {
    if (str == "") {
        document.getElementById("demo7").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("demo7").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("POST","ecmg.php?q="+str,true);
        xmlhttp.send();
    }
}
