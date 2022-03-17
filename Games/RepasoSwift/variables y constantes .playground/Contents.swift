import UIKit

var greeting = "Hello, playground"
 print(greeting)






//parates de una variablevariables
//palabraReservada     -   nombre    -     tipo     -   operadorDeAsisgnacion   -  valor
       var               numeroEntero      :Int                   =                  2





//funciones y aguments label

//La funcion mas usada en un inicio y la concatenacion de variables/constantes
                                print("Hola")



//Argumentos o parametros de entrada de la funcion print
        print("Hola", separator: "...")



//Estructura de una funcion (ejemplo funcion suma )

func suma(){
    print("el resultado es dos")
}

//llamada de funcion

suma()



//Estructura de una funcion con parametros de entrada

func sumaXY(X:Int, Y:Int){
    print(X + Y)
}

sumaXY(X: 10, Y: 8)



//funcion con retorno

func sumaXYRetorno(numeroUno:Int, numeroDos:Int) -> Int {
   // print(x + y)
    return numeroUno + numeroDos
}

var resultado = sumaXYRetorno(numeroUno: 2, numeroDos: 2)
print(resultado)




// argument labels

func saluda(a:String, de:String){
    print("mando saludos a \(a) de parte de \(de)")
}

saluda(a: "juan", de: "luz")




// operador guion _

func saludos(_ destinatario:String, departe:String){
    print("mando saludos a \(destinatario) de parte de \(departe)")
}

saludos("juan", departe: "luz")




// estructuras (Struct)

struct calculadora {
    
    //var se les llama propiedades
    var numeroUno:Int
    var numeroDos:Int
    
    // a las fuciones se les llama metodos
    func suma()  -> Int {
        print(numeroUno + numeroDos)
        return numeroUno +  numeroDos
        
    }
    func multiplicacion(numeroUno:Int, numeroDos:Int) -> Int {
        return numeroUno * numeroDos
    }
}

var plus = calculadora(numeroUno: 10, numeroDos: 8)

print(plus.suma())
    
