import java.util.Scanner;


class Main {
  public static void main(String[] args) {

    Scanner user_input = new Scanner(System.in);

    System.out.println("Welcome to the guessing game!");
    System.out.println("Pick a number from 1-100!");

    int attempts = 0;
    int min = 1;
    int max = 100;
    int random_int = (int) Math.floor(Math.random() * (max - min + 1) + min);
    int guess = user_input.nextInt();

    if (guess > max || guess < min) {
      System.out.println("That number is out of bounds, use one between 1-100");
        guess = user_input.nextInt();
    }

    while (random_int != guess) {
      if (guess > random_int) {
        System.out.println("That's too high! Try again");
        guess = user_input.nextInt();
        attempts += 1;
      } else if (guess < random_int) {
        System.out.println("That's too low! Try again");
        guess = user_input.nextInt();
        attempts += 1;
      }
    }
attempts += 1;
    System.out.println("You did it! you got the number!");
    if (attempts > 1) {
      System.out.println ("You got the number in: " + attempts + " attempts!");
    } else if (attempts == 1) {
      System.out.println ("You got the number in: " + attempts + " attempt!");
    }

    String input = user_input.nextLine(); // Read user input

    user_input.close();
  }
}

