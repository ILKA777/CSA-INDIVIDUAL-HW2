#include <stdio.h>
#include <string.h>

static int C[10];
extern void digits_count(char *str);
extern void print_result(int *C);

void digits_count(char *str) {
    int i;
    
    for (i = 0; i < strlen(str); ++i) {
        if(str[i] == '0') {
            C[0]++;
        }
        if(str[i] == '1') {
            C[1]++;
        }
        if(str[i] == '2') {
            C[2]++;
        }
        if(str[i] == '3') {
            C[3]++;
        }
        if(str[i] == '4') {
            C[4]++;
        }
        if(str[i] == '5') {
            C[5]++;
        }
        if(str[i] == '6') {
            C[6]++;
        }
        if(str[i] == '7') {
            C[7]++;
        }
        if(str[i] == '8') {
            C[8]++;
        }
        if(str[i] == '9') {
            C[9]++;
        }
    }
    print_result(C);
    
}

void print_result(int *C) {
    int i;
    int k = 0;
    for (i = 0; i<10; i++) {
        if (C[i] > 0) {
            printf("Количество : %d - %d\n",i,C[i]);
        }
    }
    printf("Других цифр в строке нет");
}

int main(int argc, char** argv) {
    int n,i;
    printf("Введите первоначальный размер строки: ");
    scanf("%d", &n);
    char str[n];
    printf("Введите строку: ");
    scanf("%s", str);

    digits_count(str);
    
    return 0;
}
