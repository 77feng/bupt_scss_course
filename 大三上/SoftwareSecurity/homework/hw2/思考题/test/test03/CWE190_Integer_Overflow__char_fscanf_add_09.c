#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>


void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void printHexCharLine (char charHex)
{
    printf("%02x\n", charHex);
}


const int GLOBAL_CONST_TRUE = 1; /* true */
const int GLOBAL_CONST_FALSE = 0; /* false */


void CWE190_Integer_Overflow__char_fscanf_add_09_bad()
{
    char data;
    data = ' ';
    if(GLOBAL_CONST_TRUE)
    {
        /* POTENTIAL FLAW: Use a value input from the console */
        fscanf (stdin, "%c", &data);
    }
    if(GLOBAL_CONST_TRUE)
    {
        {
            /* POTENTIAL FLAW: Adding 1 to data could cause an overflow */
            char result = data + 1;
            printHexCharLine(result);
        }
    }
}



/* goodB2G1() - use badsource and goodsink by changing the second GLOBAL_CONST_TRUE to GLOBAL_CONST_FALSE */
static void goodB2G1()
{
    char data;
    data = ' ';
    if(GLOBAL_CONST_TRUE)
    {
        /* POTENTIAL FLAW: Use a value input from the console */
        fscanf (stdin, "%c", &data);
    }
    if(GLOBAL_CONST_FALSE)
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        /* FIX: Add a check to prevent an overflow from occurring */
        if (data < CHAR_MAX)
        {
            char result = data + 1;
            printHexCharLine(result);
        }
        else
        {
            printLine("data value is too large to perform arithmetic safely.");
        }
    }
}

/* goodB2G2() - use badsource and goodsink by reversing the blocks in the second if */
static void goodB2G2()
{
    char data;
    data = ' ';
    if(GLOBAL_CONST_TRUE)
    {
        /* POTENTIAL FLAW: Use a value input from the console */
        fscanf (stdin, "%c", &data);
    }
    if(GLOBAL_CONST_TRUE)
    {
        /* FIX: Add a check to prevent an overflow from occurring */
        if (data < CHAR_MAX)
        {
            char result = data + 1;
            printHexCharLine(result);
        }
        else
        {
            printLine("data value is too large to perform arithmetic safely.");
        }
    }
}

/* goodG2B1() - use goodsource and badsink by changing the first GLOBAL_CONST_TRUE to GLOBAL_CONST_FALSE */
static void goodG2B1()
{
    char data;
    data = ' ';
    if(GLOBAL_CONST_FALSE)
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        /* FIX: Use a small, non-zero value that will not cause an overflow in the sinks */
        data = 2;
    }
    if(GLOBAL_CONST_TRUE)
    {
        {
            /* POTENTIAL FLAW: Adding 1 to data could cause an overflow */
            char result = data + 1;
            printHexCharLine(result);
        }
    }
}

/* goodG2B2() - use goodsource and badsink by reversing the blocks in the first if */
static void goodG2B2()
{
    char data;
    data = ' ';
    if(GLOBAL_CONST_TRUE)
    {
        /* FIX: Use a small, non-zero value that will not cause an overflow in the sinks */
        data = 2;
    }
    if(GLOBAL_CONST_TRUE)
    {
        {
            /* POTENTIAL FLAW: Adding 1 to data could cause an overflow */
            char result = data + 1;
            printHexCharLine(result);
        }
    }
}

void CWE190_Integer_Overflow__char_fscanf_add_09_good()
{
    goodB2G1();
    goodB2G2();
    goodG2B1();
    goodG2B2();
}



int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );
    printLine("Calling good()...");
    CWE190_Integer_Overflow__char_fscanf_add_09_good();
    printLine("Finished good()");

    printLine("Calling bad()...");
    CWE190_Integer_Overflow__char_fscanf_add_09_bad();
    printLine("Finished bad()");

    return 0;
}


