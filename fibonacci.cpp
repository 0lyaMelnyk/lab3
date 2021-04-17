//Fibonacci Series using Recursion 
#include<stdio.h>
int fib(int n)
{                                                                                                 
   if (n <= 1)
      return n;
   return fib(n-1) + fib(n-2);
}                                                                                                 

int main ()
{      
    int i;
    for (i = 1; i <= 1000; i++) // задаем начальное значение 1, конечное 1000 и задаем шаг цикла - 1.
    {
        printf("\n%d", fib(42));
    }
  return 0;
} 