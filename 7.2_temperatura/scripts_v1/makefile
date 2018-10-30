
dat_files = $(wildcard *.dat)
png_files = $(dat_files:.dat=.png)

all: $(png_files)

%.png: %.dat plot.py
	@./plot.py $<
	@mv plot.png $@

clean:
	@rm -rf $(png_files)