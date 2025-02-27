void main() {
  
  Map<String, Map<String, dynamic>> bookCollection = {};

  
  addBook(bookCollection, title: "Mastering Flutter", author: "James Peterson", year: 2022, category: "Technology");
  addBook(bookCollection, title: "Dart for Developers", author: "Emma Watson", year: 2019, category: "Programming");

  
  showAllBooks(bookCollection);

  
  print(getBookDetails(bookCollection, title: "Dart for Developers"));

 
  print(deleteBook(bookCollection, title: "Mastering Flutter"));

  
  showAllBooks(bookCollection);
}


void addBook(Map<String, Map<String, dynamic>> bookCollection,
    {required String title, String author = "Unknown", int year = 0, String category = "Uncategorized"}) {
  bookCollection[title] = {'author': author, 'year': year, 'category': category};
  print(" Book '$title' has been added successfully.");
}


String getBookDetails(Map<String, Map<String, dynamic>> bookCollection, {required String title}) {
  if (bookCollection.containsKey(title)) {
    var book = bookCollection[title]!;
    return " Title: $title, Author: ${book['author']}, Year: ${book['year']}, Category: ${book['category']}";
  }
  return " Book not found.";
}


void showAllBooks(Map<String, Map<String, dynamic>> bookCollection, {String? category}) {
  print("\n Library Book List:");
  bool found = false;
  bookCollection.forEach((title, book) {
    if (category == null || book['category'] == category) {
      print("📖 Title: $title, Author: ${book['author']}, Year: ${book['year']}, Category: ${book['category']}");
      found = true;
    }
  });
  if (!found) print(" No books available in this category.");
}


String deleteBook(Map<String, Map<String, dynamic>> bookCollection, {required String title}) {
  if (bookCollection.containsKey(title)) {
    bookCollection.remove(title);
    return " Book '$title' has been removed.";
  }
  return " Book not found.";
}
