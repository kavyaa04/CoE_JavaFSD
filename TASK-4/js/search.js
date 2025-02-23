const apiKey = "3f72fb498ffdb11807f4b029c2084e9b";

async function fetchMovies(url, containerId) {
    const response = await fetch(url);
    const data = await response.json();
    const container = document.getElementById(containerId);
    container.innerHTML = ""; 

    data.results.forEach(movie => {
        if (movie.poster_path) { 
            const movieElement = document.createElement("img");
            movieElement.src = `https://image.tmdb.org/t/p/w500${movie.poster_path}`;
            movieElement.classList.add("movie");
            movieElement.setAttribute("data-id", movie.id); // Store movie ID
            movieElement.onclick = () => goToMovieDetails(movie.id);
            container.appendChild(movieElement);
        }
    });
}


document.getElementById("searchButton").addEventListener("click", () => {
    const query = document.getElementById("searchBox").value.trim();
    if (query !== "") {
        fetchMovies(`https://api.themoviedb.org/3/search/movie?api_key=${apiKey}&query=${query}`, "searchResults");
        document.getElementById("searchResults").style.display = "flex"; 
    }
});

function goToMovieDetails(movieId) {
    window.location.href = `movie-details.html?id=${movieId}`;
}


fetchMovies(`https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}`, "trendingMovies");
fetchMovies(`https://api.themoviedb.org/3/movie/top_rated?api_key=${apiKey}`, "topRatedMovies");

