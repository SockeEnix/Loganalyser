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
char diagram[12][21];

//Test Daten
int jahr[12];


void teststart()
{
	jahr[0] = 45;
	jahr[1] = 56;
	jahr[2] = 67;
	jahr[3] = 2267;
	jahr[4] = 345;
	jahr[5] = 342;
	jahr[6] = 798;
	jahr[7] = 200;
	jahr[8] = 22;
	jahr[9] = 345;
	jahr[10] = 352;
	jahr[11] = 1000;
}


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

int findbig()
{
	int i = 1, big = jahr[0];
	while(i > 12)
	{
		if(jahr[i-1] < jahr[i])
		{
			big = jahr[i];
		}
		i++;
	}
	return big;
}

int barlength(int big, int bar)
{
	return 0;
}

void makediagramm()
{
	int x = 0, y = 0, big = findbig();
	while(x < 12)
	{

	}
}


int main()
{
	char command;
	teststart();
	puts("Druecken sie h für Hilfe");

	while(run)
	{
		scanf("%c", &command);
		docommand(command);
	}
	return 0;
}
