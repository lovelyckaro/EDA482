#include <stdio.h>
#include <string.h>

void print_bits(unsigned char byte) {
    for (char i = 7; i >= 0; i--) {
        char current_bit = 1 << i;
        printf("%d", byte&current_bit ? 1 : 0);
    }
    printf("\n");
}

unsigned char parse_byte(char str[]) {
   unsigned char byte = 0;
   for (char i = strlen(str)-1; i >= 0 ; i--) {
       if (str[i] == '1') {
           byte |= (1 << (7-i));
       }
   }
}

char is_even(int num) {
    return !(num & 1);
}

char is_odd(int num) {
    return (num & 1);
}

int main() {
    int num;
    printf("Gib num: ");
    scanf("%d", &num);
    print_bits((unsigned char) num);
    printf("%d\n", is_even(4));
    printf("%d\n", is_odd(4));
    printf("%d\n", is_even(5));
    printf("%d\n", is_odd(5));
}