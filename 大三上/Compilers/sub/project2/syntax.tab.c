/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "syntax.y" /* yacc.c:339  */

    #include "lex.yy.c"
    
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdarg.h>

    #include "head.h"

    void yyerror();

    Node* root=NULL;
    int flag=0;

    // Connect nodes in a sequence
    void connect_to_next(int next_num, ...)
    {
        if (next_num <= 0) {
            // If there are no nodes or the number of arguments is negative, do nothing
            return;
        }
    
        va_list valist;
        va_start(valist, next_num); 

        Node* temp = va_arg(valist, Node*); // Get the first node
        Node* prev = temp; 
        for (int i = 1; i < next_num; i++)
        {
            temp = va_arg(valist, Node*); // Get the next node
            if (prev) {
                prev->next = temp; 
            }
            prev = temp; // Update
        }

        if (temp) {
            temp->next = NULL; 
        }
    
        va_end(valist); 
    }

    // Flag to check if currently inside a function body
    bool is_in_function=false;
    // Store the name of the current function
    char *current_function_name;
    // Flag to check if there is an array index error
    bool index_error=false; 
    void find_compst_return(Node *Compst, char *expected_type);
    void check_nested_statements(Node *stmt, char *expected_type);
    
    /* Struct operations */
    // Insert a variable declaration into the symbol table
    void insert_vardec(Node *node) {
        if (!node->child->next) {
            // If the child node does not have a next member, it is not an array type
            add_dec(node->child->id, last_type, node->lineno);
        } else {
            // If the child node has a next member, it is an array type
            if (add_dec(node->child->child->id, "array", node->lineno)) {
                add_array(node->child->child->id, last_type, node->lineno);
            }
        }
    }

    // Insert an extended declaration list into the symbol table
    void insert_ExtDecList(Node* node) {
        // Process the current variable declaration
        insert_vardec(node->child);
        if (node->child->next) {
            // If there are multiple variable declarations (separated by commas), recursively process the remaining declarations
            insert_ExtDecList(node->child->next->next);
        }
    }

    // Add struct member definitions to the symbol table
    void add_struct_member_deflist(Node* node, char* struct_name)
    {
        // Process member declarations inside a struct
        if(!node||!node->child)
        {
            return;
        }
        Node* temp=node->child;
        Node* temp2=temp->child;
        char *type;
        if (strcmp(temp2->child->type,"TYPE")==0)
        {
            // Not a struct
            type=temp2->child->id;
        }
        else
        {
            // Is a struct
            type=temp2->child->child->next->id;
        }
        Node *temp3=temp->child->next;
        while(temp3)
        {
            Node* temp4=temp3->child;
            Node* temp5=temp4->child;
            if(temp5->child->next==NULL)
            {
                // Not an array
                add_struct_member(struct_name,temp5->child->id,type,temp5->lineno);
            }
            else
            {
                // Is an array
                add_struct_member(struct_name,temp5->child->child->id,"array",temp5->lineno);
                add_array(temp5->child->child->id,type,temp5->lineno);
            }
            if(temp3->child->next)
            {
                temp3=temp3->child->next->next;
            }
            else
            {
                break;
            }
        }
        if(node->child)
        {
            add_struct_member_deflist(node->child->next,struct_name);
        }
        return;
    }

    /* Function argument and variable insertion */
    // Insert function arguments into the symbol table
    void insert_function_args(char *func_name, Node *node) {
        if (node == NULL) {
            // If the node is empty, there are no more variables to process, return
            return;
        }

        // Process the current ParamDec node
        Node *param = node->child;
        Node *specifier = param->child;
        Node *vardec = specifier->next;
        char *type = specifier->child->id; // Get the type
        char *name = vardec->child->id;    // Get the variable name
        // Assume arguments are not array types for simplicity
        add_func_args(func_name, name, type, param->lineno);

        // If there is a COMMA, it means there are more arguments, recursively process the subsequent VarList
        Node *nextParam = node->child->next;
        if (nextParam != NULL && strcmp(nextParam->type, "COMMA") == 0) {
            insert_function_args(func_name, nextParam->next);
        }
    }
        
    // Insert function variables into the symbol table
    void insert_func_variables(Node *Dec) {
        // If not inside a function or input node is empty, no need to process
        if (!is_in_function || Dec == NULL) {
            return;
        }

        // Inside the function body
        Node *VarDec = Dec->child;
        char *var_name;
        char *var_type;
        
        // Check if it's an array type
        if (VarDec->child->next) {
            // Handle array type variables
            var_name = VarDec->child->child->id;
            var_type = "array";
            add_func_variables(current_function_name, var_name, var_type, VarDec->lineno);
            add_array(var_name, last_type, VarDec->lineno);
        } else {
            // Handle regular variables
            var_name = VarDec->child->id;
            var_type = last_type;
            add_func_variables(current_function_name, var_name, var_type, VarDec->lineno);
        }

        // Check assignment statements and verify type matching
        Node *Assign = VarDec->next;
        if (Assign && strcmp(Assign->type, "ASSIGN") == 0) {
            Node *Exp = Assign->next;
            if (strcmp(Exp->value_type, "error") != 0 && strcmp(Exp->value_type, last_type) != 0) {
                printf("Error type 5 at line %d: Type mismatched for assignment\n", Exp->lineno);
            }
        }
    }

    /* Expression checking */
    // Check if an expression matches the expected type
    void check_type(Node *exp, const char *expected_type, int error_type, int lineno) {
        if (strcmp(exp->value_type, "error") == 0) {
            // If the type is already an error, don't repeat the error message
            return;
        }
        if (expected_type != NULL && strcmp(exp->value_type, expected_type) != 0) {
            printf("Error type %d at line %d: Type mismatched for operands\n", error_type, lineno);
        }
    }

    // Check if a single expression is of type int or float
    void check_single_arithmetic_exp(Node *exp) {
        check_type(exp, NULL, 7, exp->lineno);
        if (strcmp(exp->value_type, "int") != 0 && strcmp(exp->value_type, "float") != 0) {
            printf("Error type 7 at line %d: Type mismatched for operands, expected int or float\n", exp->lineno);
        }
    }

    // Check if a single expression is of type int
    void check_single_logical_exp(Node *exp) {
        check_type(exp, "int", 7, exp->lineno);
    }

    // Check if two expressions in an arithmetic operation are of compatible types
    void check_exp_arithmetic_symbols(Node *exp1, Node *exp2) {
        check_type(exp1, NULL, 7, exp1->lineno);
        check_type(exp2, NULL, 7, exp2->lineno);
        if ((strcmp(exp1->value_type, "int") != 0 && strcmp(exp1->value_type, "float") != 0) || 
            (strcmp(exp2->value_type, "int") != 0 && strcmp(exp2->value_type, "float") != 0)) {
            printf("Error type 7 at line %d: Type mismatched for operands, expected int or float\n", exp1->lineno);
        }
        if (strcmp(exp1->value_type, exp2->value_type) != 0) {
            printf("Error type 7 at line %d: Type mismatched for operands, expected same type\n", exp1->lineno);
        }
    }

        // Check if two expressions in a logical operation are of type int
    void check_exp_logical_symbols(Node *exp1, Node *exp2) {
        // Assume logical operations can only be performed by int type variables
        check_type(exp1, "int", 7, exp1->lineno);
        check_type(exp2, "int", 7, exp2->lineno);
    }

    // Check if the left and right sides of an assignment match in type
    void check_exp_assign(Node *exp1, Node *exp2) {
        // Check the type of the left side of the assignment
        check_type(exp1, NULL, 6, exp1->lineno);
        check_type(exp2, NULL, 5, exp2->lineno);
        if (exp1->rvalue) {
            printf("Error type 6 at line %d: rvalue on the left side of assignment operator\n", exp1->lineno);
            return;
        }
        if (strcmp(exp1->value_type, exp2->value_type) != 0) {
            printf("Error type 5 at line %d: Type mismatched for assignment\n", exp1->lineno);
        }
    }

    // Check if an expression matches a specific expected type
    void check_Exp_with_specific_type(Node *Exp, char *expected_type) {
        // Check if the type of Exp is as expected
        check_type(Exp, expected_type, 7, Exp->lineno);
    }

    // Check the definitions for type matching in assignments
    void check_Def(Node *Def) {
        // The expected_type is the type defined
        char *expected_type = last_type;
        Node *DecList = Def->child->next;
        
        // Process all declarations in the declaration list
        while (DecList) {
            Node *Dec = DecList->child;
            Node *VarDec = Dec->child;

            // If there is an assignment (ASSIGN), check if the expression (Exp) type matches
            Node *Assign = VarDec->next;
            if (Assign && strcmp(Assign->type, "ASSIGN") == 0) {
                Node *Exp = Assign->next;
                if (strcmp(Exp->value_type, "error") != 0 && strcmp(Exp->value_type, expected_type) != 0) {
                    printf("Error type 5 at line %d: Type mismatched for assignment\n", Exp->lineno);
                }
            }

            // Move to the next declaration if it exists
            DecList = (Dec->next && strcmp(Dec->next->type, "COMMA") == 0) ? Dec->next->next : NULL;
        }
    }

    // Set a node's value as an rvalue
    void set_rvalue(Node *node) {
        if (node) {
            node->rvalue = 1;
        }
    }

    // Set a node's type
    void set_EXP_value_type(Node *node, char *type) {
        if (node && type) {
            strcpy(node->value_type, type);
        }
    }

    /* Function parameter and return type checking */
    // Check the return type of a function
    void check_func_return_type(Node* Compst, char *expected_type) {
        if (!is_in_function || Compst == NULL) {
            // If not inside a function or Compst is empty, no need to process
            return;
        }
        // Recursively check the return statements in the function body
        find_compst_return(Compst, expected_type);
    }

    // Find and check return statements within a compound statement
    void find_compst_return(Node *Compst, char *expected_type) {
        Node *stmtlist = Compst->child->next->next;
        while (stmtlist && stmtlist->child) {
            Node *stmt = stmtlist->child;
            if (strcmp(stmt->child->type, "RETURN") == 0) {
                Node *exp = stmt->child->next;
                if (exp && strcmp(exp->value_type, expected_type) != 0 && strcmp(exp->value_type, "error") != 0) {
                    printf("Error type 8 at line %d: The return type mismatched\n", exp->lineno);
                }
            } else if (strcmp(stmt->child->type, "CompSt") == 0) {
                find_compst_return(stmt->child, expected_type);
            } else {
                // Handle potentially nested structures, such as if-else and while statements
                check_nested_statements(stmt, expected_type);
            }
            stmtlist = stmtlist->next ? stmtlist->next->child : NULL;
        }
    }

    // Check nested statements for return type consistency
    void check_nested_statements(Node *stmt, char *expected_type) {
        Node *head = stmt->child;
        while (head) {
            if (strcmp(head->type, "Stmt") == 0) {
                if (strcmp(head->child->type, "CompSt") == 0) {
                    find_compst_return(head->child, expected_type);
                } else if (strcmp(head->child->type, "RETURN") == 0) {
                    Node *exp = head->child->next;
                    if (exp && strcmp(exp->value_type, expected_type) != 0 && strcmp(exp->value_type, "error") != 0) {
                        printf("Error type 8 at line %d: The return type mismatched\n", exp->lineno);
                    }
                }
            }
            head = head->next;
        }
    }

    // Check function arguments for type and count matching
    void check_func_args(char *func_name, Node *Args, int arg_index) {
        // Look for function definition
        int func_index;
        for(func_index = 0; func_index < def_num; func_index++) {
            if(strcmp(def[func_index].name, func_name) == 0) {
                break;
            }
        }
        // If the function is not found, return directly
        if(func_index == def_num) return;

        Node *current_arg = Args->child;
        // Check if the number and type of arguments match
        if(arg_index < def[func_index].arg_num) {
            if(strcmp(current_arg->value_type, def[func_index].args[arg_index].type) != 0) {
                printf("Error type 9 at line %d: Unmatched argument type for Function \"%s\"\n", current_arg->lineno, func_name);
                return;
            }
        } else {
            printf("Error type 9 at line %d: Too many arguments for Function \"%s\"\n", current_arg->lineno, func_name);
            return;
        }
        // Recursively check the next argument if it exists
        if(current_arg->next) {
            check_func_args(func_name, current_arg->next->next, arg_index + 1);
        } else if(arg_index + 1 < def[func_index].arg_num) {
            printf("Error type 9 at line %d: Too few arguments for Function \"%s\"\n", current_arg->lineno, func_name);
        }
    }

    // Check if a function is called without any arguments
    void check_func_without_args(char *func_name, int lineno) {
        // Look for function definition
        int func_index;
        for(func_index = 0; func_index < def_num; func_index++) {
            if(strcmp(def[func_index].name, func_name) == 0) {
                break;
            }
        }
        // If the function is not found, return directly
        if(func_index == def_num) return;

        if(def[func_index].arg_num != 0) {
            printf("Error type 9 at line %d: Function \"%s\" expects no arguments\n", lineno, func_name);
        }
    }

    /* Array operation checks */
    // Check if an expression is an array and if the index is an integer
    bool check_exp_array(Node *array_exp, Node *index_exp) {
        // If the index or array expression type is already an error, do not check further
        if (strcmp(index_exp->value_type, "error") == 0 || strcmp(array_exp->value_type, "error") == 0) {
            return false;
        }
        // Check if the indexing operator is applied to a non-array variable
        if (strcmp(array_exp->value_type, "array") != 0) {
            printf("Error type 10 at line %d: Indexing operator ([...]) applied to non-array variable \"%s\".\n", array_exp->lineno, array_exp->id);
            return false;
        }
        // Check if the index is an integer
        if (strcmp(index_exp->value_type, "int") != 0) {
            printf("Error type 12 at line %d: Array index is not an integer.\n", index_exp->lineno);
            index_error = true; // Ensure the external index error flag is set
            return true;
        }
        return true;
    }

    // Find the element type of an array
    char* find_array_elem_type(Node *exp) {
               // Find the ID node of the array
        Node *id = NULL;
        bool found = false;
        while (exp->child && !found) {
            exp = exp->child;
            Node *temp = exp;
            while (temp) {
                if (strcmp(temp->type, "ID") == 0) {
                    id = temp;
                    found = true;
                    break;
                }
                temp = temp->next;
            }
        }
        // Look up the matching array in the declarations and return its element type
        for (int i = 0; i < def_num; i++) {
            if (strcmp(def[i].name, id->id) == 0) {
                return def[i].elem_type;
            }
        }
        return NULL; // If no matching definition is found, return NULL
    }

    /* Structure member checks */
    // Check if an expression is a structure and if the member exists
    bool check_exp_structure(Node *structure_exp, Node *member_id) {
        // If the expression type is already an error, do not check further
        if (strcmp(structure_exp->value_type, "error") == 0 || strcmp(member_id->value_type, "error") == 0) {
            return false;
        }

        // Check if it is a structure
        bool is_structure_found = false;
        for (int i = 0; i < dec_num && !is_structure_found; i++) {
            if (strcmp(dec[i].name, structure_exp->value_type) == 0) {
                if (strcmp(dec[i].type, "structure") != 0) {
                    printf("Error type 13 at line %d: Illegal member access on non-structure variable \"%s\"\n", 
                        structure_exp->lineno, structure_exp->id);
                    return false;
                }
                is_structure_found = true;
            }
        }

        // If no corresponding structure definition is found, report an error
        if (!is_structure_found) {
            printf("Error type 13 at line %d: Illegal member access on non-structure variable \"%s\"\n", 
                structure_exp->lineno, structure_exp->id);
            return false;
        }

        // Check if the structure has the member
        char *type = find_structure_member_type(structure_exp->value_type, member_id->id);
        if (!type) {
            printf("Error type 14 at line %d: Structure '%s' has no member named '%s'\n", 
                structure_exp->lineno, structure_exp->value_type, member_id->id);
            return false;
        }

        return true;
    }

    /* Function call checks */
    // Check if a function exists
    bool check_if_func_exist(char *name, int lineno) {
        // First, check if the global declarations contain the name
        for (int i = 0; i < dec_num; ++i) {
            if (strcmp(dec[i].name, name) == 0) {
                // Name matches, check if it is a function type
                if (strcmp(dec[i].type, "function") != 0) {
                    printf("Error type 11 at Line %d: '%s' is not a function name.\n", lineno, name);
                    return false;
                }
                return true;
            }
        }

        // Next, check if there is a parameter or local declaration with the same name in the current function
        for (int i = 0; i < def_num; ++i) {
            if (strcmp(def[i].name, current_function_name) == 0) {
                // Check parameters
                for (int j = 0; j < def[i].arg_num; ++j) {
                    if (strcmp(def[i].args[j].name, name) == 0) {
                        printf("Error type 11 at Line %d: '%s' is a parameter, not a function.\n", lineno, name);
                        return false;
                    }
                }
                // Check local declarations
                for (int j = 0; j < def[i].dec_num; ++j) {
                    if (strcmp(def[i].dec[j].name, name) == 0) {
                        if (strcmp(def[i].dec[j].type, "function") != 0) {
                            printf("Error type 11 at Line %d: '%s' is not a function name.\n", lineno, name);
                            return false;
                        }
                        return true;
                    }
                }
            }
        }

        // If previous checks did not return,意味着函数未定义
        printf("Error type 2 at Line %d: Function \"%s\" is invoked without definition.\n", lineno, name);
        return false;
    }

    /* Variable checks */
    // Check the type of an expression ID and return its type
    char* check_exp_id(Node *id) {
        char *type = "error"; // Default type is "error"

        // First, search in global declarations
        for (int i = 0; i < dec_num; ++i) {
            if (strcmp(dec[i].name, id->id) == 0) {
                return dec[i].type; // Found a match, return the corresponding type
            }
        }

        // Then, check if it is a member of a structure definition
        for (int i = 0; i < def_num; ++i) {
            for (int j = 0; j < def[i].dec_num; ++j) {
                if (strcmp(def[i].dec[j].name, id->id) == 0) {
                    return def[i].dec[j].type; // Found a match, return the corresponding type
                }
            }
        }

        // Finally, check if it is a parameter or local variable in the current function
        for (int i = 0; i < def_num; ++i) {
            if (strcmp(def[i].name, current_function_name) == 0) {
                // Check parameters
                for (int j = 0; j < def[i].arg_num; ++j) {
                    if (strcmp(def[i].args[j].name, id->id) == 0) {
                        return def[i].args[j].type; // Found a match, return the corresponding type
                    }
                }
                // Check local variables
                for (int j = 0; j < def[i].dec_num; ++j) {
                    if (strcmp(def[i].dec[j].name, id->id) == 0) {
                        return def[i].dec[j].type; // Found a match, return the corresponding type
                    }
                }
            }
        }

        // If the identifier is undefined and inside a function, print an error message
        if (strcmp(type, "error") == 0 && is_in_function) {
            printf("Error type 1 at line %d: Undefined variable \"%s\".\n", id->lineno, id->id);
        }
        return type; // If no matching declaration is found, return "error"
    }

