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

