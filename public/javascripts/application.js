jQuery.noConflict();

jQuery(document).ready(function() {
	jQuery("a#compose").fancybox({'zoomSpeedIn': 0, 'zoomSpeedOut': 0, 'frameWidth': 630, 'frameHeight': 660, 'hideOnContentClick': false});
});

function show_details(div,div2,div3,div4,div5,div6,div7) {
	e = document.getElementById(div4);
	$(div).style.display = 'inline';
  $(div3).style.display = 'inline';
  $(div2).style.display = 'none';
	$(div5).style.display = 'none';
	$(div6).style.display = 'none';
	$(div7).style.display = 'inline';
	if (e.style.height.split('px')[0]<250) {e.style.height = 250 + 'px';
	} else {e.style.height = 72 + 'px';}
}

function hide_details(div,div2,div3,div4,div5,div6,div7) {
	e = document.getElementById(div4);
	$(div).style.display = 'none';
  $(div3).style.display = 'none';
  $(div2).style.display = 'inline';
	$(div5).style.display = 'block';
	$(div6).style.display = 'inline';
	$(div7).style.display = 'none';
	if (e.style.height.split('px')[0]<250) {e.style.height = 250 + 'px';
	} else {e.style.height = 72 + 'px';}

}

var ie = (document.all) ? true : false;
function hideID(objID){
    var element = (ie) ? document.all(objID) : document.getElementById(objID);
    element.style.display="none"
}
function showID(objID){
    var element = (ie) ? document.all(objID) : document.getElementById(objID);
    element.style.display="block"
}

 function changePasswordBox()
 {
    document.getElementById('password-on').style.display='none';
    document.getElementById('password-off').style.display='';
    document.getElementById('password').focus();
 }
 function restorePasswordBox()
 {
    if(document.getElementById('password').value=='')
    {
      document.getElementById('password-on').style.display='';
      document.getElementById('password-off').style.display='none';
    }
 }

 function changeLoginBox()
 {
    document.getElementById('login-on').style.display='none';
    document.getElementById('login-off').style.display='';
    document.getElementById('login').focus();
 }
 function restoreLoginBox()
 {
    if(document.getElementById('login').value=='')
    {
      document.getElementById('login-on').style.display='';
      document.getElementById('login-off').style.display='none';
    }
 }

