var id = 0;
//
function delpopup(id) {
	document.getElementById('editpopup').style.display="block";
	document.getElementById('editpopupiframe').src="useredit.php?id=" + id + "&mode=delete";
}
//
function editpopup(id) {
	document.getElementById('editpopup').style.display="block";
	document.getElementById('editpopupiframe').src="useredit.php?id=" + id + "&mode=edit";
}
//
function newuserpopup() {
	document.getElementById('editpopup').style.display="block";
	document.getElementById('editpopupiframe').src="useredit.php?id=0&mode=new";
}
