#include <stdio.h>
#include <string.h>

int main() {
    char *c = malloc(1000 * sizeof(char));
    scanf("%s", c);
    c = realloc(c, strlen(c));
}