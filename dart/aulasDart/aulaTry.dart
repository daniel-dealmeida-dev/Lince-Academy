//try-catch
//e:object
//s: stack trace
//on especifica o tipo do erro que queremos tratar. Se for diferente, o programa para e mostra o erro normalmente. Se for igual, ele entra no bloco de código do catch e executa o que tem lá dentro.
//finally
//rethrow

void main() {
  try {
    dynamic valor = true;
    valor++;
  } catch (e, s) {
    //primeiro parametro é o erro, segundo é o stack trace
    print("Não foi possivel: $e");
    print("Stack trace: $s");
  } on Exception catch (e) {
    //aqui eu especifico que quero tratar apenas erros do tipo Exception. Se for outro tipo de erro, o programa para normalmente.
    print("Erro do tipo Exception: $e");
  } catch (e) {
    print("houve um erro");
  }
}

void gerarErro(int numero) {
  if (numero == 1) {
    throw FormatException("valor 1");
  }
  if (numero == 2) {
    throw ArgumentError("valor 2");
  }
  if (numero == 3) {
    throw Exception("valor 3");
  }
}
