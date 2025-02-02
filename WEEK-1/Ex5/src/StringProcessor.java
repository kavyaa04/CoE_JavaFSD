import java.io.*;
import java.util.*;
import java.util.Scanner;

class StringProcessor {
    public static String reverseString(String str) {
        return new StringBuilder(str).reverse().toString();
    }

    public static int countOccurrences(String text, String sub) {
        int count = 0, index = 0;
        while ((index = text.indexOf(sub, index)) != -1) {
            count++;
            index += sub.length();
        }
        return count;
    }

    public static String splitAndCapitalize(String str) {
        String[] words = str.split(" ");
        StringBuilder result = new StringBuilder();
        for (String word : words) {
            if (!word.isEmpty()) {
                result.append(Character.toUpperCase(word.charAt(0)))
                      .append(word.substring(1))
                      .append(" ");
            }
        }
        return result.toString().trim();
    }
}

class Main {
    public static void main(String[] args) {
        String str = "hello world from java";
        System.out.println("Reversed: " + StringProcessor.reverseString(str));
        System.out.println("Occurrences of 'o': " + StringProcessor.countOccurrences(str, "o"));
        System.out.println("Capitalized: " + StringProcessor.splitAndCapitalize(str));
    }
}

