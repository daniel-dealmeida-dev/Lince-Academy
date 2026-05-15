// Importa entrada e saída do terminal
import { stdin, stdout } from 'process'

// Importa interface de leitura do terminal com suporte a Promises (permite usar await)
import { createInterface } from 'node:readline/promises'

// Cria a interface do terminal para interação com o usuário
const consoleInterface = createInterface({
    input: stdin,
    output: stdout
})

// Lê o primeiro número digitado pelo usuário
let numero1 = Number(
    await consoleInterface.question('Digite o primeiro número:\n ')
)

// Lê o segundo número digitado pelo usuário
let numero2 = Number(
    await consoleInterface.question('Digite o segundo número:\n ')
)



// Função que calcula a subtração entre dois números e retorna o valor absoluto
function calcularSubtracao(numero1, numero2) {

    // Calcula a diferença entre os números
    const resultado = numero1 - numero2

    // Retorna o valor absoluto (sempre positivo)
    if (resultado < 0) {
        return resultado * -1
    }

    return resultado
}

// Executa a função e mostra o resultado no console
const resultadoFinal = calcularSubtracao(numero1, numero2)

console.log(`O resultado da subtração é: ${resultadoFinal}`)

// Fecha a interface do terminal
consoleInterface.close()