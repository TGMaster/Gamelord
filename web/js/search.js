/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function onclickSearch() {
    xmlHttp = GetXmlHttpObject();
    if (xmlHttp === null) {
        alert("Your browser does not support HTTP Request");
        return;
    }

    var genres = document.getElementById("category");
    var string = document.getElementById("search");
    var btSearch = document.getElementById("searchbtn");

    //		
    var url = "/news";
    url = url + "?category=" + genres.value.trim() + "&searchNews=" + string.value.trim() + "&action=" + btSearch.value.trim();

    xmlHttp.onreadystatechange = function(){
        if (xmlHttp.readyState === 4 || xmlHttp.status === 200) {
            document.getElementById("").innerHTML = "";
        }
    };
    xmlHttp.open("GET", url, true);
    xmlHttp.send();

}

function delete_ChildNode() {
    var parentNodes = document.getElementById("login-bar");
    while (parentNodes.firstChild) {
        parentNodes.removeChild(parentNodes.firstChild);
    }
}

function GetXmlHttpObject() {
    var xmlHttp = null;
    try {
        xmlHttp = new XMLHttpRequest();
    } catch (e) {
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
}