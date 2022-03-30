import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

public class TestGame {

    private Game g;

    @BeforeEach
    void setUp() {
        g = new Game();
    }
    // 프레임 중간에 score를 호출하는 경우는 고려하지 않는다.
//    @Test
//    public void testOneThrow() {
//        g.add(5);
//        assertThat(5).isEqualTo(g.score());
//        assertThat(1).isEqualTo(g.getCurrentFrame());
//    }


    @Test
    public void testTwoThrowsNoMark() {
        g.add(5);
        g.add(4);
        assertThat(9).isEqualTo(g.score());
        assertThat(2).isEqualTo(g.getCurrentFrame());
    }

    @Test
    public void testFourThrowsNoMark() {
        g.add(5);
        g.add(4);
        g.add(7);
        g.add(2);
        assertThat(9).isEqualTo(g.scoreForFrame(1));
        assertThat(18).isEqualTo(g.scoreForFrame(2));
        assertThat(3).isEqualTo(g.getCurrentFrame());
    }

    @Test
    public void testSimpleSpare() {
        g.add(3);
        g.add(7);
        g.add(3);
        assertThat(13).isEqualTo(g.scoreForFrame(1));
        assertThat(2).isEqualTo(g.getCurrentFrame());
    }

    @Test
    public void testSimpleFrameAfterSpare() {
        g.add(3);
        g.add(7);
        g.add(3);
        g.add(2);
        assertThat(13).isEqualTo(g.scoreForFrame(1));
        assertThat(18).isEqualTo(g.scoreForFrame(2));
        assertThat(3).isEqualTo(g.getCurrentFrame());
    }

    @Test
    public void testPerfectGame() {
        for (int i = 0; i < 12; i++) {
            g.add(10);
        }
        assertThat(300).isEqualTo(g.score());
        assertThat(11).isEqualTo(g.getCurrentFrame());
    }
}
