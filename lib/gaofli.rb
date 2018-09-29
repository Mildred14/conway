class Gaofli
    def board_fill
        @tamano=6
        @limite_matriz = @tamano - 1  
        @tablero = Array.new(@tamano){ Array.new(@tamano)}
        (0..@limite_matriz).each do |row|
            (0..@limite_matriz).each do |col|
                @tablero[row][col] = 0
            end
        end
        return @tablero
    end
    def show_board_fill
        board_fill
        create_cell
        @tablero.each do |row|
            puts row.to_s
        end 
    end

    def create_cell
        (0..20).each do
            @tablero[rand(@limite_matriz)][rand(@limite_matriz)]=1
        end
    end
    def value_cell
        (0..@limite_matriz).each do |row|
            (0..@limite_matriz).each do |col|
                @position = @tablero[col][row]
                @my_neighbors = inspect_neighborhood(@tablero, col, row)
                if @position.zero? && @my_neighbors == 3
                    @tablero[col][row]=1
                elsif @position == 1 && (@my_neighbors<2 || @my_neighbors >3)
                    @tablero[col][row]=0
                else
                    @tablero[col][row]=@position
                end
            end
        end   
    end
    def inspect_neighborhood(tablero, col, row)
        sum=0
        for x in -1..1
            for y  in -1..1
                positionX=(col+x)
                positionY=(row+y)
                if positionX >= 0 && positionY >=0
                    if positionX <= @limite_matriz && positionY <= @limite_matriz
                        sum += tablero[positionX][positionY]
                    end
                end
            end
        end
        sum -= tablero[col][row]
    end
    def start_game
     show_board_fill
        (0..10).each do
            value_cell
            puts
            show_board_fill
        end
    end
    def begin
         Gaofli.new.start_game
    end
end
Gaofli.new.begin
