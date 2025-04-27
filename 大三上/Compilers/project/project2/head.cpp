#include "head.h"
#include <cstdio>
#include <cstring>

declare dec[100];  // Global variable table
int dec_num = 0;   // Number of global variables
definition def[100];  // Array of complex type definitions (array, struct, function)
int def_num = 0;      // Number of complex type definitions (array, struct, function)
char last_type[100];  // Name of the last defined type

// Set the name of the last defined type
void set_last_type(char *type) {
    strcpy(last_type, type);  // Copy the type name to last_type
}

// Add a new variable declaration to the global variable table
// Returns true if successful, false if the variable is already defined
bool add_dec(char *name, char *type, int lineno) {
    // Check if the variable has already been defined
    for (int i = 0; i < dec_num; ++i) {
        if (strcmp(dec[i].name, name) == 0) {
            // Determine the type of the existing definition (function, structure, or variable)
            const char *errorType =
                strcmp(dec[i].type, "function") == 0 ? "function" :
                strcmp(dec[i].type, "structure") == 0 ? "structure" :
                "variable";
            int errorTypeCode = strcmp(errorType, "function") == 0 ? 4 :
                                strcmp(errorType, "structure") == 0 ? 15 :
                                3;
            // Print error message if variable is redefined
            printf("Error type %d at Line %d: Redefined %s \"%s\".\n", errorTypeCode, lineno, errorType, name);
            return false;
        }
    }

    // Add new variable declaration
    strcpy(dec[dec_num].name, name);
    strcpy(dec[dec_num].type, type);
    dec_num++;  // Increase the variable count
    return true;
}

// Add a new array definition to the complex type definitions
void add_array(char *name, char *elem_type, int lineno) {
    // Check if the array has already been defined
    for (int i = 0; i < def_num; ++i) {
        if (strcmp(def[i].name, name) == 0) {
            // Print error if the array is already defined
            printf("Error type 3 at Line %d: Redefined variable \"%s\".\n", lineno, name);
            return;
        }
    }

    // Add new array definition
    strcpy(def[def_num].name, name);
    strcpy(def[def_num].elem_type, elem_type);
    def[def_num].dec_num = 0;  // Initialize the count of internal variables in the array
    def_num++;  // Increase the type definition count
}

// Add a new function or struct definition to the complex type definitions
// Returns true if successful, false if already defined
bool add_func_or_struct(char *name, int lineno, char *type) {
    // Check if the function or struct has already been defined
    for (int i = 0; i < def_num; ++i) {
        if (strcmp(def[i].name, name) == 0) {
            // Print error based on whether it's a function or a structure
            int errorTypeCode = strcmp(type, "function") == 0 ? 4 : 15;
            const char *typeText = strcmp(type, "function") == 0 ? "function" : "structure";
            printf("Error type %d at Line %d: Redefined %s \"%s\".\n", errorTypeCode, lineno, typeText, name);
            return false;
        }
    }

    // Add new function or struct definition
    strcpy(def[def_num].name, name);
    if (strcmp(type, "function") == 0) {
        def[def_num].arg_num = 0; // Initialize function argument count
    }
    def[def_num].dec_num = 0; // Initialize member or local variable count
    def_num++;  // Increase the type definition count
    return true;
}

// Link function or struct to its internal variables or members
void build_func_and_struct_dec(char *name, char *dec_name, char *type) {
    // Find the specific function or struct by name
    for (int i = 0; i < def_num; ++i) {
        if (strcmp(def[i].name, name) == 0) {
            // Add the member or variable to the function/struct
            strcpy(def[i].dec[def[i].dec_num].name, dec_name);
            strcpy(def[i].dec[def[i].dec_num].type, type);
            def[i].dec_num++;  // Update member count
            return;
        }
    }
}

// Find the type of an identifier (variable, function, or struct)
char* find_id_type(char *name) {
    // Traverse the variable table and find the matching type
    for (int i = 0; i < dec_num; ++i) {
        if (strcmp(dec[i].name, name) == 0) {
            return dec[i].type; // Return the type of the found variable
        }
    }
    return NULL; // Return NULL if not found
}

// Find the declaration of a function or struct by its name
declare* find_func_or_struct_dec(char *name) {
    // Traverse the definition array and find the matching function or struct
    for (int i = 0; i < def_num; i++) {
        if (strcmp(def[i].name, name) == 0) {
            return def[i].dec; // Return the declarations of the found function or struct
        }
    }
    return NULL; // Return NULL if not found
}

