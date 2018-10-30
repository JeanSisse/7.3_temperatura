#!/usr/bin/env python

import sys
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.axes_grid1 import make_axes_locatable


# Uso: ./plot.py <datafile.txt>

# Arquivo de dados
# Linha 1: <size_x>x<size_y>
# Linha 2: <valor_min> <valor_max>
# Linhas que sequem: Valores de cada posicao da noc

# O primeor argumento eh o nome do programa
filename = str(sys.argv[1])
f = open(filename, 'r')

# Primeira linha o tamanho da rede
size_x, size_y = map(int, f.readline().split('x'))

# Segunda linha o menor e o maior valor
val_min, val_max = map(int, f.readline().split())

values = []
for line in f:
	values.append(map(int, line.split()))
values = np.array(values)

fig = plt.figure(figsize=(7, 6))

ax = fig.add_subplot(111)
ax.set_aspect('equal')

# setting ticks positions
ax.set_xticks(np.arange(0, size_x, 1))
ax.set_yticks(np.arange(0, size_y, 1))

# setting ticks labels
ax.set_xticklabels(np.arange(0, size_x, 1))
ax.set_yticklabels(size_y - 1 - np.arange(0, size_y, 1))

imgplot = plt.imshow(values, vmin=val_min, vmax=val_max)

# create an axes on the right side of ax. The width of cax will be 5%
# of ax and the padding between cax and ax will be fixed at 0.05 inch.
divider = make_axes_locatable(ax)
cax = divider.append_axes("right", size="5%", pad=0.1)
plt.colorbar(imgplot, cax=cax)

# Color maps: http://matplotlib.org/examples/color/colormaps_reference.html
#imgplot.set_cmap('autumn') # sequencial, vermelho para amarelo
#imgplot.set_cmap('summer') # sequencial, verde escuro para verde claro
imgplot.set_cmap('Reds')   # sequencial, branco para vermelho
#imgplot.set_cmap('YlOrRd')  # sequencial, creme para vermelho

# Interpolation types:
imgplot.set_interpolation('nearest')
#imgplot.set_interpolation('bicubic')
#imgplot.set_interpolation('bilinear')

#plt.colorbar(orientation='vertical')
ax.grid(color='w', linestyle='--', linewidth=0.5)

#plt.show()
plt.savefig('plot.png', dpi=150)
