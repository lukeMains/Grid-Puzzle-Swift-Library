/* This is a text based version to test out my futoshiki code
 * and also to get used to coding in swift again.
 *
 * NOTE: 
 *   - up    = ^
 *   - down  = v
 *   - left  = <
 *   - right = >
 */

public struct Grid: Object {
    public let size: Int
    public var grid: [[Int]]

    public init(size: Int) {
        self.size = size
        self.grid = [[Int]]()
    }
}

func shuffleGrid() {
    var randI = Int.random(in: 0 ..< gridSize)
    var randJ = Int.random(in: 0 ..< gridSize)

    // Change starting grid
    for i in 0 ..< gridSize {
        for j in 0 ..< gridSize {
            grid[i][j] = ((grid[i][j] + randI) % gridSize) + 1
        }
    }

    // Swap Rows
    for _ in (0 ... gridSize + 7) {
        randI = Int.random(in: 0 ..< gridSize)
        randJ = Int.random(in: 0 ..< gridSize)

        grid.swapAt(randI, randJ)
    }
    

    // Swap Columns
    for _ in (0 ... gridSize + 7) {
        randI = Int.random(in: 0 ..< gridSize)
        randJ = Int.random(in: 0 ..< gridSize)
        
        // Go down each row and swap the same random columns
        for row in (0 ..< gridSize) {
            grid[row].swapAt(randI, randJ)
        }
    }
}

func printGrid() {
    // This one is going to get way more complex as we go..
    print("")
    for row in (0 ..< gridSize) {
        for value in grid[row] {
            print(value, terminator:"   ")
        }
        print("\n")
     }
}