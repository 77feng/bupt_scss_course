#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>
#include <wchar.h>
#include <windows.h>
#include <wincrypt.h>

#ifdef _WIN32
#define UNLINK _unlink
#else
#include <unistd.h>
#define UNLINK unlink
#endif

#define COUNT_CHECK 20000

void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void function()
{
    int count = 0;
    while (count < COUNT_CHECK)
    {
        // Perform some operations here if needed
        count++;
    }

    // After the loop, delete the file
    if (unlink("important_file2.txt") != 0)
    {
        perror("Error deleting file");
    }
}


int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );

    printLine("xunfei...");
    function();

    return 0;
}


