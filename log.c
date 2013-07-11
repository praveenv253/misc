#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define LOGFILE "/home/praveen/Documents/.logfile"
#define TEMPLOGFILE "/home/praveen/Documents/.logfile~"

void display(void);
void writelog(int, char **);

int main(int argc, char **argv)
{
	if(argc == 1) {
		printf("No log message given. Nothing was logged.\n");
		return 0;
	}

	// "--" will ignore all options
	if(strcmp(argv[1], "--") == 0) {
		writelog((argc - 2), (argv + 2));
		return 0;
	}

	// "-d" or "--display" to print the logfile to stdout
	if(strcmp(argv[1], "-d") == 0 || strcmp(argv[1], "--display") == 0) {
		display();
		return 0;
	}

	// No options given
	writelog((argc - 1), (argv + 1));
	return 0;
}

/* Function to display the logs */
void display(void)
{
	// Try to open the logfile
	FILE *f;
	f = fopen(LOGFILE, "r");
	if(f == NULL) {
		printf("Error. Could not open task file for reading.\n");
		exit(1);
	}

	// Read and display line by line
	char buf[79];
	int line_num = 0;
	while(fgets(buf, 80, f) != NULL) {
		// Print a '\n' only when splitting lines
		if(strlen(buf) < 80)
			printf("%s", buf);
		else
			printf("%s\n", buf);
	}

	// Cleanup
	fclose(f);
}

/**
 * Function to write a new entry into the logfile.
 * Accepts number of words to write and list of words as arguments.
 * Automatically adds a date and time
 */
void writelog(int argc, char **argv)
{
	// Try to open the temporary logfile for writing
	FILE *f;
	f = fopen(TEMPLOGFILE, "w");
	if(f == NULL) {
		printf("Error. Could not open the log file for writing.\n");
		exit(1);
	}

	// Get system time and format it
	char logtime[60];
	time_t t = time(NULL);
	struct tm *tmp;
	tmp = localtime(&t);
	if(tmp == NULL) {
		perror("localtime");
		exit(EXIT_FAILURE);
	}
	if(strftime(logtime, sizeof(logtime),
				"%A | %d %b %Y | %T | GMT%z", tmp) == 0) {
		printf("Error. Could not get current time.\n\n");
		printf("Debug info:\nstrftime returned 0.\n");
		exit(EXIT_FAILURE);
	}

	// Write formatted time
	fprintf(f, "%s\n", logtime);

	//Write log data
	int i;
	for(i = 0 ; i < argc ;  i++) {
		fprintf(f, "%s ", argv[i]);
	}

	// Cleanup
	fprintf(f, "\n\n");
	fclose(f);

	// Concatenate the temporary file with the original and delete it.
	char command[200];
	const char templogfile[] = TEMPLOGFILE;
	const char logfile[] = LOGFILE;
	sprintf(command, "touch %s", logfile);
	system(command);
	sprintf(command, "cat %s >> %s", logfile, templogfile);
	system(command);
	sprintf(command, "mv %s %s", templogfile, logfile, templogfile);
	system(command);
}
