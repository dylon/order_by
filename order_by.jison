%lex

%%

\s+ /* Ignore White Space */

([Dd][Ee][Ss][Cc]|[Aa][Ss][Cc])\b return 'DIRECTION';
[a-zA-Z_][a-zA-Z0-9_]*\b          return 'IDENTIFIER';
","                               return ',';
"."                               return '.';
<<EOF>>                           return 'EOF';

/lex

%left ','
%right '.'

%start clause

%%

clause: columns EOF {
        return new Clause($1);
      }
      ;

columns: column {
         $$ = [$1];
       }
       | columns ',' column {
         $1.push($3);
       }
       ;

column: IDENTIFIER '.' IDENTIFIER direction {
        $$ = new Column($3, $4, $1);
      }
      | IDENTIFIER direction {
        $$ = new Column($1, $2);
      }
      ;

direction: /* ϵ */ {
           $$ = new Direction();
         }
         | DIRECTION {
           $$ = new Direction($1);
         }
         ;

/* vim: set et sw=2 ts=2 sta ft=lex: */
