#include <print>
#include <vector>

int main() {
    std::println("Hello, World!");

    std::vector<int> list = {1, 2, 3};

    int sum = 0;

    for (int num : list) {
        sum += num;
    }

    std::println("The sum is {}", sum);
}