#line 633 "syntax.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "syntax.tab.h".  */
#ifndef YY_YY_SYNTAX_TAB_H_INCLUDED
# define YY_YY_SYNTAX_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ASSIGN = 258,
    OR = 259,
    AND = 260,
    LT = 261,
    LE = 262,
    GT = 263,
    GE = 264,
    NE = 265,
    EQ = 266,
    PLUS = 267,
    MINUS = 268,
    MUL = 269,
    DIV = 270,
    NOT = 271,
    NEGATIVE = 272,
    LC = 273,
    RC = 274,
    LB = 275,
    RB = 276,
    LP = 277,
    RP = 278,
    DOT = 279,
    ID = 280,
    INT = 281,
    FLOAT = 282,
    CHAR = 283,
    STRUCT = 284,
    RETURN = 285,
    IF = 286,
    ELSE = 287,
    WHILE = 288,
    TYPE = 289,
    SEMI = 290,
    COMMA = 291,
    ILLEGAL = 292,
    ILLEGAL_ID = 293,
    ILLEGAL_HEX_INT = 294,
    ILLEGAL_CHAR = 295
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 568 "syntax.y" /* yacc.c:355  */

    int     num;
    char*   str;
    struct Head* node; /* "struct" is indispensable */

#line 720 "syntax.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SYNTAX_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 737 "syntax.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  9
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   499

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  41
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  20
/* YYNRULES -- Number of rules.  */
#define YYNRULES  75
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  141

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   295

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   589,   589,   592,   593,   596,   597,   598,   599,   602,
     603,   606,   607,   610,   611,   614,   615,   616,   619,   620,
     621,   622,   625,   626,   629,   632,   635,   636,   637,   640,
     641,   642,   643,   644,   645,   646,   649,   650,   653,   654,
     657,   658,   661,   662,   665,   666,   667,   668,   669,   670,
     671,   672,   673,   674,   675,   676,   677,   678,   679,   680,
     681,   682,   683,   684,   685,   686,   687,   688,   689,   690,
     691,   692,   693,   694,   697,   698
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ASSIGN", "OR", "AND", "LT", "LE", "GT",
  "GE", "NE", "EQ", "PLUS", "MINUS", "MUL", "DIV", "NOT", "NEGATIVE", "LC",
  "RC", "LB", "RB", "LP", "RP", "DOT", "ID", "INT", "FLOAT", "CHAR",
  "STRUCT", "RETURN", "IF", "ELSE", "WHILE", "TYPE", "SEMI", "COMMA",
  "ILLEGAL", "ILLEGAL_ID", "ILLEGAL_HEX_INT", "ILLEGAL_CHAR", "$accept",
  "Program", "ExtDefList", "ExtDef", "ExtDecList", "Specifier",
  "StructSpecifier", "VarDec", "FunDec", "VarList", "ParamDec", "CompSt",
  "StmtList", "Stmt", "DefList", "Def", "DecList", "Dec", "Exp", "Args", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295
};
# endif

