#include <print>
#include <vector>

using std::println;
using std::vector;

auto main() -> int {
    println("Hello, World!");

    vector<int> const list = {1, 2, 3};

    int sum = 0;

    for (int const num : list) {
        sum += num;
    }

    println("The sum is {}", sum);
}
