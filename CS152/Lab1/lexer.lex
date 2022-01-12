


%{



%}



DIGIT	[0-9]

	int num_int = 0, num_op = 0, num_par = 0, num_equal = 0;

%%

"="		{printf("EQUAL\n"); num_equal++;}
{DIGIT}+	{printf("NUMBER %s\n", yytext); num_int++;}
"+"		{printf("PLUS\n"); num_op++;}
"-"		{printf("MINUS\n"); num_op++;}
"*"		{printf("MULT\n"); num_op++;}
"/"		{printf("DIVIDE\n"); num_op++;}
"("		{printf("PAREN\n"); num_par++;}
")"		{printf("PAREN\n"); num_par++;}
. 		{printf("ERROR\n"); exit(0);}

%%



int main(int argc, char ** argv) 

{
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);

	printf("# of int: %d\n", num_int);
	printf("# of operators: %d\n", num_op);
	printf("# of parenthesis: %d\n", num_par);
	printf("# of equal: %d\n", num_equal);
}