#define YYPACT_NINF -62

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-62)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      45,   -13,   -62,    24,   -62,    45,    81,   -62,    12,   -62,
     -62,     4,   -62,    31,    15,    -7,    16,    45,    80,   -62,
     -62,   -62,    42,   -19,    45,   -62,   -19,    58,    45,   -62,
     -62,   -19,     8,    46,    62,   -62,   -62,   409,     2,    19,
      48,   -62,   -62,    65,   -62,   -62,    45,   -62,   444,   444,
     444,    82,   -62,   -62,   -62,   444,    83,    86,   109,   111,
     112,   -62,    68,   384,   157,   444,   -62,   -62,   -19,   -62,
     379,    49,    52,   428,    87,   444,   444,   -62,   -62,   -62,
     -62,   -62,   409,   444,   444,   444,   444,   444,   444,   444,
     444,   444,   444,   444,   444,   444,   444,    90,   -62,   444,
     332,   -62,   -62,   -62,   -62,   192,    10,   -62,   -62,   227,
     262,   116,   332,   352,   371,   462,   462,   462,   462,   462,
     462,   379,   379,    49,    49,   297,   -62,   122,   444,   -62,
     -62,   409,   409,   -62,   -62,   -62,   -62,    88,   -62,   409,
     -62
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,     0,    11,     0,     2,     4,     0,    12,    14,     1,
       3,    15,     7,     0,     0,     9,     0,    37,     0,    16,
       6,     5,     0,     0,    37,     8,     0,     0,    37,    21,
      19,     0,     0,    23,     0,    15,    10,    28,    42,     0,
      40,    13,    36,    24,    20,    18,     0,    17,     0,     0,
       0,    66,    67,    68,    69,     0,     0,     0,     0,     0,
       0,    30,     0,    28,     0,     0,    39,    38,     0,    22,
      59,    60,     0,     0,     0,     0,     0,    70,    71,    72,
      25,    26,    28,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    29,     0,
      43,    41,    58,    57,    63,    75,     0,    32,    31,     0,
       0,     0,    44,    46,    45,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,     0,    65,     0,     0,    62,
      61,     0,     0,    27,    64,    73,    74,    33,    35,     0,
      34
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -62,   -62,   113,   -62,    98,     3,   -62,   -16,   -62,    92,
     -62,   123,   -59,   -61,   -10,    77,    73,   -62,   -48,    17
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     3,     4,     5,    14,    26,     7,    15,    16,    32,
      33,    61,    62,    63,    27,    28,    39,    40,    64,   106
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      70,    71,    72,     6,    81,    65,    35,    74,     6,    44,
      38,   129,     8,    22,    37,    43,    20,   100,    42,    13,
      66,    31,    22,   111,     9,   105,    18,   109,   110,    23,
      17,    45,    19,   130,    24,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,    31,
      21,   127,    38,   102,    67,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    34,    96,
     137,   138,    96,    97,     1,   103,    97,    41,   140,     2,
     105,    29,    46,    47,    68,    22,    99,    80,   107,    99,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    30,    73,    75,    11,    96,    76,     1,
      77,    97,    78,    79,     2,   126,    12,   133,    10,    13,
     139,    36,   108,   135,    99,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    69,    25,
      82,   101,    96,     0,     0,   136,    97,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    99,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,     0,     0,     0,     0,    96,     0,     0,
       0,    97,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    98,     0,    99,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,     0,     0,
       0,     0,    96,     0,     0,     0,    97,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   128,    99,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,     0,     0,     0,     0,    96,     0,     0,
     131,    97,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    99,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,     0,     0,
       0,     0,    96,     0,     0,   132,    97,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    99,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,     0,     0,     0,     0,    96,   134,     0,
       0,    97,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    99,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,     0,     0,
       0,     0,    96,     0,     0,     0,    97,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,     0,    99,
       0,     0,    96,     0,     0,     0,    97,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,     0,     0,    99,
       0,    96,     0,    94,    95,    97,     0,    48,     0,    96,
      49,     0,    24,    97,     0,     0,    50,     0,    99,    51,
      52,    53,    54,     1,    55,    56,    99,    57,     2,     0,
       0,    58,    48,    59,    60,    49,     0,    24,     0,     0,
       0,    50,     0,     0,    51,    52,    53,    54,     0,    55,
      56,    48,    57,     0,    49,     0,    58,     0,    59,    60,
      50,   104,     0,    51,    52,    53,    54,    48,     0,     0,
      49,     0,     0,     0,     0,    58,    50,    59,    60,    51,
      52,    53,    54,     0,    92,    93,    94,    95,     0,     0,
       0,    58,    96,    59,    60,     0,    97,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    99
};

