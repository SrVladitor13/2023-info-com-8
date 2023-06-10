AÑO_ACTUAL = 2023

def main():
    exitWhile = False
    exitMatch = False
    listaInmuebles = []

    # Aca podes agregar inmuebles desde afuera para testear las funcionalidades
    #inmueble = {"año": 2000, "metros": 60, "habitaciones": 2, "garaje": "Y", "zona": "A", "estado": "Disponible"}
    #inmueble2 = {"año": 2000, "metros": 100, "habitaciones": 3, "garaje": "N", "zona": "C", "estado": "Disponible"}
    #inmueble3 = {"año": 2000, "metros": 60, "habitaciones": 2, "garaje": "Y", "zona": "A", "estado": "Vendido"}

    #listaInmuebles.append(inmueble)
    #listaInmuebles.append(inmueble2)
    #listaInmuebles.append(inmueble3)


    while exitWhile == False:

        if exitMatch == True:
            print("Error. Ingreso invalido")

        exitMatch = False
        mostrarMenu()
        opcion = input("\nIngrese el numero de su opcion: ")
        print("\n")

        match opcion:
            case '1':
                print("Usted selecciono agregar un nuevo inmueble\n")

                listaInmuebles = agregarInmueble(listaInmuebles)
            case "2":
                print("Usted selecciono editar la informacion de un inmueble\n")

                listaInmuebles = editarInmueble(listaInmuebles)
            case "3":
                print("Usted selecciono eliminar inmueble\n")

                listaInmuebles = eliminarInmueble(listaInmuebles)
            case "4":
                print("Usted selecciono editar el estado de un inmueble inmueble\n")

                listaInmuebles = cambiarEstadoInmueble(listaInmuebles)
            case "5":
                print("A continuacion se mostraran los inmuebles disponibles al presupuesto que ingrese\n")

                busquedaInmueblePorPresupuesto(listaInmuebles)
            case "6":
                print("A continuacion se listan todos los inmuebles\n")
                listarInmuebles(listaInmuebles)
            case "0":
                print("Gracias por utilizar este programa")
                exitWhile = True
            case _:
                exitMatch = True

    return 0

def agregarInmueble(listaInmuebles):
    inmueble = cargarDatosDeInmueble()
    if inmueble.get("estado") == "Nihil":
        print("Error al cargar datos")
        return

    listaInmuebles.append(inmueble)

    return listaInmuebles


def editarInmueble(listaInmuebles):
    try:
        index = int(input("Ingrese el index del inmueble al que desea editar: "))

    except ValueError:
        print("Ingreso incorrecto")
        return listaInmuebles

    if index >= len(listaInmuebles):
        print("Error al editar. No se encontro el inmueble")
        return listaInmuebles

    inmueble = cargarDatosDeInmueble()

    if inmueble["estado"] == "Nihil":
        print("Error al cargar datos")
        return listaInmuebles


    listaInmuebles[index] = inmueble

    return listaInmuebles

def eliminarInmueble(listaInmuebles):
    try:
        index = int(input("Ingrese el index del inmueble que desea eliminar: "))

    except ValueError:
        print("Ingreso incorrecto")
        return listaInmuebles

    cont = 0

    for x in listaInmuebles:
        if cont == index:
            listaInmuebles.remove(x)
            return listaInmuebles
        else:
            cont += 1

    print("Error al eliminar. No se encontro el inmueble")
    return listaInmuebles

def cambiarEstadoInmueble(listaInmuebles):
    try:
        index = int(input("Ingrese el index del inmueble al que desea editar el estado: "))

    except ValueError:
        print("Ingreso incorrecto")
        return listaInmuebles

    cont = 0

    for inmueble in listaInmuebles:
        if cont == index:
            estado = (input('Ingrese el estado del inmueble ["Disponible", "Reservado" o "Vendido"]: ')).capitalize()
            if estado != "Disponible" and estado != "Reservado" and estado != "Vendido":
                print("Error al editar estado del inmueble")
                return listaInmuebles

            inmueble["estado"] = estado
            return listaInmuebles
        else:
            cont += 1

    print("Error al editar estado. No se encontro el inmueble")
    return listaInmuebles


