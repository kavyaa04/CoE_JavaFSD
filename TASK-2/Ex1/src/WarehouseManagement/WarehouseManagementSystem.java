package WarehouseManagement;

import java.io.*;
import java.util.*;
import java.util.concurrent.*;

class Location {
    private int aisle, shelf, bin;

    public Location(int aisle, int shelf, int bin) {
        this.aisle = aisle;
        this.shelf = shelf;
        this.bin = bin;
    }

    @Override
    public String toString() {
        return "Aisle " + aisle + ", Shelf " + shelf + ", Bin " + bin;
    }
}

class Product {
    private String productID, name;
    private int quantity;
    private Location location;

    public Product(String productID, String name, int quantity, Location location) {
        this.productID = productID;
        this.name = name;
        this.quantity = quantity;
        this.location = location;
    }

    public synchronized void updateQuantity(int amount) {
        this.quantity += amount;
    }

    public String getProductID() { return productID; }
    public int getQuantity() { return quantity; }
    public Location getLocation() { return location; }
    public String getName() { return name; }
}

class OutOfStockException extends Exception {
    public OutOfStockException(String message) { super(message); }
}

class Order {
    private String orderID;
    private List<String> productIDs;
    private Priority priority;

    public enum Priority { STANDARD, EXPEDITED }

    public Order(String orderID, List<String> productIDs, Priority priority) {
        this.orderID = orderID;
        this.productIDs = productIDs;
        this.priority = priority;
    }

    public List<String> getProductIDs() { return productIDs; }
    public Priority getPriority() { return priority; }
    public String getOrderID() { return orderID; }
}

class OrderComparator implements Comparator<Order> {
    public int compare(Order o1, Order o2) {
        return o1.getPriority().compareTo(o2.getPriority());
    }
}

class InventoryManager {
    private ConcurrentHashMap<String, Product> products = new ConcurrentHashMap<>();
    private PriorityQueue<Order> orderQueue = new PriorityQueue<>(new OrderComparator());

    public synchronized void addProduct(Product product) {
        products.put(product.getProductID(), product);
    }

    public synchronized void placeOrder(Order order) {
        orderQueue.add(order);
    }

    public void processOrders() {
        ExecutorService executor = Executors.newFixedThreadPool(3);
        while (!orderQueue.isEmpty()) {
            Order order = orderQueue.poll();
            executor.submit(() -> fulfillOrder(order));
        }
        executor.shutdown();
    }

    private void fulfillOrder(Order order) {
        try {
            for (String productId : order.getProductIDs()) {
                if (!products.containsKey(productId)) throw new OutOfStockException("Product not found: " + productId);
                Product product = products.get(productId);
                synchronized (product) {
                    if (product.getQuantity() <= 0) throw new OutOfStockException("Out of stock: " + product.getName());
                    product.updateQuantity(-1);
                }
            }
            System.out.println("Order " + order.getOrderID() + " fulfilled.");
        } catch (OutOfStockException e) {
            System.err.println(e.getMessage());
        }
    }
}

public class WarehouseManagementSystem {
    public static void main(String[] args) {
        InventoryManager inventoryManager = new InventoryManager();
        inventoryManager.addProduct(new Product("P1", "Laptop", 10, new Location(1, 1, 1)));
        inventoryManager.addProduct(new Product("P2", "Mouse", 5, new Location(2, 1, 2)));
        inventoryManager.addProduct(new Product("P3", "Keyboard", 7, new Location(3, 2, 3)));

        inventoryManager.placeOrder(new Order("O1", Arrays.asList("P1", "P2"), Order.Priority.EXPEDITED));
        inventoryManager.placeOrder(new Order("O2", Arrays.asList("P2", "P3"), Order.Priority.STANDARD));
        inventoryManager.processOrders();
    }
}