static const yytype_int16 yycheck[] =
{
      48,    49,    50,     0,    63,     3,    25,    55,     5,     1,
      26,     1,    25,    20,    24,    31,     1,    65,    28,    38,
       1,    18,    20,    82,     0,    73,    22,    75,    76,    36,
      18,    23,     1,    23,    18,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    96,    46,
      35,    99,    68,     1,    35,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    26,    20,
     131,   132,    20,    24,    29,    23,    24,    19,   139,    34,
     128,     1,    36,    21,    36,    20,    37,    19,     1,    37,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    23,    22,    22,    25,    20,    22,    29,
       1,    24,     1,     1,    34,    25,    35,     1,     5,    38,
      32,    23,    35,     1,    37,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    46,    16,
      63,    68,    20,    -1,    -1,   128,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    37,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    -1,    -1,    -1,    -1,    20,    -1,    -1,
      -1,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    35,    -1,    37,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    -1,    -1,
      -1,    -1,    20,    -1,    -1,    -1,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    36,    37,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    -1,    -1,    -1,    -1,    20,    -1,    -1,
      23,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    37,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    -1,    -1,
      -1,    -1,    20,    -1,    -1,    23,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    37,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    -1,    -1,    -1,    -1,    20,    21,    -1,
      -1,    24,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    37,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    -1,    -1,
      -1,    -1,    20,    -1,    -1,    -1,    24,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    -1,    37,
      -1,    -1,    20,    -1,    -1,    -1,    24,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    -1,    -1,    37,
      -1,    20,    -1,    14,    15,    24,    -1,    13,    -1,    20,
      16,    -1,    18,    24,    -1,    -1,    22,    -1,    37,    25,
      26,    27,    28,    29,    30,    31,    37,    33,    34,    -1,
      -1,    37,    13,    39,    40,    16,    -1,    18,    -1,    -1,
      -1,    22,    -1,    -1,    25,    26,    27,    28,    -1,    30,
      31,    13,    33,    -1,    16,    -1,    37,    -1,    39,    40,
      22,    23,    -1,    25,    26,    27,    28,    13,    -1,    -1,
      16,    -1,    -1,    -1,    -1,    37,    22,    39,    40,    25,
      26,    27,    28,    -1,    12,    13,    14,    15,    -1,    -1,
      -1,    37,    20,    39,    40,    -1,    24,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    37
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    29,    34,    42,    43,    44,    46,    47,    25,     0,
      43,    25,    35,    38,    45,    48,    49,    18,    22,     1,
       1,    35,    20,    36,    18,    52,    46,    55,    56,     1,
      23,    46,    50,    51,    26,    25,    45,    55,    48,    57,
      58,    19,    55,    48,     1,    23,    36,    21,    13,    16,
      22,    25,    26,    27,    28,    30,    31,    33,    37,    39,
      40,    52,    53,    54,    59,     3,     1,    35,    36,    50,
      59,    59,    59,    22,    59,    22,    22,     1,     1,     1,
      19,    53,    56,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    20,    24,    35,    37,
      59,    57,     1,    23,    23,    59,    60,     1,    35,    59,
      59,    53,    59,    59,    59,    59,    59,    59,    59,    59,
      59,    59,    59,    59,    59,    59,    25,    59,    36,     1,
      23,    23,    23,     1,    21,     1,    60,    54,    54,    32,
      54
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    41,    42,    43,    43,    44,    44,    44,    44,    45,
      45,    46,    46,    47,    47,    48,    48,    48,    49,    49,
      49,    49,    50,    50,    51,    52,    53,    53,    53,    54,
      54,    54,    54,    54,    54,    54,    55,    55,    56,    56,
      57,    57,    58,    58,    59,    59,    59,    59,    59,    59,
      59,    59,    59,    59,    59,    59,    59,    59,    59,    59,
      59,    59,    59,    59,    59,    59,    59,    59,    59,    59,
      59,    59,    59,    59,    60,    60
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     0,     3,     3,     2,     3,     1,
       3,     1,     1,     5,     2,     1,     2,     4,     4,     3,
       4,     3,     3,     1,     2,     4,     2,     4,     0,     2,
       1,     3,     3,     5,     7,     5,     2,     0,     3,     3,
       1,     3,     1,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     2,
       2,     4,     4,     3,     4,     3,     1,     1,     1,     1,
       2,     2,     2,     4,     3,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 589 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"Program","",(yyvsp[0].node),NULL,0);root=(yyval.node);}
