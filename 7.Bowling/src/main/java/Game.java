public class Game {
    private int intsScore;
    private int itsCurrentThrow = 0;
    private int[] itsThrows = new int[21];

    public void add(int pins) {
        intsScore += pins;
        itsThrows[itsCurrentThrow++] = pins;
    }

    public int score() {
        return intsScore;
    }

    public int scoreForFrame(int frame) {
        int score = 0;
        for (int ball = 0; frame > 0 && (ball < itsCurrentThrow); ball += 2, frame--) {
            score += itsThrows[ball] + itsThrows[ball + 1];
        }
        return score;
    }
}
