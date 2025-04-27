#ifndef HEAD_H_  // Prevent multiple inclusions of this header file
#define HEAD_H_

#ifdef __cplusplus  // Allow C++ to call C code by using C linkage
extern "C" {
#endif

#include <stdbool.h>  // Include the standard boolean type for flag values

// Structure for variable declarations
typedef struct {
    char name[100];  // Variable name
    char type[100];  // Variable type
} declare;

// Structure for complex type definitions (arrays, structs, functions)
typedef struct {
    char name[100];          // Type name (e.g., struct, function)
    char elem_type[100];     // Element type for arrays
    declare dec[100];        // Structure members or function local variables
    char return_type[100];   // Function return type
    declare args[100];       // Function arguments
    int arg_num;             // Number of function arguments
    int dec_num;             // Number of declarations in 'dec' array
} definition;

extern declare dec[100];     // Global variable table
extern int dec_num;          // Global variable count
extern definition def[100];  // Complex type definitions array
extern int def_num;          // Complex type definition count
extern char last_type[100];  // Last defined type name

// Function declarations

// Set the name of the last defined type
void set_last_type(char *type);

// Add a new variable declaration
// Returns true if successful
bool add_dec(char *name, char *type, int lineno);

// Add a new array definition
void add_array(char *name, char *elem_type, int lineno);

// Add a new function or struct definition
// Returns true if successful
bool add_func_or_struct(char *name, int lineno, char *type);

// Link a function or struct to its variables/members
void build_func_and_struct_dec(char *name, char *dec_name, char *type);

// Find the type of a variable, function, or struct
char* find_id_type(char *name);

// Find the declaration of a function or struct by name
declare* find_func_or_struct_dec(char *name);

// Find the return type of a function by name
char* find_func_return_type(char *name);

// Add a new member to a struct
void add_struct_member(char *struct_name, char *member_name, char *member_type, int lineno);

// Add a new argument to a function
void add_func_args(char *func_name, char *arg_name, char *arg_type, int lineno);

// Add a new variable to a function
void add_func_variables(char *func_name, char *variable_name, char *variable_type, int lineno);

// Find the type of a struct member
char* find_structure_member_type(char *struct_name, char *member_name);

// Set the return type of a function
void set_func_return_type(char *func_name, char *return_type);

#ifdef __cplusplus
}  
#endif

#endif /* MYHEAD_H_ */
