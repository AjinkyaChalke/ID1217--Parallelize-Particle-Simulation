#
# Computers with Red Hat Enterprise Linux 5 in the computer room 648, KTH Forum, Kista
#
CC = g++
MPCC =  mpicc -cc=g++44

TARGETS = serial pthreads openmp mpi

all:	serial pthreads openmp

serial:
	$(CC) -O3 -o $@ -lm serial.cpp common.cpp
pthreads:
	$(CC) -O3 -o $@ pthreads.cpp common.cpp -lm -lpthread
openmp:
	$(CC) -O3 -o $@ openmp.cpp common.cpp -lm -fopenmp
mpi:
	$(MPCC) -O3 -o $@ mpi.cpp common.cpp -lm

clean:
	rm -f *.o $(TARGETS)