// Find the return type of a function by its name
char* find_func_return_type(char *name) {
    // Traverse the definition array and find the matching function
    for (int i = 0; i < def_num; i++) {
        if (strcmp(def[i].name, name) == 0) {
            return def[i].return_type; // Return the function's return type
        }
    }
    return NULL; // Return NULL if not found
}

// Add a new member to a struct definition
void add_struct_member(char *struct_name, char *member_name, char *member_type, int lineno) {
    // Traverse the definition array to find the specified struct
    for (int i = 0; i < def_num; i++) {
        if (strcmp(def[i].name, struct_name) == 0) {
            // Check if the member is already defined in the struct
            for (int j = 0; j < def[i].dec_num; j++) {
                if (strcmp(def[i].dec[j].name, member_name) == 0) {
                    // Print error if member is redefined
                    printf("Error type 15 at Line %d: Redefined field \"%s\".\n", lineno, member_name);
                    return;
                }
            }
            // Add the new member to the struct definition
            strcpy(def[i].dec[def[i].dec_num].name, member_name);
            strcpy(def[i].dec[def[i].dec_num].type, member_type);
            def[i].dec_num++; // Update member count
            return; // Exit after successful addition
        }
    }
}

// Add a new argument to a function
void add_func_args(char *func_name, char *arg_name, char *arg_type, int lineno) {
    // Traverse the definition array to find the specified function
    for (int i = 0; i < def_num; i++) {
        if (strcmp(def[i].name, func_name) == 0) {
            // Check if the argument is already defined in the function
            for (int j = 0; j < def[i].arg_num; j++) {
                if (strcmp(def[i].args[j].name, arg_name) == 0) {
                    // Print error if argument is redefined
                    printf("Error type 3 at Line %d: Redefined variable \"%s\".\n", lineno, arg_name);
                    return;
                }
            }
            // Add the new argument to the function definition
            strcpy(def[i].args[def[i].arg_num].name, arg_name);
            strcpy(def[i].args[def[i].arg_num].type, arg_type);
            def[i].arg_num++; // Update argument count
            return; // Exit after successful addition
        }
    }
}

// Add a variable to the list of a function's local variables
void add_func_variables(char *func_name, char *variable_name, char *variable_type, int lineno) {
    // Traverse the list of defined functions to find the specified function
    for (int i = 0; i < def_num; i++) {
        if (strcmp(def[i].name, func_name) == 0) {
            // Traverse the function's local variables to check if the variable already exists
            for (int j = 0; j < def[i].dec_num; j++) {
                if (strcmp(def[i].dec[j].name, variable_name) == 0) {
                    // If the variable already exists, print an error and return
                    printf("Error type 3 at Line %d: Redefined variable \"%s\".\n", lineno, variable_name);
                    return; // Exit after detecting the redefinition
                }
            }
            // If the variable is not defined yet, add it to the function's list of local variables
            strcpy(def[i].dec[def[i].dec_num].name, variable_name);
            strcpy(def[i].dec[def[i].dec_num].type, variable_type);
            def[i].dec_num++; // Increment the count of local variables
            return; // Exit after successfully adding the variable
        }
    }
}

// Find the type of a member in a struct by its name
char* find_structure_member_type(char *struct_name, char *member_name) {
    // Traverse the list of definitions to find the specified struct
    for (int i = 0; i < def_num; i++) {
        if (strcmp(def[i].name, struct_name) == 0) {
            // Traverse the struct's members to find the specified member
            for (int j = 0; j < def[i].dec_num; j++) {
                if (strcmp(def[i].dec[j].name, member_name) == 0) {
                    return def[i].dec[j].type; // Return the type of the found member
                }
            }
            return NULL; // Return NULL if the specified member is not found
        }
    }
    return NULL; // Return NULL if the specified struct is not found
}

// Set the return type of a function by its name
void set_func_return_type(char *name, char *type) {
    // Traverse the list of defined functions to find the specified function
    for (int i = 0; i < def_num; i++) {
        if (strcmp(def[i].name, name) == 0) {
            // Set the return type for the found function
            strcpy(def[i].return_type, type);
            return; // Exit after successfully setting the return type
        }
    }
}


