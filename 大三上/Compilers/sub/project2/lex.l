%{
    #include "syntax.tab.h"     // Include the parser header
    #include <stdlib.h>          // Standard library for memory allocation
    #include <stdio.h>           // Standard I/O for printing errors
    #include <string.h>          // String handling functions

    #define MAX_ID_SIZE 256     // Maximum size for identifiers

    int line = 1;               // Current line number for error reporting

    // Define the Node structure representing a node in the syntax tree
    typedef struct Head 
    {
        int terminal;            // Indicates whether the node is a terminal (leaf) or non-terminal
        char type[200];          // Type of the node (e.g., "int", "ID", etc.)
        char id[200];            // Identifier for the node (e.g., variable name or type)
        char value_type[200];    // Used for marking the expression type (for EXP)
        int rvalue;              // Used to mark if the node is a right-hand value
        int lineno;              // Line number where the node appears in the source code
        struct Head* child;      // Pointer to the child node (if any)
        struct Head* next;       // Pointer to the next sibling node (if any)
    } Node;

    // Function to create a new Node in the syntax tree
    Node* create_Node(int terminal, char* type, char* id, Node* child, Node* next, int lineno) 
    {
        Node* newNode = malloc(sizeof(Node));  // Allocate memory for a new node
        if (newNode == NULL) {
            perror("Memory allocation error");  // Error handling if memory allocation fails
            exit(EXIT_FAILURE);
        }
        
        newNode->terminal = terminal;  // Set the terminal value
        newNode->lineno = (lineno == 0 && child != NULL) ? child->lineno : lineno;  // Set line number, prefer child line number if it's zero

        // Copy the type string into the type field, ensuring no overflow
        if (type != NULL) {
            strncpy(newNode->type, type, sizeof(newNode->type) - 1);
            newNode->type[sizeof(newNode->type) - 1] = '\0';  // Null-terminate the string
        } else {
            newNode->type[0] = '\0';  // Set type to empty if not provided
        }
        
        // Copy the id string into the id field, ensuring no overflow
        if (id != NULL) {
            strncpy(newNode->id, id, sizeof(newNode->id) - 1);
            newNode->id[sizeof(newNode->id) - 1] = '\0';  // Null-terminate the string
        } else {
            newNode->id[0] = '\0';  // Set id to empty if not provided
        }
        
        newNode->child = child;  // Set the child pointer
        newNode->next = next;    // Set the next pointer
        newNode->rvalue = 0;     // Initialize rvalue as 0 (not a right-hand value)

        return newNode;  // Return the newly created node
    }

    // Function to print the syntax tree
    void print_tree(Node* root, int depth) 
    {
        if (root == NULL) {
            return;  // Return if the node is NULL
        }

        // Indentation for non-empty nodes
        if (strcmp(root->type, "empty") != 0) {
            for (int i = 0; i < depth; i++) {
                printf("  ");  // Print spaces for indentation
            }
        }

        // Print information about terminal (leaf) nodes
        if (root->terminal == 1) {
            printf("%s", root->type);

            // For specific types of nodes, print additional information (like ID or value)
            if (strcmp(root->type, "ID") == 0 || strcmp(root->type,"TYPE") == 0 ||
                strcmp(root->type, "INT") == 0 || strcmp(root->type,"FLOAT") == 0 || 
                strcmp(root->type, "CHAR") == 0) {
                printf(": %s", root->id);  // Print the identifier or value of the terminal node
            }
            printf("\n");
        } else if (strcmp(root->type, "empty") != 0) {
            // For non-terminal, non-empty nodes, print the type and line number
            printf("%s (%d)\n", root->type, root->lineno);
        }

        // Recursively print the child node with increased indentation
        print_tree(root->child, depth + 1);

        // Recursively print the sibling nodes without changing indentation
        print_tree(root->next, depth);
    }
%}


%option noyywrap

int_        [0-9]+|0x[0-9a-fA-F]+
float_      [0-9]+"."[0-9]+
id_         [a-zA-Z_][a-zA-Z0-9_]*
char_       \'.\'|\'\\x[0-9a-fA-F]{2}\'

