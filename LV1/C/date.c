#include <stdio.h>

// Return date in form 0bYYYY YYYY YYYY YYYY YYYY YYYM MMMD DDDD 
int compressDate(int year, int month, int day) {
    // Init variables, and shift digits into place
    int date = 0;
    year = year << 9; // Shift year into place
    month &= 0xF; // Reset all bits except last 4
    month = month << 5; // Shift month into place
    day &= 0x1F; // Reset all bits except last 5

    date |= year;
    date |= month;
    date |= day;
    return date;
}

void printDate(int date) {
    int year = date & 0xFFFFFE00; // Reset last 9 bits
    year = year >> 9;   // Shift into place
    int month = date & 0x1E0; // Reset first 23 bits, and last 4 
    month = month >> 5; // Shift into place
    int day = date & 0x1F;  // Reset all but last 5 bits
    printf("Date is %d-%d-%d", year, month, day);
}

int main(int argc, char **argv) {
    int y, m, d;
    printf("Input date in format YYYY-MM-DD: ");
    scanf("%d-%d-%d", &y, &m, &d);
    int date = compressDate(y, m, d);
    printDate(date);
}