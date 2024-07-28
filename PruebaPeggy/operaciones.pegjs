// operaciones.pegjs

Expresion
  = Print

Print
  = "print" "(" contenido:Contenido ")" { return { tipo: "print", contenido } }

Contenido
    = Cadena
    / Suma

Suma
    = num1:Producto "+" num2:Suma { return { tipo: "suma", num1, num2 } }
    / num1:Producto "-" num2:Suma { return { tipo: "resta", num1, num2 } }
    / Producto

Producto
    = num1:Numero "*" num2:Producto { return { tipo: "multiplicacion", num1, num2 } }
    / num1:Numero "/" num2:Producto { return { tipo: "division", num1, num2 } }
    / Numero

Cadena
  = '"' texto:[^"]* '"' { return { tipo: "cadena", valor: texto.join("") } }

Numero
    = numero:[0-9]+ { return { tipo: "numero", valor: parseInt(numero.join(""), 10) } }



// 2 * (3 + 4) - 5 / (1 + 1)
// |
// Expresion1 -> Suma1
// Suma1 -> Producto1 - Suma2
// Producto1 -> Primario1 * Producto2
// Primario1 -> (Expresion2)
// Expresion2 -> Suma3
// Suma3 -> Producto3 + Suma4
// Producto3 -> Numero1
// Numero1 -> 3
// Suma4 -> Producto4
// Producto4 -> Primario2
// Primario2 -> Numero2
// Numero2 -> 4

