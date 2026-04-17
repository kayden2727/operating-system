#include <stdio.h>
#include <sys/stat.h>
#include <stdlib.h>

// TODO: Implement this function
void inspect_file(const char* filepath) {
    struct stat file_stat;

    printf("Inspecting: %s\n", filepath);
    // Add your logic here
    // 1. Call stat(filepath, &file_stat). 
    // 2. Check if stat() returns -1 (meaning the file doesn't exist or an error occurred).
    if (stat(filepath, &file_stat) == -1) {
        printf("Could not read file");
        return;
    }
    // 3. If successful, print the file size using file_stat.st_size.
    printf("File size: %ld bytes", (long)file_stat.st_size);
    // 4. Use the S_ISDIR(file_stat.st_mode) and S_ISREG(file_stat.st_mode) macros 
    //    to print whether it's a directory or a regular file.
    if (S_ISDIR(file_stat.st_mode)) {
        printf("This is a directory");
    } else if(S_ISREG(file_stat.st_mode)) {
        printf("This is a regular file");
    }
}

int main() {
    // Ensure you have a file named "test.txt" in your working directory to test this properly,
    // or change the path to a known file/directory on your system.
    
    // Create a dummy file for testing purposes
    FILE *f = fopen("test.txt", "w");
    if(f) { fputs("Hello File System!", f); fclose(f); }

    inspect_file("test.txt");
    inspect_file("."); // Inspect the current directory
    inspect_file("does_not_exist.bin");

    return 0;
}