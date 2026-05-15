// Importa entrada e saída do terminal
import { stdin, stdout } from 'process'

// Importa a interface de leitura do terminal
import { createInterface } from 'node:readline/promises'

// Cria a interface de comunicação com o terminal
const consoleInterface = createInterface({
    input: stdin,
    output: stdout
})

// Solicita um número ao usuário
const numero = Number(
    await consoleInterface.question(
        'Digite um número:\n '
    )
)

// Função responsável por calcular e exibir a tabuada
function calcularTabuada(numero){

    // Verifica se o valor informado é um número válido
    if (isNaN(numero)) {
        console.log('Digite um número válido.')
        return
    }

    // Executa um laço de repetição de 1 até 9
    for (let i = 1; i <= 9; i++) {

        // Calcula o resultado da multiplicação
        const resultado = numero * i

        // Exibe a operação e o resultado no terminal
        console.log(`${numero} x ${i} = ${resultado}`)
    }
}

// Chama a função passando o número digitado
calcularTabuada(numero)

// Fecha a interface do terminal
consoleInterface.close()