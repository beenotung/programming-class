#include <stdio.h>

#define min(X,Y) (X<Y?X:Y)
#define min3(X,Y,Z) (min(min(X,Y),min(Y,Z)))

int distance(char* s, int len_s, char* t, int len_t) {
  //printf("distance(%s,%d,%s,%d)\n",s,len_s,t,len_t);
  if(len_s==0) return len_t;
  if(len_t==0) return len_s;
  int cost = s[len_s-1] == t[len_t-1] ? 0 : 1;
  return min3(
      distance(s, len_s-1, t, len_t  )+1
    , distance(s, len_s  , t, len_t-1)+1
    , distance(s, len_s-1, t, len_t-1)+cost
  );
}

int main (int argc, char** args) {
  if (argc != 3) {
    fprintf(stderr, "Expect 2 arguments!\n");
    fprintf(stderr, "Got %d arguments.\n", argc);
    return 1;
  }
  char* s = args[1];
  int len_s = strlen(s);
  char* t = args[2];
  int len_t = strlen(t);
  int d = distance(s,len_s,t,len_t);
  printf("%d\n",d);
  return 0;
}
