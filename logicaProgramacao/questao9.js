// Importa entrada e saída do terminal
import { stdin, stdout } from 'process'

// Importa a interface de leitura do terminal
import { createInterface } from 'node:readline/promises'

// Cria a interface do terminal
const consoleInterface = createInterface({
    input: stdin,
    output: stdout
})

// Solicita um texto ao usuário
const texto = await consoleInterface.question(
    'Digite um texto:\n '
)

// Função responsável pela análise do texto
function analisarTexto(texto) {

    // Variáveis contadoras
    let vogais = 0
    let consoantes = 0
    let letras = 0

    // Lista de vogais
    const listaVogais = 'aeiou'

    // Converte o texto para minúsculo
    const textoMinusculo = texto.toLowerCase()

    // Percorre cada caractere do texto
    for (const letra of textoMinusculo) {

        // Verifica se é uma letra do alfabeto
        if (letra >= 'a' && letra <= 'z') {

            // Conta letras totais
            letras++

            // Verifica se é vogal
            if (listaVogais.includes(letra)) {
                vogais++
            }

            // Caso contrário, é consoante
            else {
                consoantes++
            }
        }
    }

    // Remove espaços extras e separa palavras
    const palavras = texto
        .trim()
        .split(/\s+/)

    // Exibe os resultados
    console.log(`Quantidade de vogais: ${vogais}`)
    console.log(`Quantidade de consoantes: ${consoantes}`)
    console.log(`Quantidade total de letras: ${letras}`)
    console.log(`Quantidade de palavras: ${palavras.length}`)
}

// Chama a função
analisarTexto(texto)

// Fecha a interface do terminal
consoleInterface.close()