def busquedaInmueblePorPresupuesto(listaInmuebles):
    try:
        presupuesto = int(input("Ingrese su presupuesto: "))

    except ValueError:
        print("Ingreso incorrecto")
        return listaInmuebles

    listaInmueblesDisponibles = filtrarInmueblesDisponibles(listaInmuebles)
    listaInmueblesFiltrados = []
    for inmueble in listaInmueblesDisponibles:
        if calcularPrecio(inmueble) <= presupuesto:
            listaInmueblesFiltrados.append(inmueble)

    if len(listaInmuebles) == 0:
            print("No se encontraron inmuebles")
            return

    for inmueble in listaInmueblesFiltrados:
        print(inmueble)

    return

def filtrarInmueblesDisponibles(listaInmuebles):
    listaInmueblesDisponibles = []

    for inmueble in listaInmuebles:
        if inmueble.get("estado") == "Disponible":
            listaInmueblesDisponibles.append(inmueble)

    return listaInmueblesDisponibles


def listarInmuebles(listaInmuebles):
    if len(listaInmuebles) == 0:
        print("No se encontraron inmuebles")
        return

    for inmueble in listaInmuebles:
        print(inmueble)

    return

def mostrarMenu():
    print("\n1) Agregar inmueble")
    print("2) Editar inmueble")
    print("3) Eliminar inmueble")
    print("4) Cambiar estado de inmueble")
    print("5) Listar inmuebles disponibles segun presupuesto")
    print("6) Listar inmuebles")
    print("0) Salir del programa")

def calcularPrecio(inmueble):

    if inmueble.get("garaje"):
        precio = 1500
    else:
        precio = 0

    precio = (precio+inmueble.get("metros")*100+inmueble.get("habitaciones")*500)*(1-(AÑO_ACTUAL-inmueble.get("año"))/100)

    match(inmueble.get("zona")):
        case 'B':
            precio *= 1.5
        case 'C':
            precio *= 2

    return precio

def cargarDatosDeInmueble():
    inmueble = {"año": 0, "metros": 0, "habitaciones": 0, "garaje": 0, "zona": 0, "estado": "Nihil"}

    try:
        año = int(input("Ingrese el año: "))
        if año < 2000:
            print("No operamos con inmuebles de años anteriores al 2000")
            return inmueble
        inmueble["año"] = año

        metros = int(input("Ingrese la cantidad de metros cuadrados del inmueble: "))
        if metros < 60:
            print("No operamos con inmuebles con menos de 60 metros cuadrados")
            return inmueble
        inmueble["metros"] = metros

        habitaciones = int(input("Ingrese la cantidad de habitaciones que posee el inmueble: "))
        if habitaciones < 2:
            print("No operamos con inmuebles con menos de 2 habitaciones")
            return inmueble
        inmueble["habitaciones"] = habitaciones

        garaje = (input("El inmueble posee garaje? [Y/N]: ")).upper()
        if garaje == "Y":
            garaje = True
        elif garaje == "N":
            garaje = False
        else:
            return inmueble
        inmueble["garaje"] = garaje

        zona = (input("Ingrese la zona en la que se encuentra el inmueble [A, B, C]: ")).upper()
        if zona != "A" and zona != "B" and zona != "C":
            return inmueble
        inmueble["zona"] = zona

        estado = (input('Ingrese el estado del inmueble ["Disponible", "Reservado" o "Vendido"]: ')).capitalize()
        if estado != "Disponible" and estado != "Reservado" and estado != "Vendido":
            return inmueble
        inmueble["estado"] = estado

        return inmueble

    except ValueError:
            return inmueble



main()
