import pandas as pd
from collections import Counter

def main():
    # Load the CSV file
    file_path = "C:/Users/EASY LIFE/Downloads/archive/Top_100_Movies.csv"
    df = pd.read_csv(file_path)

    # Check if the 'genre' column exists
    if 'genre' not in df.columns:
        print("The CSV file does not contain a 'genre' column.")
        return

    # Extract and process the genres
    genres = df['genre'].apply(lambda x: x.strip('[]').replace("'", "").split(', ')).tolist()
    flattenedGenres = [genre for sublist in genres for genre in sublist]

    # Count the occurrences of each genre
    genreCounts = Counter(flattenedGenres)

    # Sort the results by count in descending order
    sortedGenreCounts = dict(sorted(genreCounts.items(), key=lambda item: item[1], reverse=True))

    # Print the sorted results
    for genre, count in sortedGenreCounts.items():
        print(f"{genre}: {count}")

if __name__ == "__main__":
    main()
