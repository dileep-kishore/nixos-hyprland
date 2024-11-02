import math

def main():
    try:
        number = int(input("Enter a number to calculate its factorial: "))
        if number < 0:
            print("Factorial is not defined for negative numbers!")
            return
        result = math.factorial(number)
        print(f"The factorial of {number} is {result}")
    except ValueError:
        print("Please enter a valid integer!")

if __name__ == "__main__":
    main()