#line 1979 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 592 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(2,(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"ExtDefList","",(yyvsp[-1].node),NULL,0);}
#line 1985 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 593 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"empty","",NULL,NULL,100);}
#line 1991 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 596 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"ExtDef","",(yyvsp[-2].node),NULL,0);insert_ExtDecList((yyvsp[-1].node));}
#line 1997 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 597 "syntax.y" /* yacc.c:1646  */
    {printf("Error type B at line %d: missing semicolon ';'\n", (yyvsp[-2].node)->lineno);}
#line 2003 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 598 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(2,(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"ExtDef","",(yyvsp[-1].node),NULL,0);}
#line 2009 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 599 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"ExtDef","",(yyvsp[-2].node),NULL,0);if(is_in_function){set_func_return_type(current_function_name,(yyvsp[-2].node)->child->id);check_func_return_type((yyvsp[0].node),(yyvsp[-2].node)->child->id);}is_in_function=false;}
#line 2015 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 602 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"ExtDecList","",(yyvsp[0].node),NULL,0);}
#line 2021 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 603 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"ExtDecList","",(yyvsp[-2].node),NULL,0);}
#line 2027 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 606 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"Specifier","",(yyvsp[0].node),NULL,0);set_last_type((yyvsp[0].node)->id);}
#line 2033 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 607 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"Specifier","",(yyvsp[0].node),NULL,0);}
#line 2039 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 610 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(5,(yyvsp[-4].node),(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"StructSpecifier","",(yyvsp[-4].node),NULL,0);if(add_dec((yyvsp[-3].node)->id,"structure",(yyvsp[-3].node)->lineno)&&add_func_or_struct((yyvsp[-3].node)->id,(yyvsp[-3].node)->lineno,"structure")){add_struct_member_deflist((yyvsp[-1].node),(yyvsp[-3].node)->id);}}
#line 2045 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 611 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(2,(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"StructSpecifier","",(yyvsp[-1].node),NULL,0);set_last_type((yyvsp[0].node)->id);}
#line 2051 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 614 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"VarDec","",(yyvsp[0].node),NULL,0);}
#line 2057 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 615 "syntax.y" /* yacc.c:1646  */
    {printf("Error type A at line %d: illegal identifier '%s'\n", (yyvsp[-1].node)->lineno,(yyvsp[-1].node)->id);}
