; extends 

((function_declaration 
  name: (identifier) @funcName
  (#match? @funcName "Test[A-Za-z]+")
  body: (block (for_statement 
  body: (block 
    (expression_statement 
      (call_expression 
        (selector_expression
          operand: (identifier)@t
          field: (field_identifier)@Run)@sf)@call))@block)@for)) @TestFuncDecl)
