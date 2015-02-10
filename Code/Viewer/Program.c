/*
 * Program.c
 *
 *  Created on: 10.02.2015
 *      Author: Felix Martin
 */


#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <my_global.h>


bool run = true;
char diagram[10][10];

//Test Daten



void docommand(char command)
{
	switch(command)
	{

	case 'h':
		puts("h - Hilfe");
		puts("x - Beenden");
		break;



	case 'x':
		run = false;
		break;

	}
}


int main()
{
	char command;

	puts("Druecken sie h für Hilfe");

	while(run)
	{
		scanf("%c", &command);
		docommand(command);
	}
	return 0;
}
