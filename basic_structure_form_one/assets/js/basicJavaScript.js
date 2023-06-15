/*VARIABLES*/
console.log("*****VARIABLES*******");
/*STRING*/
let srtName = "12.9";
/*NUMBER*/
let numDocument = 12.5;
/*BOOLEAN*/
let validations = true;
/*ARRAY*/
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

console.log("*****OPERACIONES MATEMATICAS*******");
/*OPERACIONES MATEMATICAS*/
result = num1 - num2;
console.log(result);
result = num1 / num2;
console.log(result);
result = num1 + num2;
console.log(result);
console.log("*****VALIDAR TIPO DE DATO*******");
/*VALIDACIÓN DE TIPO DE DATOS*/
console.log(typeof num1);
console.log(typeof num2);
console.log("*****CONDICIONAL*******");
/*CONDICIONAL IF MIENTRAS
Use if to specify a block of code to be executed, if a specified condition is true
Use else to specify a block of code to be executed, if the same condition is false
Use else if to specify a new condition to test, if the first condition is false*/

if (num1 === num2) {
  /*Validación lógica*/
  console.log("IGUALES");
  /*Contenido dentro de la comprobación verdadera*/
} else if (num1 > num2) {
  console.log("MAYOR ES NÚMERO 1");
} else {
  /*Cuando no se cumple ningana de las validaciones indicadas, el defecto ingresa al else*/
  console.log("MAYOR ES NUMERO 2");
}

console.log("*******VALIDACIÓN IF LOGIN*****");
let user = "diego@gmail.com";
let pass = "123456789";

let arrayDBUser = new Array("diegocasallas@gmail.com", "123456789");

if (user == arrayDBUser[0] && pass == arrayDBUser[1]) {
  console.log("Ir a la vista de home");
} else {
  console.log("Validar Usuario y contraseña");
}

console.log("*****SWITCH*******");
/*Use switch to specify many alternative blocks of code to be executed*/
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

console.log("******FUNCION******");
/*Se ejecuta la función*/


validateOperations();


/*Función de validacinón de operaciones*/
function validateOperations() {
  console.log("******CICLOS FOR ******");
  /*Creación de arreglos */
  let auxNum1 = new Array();
  let auxNum2 = new Array();
  let auxOpe = new Array("+", "-", "*", "/");

  for (i = 0; i < 10; i++) {
    //Creación de nuevos números
    num1 = num1 + i;
    auxNum1[i] = num1;
    num2 = num1 * 2;
    auxNum2[i] = num2;
    ope = auxOpe[cont];
    //Validación del contador
    if (cont == 3) {
      cont = 0;
    } else if (cont >= 0) {
      cont = cont + 1;
    }
    ope = auxNum1[i] + ope + auxNum2[i];
    result = eval(ope);
    console.log(result);
    console.log("***** " + i);
  }
}


console.log("******CICLO WHILE ******");
//El ciclo while va iterar hasta que  se cumpla la condición 
let condition=true;
while(condition){
  console.log("Ciclo While");
if(condition){
  condition=false;
}
    console.log(condition);
}
/*La instrucción do...while crea un bucle que ejecuta una instrucción específica hasta que la condición de prueba se evalúa como falsa. La condición se evalúa después de ejecutar la instrucción, lo que da como resultado que la instrucción especificada se ejecute al menos una vez.
*/ 
result = '';
let j = 0;

do {
  j = j + 1;
  result = result + j;
} while (j < 5);

console.log(result);
