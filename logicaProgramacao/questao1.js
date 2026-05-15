// Importa entrada e saída do terminal
import { stdin, stdout } from 'process'

// Importa a interface de leitura do terminal
import { createInterface } from 'node:readline/promises'

// Armazena o resultado da divisão
let divisao = 0;

// Cria a interface do terminal
const consoleInterface = createInterface({
    input: stdin,
    output: stdout
});

// Lê o primeiro número
const numero1 = Number(
    await consoleInterface.question('Digite o primeiro número:\n ')
)

// Lê o segundo número
const numero2 = Number(
    await consoleInterface.question('Digite o segundo número:\n ')
)

// Divide o maior número pelo menor
function calcularSoma(numero1, numero2){

    // Verifica qual número é maior
    if (numero1 > numero2){

        // Divide o primeiro pelo segundo
        return divisao = numero1 / numero2 
    }

    // Divide o segundo pelo primeiro
    return divisao = numero2 / numero1
}

// Exibe o resultado
console.log(`A resposta é: ${calcularSoma(numero1, numero2)}`)

// Fecha a interface
consoleInterface.close()