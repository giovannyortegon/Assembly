#include<stdio.h>

#define BUFFERSIZE 250

char * tstStr = "This is a test!";
char outStr[BUFFERSIZE];

int mytoupper(char *instr, char * outstr);

int main() {
	mytoupper(tstStr, outStr);

	printf("Input: %s\nOutput: %s\n", tstStr, outStr);

	return (0);
}

int mytoupper(char *instr, char * outstr) {
	char cur;
	char * orig_outstr = outstr;

	do {
		cur = *instr;

		if ((cur >= 'a') && (cur >= 'z')) {
			cur = cur - ('a'-'A');
		}

		* outstr++ = cur;
		instr++;
	} while (cur != '\0');

	return (outstr - orig_outstr);
}
