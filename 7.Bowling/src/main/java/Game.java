public class Game {
    private int intsScore;
    private int itsCurrentThrow = 0;
    private int[] itsThrows = new int[21];
    private int itsCurrentFrame = 1;
    private boolean firstThrow = true;

    public void add(int pins) {
        intsScore += pins;
        itsThrows[itsCurrentThrow++] = pins;
        adjustCurrentFrame(pins);
    }

    private void adjustCurrentFrame(int pins) {
        if (firstThrow) {
            firstThrow = false;
            if (pins == 10) {
                itsCurrentFrame++;
            }
        } else {
            firstThrow = true;
            itsCurrentFrame++;
        }
        itsCurrentFrame = Math.min(11, itsCurrentFrame);
    }

    public int score() {
        return scoreForFrame(getCurrentFrame() - 1);
    }

    public int scoreForFrame(int theFrame) {
        int ball = 0;
        int score = 0;
        for (int currentFrame = 0; currentFrame < theFrame; currentFrame++) {
            int firstThrow = itsThrows[ball++];
            if (firstThrow == 10) {
                score += 10 + itsThrows[ball] + itsThrows[ball + 1];
            } else {
                int secondThrow = itsThrows[ball++];

                int frameScore = firstThrow + secondThrow;
                // 스페어는 다음 프레임의 첫 번째 투구에 필요하다.
                if (frameScore == 10) {
                    score += frameScore + itsThrows[ball];
                } else {
                    score += frameScore;
                }
            }
        }
        return score;
    }

    public int getCurrentFrame() {
        return itsCurrentFrame;
    }
}
