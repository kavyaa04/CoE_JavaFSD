public class BankAccount {
    private double balance;

    public BankAccount(double initialBalance) {
        this.balance = initialBalance;
    }

    public synchronized void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println(Thread.currentThread().getName() + " deposited " + amount + ", New Balance: " + balance);
        }
    }

    public synchronized void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            System.out.println(Thread.currentThread().getName() + " withdrew " + amount + ", New Balance: " + balance);
        } else {
            System.out.println(Thread.currentThread().getName() + " attempted to withdraw " + amount + " but insufficient balance.");
        }
    }

    public double getBalance() {
        return balance;
    }
}

class BankUser extends Thread {
    private BankAccount account;
    private boolean deposit;
    private double amount;

    public BankUser(BankAccount account, boolean deposit, double amount) {
        this.account = account;
        this.deposit = deposit;
        this.amount = amount;
    }

    @Override
    public void run() {
        if (deposit) {
            account.deposit(amount);
        } else {
            account.withdraw(amount);
        }
    }
}

 class Main {
    public static void main(String[] args) {
        BankAccount account = new BankAccount(1000);

        Thread user1 = new BankUser(account, true, 500);
        Thread user2 = new BankUser(account, false, 200);
        Thread user3 = new BankUser(account, false, 1500);
        Thread user4 = new BankUser(account, true, 100);

        user1.start();
        user2.start();
        user3.start();
        user4.start();
    }
}
