TARGET = clib.c
APPLICATION = clib.so
PYTHON = pspl.py
IMG_FILE = image.pgm

default:
	gcc -shared -fPIC $(TARGET) -o $(APPLICATION) -g

run: $(APPLICATION)
	sudo python3 $(PYTHON)

view: $(IMG_FILE)
	eog $(IMG_FILE) &

clean:
	rm -rf *~ $(APPLICATION) $(IMG_FILE)
