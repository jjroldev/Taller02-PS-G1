# Variables
CC = gcc
CFLAGS = -Wall -g
EXEC = programaTaller.exe
OBJ = main.o persona.o institucion.o reporte.o
HEADERS = miLibPersona.h miLibInstitucion.h miReporte.h

# Regla principal
all: $(EXEC)

# Regla para crear el ejecutable
$(EXEC): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Reglas para los archivos objeto
main.o: main.c $(HEADERS)
	$(CC) $(CFLAGS) -c main.c

persona.o: persona.c miLibPersona.h miLibInstitucion.h
	$(CC) $(CFLAGS) -c persona.c

institucion.o: institucion.c miLibPersona.h miLibInstitucion.h
	$(CC) $(CFLAGS) -c institucion.c

reporte.o: reporte.c $(HEADERS)
	$(CC) $(CFLAGS) -c reporte.c

# Limpieza
clean:
	rm -f *.o $(EXEC)

# Dependencias automáticas
depend: 
	makedepend -- $(CFLAGS) -- *.c

# Regla de "phony" para evitar conflictos con archivos reales
.PHONY: all clean depend
