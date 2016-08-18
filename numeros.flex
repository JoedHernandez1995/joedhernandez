%%
%line
%column
%class Lexer
%unicode
%int
%{
	private int numerosPares;
	private int numerosImpares;

	public int getNumerosPares(){
		return this.numerosPares;
	}

	public int getNumerosImpares(){
		return this.numerosImpares;
	}
%}
%init{
	this.numerosPares = 0;
	this.numerosImpares = 0;
%init}
%eof{
	System.out.println("Hay "+numerosPares+" numeros pares en el archivo");
	System.out.println("Hay "+numerosImpares+" numeros impares en el archivo");
%eof}
linebreak = \n | \t | \r
digito = [0-9]
numeroPar = {digito}*(0|2|4|6|8) 
numeroImpar = {digito}*(1|3|5|7|9)
%%
<YYINITIAL> {
	{numeroPar}		{numerosPares++;}
	{numeroImpar}	{numerosImpares++;}
	{linebreak}		{/* */}
	.				{/* */}
}
