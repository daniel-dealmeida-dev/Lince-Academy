// Importa entrada e saída do terminal
import { stdin, stdout } from 'process'

// Importa interface de leitura do terminal
import { createInterface } from 'node:readline/promises'

// Cria a interface do terminal
const consoleInterface = createInterface({
    input: stdin,
    output: stdout
});

// Array que armazenará os números
const numeros = []

// Solicita 5 números ao usuário
while (numeros.length < 5) {

    const numero = Number(
        await consoleInterface.question('Digite um número:\n ')
    )

    numeros.push(numero)
}

// Fecha a interface
consoleInterface.close()

// Retorna apenas números ímpares
function verificarImpares(numeros) {

    const valoresImpares = numeros.filter(
        numero => numero % 2 !== 0
    )

    return valoresImpares
}

// Exibe os números ímpares
console.log(
    `Os números ímpares são: ${verificarImpares(numeros)}`
)