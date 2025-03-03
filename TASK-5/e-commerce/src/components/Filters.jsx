const Filters = ({ setCategory }) => {
    return (
        <div className="flex space-x-4">
            <button onClick={() => setCategory("all")} className="px-4 py-2 bg-gray-200 rounded hover:bg-gray-300">All</button>
            <button onClick={() => setCategory("electronics")} className="px-4 py-2 bg-gray-200 rounded hover:bg-gray-300">Electronics</button>
            <button onClick={() => setCategory("fashion")} className="px-4 py-2 bg-gray-200 rounded hover:bg-gray-300">Fashion</button>
            <button onClick={() => setCategory("fashion")} className="px-4 py-2 bg-gray-200 rounded hover:bg-gray-300">Books</button>
            <button onClick={() => setCategory("fashion")} className="px-4 py-2 bg-gray-200 rounded hover:bg-gray-300">Sports</button>
            <button onClick={() => setCategory("fashion")} className="px-4 py-2 bg-gray-200 rounded hover:bg-gray-300">Daily-Utilities</button>
        </div>
    );
};

export default Filters;