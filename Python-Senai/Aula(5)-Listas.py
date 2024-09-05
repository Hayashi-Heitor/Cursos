# Exemplo de manipulação
bancos = ["Banco do Brasil", "Caixa", "Santander"]
print(bancos)
bancos[1] = "Itaú"
print(bancos)
bancos[-1] = "C6"
print(bancos)
bancos += ["Bradesco", "Nubank"]
print(bancos, end="\n\n")



# Comandos
lista = [4, 5, 3, 5]
print(lista)
lista.append(2)  # Adiciona o elemento 2 ao final da lista
print(lista)  # Exibe: [4, 5, 3, 5, 2]

lista.insert(2, -3)  # Insere o valor -3 na posição de índice 2 (terceiro elemento)
print(lista)  # Exibe: [4, 5, -3, 3, 5, 2]

lista.remove(4)  # Remove a primeira ocorrência do valor 4 na lista
print(lista)  # Exibe: [5, -3, 3, 5, 2]

lista.sort()  # Ordena a lista em ordem crescente
print(lista)  # Exibe: [-3, 2, 3, 5, 5]

lista.sort(reverse=True)  # Ordena a lista em ordem crescente
print(lista)  # Exibe: [-3, 2, 3, 5, 5]

lista.reverse()  # Inverte a ordem dos elementos na lista
print(lista)  # Exibe: [5, 5, 3, 2, -3]

qnt = lista.count(5)  # Conta quantas vezes o valor 5 aparece na lista e armazena em 'qnt'
print(qnt)  # Exibe: 2

exc = lista.pop()  # Remove e retorna o último item da lista
print(lista)  # Exibe: [5, 5, 3, 2]
print(exc)  # Exibe: -3 (o item removido)

del lista[2]  # Remove o item na posição de índice 2 (terceiro elemento)
print(lista)  # Exibe: [5, 5, 2]

del lista[2:5]  # Remove os itens dos índices 2 até 4 (na prática, aqui só remove o item 2)
print(lista)  # Exibe: [5, 5]

lista.clear()  # Remove todos os elementos da lista, deixando-a vazia
print(lista, end="\n\n")  # Exibe: []



# Listas em Listas
compra = [10.2, 3.35, 16.3, ["tomate", "sabonete", "arroz"]]  # Cria uma lista com preços e uma sublista de produtos
print(compra)  # Exibe: [10.2, 3.35, 16.3, ['tomate', 'sabonete', 'arroz']]

produtos = compra[3]  # Acessa a sublista de produtos que está no índice 3 da lista 'compra'
print(produtos)  # Exibe: ['tomate', 'sabonete', 'arroz']

total = compra[0] + compra[1] + compra[2]  # Calcula a soma dos primeiros três elementos da lista 'compra' (preços)
print(total)  # Exibe: 29.85

letra = ["a", "b", "c"]  # Cria uma lista com letras
num = [2, 4, 6]  # Cria uma lista com números
tudo = [letra, num]  # Cria uma lista que contém as listas 'letra' e 'num' como elementos
print(tudo)  # Exibe: [['a', 'b', 'c'], [2, 4, 6]]

print(f"Letras: {tudo[0]}")  # Exibe a lista de letras, que está no índice 0 da lista 'tudo'
print(f"Numeros: {tudo[1]}")  # Exibe a lista de números, que está no índice 1 da lista 'tudo'

letra = ["a", "b", "c"]  # Cria uma lista contendo os elementos 'a', 'b' e 'c'
print(f"tamanho da lista: {len(letra)}")  # Exibe o tamanho da lista 'letra', que é o número de elementos na lista (3)
print(f"endereço da letra b: {letra.index('b')}", end="\n\n")  # Exibe o índice do elemento 'b' na lista 'letra', que é 1



letras = ["a", "b", "c", "d", "e", "f"]  # Cria uma lista contendo as letras 'a', 'b', 'c', 'd', 'e' e 'f'
var = input("informe uma letra: ")  # Solicita ao usuário que insira uma letra e armazena a entrada na variável 'var'
# Verifica se a letra inserida, convertida para minúscula, está na lista 'letras'
if var.lower() in letras:
  print(f"A Letra '{var.lower()}' está na lista")  # Exibe uma mensagem informando que a letra está na lista
else:
  print(f"A Letra '{var.lower()}' NÃO está na lista")  # Exibe uma mensagem informando que a letra não está na lista



vals = [0, 1, 2]
vals[0], vals[2] = vals[2], vals[0]
print(vals)
