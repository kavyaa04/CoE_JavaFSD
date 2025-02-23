const API_KEY: string = '3f72fb498ffdb11807f4b029c2084e9b';
const BASE_URL: string = 'https://api.themoviedb.org/3';


interface Movie {
  id: number;
  title: string;
  poster_path: string;
  release_date: string;
  overview: string;
  vote_average: number;
}


async function fetchMovies(query: string): Promise<Movie[]> {
  try {
    const response: Response = await fetch(
      `${BASE_URL}/search/movie?api_key=${API_KEY}&query=${query}`
    );
    if (!response.ok) {
      throw new Error(`API request failed with status ${response.status}`);
    }
    const data: { results: Movie[] } = await response.json();
    return data.results;
  } catch (error) {
    console.error('Error fetching movies:', error);
    return [];
  }
}


function displayMovies(movies: Movie[]): void {
  const carousel: HTMLElement | null = document.getElementById('carousel');
  if (!carousel) {
    console.error('Carousel element not found!');
    return;
  }

  carousel.innerHTML = ''; 

  movies.forEach((movie: Movie) => {
    const movieElement: HTMLDivElement = document.createElement('div');
    movieElement.classList.add('movie-card');
    movieElement.innerHTML = `
      <img src="https://image.tmdb.org/t/p/w500${movie.poster_path}" alt="${movie.title}">
      <h3>${movie.title}</h3>
    `;
    carousel.appendChild(movieElement);
  });
}


const searchButton: HTMLElement | null = document.getElementById('search-button');
const searchBox: HTMLInputElement | null = document.getElementById('search-box') as HTMLInputElement;

if (searchButton && searchBox) {
  searchButton.addEventListener('click', async () => {
    const query: string = searchBox.value;
    const movies: Movie[] = await fetchMovies(query);
    displayMovies(movies);
  });
} else {
  console.error('Search button or search box not found!');
}