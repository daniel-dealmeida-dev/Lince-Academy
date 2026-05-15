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

// Função responsável por calcular o fatorial
function calcularFatorial(numero) {

    // Verifica se o número é negativo
    if (numero < 0) {
        return 'Não existe fatorial de número negativo'
    }

    // Verifica se o número é decimal
    if (!Number.isInteger(numero)) {
        return 'Não existe fatorial de número decimal'
    }

    // Variável acumuladora do resultado e inicializada com 1 (fatorial de 0 é 1)
    let fatorial = 1

    // Executa enquanto o número for diferente de 0
    while (numero !== 0) {

        // Multiplica o valor atual do fatorial pelo número
        fatorial *= numero

        // Decrementa o número em 1
        numero--
    }

    // Retorna o resultado final
    return fatorial
}

// Exibe o resultado no terminal
console.log(`O fatorial de ${numero} é: ${
        calcularFatorial(numero)}`)

// Fecha a interface do terminal
consoleInterface.close()