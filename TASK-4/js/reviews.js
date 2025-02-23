document.addEventListener("DOMContentLoaded", function () {
    const urlParams = new URLSearchParams(window.location.search);
    const movieTitle = urlParams.get("title") || "This Movie";  
    document.getElementById("movieTitle").innerText = "Write a Review About " + movieTitle;
});

document.getElementById("submitReview").addEventListener("click", function () {
    const name = document.getElementById("name").value.trim();
    const reviewText = document.getElementById("reviewText").value.trim();
    const reviewsContainer = document.getElementById("reviewsContainer");

    if (name === "" || reviewText === "") {
        alert("Please enter both your name and review.");
        return;
    }

    
    const reviewElement = document.createElement("div");
    reviewElement.classList.add("review-item");
    reviewElement.innerHTML = `<p><strong>${name}:</strong> ${reviewText}</p>`;

    
    reviewsContainer.prepend(reviewElement);

    
    document.getElementById("name").value = "";
    document.getElementById("reviewText").value = "";
});
