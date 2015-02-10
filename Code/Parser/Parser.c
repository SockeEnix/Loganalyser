#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <mysql/mysql.h>
#include <sys/types.h>
#include <dirent.h>

MYSQL *conn;

void connect();
char* cmbStr(char *str1, char *str2);

void analyze(char line[255]){
	char *timestamp;
	char *dienst;
	char *server;
	//Sttring zerteilen mit strtok
        //http://www.c-howto.de/tutorial-strings-zeichenketten-stringfunktionen-zerteilen-strtok.html
}

int main(void){
	
	DIR *dir;
	struct dirent *dirpnt;
	FILE *file1, *file2;
	char readline[255], delimiter[] =" ";
	//char *ptr;
	bool readable = false;
	
	//Verzeichnis öffnen
	if(dir=opendir("/home/johannes/C/Parser/Logfiles/log2.log") == NULL){
	fprintf(stderr,"Fehler beim öffnen\n");
	exit(1);
	}	

	//Verzeichnis auslesen
	while(dirpnt=readdir(dir) != NULL){
		file1=fopen((*dirpnt).d_name,"r");
		//werte Zeilenweise aus
		while(fgets(readline, 255, file1)){
			//fputs(&readline[255], stdout);
			printf("%s\n",readline[255]);


		//Zeile verwertbar?
		if(!readable){
			file2=fopen("/home/user/C/Parser/unreadable/test.txt","w");
			//fputs(255, file2);		
		}
		}
					
	}
	if(closedir(dir) == -1){
		printf("Fehler beim Schließen\n");
	}
	printf("Hi");
	return 0;
}

char* cmbStr(char *str1, char *str2)
{
   char *query, *string;
   char *select = str1;
   string = malloc(strlen(str2)+1);
   strcpy(string,str2);
   query = malloc(strlen(select)+strlen(string)+1);
   strcpy(query, select);
   strcat(query, string);
   //printf("%s\n",query);
   return query;
}

void connect(){
	char *server = "192.168.148.130";
	char *user = "johannes";
 	char *password = "user"; /* set me first */
	char *database = "fussball_db";
	conn = mysql_init(NULL);
  	/* Connect to database */
  	if (!mysql_real_connect(conn, server, user, password, database, 0, NULL, 0)) {
		fprintf(stderr, "%s\n", mysql_error(conn));
		exit(1);
	}
}
