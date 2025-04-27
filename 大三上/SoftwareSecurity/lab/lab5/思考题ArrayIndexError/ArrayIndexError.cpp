/*
    ArrayIndexError.cpp
*/

#include <stdio.h>
#include <stdlib.h>

int* IntVector;

void bar(void)
{
    printf("Augh! I've been hacked!\n");
}

void InsertInt(long index, unsigned long value)
{
    //We're so sure that no one would ever pass in
    //a value more than 64 KB that we're not even going to 
    //declare the function as taking unsigned shorts
    //or check for an index out of bounds - doh!
    printf("Writing memory at %p\n", &(IntVector[index]));

    IntVector[index] = value;
}

bool InitVector(int size)
{
    IntVector = (int*)malloc(sizeof(int)*size);
    printf("Address of IntVector is %p\n", IntVector);

    if(IntVector == NULL)
        return false;
    else
        return true;
}

int main(int argc, char* argv[])
{
    long index;
	unsigned long  value;

    if(argc != 3)
    {
        printf("Usage is %s [index] [value]\n");
        return -1;
    }

    printf("Address of bar is %p\n", bar);

    //Let's initialize our vector - 64 KB ought to be enough for 
    //anyone <g>.
    if(!InitVector(0xffff))
    {
        printf("Cannot initialize vector!\n");
        return -1;
    }

    index = atol(argv[1]);
    value = atol(argv[2]);

	if (index < 0xffff)

	{

		InsertInt(index, value);

	}
	else
	{
		printf("index >= 0xffff!\n");
	}

    return 0;
}
