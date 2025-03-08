# String Calculator

String Calculator is a simple Ruby program that computes the sum of numbers in a given string. It supports different delimiters, including custom ones, and follows Test-Driven Development (TDD) principles.

## Installation

To use the String Calculator, ensure you have Ruby installed on your system.

### Steps:
1. Clone this repository:
   ```sh
   git clone https://github.com/harshkrishnani249/string-calculator-tdd.git
2. Navigate to the project directory:
   ```sh
   cd string-calculator-tdd-kata
3. Install dependencies
   ```sh
   bundle install

## **Usage**

### **Running Tests (Recommended)**
Since this project follows **TDD**, the best way to use it is by running the test suite:

```sh
rspec
```
## **Manual Testing in IRB**

If you want to manually test the calculator, open **IRB** and load the module:

```sh
irb -r ./lib/string_calculator.rb
```
Then, run:
```sh
StringCalculator.add("1,2,3")
```
It should return 6

## Examples & Edge Cases

StringCalculator.add("1,2,3,4,5")      # Output: 15  
StringCalculator.add("1\n2,3")         # Output: 6  
StringCalculator.add("//;\n2;5")       # Output: 7  
StringCalculator.add("1001,2")         # Output: 2 (ignores numbers > 1000)  
StringCalculator.add("-1,2,-3")        # Raises: "negatives not allowed: -1, -3"  
