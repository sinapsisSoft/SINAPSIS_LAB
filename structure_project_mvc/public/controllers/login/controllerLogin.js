/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:21/10/2023
 *Description:...
 */
/*Function change type input*/
var inputType = new Array("text", "password");
var iconsType = new Array("bi-shield-lock", "bi-shield-minus");
var inputsCompare = new Array("user_password_repeat", "user_password");
var objModal = document.getElementById('appModal');
var objForm = document.getElementById('modalForm');
var arrayActions = new Array('show', 'create', 'edit', 'update', 'delete');
var folder = "login/";
if(objModal){
var modal = new bootstrap.Modal(objModal);
}
var primary = "user_id";
var dataModel = 'data';
var dataResponse = 'response';
var url = "";
function changeTypeInput(idInput, objBtn) {

  var objInput = document.getElementById(idInput);
  var obj = objBtn.firstChild;


  if (objInput.type == inputType[0]) {
    objInput.type = inputType[1];
    obj.classList.remove(iconsType[1]);
    obj.classList.add(iconsType[0]);

  } else {
    objInput.type = inputType[0];
    obj.classList.remove(iconsType[0]);
    obj.classList.add(iconsType[1]);
  }

}
/*Function validate data*/
function validateData() {

  return compareData();
}
/*Function to compare data from two inputs.*/
function compareData() {

  var result = document.getElementById(inputsCompare[0]).value == document.getElementById(inputsCompare[1]).value ? true : false;
  if (!result) {
    alert("Validate input , different values");
  }
  return result;
}

/*Function show - get data  user*/
function show(id) {
  url = APP_URL_PUBLIC + folder + arrayActions[0] + "?" + primary + "=" + id;
  locationsPage(url);
}
/*Function edit - get data  user*/
function edit(id) {
  url = APP_URL_PUBLIC + folder + arrayActions[2] + "?" + primary + "=" + id;
  locationsPage(url);
}
/*Function delete - get data  user*/
function delete_(id) {
  let message;
if (confirm("Delete User!") == true) {
  message = "Delete OK!";
  url = APP_URL_PUBLIC + folder + arrayActions[4] + "?" + primary + "=" + id;
  
} else {
  message = "Delete canceled!";
}
alert(message);
locationsPage(url);
}
/*Function show modal*/
function showModal() {
  modal.show();
  resetForm();
}
/*Function hidden modal*/
function hiddenModal() {
  modal.hide();
}

/*Function reset form*/
function resetForm() {
  objForm.reset();
}
/*Function return page*/
function returnPage() {

  url = APP_URL_PUBLIC + folder + arrayActions[0];
  locationsPage(url);
}

/*Function locations page*/
function locationsPage(url) {
  window.location.assign(url);
}