# Estrutura de repetição for com range
for i in range(1, 6, 2): #começo / fim / salto
    print(i)

for i in range(1, 6): #começo / fim
    print(i)

for i in range(6): #fim
    print(i)

# Estrutura de repetição for com string
for caracter in "python":
    print(caracter)

letras = {'a', 'b', 'c', 'd', 'e'}
for letra in letras:
    print(letra)

# Estrutura de repetição com lista e else
for numero in [0, 18, 56]:
    print(numero)
else:
    print("Acabou")

# Break
for numero in range(10000):
    print(numero)
    if numero == 4:
        break
print("Até mais")

for x in [1, 10, 20, 30, 40]:
    if x == 30:
        continue

# Estrutura de repetição while
x = 1

while x < 10:
    print(x)
    x = x+1
    x += 1
    x -= 1

numero = 0

while numero < 5:
    numero += 1
    if numero == 3:
        print("vamos pular o 3")
        continue

