#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>


#define SNPRINTF snprintf

void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void printWLine (const wchar_t * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}



static int staticTrue = 1; /* true */
static int staticFalse = 0; /* false */


void CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_05_bad()
{
    wchar_t * data;
    wchar_t dataBadBuffer[50];
    wchar_t dataGoodBuffer[100];
    if(staticTrue)
    {
        /* FLAW: Set a pointer to a "small" buffer. This buffer will be used in the sinks as a destination
         * buffer in various memory copying functions using a "large" source buffer. */
        data = dataBadBuffer;
        data[0] = '\0'; /* null terminate */
    }
    {
        wchar_t source[100];
        memset(source, 'C', 100-1); /* fill with L'C's */
        source[100-1] = '\0'; /* null terminate */
        /* POTENTIAL FLAW: Possible buffer overflow if the size of data is less than the length of source */
        SNPRINTF(data, 100, "%s", source);
        printWLine(data);
    }
}


/* goodG2B1() - use goodsource and badsink by changing the staticTrue to staticFalse */
static void goodG2B1()
{
    wchar_t * data;
    wchar_t dataBadBuffer[50];
    wchar_t dataGoodBuffer[100];
    if(staticFalse)
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        /* FIX: Set a pointer to a "large" buffer, thus avoiding buffer overflows in the sinks. */
        data = dataGoodBuffer;
        data[0] = '\0'; /* null terminate */
    }
    {
        wchar_t source[100];
        memset(source, 'C', 100-1); /* fill with L'C's */
        source[100-1] = '\0'; /* null terminate */
        /* POTENTIAL FLAW: Possible buffer overflow if the size of data is less than the length of source */
        SNPRINTF(data, 100, "%s", source);
        printWLine(data);
    }
}

/* goodG2B2() - use goodsource and badsink by reversing the blocks in the if statement */
static void goodG2B2()
{
    wchar_t * data;
    wchar_t dataBadBuffer[50];
    wchar_t dataGoodBuffer[100];
    if(staticTrue)
    {
        /* FIX: Set a pointer to a "large" buffer, thus avoiding buffer overflows in the sinks. */
        data = dataGoodBuffer;
        data[0] = '\0'; /* null terminate */
    }
    {
        wchar_t source[100];
        memset(source, 'C', 100-1); /* fill with L'C's */
        source[100-1] = '\0'; /* null terminate */
        /* POTENTIAL FLAW: Possible buffer overflow if the size of data is less than the length of source */
        SNPRINTF(data, 100, "%s", source);
        printWLine(data);
    }
}

void CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_05_good()
{
    goodG2B1();
    goodG2B2();
}



int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );

    printLine("Calling good()...");
    CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_05_good();
    printLine("Finished good()");

    printLine("Calling bad()...");
    CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_05_bad();
    printLine("Finished bad()");

    return 0;
}

