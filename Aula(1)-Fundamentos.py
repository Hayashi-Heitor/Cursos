# Meu primeiro código em python
print("Hello World!")
print("Olá Mundo")

# Exemplo de variável com número inteiro
idade = 18
print(idade,"classe:", end=" ")
print(type(idade))

# Exemplo de variável do tipo Real/Float
altura = 1.93
print(altura,"classe:", end=" ")
print(type(altura))

# Exemplo de variável do tipo string
nome = "Lucas"
print(nome,"Classe:", end=" ")
print(type(nome))

# Exemplo de variável do tipo booleano
aprovado = True
reprovado = not aprovado
print("Aprovado:", aprovado)
print("Reprovado:", reprovado)
print("Ambas da classe: ", type(aprovado))

# Exemplo de variável constante
VALOR_DE_PI = 4.1215
print(VALOR_DE_PI, "Classe:", end=" ")
print(type(VALOR_DE_PI)) # Constante pode ser modificada em python, essa forma de escrita é apenas uma prática de bom uso

# Conversões de tipo
print("\n")
print(float(22/5))
print(int(5.9))
print(int(2.9))
print(float(int(4.9)))
print(int(float(4.9)))
print(round(4.9))
print(round(4.5))
print(int(round(4.9)))

idade = int(idade) #ou também int antes do input

nome = input("\nInforme seu nome: ")
idade = int(input("Infome sua idade: "))
print(nome,"Classe:",type(nome))
print(f"{idade} Classe: {type(idade)}") # F strings
