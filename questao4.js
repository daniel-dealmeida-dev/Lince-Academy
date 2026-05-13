// Importa entrada e saída do terminal
import { stdin, stdout } from 'process'

// Importa interface de leitura do terminal
import { createInterface } from 'node:readline/promises'

// Cria a interface do terminal
const consoleInterface = createInterface({
    input: stdin,
    output: stdout
});

// Lê o primeiro número digitado pelo usuário
const numero1 = Number(
    await consoleInterface.question("Digite o primeiro número:\n ")
)

// Lê o segundo número digitado pelo usuário
const numero2 = Number(
    await consoleInterface.question("Digite o segundo número:\n ")
)

// Fecha a interface do terminal
consoleInterface.close()

// Calcula o MMC entre dois números
function minimoMultiplo(numero1, numero2){

    // Define o maior número como valor inicial do MMC
    let mmc = numero1 > numero2 ? numero1 : numero2;

    // Executa o loop até encontrar o MMC
    while (true) {

        // Verifica se o número é divisível pelos dois valores
        if (mmc % numero1 === 0 && mmc % numero2 === 0) {

            // Exibe o MMC encontrado
            console.log(`O mmc é: ${mmc}`);
            return
        }

        // Incrementa o valor para testar o próximo número
        mmc++;
    }
}

// Executa a função
minimoMultiplo(numero1, numero2)