final int MAS = 1, MENOS = 2, PARIZQ = 3, PARDER = 4, NUM = 5, COMILLA = 6, LETRA_I = 7, DOLAR = 8;

int tok = getToken();

void advance(){
	tok = getToken();
}

void eat(int t){
	if(tok == t){
		advance();
	}else{
		error();
	}
}

void S(){
	if(tok==PARIZQ){
		N();Sp();
	}else{
		error();
	}
}

void Sp(){
	switch(tok){
		case MAS:
			eat(MAS);
			N();
			Sp();
			break;
		case MENOS:
			eat(MENOS);
			N();
			Sp();
			break;
		case DOLAR:
			return;
		default:
			error();
	}
}

void N(){
	if(tok == PARIZQ){
		eat(PARIZQ);
		C();
		Np();
	}else{
		error();
	}
}

void Np(){
	switch(tok){
		case MAS:
			eat(MAS);
			eat(NUM);
			eat(PARDER);
		case MENOS:
			eat(MENOS);
			eat(NUM);
			eat(PARDER);
		default:
			error();
	}
}

void C(){
	if(tok == NUM){
		eat(NUM);
		eat(COMILLA);
		eat(LETRA_I);
		eat(COMILLA);
	}else{
		error();
	}
}
