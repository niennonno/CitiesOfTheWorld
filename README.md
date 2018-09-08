# CitiesOfTheWorld
iOS app traversing through a huge json file to show cities of the world

This app parses a `.json` file to get the data about cities and displays it in a `UITableView`. There is a search bar on which you can search for the name of the city.

Once you click on a city, you are taken to the map of the particular city based on the coordinates supplied by the JSON.


## Search Logic
The search logic is based on the methods already available to us in Swift. I did research on `AVL trees` and `Binary Search Trees` but the results provided by the default methods are fast enough.