#line 2063 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 616 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(4,(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"VarDec","",(yyvsp[-3].node),NULL,0);}
#line 2069 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 619 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(4,(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"FunDec","",(yyvsp[-3].node),NULL,0);if(add_dec((yyvsp[-3].node)->id,"function",(yyvsp[-3].node)->lineno)&&add_func_or_struct((yyvsp[-3].node)->id,(yyvsp[-3].node)->lineno,"function")){insert_function_args((yyvsp[-3].node)->id,(yyvsp[-1].node));current_function_name=(yyvsp[-3].node)->id;is_in_function=true;} else{is_in_function=false;}}
#line 2075 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 620 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"FunDec","",(yyvsp[-2].node),NULL,0);if(add_dec((yyvsp[-2].node)->id,"function",(yyvsp[-2].node)->lineno)&&add_func_or_struct((yyvsp[-2].node)->id,(yyvsp[-2].node)->lineno,"function")){current_function_name=(yyvsp[-2].node)->id;is_in_function=true;} else{is_in_function=false;}}
#line 2081 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 621 "syntax.y" /* yacc.c:1646  */
    {printf("Error type B at line %d: missing closing symbols ')'\n", (yyvsp[-3].node)->lineno);}
#line 2087 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 622 "syntax.y" /* yacc.c:1646  */
    {printf("Error type B at line %d: missing closing symbols ')'\n", (yyvsp[-2].node)->lineno);}
