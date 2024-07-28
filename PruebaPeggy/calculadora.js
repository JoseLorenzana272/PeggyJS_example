import { parse } from '/PruebaPeggy/operaciones.js'

const editor = document.getElementById('editor')
const btn = document.getElementById('btn')
const ast = document.getElementById('ast')
const salida = document.getElementById('salida')

const recorrer = (nodo) => {
    switch (nodo.tipo) {
        case 'cadena':
            return nodo.valor
        case 'numero':
            return nodo.valor
        case 'suma':
            return recorrer(nodo.num1) + recorrer(nodo.num2)
        case 'resta':
            return recorrer(nodo.num1) - recorrer(nodo.num2)
        case 'multiplicacion':
            return recorrer(nodo.num1) * recorrer(nodo.num2)
        case 'division':
            return recorrer(nodo.num1) / recorrer(nodo.num2)
        case 'print':
            const contenido = recorrer(nodo.contenido)
            salida.innerHTML = contenido
            return contenido
        default:
            throw new Error(`Tipo de nodo desconocido: ${nodo.tipo}`)
    }
}

btn.addEventListener('click', () => {
    try {
        const codigoFuente = editor.value
        const arbol = parse(codigoFuente)
        ast.innerHTML = JSON.stringify(arbol, null, 2)
        recorrer(arbol)
    } catch (e) {
        ast.innerHTML = `Error: ${e.message}`
        salida.innerHTML = ''
    }
})
