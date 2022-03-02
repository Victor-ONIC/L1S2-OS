#include <iostream>
#include <string>

using namespace std;


int main(int argc, char** argv) {

  bool loop = true;
  float mean = 0.0;
  float number = 0.0;

  cout<<"Entrez vos notes :  "<<endl;
  while(loop) {
    string xx;
    cin >> xx;

    if(xx != "exit") {
      if(stof(xx) < 0.0) {
        cerr<<"Note inattendu !"<<endl;
      }
      else {
        mean += stof(xx);
        number += 1.0;
      }
    }
    else {
      loop = false;
    }
  }

  cout<<"Votre moyenn est de : "<<mean/number<<endl;
  return 0;
}

