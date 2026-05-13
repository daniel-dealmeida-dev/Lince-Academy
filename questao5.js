// Importa entrada e saída do terminal
import { stdin, stdout } from 'process'

// Importa interface de leitura do terminal com Promises (permite uso de await)
import { createInterface } from 'node:readline/promises'

// Cria a interface do terminal para interação com o usuário
const consoleInterface = createInterface({
    input: stdin,
    output: stdout
});

// Lê o valor de A 
const numeroA = Number(
    await consoleInterface.question("Digite o valor do A:\n ")
)

// Lê o valor de B 
const numeroB = Number(
    await consoleInterface.question("Digite o valor do B:\n ")
)

// Lê o valor de C 
const numeroC = Number(
    await consoleInterface.question("Digite o valor do C:\n ")
);

// Função que calcula Bhaskara
function calculoBhaskara(numeroA, numeroB, numeroC) {

    // Calcula o delta 
    const delta = (numeroB ** 2) - (4 * numeroA * numeroC);

    // Caso delta seja negativo, não existem raízes reais
    if (delta < 0) {
        console.log("Não existem raízes reais.");
        return;
    }

    // Caso delta seja zero, existe uma única raiz
    if (delta === 0) {
        const x = -numeroB / (2 * numeroA);
        console.log(`A raiz é: x = ${x}`);
        return;
    }

    // Caso delta seja positivo, existem duas raízes reais
    const x1 = (-numeroB + Math.sqrt(delta)) / (2 * numeroA);
    const x2 = (-numeroB - Math.sqrt(delta)) / (2 * numeroA);

    console.log(`As raízes são: x1 = ${x1}, x2 = ${x2}`);
    return;
}

// Executa a função com os valores informados pelo usuário
calculoBhaskara(numeroA, numeroB, numeroC);

// Fecha a interface do terminal
consoleInterface.close();