%{
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
%}
%union
{
    int     num;
    char*   str;
    struct Head* node; /* "struct" is indispensable */
}

%right ASSIGN
%left OR
%left AND
%left LT LE GT GE NE EQ
%left PLUS MINUS
%left MUL DIV
%right NOT NEGATIVE
%nonassoc LC RC LB RB LP RP DOT

%token <node> ID INT FLOAT CHAR STRUCT RETURN IF ELSE WHILE PLUS MINUS MUL DIV AND OR LT LE GT GE NE EQ NOT ASSIGN TYPE LP RP LB RB LC RC SEMI COMMA DOT ILLEGAL ILLEGAL_ID ILLEGAL_HEX_INT ILLEGAL_CHAR

%type <node> Program ExtDefList ExtDef ExtDecList Specifier StructSpecifier VarDec FunDec VarList ParamDec CompSt StmtList Stmt DefList Def DecList Dec Exp Args
%%

// Program starts with an external definition list
Program: ExtDefList {$$=create_Node(0,"Program","",$1,NULL,0);root=$$;}

// External definition list, can be empty or contain multiple external definitions
ExtDefList: ExtDef ExtDefList  {connect_to_next(2,$1,$2);$$=create_Node(0,"ExtDefList","",$1,NULL,0);}
          | /* empty */         {$$=create_Node(0,"empty","",NULL,NULL,100);}

// External definition, can be a variable or function declaration
ExtDef: Specifier ExtDecList SEMI   {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"ExtDef","",$1,NULL,0);insert_ExtDecList($2);}
      | Specifier ExtDecList error  {printf("Error type B at line %d: missing semicolon ';'\n", $1->lineno);}
      | Specifier SEMI              {connect_to_next(2,$1,$2);$$=create_Node(0,"ExtDef","",$1,NULL,0);}
      | Specifier FunDec CompSt     {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"ExtDef","",$1,NULL,0);if(is_in_function){set_func_return_type(current_function_name,$1->child->id);check_func_return_type($3,$1->child->id);}is_in_function=false;}

// Extended declaration list, can contain multiple variable declarations
ExtDecList: VarDec                      {$$=create_Node(0,"ExtDecList","",$1,NULL,0);}
           | VarDec COMMA ExtDecList    {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"ExtDecList","",$1,NULL,0);}

// Specifier can be a type or a structure specifier
Specifier: TYPE                         {$$=create_Node(0,"Specifier","",$1,NULL,0);set_last_type($1->id);}
          | StructSpecifier             {$$=create_Node(0,"Specifier","",$1,NULL,0);}

// Structure specifier defines a structure
StructSpecifier: STRUCT ID LC DefList RC    {connect_to_next(5,$1,$2,$3,$4,$5);$$=create_Node(0,"StructSpecifier","",$1,NULL,0);if(add_dec($2->id,"structure",$2->lineno)&&add_func_or_struct($2->id,$2->lineno,"structure")){add_struct_member_deflist($4,$2->id);}}
               | STRUCT ID                  {connect_to_next(2,$1,$2);$$=create_Node(0,"StructSpecifier","",$1,NULL,0);set_last_type($2->id);}

// Variable declaration
VarDec: ID                              {$$=create_Node(0,"VarDec","",$1,NULL,0);}
       | ILLEGAL_ID error               {printf("Error type A at line %d: illegal identifier '%s'\n", $1->lineno,$1->id);}
       | VarDec LB INT RB               {connect_to_next(4,$1,$2,$3,$4);$$=create_Node(0,"VarDec","",$1,NULL,0);}

// Function declaration
FunDec: ID LP VarList RP                {connect_to_next(4,$1,$2,$3,$4);$$=create_Node(0,"FunDec","",$1,NULL,0);if(add_dec($1->id,"function",$1->lineno)&&add_func_or_struct($1->id,$1->lineno,"function")){insert_function_args($1->id,$3);current_function_name=$1->id;is_in_function=true;} else{is_in_function=false;}}
       | ID LP RP                       {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"FunDec","",$1,NULL,0);if(add_dec($1->id,"function",$1->lineno)&&add_func_or_struct($1->id,$1->lineno,"function")){current_function_name=$1->id;is_in_function=true;} else{is_in_function=false;}}
       | ID LP VarList error            {printf("Error type B at line %d: missing closing symbols ')'\n", $1->lineno);}  
       | ID LP error                    {printf("Error type B at line %d: missing closing symbols ')'\n", $1->lineno);} 

