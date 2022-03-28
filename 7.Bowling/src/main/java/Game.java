public class Game {
    private int intsScore;

    public void add(int pins) {
        intsScore += pins;
    }

    public int score() {
        return intsScore;
    }
}
