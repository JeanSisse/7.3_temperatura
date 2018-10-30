
# MAKEFILE para compilar todas as ferramentas da HEMPS
# Leandro Heck <lheck@gmail.com>

# Fontes a serem compilados (organizados por tipo)
src_c = ram_generator.c bin2mem.c

# Nao mexer aqui
bin_c = $(src_c:.c=.o)

all: WARNING $(bin_c)

WARNING:
	@ echo
	@ echo "AVISO!"
	@ echo
	@ echo "Para funcionar no GAPH, os programas \
		devem se compilados na KRITI" | fold -w 40
	@ echo

# compila os .c
%.o: %.c
	@ echo "Compiling C $<"
	@ gcc -o $(@:.o=) $<

clean:
	@ rm -f $(src_c:.c=)
