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

#define SOURCE_STRING "abc/opqrstu"

int globalFive = 5;

void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void printUnsignedLine(unsigned unsignedNumber)
{
    printf("%u\n", unsignedNumber);
}

void CWE469_Use_of_Pointer_Subtraction_to_Determine_Size__char_14_bad()
{
    if(globalFive==5)
    {
        {
            char string1[] = SOURCE_STRING;
            char string2[] = SOURCE_STRING;
            char * slashInString1;
            size_t indexOfSlashInString1;
            slashInString1 = strchr(string1, '/');
            if (slashInString1 == NULL)
            {
                exit(1);
            }
            /* FLAW: subtracting the slash pointer from a completely different string, should be slashInString1 - string1 */
            indexOfSlashInString1 = (size_t)(slashInString1 - string2);
            /* print the index of where the slash was found */
            printUnsignedLine(indexOfSlashInString1);
        }
    }
}



/* good1() uses if(globalFive!=5) instead of if(globalFive==5) */
static void good1()
{
    if(globalFive!=5)
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        {
            char string1[] = SOURCE_STRING;
            char * slashInString1;
            size_t indexOfSlashInString1;
            slashInString1 = strchr(string1, '/');
            if (slashInString1 == NULL)
            {
                exit(1);
            }
            /* FIX: subtract the ending pointer from the actual string it originated from (string1) */
            indexOfSlashInString1 = (size_t)(slashInString1 - string1);
            /* print the index of where the slash was found */
            printUnsignedLine(indexOfSlashInString1);
        }
    }
}

/* good2() reverses the bodies in the if statement */
static void good2()
{
    if(globalFive==5)
    {
        {
            char string1[] = SOURCE_STRING;
            char * slashInString1;
            size_t indexOfSlashInString1;
            slashInString1 = strchr(string1, '/');
            if (slashInString1 == NULL)
            {
                exit(1);
            }
            /* FIX: subtract the ending pointer from the actual string it originated from (string1) */
            indexOfSlashInString1 = (size_t)(slashInString1 - string1);
            /* print the index of where the slash was found */
            printUnsignedLine(indexOfSlashInString1);
        }
    }
}

void CWE469_Use_of_Pointer_Subtraction_to_Determine_Size__char_14_good()
{
    good1();
    good2();
}



int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );

    printLine("Calling good()...");
    CWE469_Use_of_Pointer_Subtraction_to_Determine_Size__char_14_good();
    printLine("Finished good()");

    printLine("Calling bad()...");
    CWE469_Use_of_Pointer_Subtraction_to_Determine_Size__char_14_bad();
    printLine("Finished bad()");

    return 0;
}

