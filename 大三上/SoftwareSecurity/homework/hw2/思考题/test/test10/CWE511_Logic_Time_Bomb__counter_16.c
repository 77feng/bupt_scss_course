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

void CWE511_Logic_Time_Bomb__counter_16_bad()
{
    while(1)
    {
        {
            int count = 0;
            do
            {
                /* FLAW: If a counter reaches a certain value, delete a file */
                if (count == COUNT_CHECK)
                {
                    UNLINK("important_file1.txt");
                }
                count++;
            }
            while(1 == 1);   /* infinite loop */
        }
        break;
    }
}



/* good1() uses the GoodSinkBody in the while loop */
static void good1()
{
    while(1)
    {
        {
            int count = 0;
            do
            {
                /* FIX: If a counter reaches a certain value, print to the console */
                if (count == COUNT_CHECK)
                {
                    printLine("Happy New Year!");
                }
                count++;
            }
            while(1 == 1);   /* infinite loop */
        }
        break;
    }
}

void CWE511_Logic_Time_Bomb__counter_16_good()
{
    good1();
}



int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );

    printLine("Calling good()...");
    CWE511_Logic_Time_Bomb__counter_16_good();
    printLine("Finished good()");

    printLine("Calling bad()...");
    CWE511_Logic_Time_Bomb__counter_16_bad();
    printLine("Finished bad()");

    return 0;
}


