// Importa stdin e stdout para entrada e saída no terminal
import { stdin, stdout } from 'process'

// Importa a interface de leitura do terminal
import { createInterface } from 'node:readline/promises'

// Cria a interface de comunicação com o terminal
const consoleInterface = createInterface({
    input: stdin,
    output: stdout
})

// Solicita o valor do primeiro cateto
const cateto1 = Number(
    await consoleInterface.question(
        'Digite o valor do primeiro cateto:\n '
    )
)

// Solicita o valor do segundo cateto
const cateto2 = Number(
    await consoleInterface.question('Digite o valor do segundo cateto:\n '
    )
)

// Função responsável por calcular a hipotenusa
function calcularHipotenusa(cateto1, cateto2) {

    // hipotenusa² = cateto1² + cateto2²
    const hipotenusa = Math.sqrt(
        (cateto1 ** 2) + (cateto2 ** 2)
    )

    // Retorna o valor da hipotenusa
    return hipotenusa
}

// Exibe o resultado no terminal
console.log(`O valor da hipotenusa é: ${calcularHipotenusa(cateto1, cateto2)
    }`
)

// Fecha a interface do terminal
consoleInterface.close()