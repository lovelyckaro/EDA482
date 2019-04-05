#include <stdio.h>
#include <string.h>

int main() {
    char str[] = "Erik Brink";
    for (char i = strlen(str) - 1; i >= 0; i--) {
        printf("%c", str[i]);
    }
}