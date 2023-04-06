var id = 0;
//
//Info Heute
function delinfo_heute(id) {
	document.getElementById('editpopup').style.display="block";
	document.getElementById('editpopupiframe').src="entryedit.php?id=" + id + "&mode=del_info_heute";
}
//
function editinfo_heute(id) {
	document.getElementById('editpopup').style.display="block";
	document.getElementById('editpopupiframe').src="entryedit.php?id=" + id + "&mode=editinfo__heute";
}
//
//Info Morgen
function delinfo_morgen(id) {
	document.getElementById('editpopup').style.display="block";
	document.getElementById('editpopupiframe').src="entryedit.php?id=" + id + "&mode=del_info_morgen";
}
//
function editinfo_morgen(id) {
	document.getElementById('editpopup').style.display="block";
	document.getElementById('editpopupiframe').src="entryedit.php?id=" + id + "&mode=editinfo__morgen";
}
//
//
//Plan Heute
function delplan_heute(id) {
	document.getElementById('editpopup').style.display="block";
	document.getElementById('editpopupiframe').src="entryedit.php?id=" + id + "&mode=del_plan_heute";
}
//
function editplan_heute(id) {
	document.getElementById('editpopup').style.display="block";
	document.getElementById('editpopupiframe').src="entryedit.php?id=" + id + "&mode=editplan__heute";
}
//
//Plan Morgen
function delplan_morgen(id) {
	document.getElementById('editpopup').style.display="block";
	document.getElementById('editpopupiframe').src="entryedit.php?id=" + id + "&mode=del_plan_morgen";
}
//
function editplan_morgen(id) {
	document.getElementById('editpopup').style.display="block";
	document.getElementById('editpopupiframe').src="entryedit.php?id=" + id + "&mode=editplan__morgen";
}