%%
"int"                 { yylval.node=create_Node(1,"TYPE",yytext,NULL,NULL,line);return TYPE; }
"float"               { yylval.node=create_Node(1,"TYPE",yytext,NULL,NULL,line);return TYPE; }
"char"                { yylval.node=create_Node(1,"TYPE",yytext,NULL,NULL,line);return TYPE; }
"struct"              { yylval.node=create_Node(1,"STRUCT",yytext,NULL,NULL,line);return STRUCT; }
"if"                  { yylval.node=create_Node(1,"IF",yytext,NULL,NULL,line);return IF; }
"else"                { yylval.node=create_Node(1,"ELSE",yytext,NULL,NULL,line);return ELSE; }
"while"               { yylval.node=create_Node(1,"WHILE",yytext,NULL,NULL,line);return WHILE; }
"return"              { yylval.node=create_Node(1,"RETURN",yytext,NULL,NULL,line);return RETURN; }
{int_}              {yylval.node=create_Node(1,"INT",yytext,NULL,NULL,line);return INT;}
{float_}             { yylval.node=create_Node(1,"FLOAT",yytext,NULL,NULL,line);return FLOAT; }
{id_}               { yylval.node=create_Node(1,"ID",yytext,NULL,NULL,line);return ID; }
{char_}             { yylval.node=create_Node(1,"CHAR",yytext,NULL,NULL,line);return CHAR; }

"."                 { yylval.node=create_Node(1,"DOT",yytext,NULL,NULL,line);return DOT; }
";"                 { yylval.node=create_Node(1,"SEMI",yytext,NULL,NULL,line);return SEMI; }
","                 { yylval.node=create_Node(1,"COMMA",yytext,NULL,NULL,line);return COMMA; }
"="                 { yylval.node=create_Node(1,"ASSIGN",yytext,NULL,NULL,line);return ASSIGN; }
"<"                 { yylval.node=create_Node(1,"LT",yytext,NULL,NULL,line);return LT; }
">"                 { yylval.node=create_Node(1,"GT",yytext,NULL,NULL,line);return GT; }
"<="                { yylval.node=create_Node(1,"LE",yytext,NULL,NULL,line);return LE; }
">="                { yylval.node=create_Node(1,"GE",yytext,NULL,NULL,line);return GE; }
"!="                { yylval.node=create_Node(1,"NE",yytext,NULL,NULL,line);return NE; }
"=="                { yylval.node=create_Node(1,"EQ",yytext,NULL,NULL,line);return EQ; }
"+"                 { yylval.node=create_Node(1,"PLUS",yytext,NULL,NULL,line);return PLUS; }
"-"                 { yylval.node=create_Node(1,"MINUS",yytext,NULL,NULL,line);return MINUS; }
"*"                 { yylval.node=create_Node(1,"MUL",yytext,NULL,NULL,line);return MUL; }
"/"                 { yylval.node=create_Node(1,"DIV",yytext,NULL,NULL,line);return DIV; }
"&&"                { yylval.node=create_Node(1,"AND",yytext,NULL,NULL,line);return AND; }
"||"                { yylval.node=create_Node(1,"OR",yytext,NULL,NULL,line);return OR; }
"!"                 { yylval.node=create_Node(1,"NOT",yytext,NULL,NULL,line);return NOT; }
"("                 { yylval.node=create_Node(1,"LP",yytext,NULL,NULL,line);return LP; }
")"                 { yylval.node=create_Node(1,"RP",yytext,NULL,NULL,line);return RP; }
"["                 { yylval.node=create_Node(1,"LB",yytext,NULL,NULL,line);return LB; }
"]"                 { yylval.node=create_Node(1,"RB",yytext,NULL,NULL,line);return RB; }
"{"                 { yylval.node=create_Node(1,"LC",yytext,NULL,NULL,line);return LC; }
"}"                 { yylval.node=create_Node(1,"RC",yytext,NULL,NULL,line);return RC; }

"/*"([^*]|[*][^/]|[*][*]+[^*/])*"*/"  {/* ignore comments */}
[ \t\r]+            {/* ignore whitespace */}
"\n"    {line++;}

0x([0-9a-fA-F]|[g-zG-Z])+     { yylval.node=create_Node(1,"ILLEGAL_HEX_INT", yytext, NULL, NULL, line); return ILLEGAL_HEX_INT; }
[0-9]{id_}          { yylval.node=create_Node(1,"ILLEGAL_ID", yytext, NULL, NULL, line); return ILLEGAL_ID; }
'\\x.*'                        { yylval.node=create_Node(1,"ILLEGAL_CHAR", yytext, NULL, NULL, line); return ILLEGAL_CHAR; }
.                   { yylval.node = create_Node(1,"ILLEGAL", yytext, NULL, NULL, line); return ILLEGAL; }
%%


