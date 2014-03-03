run: lab4.cpp
	g++ lab4.cpp InitShader.cpp -lglut -lGL -lGLU -lGLEW -lm -lSDL2 -g

clean:
	rm -f *.out *~