#line 2093 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 625 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"VarList","",(yyvsp[-2].node),NULL,0);}
#line 2099 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 626 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"VarList","",(yyvsp[0].node),NULL,0);}
#line 2105 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 629 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(2,(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"ParamDec","",(yyvsp[-1].node),NULL,0);}
#line 2111 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 632 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(4,(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"CompSt","",(yyvsp[-3].node),NULL,0);}
#line 2117 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 635 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(2,(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"StmtList","",(yyvsp[-1].node),NULL,0);}
#line 2123 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 636 "syntax.y" /* yacc.c:1646  */
    {printf("Error type B at line %d: definition after statement\n", (yyvsp[-2].node)->lineno);}
#line 2129 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 637 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"empty","",NULL,NULL,100);}
#line 2135 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 640 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(2,(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Stmt","",(yyvsp[-1].node),NULL,0);}
#line 2141 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 641 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"Stmt","",(yyvsp[0].node),NULL,0);}
#line 2147 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 642 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Stmt","",(yyvsp[-2].node),NULL,0);}
#line 2153 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 643 "syntax.y" /* yacc.c:1646  */
    {printf("Error type B at line %d: missing semicolon ';'\n", (yyvsp[-2].node)->lineno);}
#line 2159 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 644 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(5,(yyvsp[-4].node),(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Stmt","",(yyvsp[-4].node),NULL,0);}
#line 2165 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 645 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(7,(yyvsp[-6].node),(yyvsp[-5].node),(yyvsp[-4].node),(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Stmt","",(yyvsp[-6].node),NULL,0);}
#line 2171 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 646 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(5,(yyvsp[-4].node),(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Stmt","",(yyvsp[-4].node),NULL,0);}
#line 2177 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 649 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(2,(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"DefList","",(yyvsp[-1].node),NULL,0);}
#line 2183 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 650 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"empty","",NULL,NULL,100);}
#line 2189 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 653 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Def","",(yyvsp[-2].node),NULL,0);check_Def((yyval.node));}
#line 2195 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 654 "syntax.y" /* yacc.c:1646  */
    {printf("Error type B at line %d: missing semicolon ';'\n", (yyvsp[-2].node)->lineno);}
#line 2201 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 657 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"DecList","",(yyvsp[0].node),NULL,0);}
#line 2207 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 658 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"DecList","",(yyvsp[-2].node),NULL,0);}
#line 2213 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 661 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"Dec","",(yyvsp[0].node),NULL,0);insert_func_variables((yyval.node));}
#line 2219 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 662 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Dec","",(yyvsp[-2].node),NULL,0);insert_func_variables((yyval.node));}
#line 2225 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 665 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_assign((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),"int");}
#line 2231 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 666 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_logical_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),"int");}
#line 2237 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 667 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_logical_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),"int");}
#line 2243 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 668 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_logical_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),"int");}
#line 2249 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 669 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_logical_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),"int");}
#line 2255 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 670 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_logical_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),"int");}
#line 2261 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 671 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_logical_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),"int");}
#line 2267 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 672 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_logical_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),"int");}
#line 2273 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 673 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_logical_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),"int");}
#line 2279 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 674 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_arithmetic_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),(yyvsp[-2].node)->value_type);}
#line 2285 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 675 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_arithmetic_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),(yyvsp[-2].node)->value_type);}
#line 2291 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 676 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_arithmetic_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),(yyvsp[-2].node)->value_type);}
#line 2297 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 677 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);check_exp_arithmetic_symbols((yyvsp[-2].node),(yyvsp[0].node));set_rvalue((yyval.node));set_EXP_value_type((yyval.node),(yyvsp[-2].node)->value_type);}
#line 2303 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 678 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);strcpy((yyval.node)->value_type,(yyvsp[-1].node)->value_type);(yyval.node)->rvalue=(yyvsp[-1].node)->rvalue;}
#line 2309 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 679 "syntax.y" /* yacc.c:1646  */
    {printf("Error type B at line %d: missing closing symbols ')'\n", (yyvsp[-2].node)->lineno);}
