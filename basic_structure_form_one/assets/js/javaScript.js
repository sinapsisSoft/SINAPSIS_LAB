/*VARIABLES*/
console.log("*****VARIABLES*******");
let srtName = "12.9";
let numDocument = 12.5;
let validations = true;
let arrayList = new Array(
  "Diego",
  "Laura",
  "Camilo",
  "Juan",
  "Diego",
  "Laura",
  "Camilo",
  "Juan",
  "DIEGO 2",
  "DIEGO 3"
);
let num1 = 30;
let num2 = 30;
let ope;
let result;

console.log("*****TIPO DE DATOS*******");
/*TIPO DE DATOS*/
console.log(srtName);
console.log(numDocument);
console.log(validations);
console.log(arrayList);

/*console.log(result);
result=num1-num2;
console.log(result);
result=num1/num2;
console.log(result);

console.log(result);


result=num1+num2;
console.log(typeof(num1));
console.log(typeof(num2));
if(num1===num2){
  console.log("IGUALES");
}else if(num1>num2){
  console.log("MAYOR ES NUMERO 1");
}else{
  console.log("MAYOR ES NUMERO 2");
}

console.log("*******VALIDACIÓN IF LOGIN*****");
let user="diego@gmail.com";
let pass="123456789";

let arrayDBUser=new Array('diegocasallas@gmail.com','123456789');

if((user==arrayDBUser[0]) && (pass==arrayDBUser[1])){
  console.log("Ir a la vista de home");
}else{
  console.log("Validar Usuario y contraseña");
}
*/
console.log("*****SWITCH*******");
let operacion = "/";
let cont = 0;

switch (operacion) {
  case "+":
    ope = operacion;
    break;
  case "*":
    ope = operacion;
    break;
  case "-":
    ope = operacion;

    break;
  case "/":
    ope = operacion;
    break;
}
console.log(ope);
ope = num1 + ope + num2;
result = eval(ope);
validateOperations();
console.log("******FUNCION******");
validateOperations() ;
validateOperations() ;
function validateOperations() {
  console.log("******CICLOS FOR ******");
  let auxNum1 = new Array();
  let auxNum2 = new Array();
  let auxOpe = new Array("+", "-", "*", "/");

  for (i = 0; i < 10; i++) {
    num1 = num1 + i;
    auxNum1[i] = num1;
    num2 = num1 * 2;
    auxNum2[i] = num2;

    ope = auxOpe[cont];
    if (cont == 3) {
      cont = 0;

      cont = cont + 1;
    } else {
      console.log(i);
      cont = cont + 1;
    }

    ope = auxNum1[i] + ope + auxNum2[i];
    result = eval(ope);

    console.log(result);
    console.log("***** " + i);
  }
}
