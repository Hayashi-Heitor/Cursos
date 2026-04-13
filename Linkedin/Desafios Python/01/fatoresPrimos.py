def getFatoresPrimos(numero: int) -> list:
    fatores = []
    divisor = 2

    while divisor <= numero:
        if numero % divisor == 0:
            numero //= divisor
            fatores.append(divisor)
        else:
            divisor += 1
    
    return fatores


if __name__ == "__main__":
    print(getFatoresPrimos(630))