// Variable list for function arguments
VarList: ParamDec COMMA VarList         {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"VarList","",$1,NULL,0);}
        | ParamDec                      {$$=create_Node(0,"VarList","",$1,NULL,0);}

// Parameter declaration
ParamDec: Specifier VarDec              {connect_to_next(2,$1,$2);$$=create_Node(0,"ParamDec","",$1,NULL,0);}

// Compound statement (block)
CompSt: LC DefList StmtList RC          {connect_to_next(4,$1,$2,$3,$4);$$=create_Node(0,"CompSt","",$1,NULL,0);}

// Statement list, can be empty or contain multiple statements
StmtList: Stmt StmtList                 {connect_to_next(2,$1,$2);$$=create_Node(0,"StmtList","",$1,NULL,0);}
         |Stmt Def StmtList error       {printf("Error type B at line %d: definition after statement\n", $2->lineno);}
         | /* empty */                  {$$=create_Node(0,"empty","",NULL,NULL,100);}

// Statement can be an expression, a compound statement, a return statement, etc.
Stmt: Exp SEMI                          {connect_to_next(2,$1,$2);$$=create_Node(0,"Stmt","",$1,NULL,0);}
    | CompSt                            {$$=create_Node(0,"Stmt","",$1,NULL,0);}
    | RETURN Exp SEMI                   {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Stmt","",$1,NULL,0);}
    | RETURN Exp error                  {printf("Error type B at line %d: missing semicolon ';'\n", $1->lineno);}     
    | IF LP Exp RP Stmt                 {connect_to_next(5,$1,$2,$3,$4,$5);$$=create_Node(0,"Stmt","",$1,NULL,0);}
    | IF LP Exp RP Stmt ELSE Stmt       {connect_to_next(7,$1,$2,$3,$4,$5,$6,$7);$$=create_Node(0,"Stmt","",$1,NULL,0);}
    | WHILE LP Exp RP Stmt              {connect_to_next(5,$1,$2,$3,$4,$5);$$=create_Node(0,"Stmt","",$1,NULL,0);}

// Definition list, can be empty or contain multiple definitions
DefList: Def DefList                    {connect_to_next(2,$1,$2);$$=create_Node(0,"DefList","",$1,NULL,0);}
        | /* empty */                   {$$=create_Node(0,"empty","",NULL,NULL,100);}

// Definition, can be a variable or function definition
Def: Specifier DecList SEMI             {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Def","",$1,NULL,0);check_Def($$);}
        | Specifier DecList error       {printf("Error type B at line %d: missing semicolon ';'\n", $1->lineno);}

// Declaration list, can contain multiple declarations
DecList: Dec                            {$$=create_Node(0,"DecList","",$1,NULL,0);}
        | Dec COMMA DecList             {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"DecList","",$1,NULL,0);}

// Declaration, can be a single variable or an initialized variable
Dec: VarDec                             {$$=create_Node(0,"Dec","",$1,NULL,0);insert_func_variables($$);}
    | VarDec ASSIGN Exp                 {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Dec","",$1,NULL,0);insert_func_variables($$);}

// Expressions, including various operators and their precedence
Exp: Exp ASSIGN Exp                     {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_assign($1,$3);set_rvalue($$);set_EXP_value_type($$,"int");}
    | Exp AND Exp                       {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_logical_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,"int");}
    | Exp OR Exp                        {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_logical_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,"int");}    
    | Exp LT Exp                        {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_logical_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,"int");}    
    | Exp LE Exp                        {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_logical_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,"int");}    
    | Exp GT Exp                        {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_logical_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,"int");}
    | Exp GE Exp                        {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_logical_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,"int");}
    | Exp NE Exp                        {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_logical_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,"int");}
    | Exp EQ Exp                        {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_logical_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,"int");}
    | Exp PLUS Exp                      {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_arithmetic_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,$1->value_type);}
    | Exp MINUS Exp                     {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_arithmetic_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,$1->value_type);}
    | Exp MUL Exp                       {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_arithmetic_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,$1->value_type);}
    | Exp DIV Exp                       {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);check_exp_arithmetic_symbols($1,$3);set_rvalue($$);set_EXP_value_type($$,$1->value_type);}
    | LP Exp RP                         {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);strcpy($$->value_type,$2->value_type);$$->rvalue=$2->rvalue;}
    | LP Exp error                      {printf("Error type B at line %d: missing closing symbols ')'\n", $1->lineno);}
    | MINUS Exp                         {connect_to_next(2,$1,$2);$$=create_Node(0,"Exp","",$1,NULL,0);check_single_arithmetic_exp($2);$$->rvalue=$2->rvalue;set_EXP_value_type($$,$2->value_type);}
    | NOT Exp                           {connect_to_next(2,$1,$2);$$=create_Node(0,"Exp","",$1,NULL,0);check_single_logical_exp($2);$$->rvalue=$2->rvalue;set_EXP_value_type($$,$2->value_type);}
    | ID LP Args RP                     {connect_to_next(4,$1,$2,$3,$4);$$=create_Node(0,"Exp","",$1,NULL,0);if(check_if_func_exist($1->id,$1->lineno)){check_func_args($1->id,$3,0);set_EXP_value_type($$,find_func_return_type($1->id));} else{set_EXP_value_type($$,"error");}}         // Call function a(...)
    | ID LP Args error                  {printf("Error type B at line %d: missing closing symbols ')'\n", $1->lineno);}
    | ID LP RP                          {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);if(check_if_func_exist($1->id,$1->lineno)){check_func_without_args($1->id,$1->lineno);set_EXP_value_type($$,find_func_return_type($1->id));} else{set_EXP_value_type($$,"error");}}    // Call function, no arguments
    | Exp LB Exp RB                     {connect_to_next(4,$1,$2,$3,$4);$$=create_Node(0,"Exp","",$1,NULL,0);if(check_exp_array($1,$3)){if(index_error){set_EXP_value_type($$,"None");index_error=false;}else{set_EXP_value_type($$,find_array_elem_type($1));}}else{set_EXP_value_type($$,"error");}}     // Array access a[...]
    | Exp DOT ID                        {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Exp","",$1,NULL,0);if(check_exp_structure($1,$3)){set_EXP_value_type($$,find_structure_member_type($1->value_type,$3->id));}else{strcpy($$->value_type,"None");}}    // Structure
    | ID                                {$$=create_Node(0,"Exp","",$1,NULL,0);set_EXP_value_type($$,check_exp_id($1));}
    | INT                               {$$=create_Node(0,"Exp","",$1,NULL,0);set_EXP_value_type($$,"int");$$->rvalue=1;}
    | FLOAT                             {$$=create_Node(0,"Exp","",$1,NULL,0);set_EXP_value_type($$,"float");$$->rvalue=1;}
    | CHAR                              {$$=create_Node(0,"Exp","",$1,NULL,0);set_EXP_value_type($$,"char");$$->rvalue=1;}
    | ILLEGAL error                     {printf("Error type A at line %d: unknown lexeme '%s'\n", $1->lineno,$1->id);}
    | ILLEGAL_HEX_INT error             {printf("Error type A at line %d: illegal hexadecimal integer '%s'\n", $1->lineno,$1->id);}
    | ILLEGAL_CHAR error                {printf("Error type A at line %d: illegal hex_character '%s'\n", $1->lineno,$1->id);}
    | Exp ILLEGAL Exp error             {printf("Error type A at line %d: illegal operator '%s'\n", $2->lineno,$2->id);}

// Arguments in a function call
Args: Exp COMMA Args                    {connect_to_next(3,$1,$2,$3);$$=create_Node(0,"Args","",$1,NULL,0);}
     | Exp                              {$$=create_Node(0,"Args","",$1,NULL,0);}

%%
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