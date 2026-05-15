// Importa entrada e saída do terminal
import { stdin, stdout } from 'process'

// Importa a interface de leitura do terminal
import { createInterface } from 'node:readline/promises'

// Cria a interface de comunicação com o terminal
const consoleInterface = createInterface({
    input: stdin,
    output: stdout
})

// Array que armazenará os números digitados
const numeros = []

// Solicita quantos números o usuário deseja inserir
const quantidade = Number(
    await consoleInterface.question(
        'Digite quantos números deseja inserir:\n'
    )
)

// Solicita os números ao usuário
for (let i = 0; i < quantidade; i++) {

    const numeroDigitado = Number(
        await consoleInterface.question(
            `Digite o ${i + 1}º número:\n`
        )
    )

    // Adiciona o número ao array
    numeros.push(numeroDigitado)
}

// Função pcalcular a média
function calcularMedia(numeros) {

    // Verifica se o array está vazio
    if (numeros.length === 0) {
        console.log('Nenhum número foi digitado.')
        return
    }

    // Calcula a soma dos números
    const soma = numeros.reduce(
        (contador, numero) => contador + numero, 0
    )

    // Calcula a média
    const media = soma / numeros.length

    // Exibe o resultado
    console.log(`A média dos números digitados é: ${media}`)
}

// Função para separar números pares e ímpares
function numerosParImpar(numeros) {

    const numerosPares = numeros.filter(
        numero => numero % 2 === 0
    )

    const numerosImpares = numeros.filter(
        numero => numero % 2 !== 0
    )

    console.log(`Números pares: ${numerosPares.join(', ')}`)
    console.log(`Números ímpares: ${numerosImpares.join(', ')}`)
}

// Função para somar os números
function Soma(numeros) {

    const soma = numeros.reduce(
        (contador, numero) => contador + numero, 0
    )

    console.log(`A soma dos números digitados é: ${soma}`)
}

// Função para mostrar maior e menor número
function maiorMenor(numeros) {

    const maior = Math.max(...numeros)
    const menor = Math.min(...numeros)

    console.log(`O maior número digitado é: ${maior}`)
    console.log(`O menor número digitado é: ${menor}`)
}

// Função para ordenar em ordem crescente
function ordemCrescente(numeros) {

    const numerosOrdenados = [...numeros].sort(
        (a, b) => a - b
    )

    console.log(
        `Números em ordem crescente: ${numerosOrdenados.join(', ')}`
    )
}

// Função para ordenar em ordem decrescente
function ordemDecrescente(numeros) {

    const numerosOrdenados = [...numeros].sort(
        (a, b) => b - a
    )

    console.log(
        `Números em ordem decrescente: ${numerosOrdenados.join(', ')}`
    )
}

// Chama as funções
calcularMedia(numeros)
numerosParImpar(numeros)
Soma(numeros)
maiorMenor(numeros)
ordemCrescente(numeros)
ordemDecrescente(numeros)

// Fecha a interface do terminal
consoleInterface.close()