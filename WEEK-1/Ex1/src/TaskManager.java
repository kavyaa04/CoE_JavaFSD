import java.util.*;

class Task {
    private String id;
    private String description;
    private int priority;

    public Task(String id, String description, int priority) {
        this.id = id;
        this.description = description;
        this.priority = priority;
    }

    public String getId() {
        return id;
    }

    public int getPriority() {
        return priority;
    }

    @Override
    public String toString() {
        return "Task[ID=" + id + ", Description=" + description + ", Priority=" + priority + "]";
    }
}

class TaskManager {
    private PriorityQueue<Task> taskQueue;
    private Map<String, Task> taskMap;

    public TaskManager() {
        taskQueue = new PriorityQueue<>(Comparator.comparingInt(Task::getPriority).reversed());
        taskMap = new HashMap<>();
    }

    public void addTask(String id, String description, int priority) {
        Task task = new Task(id, description, priority);
        taskQueue.offer(task);
        taskMap.put(id, task);
    }

    public void removeTask(String id) {
        if (taskMap.containsKey(id)) {
            taskMap.remove(id);
            rebuildQueue();
        }
    }

    private void rebuildQueue() {
        taskQueue = new PriorityQueue<>(Comparator.comparingInt(Task::getPriority).reversed());
        taskQueue.addAll(taskMap.values());
    }

    public Task getHighestPriorityTask() {
        return taskQueue.peek();
    }
}

class Main {
    public static void main(String[] args) {
        TaskManager manager = new TaskManager();
        manager.addTask("1", "Fix bug", 3);
        manager.addTask("2", "Develop feature", 5);
        manager.addTask("3", "Code review", 2);
        
        System.out.println("Highest Priority Task: " + manager.getHighestPriorityTask());
        manager.removeTask("2");
        System.out.println("Highest Priority Task after removal: " + manager.getHighestPriorityTask());
    }
}

