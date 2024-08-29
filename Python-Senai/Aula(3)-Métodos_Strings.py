# função len
nome = "Heitor Hayashi"
print(len(nome))

# método count
nome = "Heitor Hayashi"
print(nome.count("e"))

# método find, rfind e in
nome = "João da Silva"
print(nome.find("João"))
print(nome.find('a'))
print(nome.rfind('a'))
print("Silva" in nome)

# método capitalize
nome = "python python"
print(nome.capitalize())

# método title
nome = "python python python"
print(nome.title())

# método lower e upper
nome1 = "python"
nome2 = "PYTHON"
nome3 = "pYtHoN"
print(nome1.upper())
print(nome2.lower())
print(nome3.swapcase())

# métodos strip, rstrip, lstrip
nome = " PYTHON "
print(nome.strip())
print(nome.rstrip())
print(nome.lstrip())

# método replace
nome = "PYTHON É LEGAL"
print(nome.replace("PYTHON", "C"))  # case sensitive

# método startswith
nome = "Python"
print(nome.startswith("Py"))  # case sensitive

# métodos join e split
nome = "python é legal"
print(".".join(nome))
print(nome.split(" "))
print(nome.split(" ")[2])
lista = nome.split(" ")
print(len(lista) - 1, end="\n\n")  # pois index = 0

# fatiamento
string = "ABCDEFGHI"

# [incio:fim:salto]
# FINAL EXCLUSIVO!!!

print(string[:2])
print(string[0:2])
print(string[1:])
print(string[0:-2])
print(string[:])
print(string[-1:])
print(string[-5:7])
print(string[-2:-1])
print(string[:-1])
print(string[::-1])