#line 2315 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 680 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(2,(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-1].node),NULL,0);check_single_arithmetic_exp((yyvsp[0].node));(yyval.node)->rvalue=(yyvsp[0].node)->rvalue;set_EXP_value_type((yyval.node),(yyvsp[0].node)->value_type);}
#line 2321 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 681 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(2,(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-1].node),NULL,0);check_single_logical_exp((yyvsp[0].node));(yyval.node)->rvalue=(yyvsp[0].node)->rvalue;set_EXP_value_type((yyval.node),(yyvsp[0].node)->value_type);}
#line 2327 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 682 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(4,(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-3].node),NULL,0);if(check_if_func_exist((yyvsp[-3].node)->id,(yyvsp[-3].node)->lineno)){check_func_args((yyvsp[-3].node)->id,(yyvsp[-1].node),0);set_EXP_value_type((yyval.node),find_func_return_type((yyvsp[-3].node)->id));} else{set_EXP_value_type((yyval.node),"error");}}
#line 2333 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 683 "syntax.y" /* yacc.c:1646  */
    {printf("Error type B at line %d: missing closing symbols ')'\n", (yyvsp[-3].node)->lineno);}
#line 2339 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 684 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);if(check_if_func_exist((yyvsp[-2].node)->id,(yyvsp[-2].node)->lineno)){check_func_without_args((yyvsp[-2].node)->id,(yyvsp[-2].node)->lineno);set_EXP_value_type((yyval.node),find_func_return_type((yyvsp[-2].node)->id));} else{set_EXP_value_type((yyval.node),"error");}}
#line 2345 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 685 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(4,(yyvsp[-3].node),(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-3].node),NULL,0);if(check_exp_array((yyvsp[-3].node),(yyvsp[-1].node))){if(index_error){set_EXP_value_type((yyval.node),"None");index_error=false;}else{set_EXP_value_type((yyval.node),find_array_elem_type((yyvsp[-3].node)));}}else{set_EXP_value_type((yyval.node),"error");}}
#line 2351 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 686 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Exp","",(yyvsp[-2].node),NULL,0);if(check_exp_structure((yyvsp[-2].node),(yyvsp[0].node))){set_EXP_value_type((yyval.node),find_structure_member_type((yyvsp[-2].node)->value_type,(yyvsp[0].node)->id));}else{strcpy((yyval.node)->value_type,"None");}}
#line 2357 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 687 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"Exp","",(yyvsp[0].node),NULL,0);set_EXP_value_type((yyval.node),check_exp_id((yyvsp[0].node)));}
#line 2363 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 688 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"Exp","",(yyvsp[0].node),NULL,0);set_EXP_value_type((yyval.node),"int");(yyval.node)->rvalue=1;}
#line 2369 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 689 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"Exp","",(yyvsp[0].node),NULL,0);set_EXP_value_type((yyval.node),"float");(yyval.node)->rvalue=1;}
#line 2375 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 690 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"Exp","",(yyvsp[0].node),NULL,0);set_EXP_value_type((yyval.node),"char");(yyval.node)->rvalue=1;}
#line 2381 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 691 "syntax.y" /* yacc.c:1646  */
    {printf("Error type A at line %d: unknown lexeme '%s'\n", (yyvsp[-1].node)->lineno,(yyvsp[-1].node)->id);}
#line 2387 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 692 "syntax.y" /* yacc.c:1646  */
    {printf("Error type A at line %d: illegal hexadecimal integer '%s'\n", (yyvsp[-1].node)->lineno,(yyvsp[-1].node)->id);}
#line 2393 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 693 "syntax.y" /* yacc.c:1646  */
    {printf("Error type A at line %d: illegal hex_character '%s'\n", (yyvsp[-1].node)->lineno,(yyvsp[-1].node)->id);}
#line 2399 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 694 "syntax.y" /* yacc.c:1646  */
    {printf("Error type A at line %d: illegal operator '%s'\n", (yyvsp[-2].node)->lineno,(yyvsp[-2].node)->id);}
#line 2405 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 697 "syntax.y" /* yacc.c:1646  */
    {connect_to_next(3,(yyvsp[-2].node),(yyvsp[-1].node),(yyvsp[0].node));(yyval.node)=create_Node(0,"Args","",(yyvsp[-2].node),NULL,0);}
#line 2411 "syntax.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 698 "syntax.y" /* yacc.c:1646  */
    {(yyval.node)=create_Node(0,"Args","",(yyvsp[0].node),NULL,0);}
#line 2417 "syntax.tab.c" /* yacc.c:1646  */
    break;


#line 2421 "syntax.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 700 "syntax.y" /* yacc.c:1906  */

// Error handling function
void yyerror() {
    //printf("Syntax error at line %d: %s\n", line, s);
    //printf("Error type B at line ");
    flag=1;
    return ;
}

// Main function to parse the input file
int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <file_path>\n", argv[0]);
        exit(-1);
    } else if (!(yyin = fopen(argv[1], "r"))) {
        perror(argv[1]);
        exit(-1);
    }
    yyparse();
    if(flag==0)
    {
        //print_tree(root,0);
    }

    /*
    printf("\ntables:\n");
    // Print symbol table
    for(int i=0;i<dec_num;i++)
    {
        printf("%s %s\n",dec[i].name,dec[i].type);
    }
    
    // Print definition table
    for(int i=0;i<def_num;i++)
    {
        printf("%s \n",def[i].name);
        for(int j=0;j<def[i].arg_num;j++)
        {
            printf("%s %s\n",def[i].args[j].name,def[i].args[j].type);
        }
        for(int j=0;j<def[i].dec_num;j++)
        {
            printf("%s %s\n",def[i].dec[j].name,def[i].dec[j].type);
        }
        printf("return_type:%s\n",def[i].return_type);
    }
    */
    return 0;
}
