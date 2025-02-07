package LibraryManagement;

import java.io.*;
import java.util.*;

class Book implements Serializable {
    private String title;
    private String author;
    private String ISBN;
    private boolean isReserved;

    public Book(String title, String author, String ISBN) {
        this.title = title;
        this.author = author;
        this.ISBN = ISBN;
        this.isReserved = false;
    }
    
    public String getISBN() { return ISBN; }
    public String getTitle() { return title; }
    public boolean isReserved() { return isReserved; }
    public void setReserved(boolean reserved) { isReserved = reserved; }
}

class User implements Serializable {
    private String name;
    private String userID;
    private List<Book> borrowedBooks;
    private static final int MAX_BOOKS = 3;
    
    public User(String name, String userID) {
        this.name = name;
        this.userID = userID;
        this.borrowedBooks = new ArrayList<>();
    }
    
    public String getUserID() { return userID; }
    public List<Book> getBorrowedBooks() { return borrowedBooks; }
    public boolean canBorrow() { return borrowedBooks.size() < MAX_BOOKS; }
}

interface ILibrary {
    void borrowBook(String ISBN, String userID) throws Exception;
    void returnBook(String ISBN, String userID) throws Exception;
    void reserveBook(String ISBN, String userID) throws Exception;
    Book searchBook(String title);
}

abstract class LibrarySystem implements ILibrary {
    protected List<Book> books = new ArrayList<>();
    protected List<User> users = new ArrayList<>();
    
    public abstract void addBook(Book book);
    public abstract void addUser(User user);
}

class LibraryManager extends LibrarySystem {
    private final Object lock = new Object();
    
    public void addBook(Book book) { books.add(book); }
    public void addUser(User user) { users.add(user); }
    
    public Book searchBook(String title) {
        for (Book book : books) {
            if (book.getTitle().equalsIgnoreCase(title)) return book;
        }
        return null;
    }
    
    public void borrowBook(String ISBN, String userID) throws Exception {
        synchronized (lock) {
            User user = findUser(userID);
            if (!user.canBorrow()) throw new Exception("Max books reached.");
            Book book = findBook(ISBN);
            if (book.isReserved()) throw new Exception("Book is reserved.");
            user.getBorrowedBooks().add(book);
        }
    }
    
    public void returnBook(String ISBN, String userID) throws Exception {
        synchronized (lock) {
            User user = findUser(userID);
            Book book = findBook(ISBN);
            if (!user.getBorrowedBooks().remove(book)) throw new Exception("Book not borrowed.");
        }
    }
    
    public void reserveBook(String ISBN, String userID) throws Exception {
        synchronized (lock) {
            Book book = findBook(ISBN);
            book.setReserved(true);
        }
    }
    
    private User findUser(String userID) throws Exception {
        for (User user : users) if (user.getUserID().equals(userID)) return user;
        throw new Exception("User not found.");
    }
    
    private Book findBook(String ISBN) throws Exception {
        for (Book book : books) if (book.getISBN().equals(ISBN)) return book;
        throw new Exception("Book not found.");
    }
    
    public void saveData(String filename) throws IOException {
        try (ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(filename))) {
            out.writeObject(books);
            out.writeObject(users);
        }
    }
    
    public void loadData(String filename) throws IOException, ClassNotFoundException {
        try (ObjectInputStream in = new ObjectInputStream(new FileInputStream(filename))) {
            books = (List<Book>) in.readObject();
            users = (List<User>) in.readObject();
        }
    }
}

public class LibraryManagementSystem {
    public static void main(String[] args) {
        LibraryManager library = new LibraryManager();
        
        library.addBook(new Book("Java Basics", "John Doe", "12345"));
        library.addBook(new Book("Advanced Java", "Jane Smith", "67890"));
        library.addUser(new User("Alice", "U001"));
        library.addUser(new User("Bob", "U002"));
        
        Thread t1 = new Thread(() -> {
            try { library.borrowBook("12345", "U001"); }
            catch (Exception e) { System.out.println(e.getMessage()); }
        });
        
        Thread t2 = new Thread(() -> {
            try { library.returnBook("12345", "U001"); }
            catch (Exception e) { System.out.println(e.getMessage()); }
        });
        
        t1.start();
        t2.start();
        
        try {
            t1.join();
            t2.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        
        try {
            library.saveData("library_data.ser");
            library.loadData("library_data.ser");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
