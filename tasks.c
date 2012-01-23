#include <stdio.h>
#include <string.h>

#define TASKSFILE "/home/praveen/Documents/.tasks"
#define TEMPFILE "/home/praveen/Documents/.tasks~"

// User defined functions
int list_tasks(void);
int add_tasks(int, char **);
int edit_task(int, char **);
int clear_tasks(void);
int remove_task(void);
int help(void);

/* Function main - entry point to the program */
int main(int argc, char **argv)
{
    if(argc != 2) {
        printf("Incorrect number of command line parameters\n");
        return 0;
    }
    
    if(strcmp(argv[1], "l") == 0) {
        return list_tasks();
    }
    else if(strcmp(argv[1], "a") == 0) {
        return add_tasks(argc, argv);
    }
    else if(strcmp(argv[1], "e") == 0) {
        return edit_task(argc, argv);
    }
    else if(strcmp(argv[1], "c") == 0) {
        return clear_tasks();
    }
    else if(strcmp(argv[1], "r") == 0) {
        return remove_task();
    }
    else if(strcmp(argv[1], "h") == 0) {
        return help();
    }
    else if(strcmp(argv[1], "-h") == 0) {
        return help();
    }
    else if(strcmp(argv[1], "--help") == 0) {
        return help();
    }
    else {
        printf("Unknown command line parameter %s\n", argv[1]);
        return 0;
    }
}

/* Function to list the tasks in the task file */
int list_tasks(void)
{
    // Try to open the tasks file
    FILE *f;
    f = fopen(TASKSFILE, "r");
    if(f == NULL) {
        printf("Error. Could not open task file for reading.\n");
        return 1;
    }
    
    // Read and display line by line
    char buf[80];
    int line_num = 0;
    while(fgets(buf, 81, f) != NULL) {
        line_num++;
        printf("%d: %s\n", line_num, buf);
    }

    // Exit successfully
    fclose(f);
    return 0;
}        

/* Function to add a task to the task file */
int add_tasks(int argc, char **argv)
{
    // Try to open the tasks file
    FILE *f;
    f = fopen(TASKSFILE, "a");
    if(f == NULL) {
        printf("Error. Could not open task file for writing.\n");
        return 1;
    }
    
    // Get a new task
    char buf[80];
    printf("Enter new task (in one line, if you please):\n");
    fgets(buf, 81, stdin);
    
    // Write new task to file
    fprintf(f, "%s", buf);
    printf("Writing complete.\n");
    
    // Exit successfully
    fclose(f);
    return 0;
}

/* Function to edit a task */
int edit_task(int argc, char **argv)
{
    printf("Not yet implemented.\nComing soon!\n");
    return 0;
}

/* Function to clear all tasks */
int clear_tasks(void)
{
    // Get confirmation
    char choice;
    printf("Are you sure? (y/n): ");
    scanf("%s", &choice);
    
    // Try to truncate file
    if(choice == 'y') {
        FILE *f;
        f = fopen(TASKSFILE, "w");
        fclose(f);
    }
    
    // Exit successfully
    return 0;
}

int remove_task(void)
{
    int choice;
    
    //Get line to remove
    printf("Enter the line number to remove (0 to exit): ");
    scanf("%d", &choice);
    
    //Check for arbitrary inputs
    if(choice < 0) {
        printf("The line number cannot be negative.\n");
        return 0;
    }
    
    //Exit condition
    if(choice == 0) {
        return 0;
    }
    
    //Open two files
    FILE *f;
    FILE *ftemp;
    f = fopen(TASKSFILE, "r");
    ftemp = fopen(TEMPFILE, "w");
    if(f == NULL || ftemp == NULL) {
        printf("Could not open files for reading/writing.\n");
        return 1;
    }
    
    /* Read from the tasks file and write all lines except the chosen line and
       write into the temp file */
    char buf[80];
    int line_num = 0;
    while(fgets(buf, 81, f) != NULL) {
        line_num++;
        if(choice != line_num) {
            fprintf(ftemp, "%s", buf);
        }
    }
    
    //Check for erroneous values
    if(choice > line_num) {
        printf("Your choice was larger than the existing number of tasks.\n");
        return 0;
    }
    
    //Close the two files
    fclose(f);
    fclose(ftemp);
    
    //Copy the temp file onto the main file
    const char tasks_file_path[] = TASKSFILE;
    const char temp_file_path[] = TEMPFILE;
    char command[300];
    sprintf(command, "cp %s %s", temp_file_path, tasks_file_path);
    system(command);
    
    // Exit successfully
    return 0;
}

int help(void)
{
    printf("This program is a todo list manager. ");
    printf("Find below the list of options:\n");
    printf("    l - lists the current tasks.\n");
    printf("    a - add a new task.\n");
    printf("    c - clear all existing tasks.\n");
    printf("    r - remove a task.\n");
    printf("    h - display this message and exit.\n");
    return 0;
}
