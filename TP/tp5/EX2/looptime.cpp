#include <iostream>
#include <thread>
#include <chrono>

int main(int argc, char **argv) {

    for (int i = 1; i < 101; i++) {
        std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        std::cout << i << '\n';
    }
    return 0;

}
