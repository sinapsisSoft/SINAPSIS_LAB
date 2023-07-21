/*
Author:DIEGO CASALLAS
Date:17/06/2023
Descriptions:This function is for validating forms and getting data
*/

//Constant
const messageError = new Array("Validar longitud", "Validar campos");

//Variables
//objForm is the variable of the form object
//objInputs is the variable of the input object
//objForm is the variable of the form object

var objForm;
var objInputs;
var objectDataForm= new Object();
//Function for validate inputs form
function validateInput(objInput) {
  let validate = true;
  switch (objInput.type) {
    case "text":
      if (objInput.value == "" || objInput.length == 0) {
        validate = false;
      }
      break;
    case "password":
      if (objInput.value == "" || objInput.value.length == 0) {
        validate = false;
      }
      break;
    case "number":
      if (objInput.value == "" || objInput.value.length == 0) {
        validate = false;
      }
      break;
  }
  debugger;
  return validate;
}

//Function for get data form
function getDataForm(id) {
  objForm = document.getElementById(id);
  objInputs = objForm.querySelectorAll("input");
  let arrayData = new Array();
  for (i = 0; i < objInputs.length; i++) {
    let objAux = objInputs[i].type;
    switch (objAux) {
      case "submit":
        break;
      default:
var objectDataForm= new Object();

        arrayData.push(objInputs[i].value);
    }
  }
  console.log(arrayData);
}

//Function for get data form
function validateForm(id, e) {
  objForm = document.getElementById(id);
  objInputs = objForm.querySelectorAll("input");
  let valieteForm = true;
  for (i = 0; i < objInputs.length; i++) {
    let objAux = objInputs[i].type;
    debugger;
    switch (objAux) {
      case "submit":
        break;
      default:
        if (!validateInput(objInputs[i])) {
          objInputs[i].focus();
          alert(messageError[1]);
          valieteForm = false;
          break;
        }
    }
  }
  if (valieteForm) {
    getDataForm(id);
  }
  e.preventDefault();
}
