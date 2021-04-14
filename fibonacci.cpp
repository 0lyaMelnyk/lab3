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
  printf("\n%d", fib(1000000000));
  return 0;
} 