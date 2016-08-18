%%
%line
%column
%class NamesLexer
%unicode
%int

linebreak = \n | \t | \r
espacio = \s
digito = [0-9]
nombre = [A-Z]+
nombreCompleto = ({nombre}) | ({nombre}{espacio}{nombre}) | ({nombre}{espacio}{nombre}{espacio}{nombre}) | ({nombre}{espacio}{nombre}{espacio}{nombre}{espacio}{nombre})
salario = {digito}+.{digito}{2}
fecha = {digito}{2}\/{digito}{2}\/{digito}{4}

%%

<YYINITIAL>{
	{nombreCompleto}	{System.out.println("Nombre: "+yytext());}
	{salario}			{System.out.println("Salario: "+yytext());}
	{fecha}				{System.out.println("Fecha: "+yytext());}
	{linebreak}			{}
	.					{}
}
